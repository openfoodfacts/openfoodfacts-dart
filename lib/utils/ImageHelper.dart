import '../model/Product.dart';
import '../model/ProductImage.dart';
import '../model/User.dart';

class ImageHelper {

  /// reduce the set of images of the product depending on the given language.
  static void removeImages(Product product, String language) {
    for (String field in ProductImage.FIELDS) {
      if (product.selectedImages.list.any(
              (i) => i.field == field && i.language == language)) {
        product.selectedImages.list.removeWhere(
                (i) => i.field == field && i.language != language);
      }
    }
  }
}