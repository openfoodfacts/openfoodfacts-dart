import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../interface/JsonObject.dart';
import '../model/ProductImage.dart';

part 'SendImage.g.dart';

@JsonSerializable()
class SendImage extends JsonObject {
  String lang;

  @JsonKey(ignore: true)
  Uri imageUrl;

  @JsonKey(name: 'code')
  String barcode;

  @JsonKey(name: 'imagefield')
  String imageField;

  SendImage({
    @required this.lang,
    @required this.barcode,
    this.imageUrl,
    this.imageField = ProductImage.FIELD_OTHER,
  });

  /// the json key depending on the image field of this object.
  String getImageDataKey() {
    switch (this.imageField) {
      case ProductImage.FIELD_FRONT:
        return 'imgupload_front_' + this.lang;
      case ProductImage.FIELD_INGREDIENTS:
        return 'imgupload_ingredients_' + this.lang;
      case ProductImage.FIELD_NUTRITION:
        return 'imgupload_nutrition_' + this.lang;
      case ProductImage.FIELD_OTHER:
        return 'imgupload_other_' + this.lang;
      default:
        return null;
    }
  }

  factory SendImage.fromJson(Map<String, dynamic> json) =>
      _$SendImageFromJson(json);

  Map<String, dynamic> toJson() => _$SendImageToJson(this);
}
