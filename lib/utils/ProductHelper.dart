import 'package:openfoodfacts/utils/ImageHelper.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/QueryType.dart';

import '../model/Product.dart';
import '../model/ProductImage.dart';

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
