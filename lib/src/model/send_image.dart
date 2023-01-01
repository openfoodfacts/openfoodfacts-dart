import 'product_image.dart';
import '../interface/json_object.dart';
import '../utils/language_helper.dart';

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
    String imageDataKey = 'imgupload_${imageField.offTag}';
    if (lang != null) {
      imageDataKey += '_${lang!.offTag}';
    }
    return imageDataKey;
  }

  String _getImageFieldWithLang() {
    String imageFieldWithLang = imageField.offTag;
    if (lang != null) {
      imageFieldWithLang += '_${lang!.offTag}';
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
