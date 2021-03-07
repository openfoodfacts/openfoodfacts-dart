import 'package:openfoodfacts/interface/JsonObject.dart';
import 'package:openfoodfacts/model/AttributeGroup.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/model/Ingredient.dart';
import 'package:openfoodfacts/model/ProductImage.dart';

class JsonHelper {
  static List<ProductImage>? selectedImagesFromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    var imageList = <ProductImage>[];
    for (var field in ImageField.values) {
      for (var size in ImageSize.values) {
        for (OpenFoodFactsLanguage lang in OpenFoodFactsLanguage.values) {
          // use the field to get the size
          if (json[field.value] == null) continue;
          var sizeJson = json[field.value] as Map<String, dynamic>?;

          // use the size to get the language
          if (sizeJson == null) continue;
          var langJson = sizeJson[size.value] as Map<String, dynamic>?;

          // use the language to get the url
          if (langJson == null) continue;
          var url = langJson[lang.code] as String?;

          // use the url to build the image
          if (url == null) continue;
          var image =
              ProductImage(field: field, size: size, language: lang, url: url);

          imageList.add(image);
        }
      }
    }
    return imageList;
  }

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
        fieldMap[size.value] = sizeMap;
      }
      result[field.value] = fieldMap;
    }

    return result;
  }

  static List<ProductImage>? imagesFromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    var imageList = <ProductImage>[];

    for (var field in ImageField.values) {
      for (OpenFoodFactsLanguage lang in OpenFoodFactsLanguage.values) {
        // get the field object e.g. front_en
        String fieldName = field.value + "_" + lang.code;
        if (json[fieldName] == null) continue;

        var fieldObject = json[fieldName] as Map<String, dynamic>?;
        if (fieldObject == null) continue;

        // get the rev object
        var rev = JsonObject.parseInt(fieldObject["rev"]);

        // get the sizes object
        var sizesObject = fieldObject["sizes"] as Map<String, dynamic>?;
        if (sizesObject == null) continue;

        // get each number object (e.g. 200)
        for (var size in ImageSize.values) {
          var number = size.toNumber();
          var numberObject = sizesObject[number] as Map<String, dynamic>?;
          if (numberObject == null) continue;

          var image =
              ProductImage(field: field, size: size, language: lang, rev: rev);
          imageList.add(image);
        }
      }
    }

    return imageList;
  }

  static Map<String, dynamic> imagesToJson(List<ProductImage>? images) {
    // not implemented and needed, yet.
    return {};
  }

  static double? servingQuantityFromJson(dynamic data) {
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

  static DateTime? timestampToDate(dynamic json) {
    if (json == null) {
      return null;
    }
    final int timestamp = JsonObject.parseInt(json)!;
    return DateTime.fromMillisecondsSinceEpoch(
        Duration.millisecondsPerSecond * timestamp,
        isUtc: true);
  }

  static int? dateToTimestamp(DateTime? dateTime) {
    if (dateTime == null) {
      return null;
    }
    return (dateTime.toUtc().millisecondsSinceEpoch /
            Duration.millisecondsPerSecond)
        .round();
  }
}
