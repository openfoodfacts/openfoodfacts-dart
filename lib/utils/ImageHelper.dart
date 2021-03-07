import 'package:image/image.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import '../model/ProductImage.dart';
import 'LanguageHelper.dart';

class ImageHelper {
  static const int MAX_IMAGE_SIZE = 2048;
  static const String IMAGE_PROD_URL_BASE =
      "https://static.openfoodfacts.org/images/products/";
  static const String IMAGE_TEST_URL_BASE =
      "https://static.openfoodfacts.net/images/products/";

  static Image resize(Image image, {int maxSize = MAX_IMAGE_SIZE}) {
    // check if the image is already small enough
    if (image.width <= maxSize || image.height <= maxSize) {
      return image;
    }

    // resize the image
    if (image.width > image.height) {
      return copyResize(image, width: maxSize);
    } else {
      return copyResize(image, height: maxSize);
    }
  }

  // build the image url
  // e.g. https://static.openfoodfacts.org/images/products/359/671/046/2858/front_fr.4.100.jpg"
  static String? buildUrl(String? barcode, ProductImage image,
      {QueryType queryType = QueryType.PROD}) {
    if (barcode == null) {
      return null;
    }
    String barcodeUrl = barcode;
    if (barcode.length >= 9) {
      var p1 = barcode.substring(0, 3);
      var p2 = barcode.substring(3, 6);
      var p3 = barcode.substring(6, 9);
      var p4 = barcode.length >= 10 ? barcode.substring(9) : "";

      barcodeUrl = p1 + "/" + p2 + "/" + p3 + "/" + p4;
    }

    String urlHelper = barcodeUrl +
        "/" +
        image.field.value +
        "_" +
        image.language.code +
        "." +
        image.rev.toString() +
        "." +
        image.size.toNumber() +
        ".jpg";

    return queryType == QueryType.PROD
        ? IMAGE_PROD_URL_BASE + urlHelper
        : IMAGE_TEST_URL_BASE + urlHelper;
  }
}
