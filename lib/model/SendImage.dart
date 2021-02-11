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
    switch (imageField) {
      case ImageField.FRONT:
        return 'imgupload_front';
      case ImageField.INGREDIENTS:
        return 'imgupload_ingredients';
      case ImageField.NUTRITION:
        return 'imgupload_nutrition';
      case ImageField.OTHER:
        return 'imgupload_other';
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
      'lang': lang,
      'code': barcode,
      'imagefield': imageField.value
    };
  }
}
