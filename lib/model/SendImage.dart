import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../interface/JsonObject.dart';

part 'SendImage.g.dart';

@JsonSerializable()
class SendImage extends JsonObject {

  static const String FIELD_FRONT = "front";
  static const String FIELD_INGREDIENTS = "ingredients";
  static const String FIELD_NUTRITION = "nutrition";
  static const String FIELD_OTHER = "other";

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
    this.imageField = FIELD_OTHER,
  });

  /// the json key depending on the image field of this object.
  String getImageDataKey() {
    switch (this.imageField) {
      case FIELD_FRONT:
        return 'imgupload_front_' + this.lang;
      case FIELD_INGREDIENTS:
        return 'imgupload_ingredients_' + this.lang;
      case FIELD_NUTRITION:
        return 'imgupload_nutrition_' + this.lang;
      case FIELD_OTHER:
        return 'imgupload_other_' + this.lang;
      default:
        return null;
    }
  }

  factory SendImage.fromJson(Map<String, dynamic> json) => _$SendImageFromJson(json);

  Map<String, dynamic> toJson() => _$SendImageToJson(this);
}

