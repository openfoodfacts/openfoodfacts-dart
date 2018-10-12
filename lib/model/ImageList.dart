import 'package:json_annotation/json_annotation.dart';

import '../interface/JsonObject.dart';
import '../model/Image.dart';
import '../model/User.dart';

@JsonSerializable()
class ImageList extends JsonObject {

  ImageList(this.list);

  List<Image> list;

  factory ImageList.fromJson(Map<String, dynamic> json) {
    var imageList = new List<Image>();
    for (var field in Image.FIELDS) {
      for (var size in Image.SIZES) {
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
          var image = new Image(field: field, size: size, language: lang, url: url);

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

}