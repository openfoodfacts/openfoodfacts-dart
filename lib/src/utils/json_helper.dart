import '../model/attribute_group.dart';
import '../model/ingredient.dart';
import '../model/product_image.dart';
import '../interface/json_object.dart';
import '../utils/language_helper.dart';

/// Helper class around product field conversion to/from JSON
class JsonHelper {
  /// Returns [ProductImage]s from a product JSON map for "Selected images"
  static List<ProductImage>? selectedImagesFromJson(Map? json) {
    if (json == null) return null;

    var imageList = <ProductImage>[];
    for (var field in ImageField.values) {
      for (var size in ImageSize.values) {
        for (OpenFoodFactsLanguage lang in OpenFoodFactsLanguage.values) {
          // use the field to get the size
          if (json[field.offTag] == null) {
            continue;
          }
          var sizeJson = json[field.offTag] as Map<String, dynamic>?;

          // use the size to get the language
          if (sizeJson == null) {
            continue;
          }
          var langJson = sizeJson[size.offTag] as Map<String, dynamic>?;

          // use the language to get the url
          if (langJson == null) {
            continue;
          }
          var url = langJson[lang.offTag] as String?;

          // use the url to build the image
          if (url == null) {
            continue;
          }
          var image = ProductImage(
            field: field,
            size: size,
            language: lang,
            url: url,
          );

          imageList.add(image);
        }
      }
    }
    return imageList;
  }

  /// Returns a JSON map from [ProductImage]s for "Selected images"
  static Map<String, dynamic> selectedImagesToJson(List<ProductImage>? images) {
    Map<String, dynamic> result = {};

    if (images == null) {
      return result;
    }

    for (ImageField field in ImageField.values) {
      Map<String, dynamic> fieldMap = {};
      for (ImageSize size in ImageSize.values) {
        Map<String, String?> sizeMap = {};
        for (ProductImage image in images) {
          if (image.field == field && image.size == size) {
            sizeMap[image.language.code] = image.url;
          }
        }
        fieldMap[size.offTag] = sizeMap;
      }
      result[field.offTag] = fieldMap;
    }

    return result;
  }

  /// Returns [ProductImage]s from a JSON map for "Images"
  static List<ProductImage>? imagesFromJson(Map? json) {
    if (json == null) return null;

    var imageList = <ProductImage>[];

    for (var field in ImageField.values) {
      for (OpenFoodFactsLanguage lang in OpenFoodFactsLanguage.values) {
        // get the field object e.g. front_en
        final String fieldName = '${field.offTag}_${lang.offTag}';
        if (json[fieldName] == null) continue;

        final fieldObject = json[fieldName] as Map<String, dynamic>?;
        if (fieldObject == null) continue;

        final rev = JsonObject.parseInt(fieldObject['rev']);
        final String imgid = fieldObject['imgid'].toString();
        final ImageAngle? angle = ImageAngleExtension.fromInt(
          JsonObject.parseInt(fieldObject['angle']),
        );
        final String? coordinatesImageSize =
            fieldObject['coordinates_image_size']?.toString();
        final int? x1 = JsonObject.parseInt(fieldObject['x1']);
        final int? y1 = JsonObject.parseInt(fieldObject['y1']);
        final int? x2 = JsonObject.parseInt(fieldObject['x2']);
        final int? y2 = JsonObject.parseInt(fieldObject['y2']);

        // get the sizes object
        var sizesObject = fieldObject['sizes'] as Map<String, dynamic>?;
        if (sizesObject == null) continue;

        // get each number object (e.g. 200)
        for (var size in ImageSize.values) {
          var number = size.number;
          var numberObject = sizesObject[number] as Map<String, dynamic>?;
          if (numberObject == null) continue;

          var image = ProductImage(
            field: field,
            size: size,
            language: lang,
            rev: rev,
            imgid: imgid,
            angle: angle,
            coordinatesImageSize: coordinatesImageSize,
            x1: x1,
            y1: y1,
            x2: x2,
            y2: y2,
          );
          imageList.add(image);
        }
      }
    }

    return imageList;
  }

  // TODO(monsieurtanuki): not implemented and needed, yet.
  static Map<String, dynamic> imagesToJson(List<ProductImage>? images) {
    return {};
  }

  /// Returns a double from a JSON-encoded int or double
  static double? quantityFromJson(dynamic data) {
    if (data == null || data is double) {
      return data;
    }
    if (data is int) {
      return data.toDouble();
    }
    try {
      return double.parse(data);
    } catch (e) {
      return null;
    }
  }

  /// Returns a JSON map from [Ingredient]s
  static List<Map<String, dynamic>>? ingredientsToJson(
      List<Ingredient>? ingredients) {
    if (ingredients == null || ingredients.isEmpty) {
      return null;
    }

    List<Map<String, dynamic>> result = [];

    for (Ingredient ingredient in ingredients) {
      result.add(ingredient.toJson());
    }

    return result;
  }

  /// Returns a JSON map from [AttributeGroup]s
  static List<Map<String, dynamic>>? attributeGroupsToJson(
      List<AttributeGroup>? list) {
    if (list == null || list.isEmpty) {
      return null;
    }

    List<Map<String, dynamic>> result = [];

    for (final AttributeGroup item in list) {
      result.add(item.toJson());
    }

    return result;
  }

  /// Returns a [DateTime] from a JSON-encoded int (UTC seconds since epoch)
  static DateTime? timestampToDate(dynamic json) {
    if (json == null) {
      return null;
    }
    final int timestamp = JsonObject.parseInt(json)!;
    return DateTime.fromMillisecondsSinceEpoch(
        Duration.millisecondsPerSecond * timestamp,
        isUtc: true);
  }

  /// Returns UTC seconds since epoch from a [DateTime]
  static int? dateToTimestamp(DateTime? dateTime) {
    if (dateTime == null) {
      return null;
    }
    return (dateTime.toUtc().millisecondsSinceEpoch /
            Duration.millisecondsPerSecond)
        .round();
  }

  /// Returns a [DateTime] from a JSON-encoded String (e.g. '2021-10-29T11:00:56.177379')
  static DateTime stringTimestampToDate(dynamic json) =>
      DateTime.parse(json as String);

  /// Returns a [DateTime] from a JSON-encoded String (e.g. '2021-10-29T11:00:56.177379')
  static DateTime? nullableStringTimestampToDate(dynamic json) =>
      json == null ? null : stringTimestampToDate(json);

  static const String _checkboxOnValue = 'on';
  static const String _checkboxOffValue = '';

  /// Returns a bool from ''/'on' conversion.
  static bool? checkboxFromJSON(dynamic jsonValue) {
    if (jsonValue == null) {
      return null;
    }
    return jsonValue is String &&
        jsonValue.trim().toLowerCase() == _checkboxOnValue;
  }

  /// Returns a bool to ''/'on' conversion.
  static String? checkboxToJSON(dynamic value) {
    if (value == null) {
      return null;
    } else if (value == true ||
        (value is String && value.trim().toLowerCase() == _checkboxOnValue)) {
      return _checkboxOnValue;
    } else {
      return _checkboxOffValue;
    }
  }

  /// Returns a bool from 0/1 conversion.
  static bool? boolFromJSON(dynamic jsonValue) {
    if (jsonValue == null) {
      return null;
    }
    return jsonValue == 1;
  }

  /// Returns a bool to 0/1 conversion.
  static int? boolToJSON(dynamic value) {
    if (value == null) {
      return null;
    }
    if (value == true || value == 1) {
      return 1;
    }
    return 0;
  }
}
