import 'package:openfoodfacts/utils/LanguageHelper.dart';

import '../interface/JsonObject.dart';
import '../model/ProductImage.dart';

class SendImage extends JsonObject {
  OpenFoodFactsLanguage lang;

  // ignored for json
  Uri imageUrl;

  String barcode;

  ImageField imageField;

  SendImage({
    this.lang,
    this.barcode,
    this.imageUrl,
    this.imageField = ImageField.OTHER,
  });

  /// the json key depending on the image field of this object.
  String getImageDataKey() {
    switch (this.imageField) {
      case ImageField.FRONT:
        return 'imgupload_front_' + this.lang.code;
      case ImageField.INGREDIENTS:
        return 'imgupload_ingredients_' + this.lang.code;
      case ImageField.NUTRITION:
        return 'imgupload_nutrition_' + this.lang.code;
      case ImageField.OTHER:
        return 'imgupload_other_' + this.lang.code;
      default:
        return null;
    }
  }

  factory SendImage.fromJson(Map<String, dynamic> json) {
    ImageField imageField = ImageFieldExtension.getType(json["imagefield"]);

    return SendImage(
      lang: LanguageHelper.fromJson(json['lang']),
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
