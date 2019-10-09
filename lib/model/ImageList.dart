import '../interface/JsonObject.dart';
import '../model/ProductImage.dart';
import '../model/User.dart';

class ImageList extends JsonObject {
  ImageList(this.list);

  List<ProductImage> list;

  factory ImageList.fromJson(Map<String, dynamic> json) {
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

  @override
  Map<String, dynamic> toJson() {
    // not implemented and needed, yet.
    return new Map<String, dynamic>();
  }

  /// return one product image with the given properties, null otherwise
  /// @param field - see ProductImage.FIELDS
  /// @param size - see ProductImage.SIZES
  /// @param language - see User.LANGUAGES
  ProductImage getBy(String field, String size, String language) {
    try {
      return list
          .where((e) =>
              e.field == field && e.size == size && e.language == language)
          .single;
    } catch (e) {
      return null;
    }
  }
}
