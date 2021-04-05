import 'package:openfoodfacts/utils/LanguageHelper.dart';

import '../interface/JsonObject.dart';
import '../model/ProductImage.dart';

class SendImage extends JsonObject {
  OpenFoodFactsLanguage? lang;

  // ignored for json
  Uri imageUri;

  String barcode;

  ImageField imageField;

  SendImage({
    this.lang,
    required this.barcode,
    required this.imageUri,
    this.imageField = ImageField.OTHER,
  });

  /// the json key depending on the image field of this object.
  String getImageDataKey() {
    String imageDataKey = 'imgupload_' + imageField.value;
    if (lang != null) {
      imageDataKey += '_' + lang.code;
    }
    return imageDataKey;
  }

  String _getImageFieldWithLang() {
    String imageFieldWithLang = imageField.value;
    if (lang != null) {
      imageFieldWithLang += '_' + lang.code;
    }
    return imageFieldWithLang;
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'lc': lang.code,
      'code': barcode,
      'imagefield': _getImageFieldWithLang(),
    };
  }
}
