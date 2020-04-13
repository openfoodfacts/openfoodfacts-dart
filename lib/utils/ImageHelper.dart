import 'package:image/image.dart';

class ImageHelper {
  static const int MAX_IMAGE_SIZE = 2048;
  static const String IMAGE_URL_BASE = "https://static.openfoodfacts.org/images/products/";

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
  static String buildUrl(String barcode, ProductImage image) {
    if (barcode == null || image == null) {
      return null;
    }

    String barcodeUrl = barcode;
    if (barcode.length >= 9) {
      var p1 = barcode.substring(0,3);
      var p2 = barcode.substring(3,6);
      var p3 = barcode.substring(6,9);
      var p4 = barcode.length >= 10 ? barcode.substring(9) : "";

      barcodeUrl = p1 + "/" + p2 + "/" + p3 + "/" + p4;
    }

    return IMAGE_URL_BASE + barcodeUrl + "/" + image.field.value + "_"
        + image.language + "." + image.rev.toString() + "." + image.size.toNumber() + ".jpg";
  }
}
