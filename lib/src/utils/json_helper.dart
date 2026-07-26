import '../interface/json_object.dart';
import '../model/attribute_group.dart';
import '../model/ingredient.dart';
import '../model/product_image.dart';
import '../model/product_packaging.dart';
import '../utils/language_helper.dart';

/// Helper class around product field conversion to/from JSON
class JsonHelper {
  /// Returns [ProductImage]s from a product JSON map for "Selected images"
  static List<ProductImage>? selectedImagesFromJson(Map? json) {
    if (json == null) {
      return null;
    }

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

  // only for main images
  static const String _ALL_IMAGES_TAG_REVISION = 'rev';
  static const String _ALL_IMAGES_TAG_ANGLE = 'angle';
  static const String _ALL_IMAGES_TAG_COORDINATES = 'coordinates_image_size';
  static const String _ALL_IMAGES_TAG_X1 = 'x1';
  static const String _ALL_IMAGES_TAG_Y1 = 'y1';
  static const String _ALL_IMAGES_TAG_X2 = 'x2';
  static const String _ALL_IMAGES_TAG_Y2 = 'y2';

  // only for raw images
  static const String _ALL_IMAGES_TAG_UPLOADED = 'uploaded_t';
  static const String _ALL_IMAGES_TAG_UPLOADER = 'uploader';

  // common to main and raw images
  static const String _ALL_IMAGES_TAG_IMAGE_ID = 'imgid';
  static const String _ALL_IMAGES_TAG_WIDTH = 'w';
  static const String _ALL_IMAGES_TAG_HEIGHT = 'h';
  static const String _ALL_IMAGES_TAG_SIZES = 'sizes';
  static const String _ALL_IMAGES_TAG_URL = 'url';

  // from API 3.3
  static const _ALL_IMAGES_TAG_3_3_UPLOADED = 'uploaded';
  static const _ALL_IMAGES_TAG_3_3_SELECTED = 'selected';
  static const _ALL_IMAGES_TAG_3_3_GENERATION = 'generation';

  /// Returns [ProductImage]s from a JSON map for "Images".
  static List<ProductImage>? allImagesFromJson(Map? json) {
    if (json == null) {
      return null;
    }

    var imageList = <ProductImage>[];

    void addUploadedImages({
      required int imageId,
      required Map<String, dynamic> fieldObject,
    }) {
      // get the sizes object
      final Map<String, dynamic>? sizesObject =
          fieldObject[_ALL_IMAGES_TAG_SIZES] as Map<String, dynamic>?;
      if (sizesObject == null) {
        return;
      }

      final DateTime? uploaded = timestampToDate(
        fieldObject[_ALL_IMAGES_TAG_UPLOADED],
      );
      final String? contributor = fieldObject[_ALL_IMAGES_TAG_UPLOADER];
      // get each number object (e.g. 200)
      for (var size in ImageSize.values) {
        var number = size.number;
        var numberObject = sizesObject[number] as Map<String, dynamic>?;
        if (numberObject == null) {
          continue;
        }
        imageList.add(
          ProductImage.raw(
            size: size,
            imgid: imageId.toString(),
            width: JsonObject.parseInt(numberObject[_ALL_IMAGES_TAG_WIDTH]),
            height: JsonObject.parseInt(numberObject[_ALL_IMAGES_TAG_HEIGHT]),
            url: numberObject[_ALL_IMAGES_TAG_URL],
            uploaded: uploaded,
            contributor: contributor,
          ),
        );
      }
    }

    void addSelectedImages({
      required ImageField field,
      required OpenFoodFactsLanguage lang,
      required Map<String, dynamic> fieldObject,
      required bool pre3_3Mode,
    }) {
      // get the sizes object
      final Map<String, dynamic>? sizesObject =
          fieldObject[_ALL_IMAGES_TAG_SIZES] as Map<String, dynamic>?;
      if (sizesObject == null) {
        return;
      }

      final int? rev = JsonObject.parseInt(
        fieldObject[_ALL_IMAGES_TAG_REVISION],
      );
      final String imgid = fieldObject[_ALL_IMAGES_TAG_IMAGE_ID].toString();

      ImageAngle? angle;
      String? coordinatesImageSize;
      int? x1;
      int? y1;
      int? x2;
      int? y2;
      final Map<String, dynamic>? generation = pre3_3Mode
          ? fieldObject
          : fieldObject[_ALL_IMAGES_TAG_3_3_GENERATION];
      if (generation != null) {
        angle = ImageAngleExtension.fromInt(
          JsonObject.parseInt(generation[_ALL_IMAGES_TAG_ANGLE]),
        );
        coordinatesImageSize = generation[_ALL_IMAGES_TAG_COORDINATES]
            ?.toString();
        x1 = JsonObject.parseInt(generation[_ALL_IMAGES_TAG_X1]);
        y1 = JsonObject.parseInt(generation[_ALL_IMAGES_TAG_Y1]);
        x2 = JsonObject.parseInt(generation[_ALL_IMAGES_TAG_X2]);
        y2 = JsonObject.parseInt(generation[_ALL_IMAGES_TAG_Y2]);
      }

      // get each number object (e.g. 200)
      for (var size in ImageSize.values) {
        var number = size.number;
        var numberObject = sizesObject[number] as Map<String, dynamic>?;
        if (numberObject == null) {
          continue;
        }
        imageList.add(
          ProductImage(
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
            width: JsonObject.parseInt(numberObject[_ALL_IMAGES_TAG_WIDTH]),
            height: JsonObject.parseInt(numberObject[_ALL_IMAGES_TAG_HEIGHT]),
            url: numberObject[_ALL_IMAGES_TAG_URL],
          ),
        );
      }
    }

    for (final String key in json.keys) {
      final Map<String, dynamic> fieldObject = json[key];

      if (key == _ALL_IMAGES_TAG_3_3_UPLOADED) {
        // here, only raw images are expected
        for (final MapEntry<String, dynamic> entry in fieldObject.entries) {
          final int? imageId = int.tryParse(entry.key);
          if (imageId != null) {
            addUploadedImages(imageId: imageId, fieldObject: entry.value);
          }
        }
        continue;
      }

      if (key == _ALL_IMAGES_TAG_3_3_SELECTED) {
        for (final MapEntry<String, dynamic> entry1 in fieldObject.entries) {
          final ImageField? field = ImageField.fromOffTag(entry1.key);
          if (field == null) {
            continue;
          }
          for (final MapEntry<String, dynamic> entry2 in entry1.value.entries) {
            final OpenFoodFactsLanguage? lang =
                OpenFoodFactsLanguage.fromOffTag(entry2.key);
            if (lang == null) {
              continue;
            }
            addSelectedImages(
              field: field,
              lang: lang,
              fieldObject: entry2.value,
              pre3_3Mode: false,
            );
          }
        }
        continue;
      }

      final int? imageId = int.tryParse(key);
      if (imageId != null) {
        // the key is an int: it's a "raw" image
        addUploadedImages(imageId: imageId, fieldObject: fieldObject);
        continue;
      }

      // we expect field + '_' + language: it's a "main" image
      ImageField? field;
      OpenFoodFactsLanguage? lang;
      final List<String> values = key.split('_');
      if (values.length != 2) {
        continue;
      }
      final String fieldString = values[0];
      field = ImageField.fromOffTag(fieldString);
      if (field == null) {
        continue;
      }
      final String languageString = values[1];
      lang = OpenFoodFactsLanguage.fromOffTag(languageString);
      if (lang == null) {
        continue;
      }
      addSelectedImages(
        field: field,
        lang: lang,
        fieldObject: fieldObject,
        pre3_3Mode: true,
      );
    }

    return imageList;
  }

  static Map<String, dynamic> allImagesToJson(
    final List<ProductImage>? images,
  ) {
    final Map<String, dynamic> result = <String, dynamic>{};
    if (images == null || images.isEmpty) {
      return result;
    }
    // grouped by "front_fr"-like or int keys
    final Map<String, List<ProductImage>> sorted =
        <String, List<ProductImage>>{};
    for (final ProductImage productImage in images) {
      final String key;
      if (productImage.language != null && productImage.field != null) {
        // it's a "main" image
        key = '${productImage.field!.offTag}_${productImage.language!.offTag}';
      } else {
        // it's a "raw" image
        key = productImage.imgid!.toString();
      }
      List<ProductImage>? items = sorted[key];
      if (items == null) {
        items = <ProductImage>[];
        sorted[key] = items;
      }
      items.add(productImage);
    }
    for (final MapEntry<String, List<ProductImage>> entry in sorted.entries) {
      final String key = entry.key;
      final List<ProductImage> list = entry.value;
      if (list.isEmpty) {
        // very unlikely
        continue;
      }
      final Map<String, dynamic> item = <String, dynamic>{};
      item[_ALL_IMAGES_TAG_SIZES] = <String, Map<String, Object>>{};
      bool first = true;
      for (final ProductImage productImage in list) {
        if (productImage.size == null) {
          continue;
        }
        item[_ALL_IMAGES_TAG_SIZES]![productImage.size!.number] =
            <String, Object>{
              _ALL_IMAGES_TAG_WIDTH: ?productImage.width,
              _ALL_IMAGES_TAG_HEIGHT: ?productImage.height,
              _ALL_IMAGES_TAG_URL: ?productImage.url,
            };
        if (first) {
          first = false;
          if (!productImage.isMain) {
            if (productImage.uploaded != null) {
              item[_ALL_IMAGES_TAG_UPLOADED] = dateToTimestamp(
                productImage.uploaded,
              );
            }
            if (productImage.contributor != null) {
              item[_ALL_IMAGES_TAG_UPLOADER] = productImage.contributor;
            }
          } else {
            if (productImage.rev != null) {
              item[_ALL_IMAGES_TAG_REVISION] = productImage.rev.toString();
            }
            if (productImage.imgid != null) {
              item[_ALL_IMAGES_TAG_IMAGE_ID] = productImage.imgid!;
            }
            if (productImage.angle != null) {
              item[_ALL_IMAGES_TAG_ANGLE] = productImage.angle!.degree
                  .toString();
            }
            if (productImage.coordinatesImageSize != null) {
              item[_ALL_IMAGES_TAG_COORDINATES] =
                  productImage.coordinatesImageSize!;
            }
            if (productImage.x1 != null) {
              item[_ALL_IMAGES_TAG_X1] = productImage.x1!;
            }
            if (productImage.y1 != null) {
              item[_ALL_IMAGES_TAG_Y1] = productImage.y1!;
            }
            if (productImage.x2 != null) {
              item[_ALL_IMAGES_TAG_X2] = productImage.x2!;
            }
            if (productImage.y2 != null) {
              item[_ALL_IMAGES_TAG_Y2] = productImage.y2!;
            }
          }
        }
      }
      result[key] = item;
    }
    return result;
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
    List<Ingredient>? ingredients,
  ) {
    if (ingredients == null || ingredients.isEmpty) {
      return null;
    }

    List<Map<String, dynamic>> result = [];

    for (Ingredient ingredient in ingredients) {
      result.add(ingredient.toJson());
    }

    return result;
  }

  /// Returns a JSON map from [ProductPackaging]s
  static List<Map<String, dynamic>>? productPackagingsToJson(
    List<ProductPackaging>? packagings,
  ) {
    if (packagings == null) {
      return null;
    }

    List<Map<String, dynamic>> result = [];

    for (ProductPackaging p in packagings) {
      result.add(p.toJson());
    }

    return result;
  }

  /// Returns a JSON map from [AttributeGroup]s
  static List<Map<String, dynamic>>? attributeGroupsToJson(
    List<AttributeGroup>? list,
  ) {
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
      isUtc: true,
    );
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

  /// Returns a String?, regardless of the input type.
  static String? stringFromJSON(dynamic jsonValue) => jsonValue?.toString();
}
