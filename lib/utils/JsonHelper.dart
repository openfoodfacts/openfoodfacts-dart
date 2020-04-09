import 'package:openfoodfacts/interface/JsonObject.dart';
import 'package:openfoodfacts/utils/ImageHelper.dart';

import '../model/User.dart';
import '../model/ProductImage.dart';
import '../model/ImageList.dart';

class JsonHelper {

  static ImageList selectedImagesFromJson(Map<String, dynamic> json) {
    var imageList = new List<ProductImage>();
    for (var field in ProductImage.FIELDS) {
      for (var size in ProductImage.SIZES) {
        for (var lang in User.LANGUAGES) {
          // use the field to get the size
          if (json[field] == null) continue;
          var sizeJson = json[field] as Map<String, dynamic>;

          // use the size to get the language
          if (sizeJson == null) continue;
          var langJson = sizeJson[size] as Map<String, dynamic>;

          // use the language to get the url
          if (langJson == null) continue;
          var url = langJson[lang] as String;

          // use the url to build the image
          if (url == null) continue;
          var image = new ProductImage(
              field: field, size: size, language: lang, url: url);

          imageList.add(image);
        }
      }
    }
    return new ImageList(imageList);
  }

  static Map<String, dynamic> selectedImagesToJson(ImageList imageList) {
    // not implemented and needed, yet.
    return new Map<String, dynamic>();
  }

  static ImageList imagesFromJson(Map<String, dynamic> json) {
    var imageList = new List<ProductImage>();

    for (var field in ProductImage.FIELDS) {
        for (var lang in User.LANGUAGES) {

          // get the field object e.g. front_en
          String fieldName = field + "_" + lang;
          if (json[fieldName] == null) continue;

          var fieldObject = json[fieldName] as Map<String, dynamic>;
          if (fieldObject == null) continue;

          // get the rev object
          var rev = JsonObject.parseInt(fieldObject["rev"]);

          // get the sizes object
          var sizesObject = fieldObject["sizes"] as Map<String, dynamic>;
          if (sizesObject == null) continue;

          // get each number object (e.g. 200)
          for (var number in ProductImage.NUMBERS) {
            var numberObject = sizesObject[number] as Map<String, dynamic>;
            if (numberObject == null) continue;

            var image = new ProductImage(
                field: field,
                size: ProductImage.NUMBER_TO_SIZE[number],
                language: lang,
                rev:rev);
            imageList.add(image);
          }
        }

    }

    return new ImageList(imageList);
  }

  static Map<String, dynamic> imagesToJson(ImageList imageList) {
    // not implemented and needed, yet.
    return new Map<String, dynamic>();
  }

}