import 'package:openfoodfacts/utils/image_helper.dart';
import 'package:openfoodfacts/utils/language_helper.dart';
import 'package:openfoodfacts/utils/query_type.dart';

import '../model/product.dart';
import '../model/product_image.dart';

/// Helper class around [Product] fields
class ProductHelper {
  /// Reduces the set of images of the product depending on the given language.
  static void removeImages(Product product, OpenFoodFactsLanguage? language) {
    if (product.selectedImages == null) {
      return;
    }

    for (var field in ImageField.values) {
      if (product.selectedImages!
          .any((i) => i.field == field && i.language == language)) {
        product.selectedImages!
            .removeWhere((i) => i.field == field && i.language != language);
      }
    }
  }

  /// Generates a image url for each product image entry
  static void createImageUrls(
    Product product, {
    QueryType? queryType,
  }) {
    if (product.images == null) {
      return;
    }

    for (ProductImage image in product.images!) {
      image.url = ImageHelper.buildUrl(
        product.barcode,
        image,
        queryType: queryType,
      );
    }
  }
}
