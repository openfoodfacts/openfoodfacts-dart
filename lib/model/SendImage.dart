import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../interface/JsonObject.dart';
import '../model/ProductImage.dart';

class SendImage extends JsonObject {

  String lang;

  // ignored for json
  Uri imageUrl;

  String barcode;

  ImageField imageField;

  SendImage({
    @required this.lang,
    @required this.barcode,
    this.imageUrl,
    this.imageField = ImageField.OTHER,
  });

  /// the json key depending on the image field of this object.
  String getImageDataKey() {
    switch (this.imageField) {
      case ImageField.FRONT:
        return 'imgupload_front_' + this.lang;
      case ImageField.INGREDIENTS:
        return 'imgupload_ingredients_' + this.lang;
      case ImageField.NUTRITION:
        return 'imgupload_nutrition_' + this.lang;
      case ImageField.OTHER:
        return 'imgupload_other_' + this.lang;
      default:
        return null;
    }
  }

  factory SendImage.fromJson(Map<String, dynamic> json) {

    ImageField imageField = ImageFieldExtension.getType(json["imagefield"]);

    return SendImage(
        lang: json['lang'] as String,
        barcode: json['code'] as String,
        imageField: imageField,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'lang': this.lang,
      'code': this.barcode,
      'imagefield': this.imageField.value
    };
  }
}
