import 'package:openfoodfacts/utils/ImageHelper.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/QueryType.dart';

import '../model/Product.dart';
import '../model/ProductImage.dart';

class ProductHelper {
  /// reduce the set of images of the product depending on the given language.
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

  // generate a image url for each product image entry
  static void createImageUrls(Product product,
      {QueryType queryType = QueryType.PROD}) {
    if (product.images == null) {
      return;
    }

    for (ProductImage image in product.images!) {
      image.url =
          ImageHelper.buildUrl(product.barcode, image, queryType: queryType);
    }
  }

  @deprecated
  static void addTranslatedFields(Product product, Map<String, dynamic> source,
      OpenFoodFactsLanguage language) {
    product.categoriesTagsTranslated =
        source['categories_tags_${language.code}'];
    product.labelsTagsTranslated = source['labels_tags_${language.code}'];
    product.ingredientsTagsTranslated =
        source['ingredients_tags_${language.code}'];
    product.ingredientsTextTranslated =
        source['ingredients_text_${language.code}'];
    product.productNameTranslated = source['product_name_${language.code}'];
    product.countriesTagsTranslated = source['countries_tags_${language.code}'];
  }
}
