import 'package:openfoodfacts/utils/ImageHelper.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
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
        queryType: OpenFoodAPIConfiguration.getQueryType(queryType),
      );
    }
  }

  // TODO: deprecated from 2021-02-15 (#106); remove when old enough
  @Deprecated(
      'Useless now that we translate fields in a different way; just do not use')
  static void addTranslatedFields(Product product, Map<String, dynamic> source,
      OpenFoodFactsLanguage language) {
    product.categoriesTagsInLanguages ??= {};
    product.categoriesTagsInLanguages![language] =
        source['categories_tags_${language.code}'];

    product.labelsTagsInLanguages ??= {};
    product.labelsTagsInLanguages![language] =
        source['labels_tags_${language.code}'];

    product.ingredientsTagsInLanguages ??= {};
    product.ingredientsTagsInLanguages![language] =
        source['ingredients_tags_${language.code}'];

    product.ingredientsTextInLanguages ??= {};
    product.ingredientsTextInLanguages![language] =
        source['ingredients_text_${language.code}'];

    product.productNameInLanguages = {};
    product.productNameInLanguages![language] =
        source['product_name_${language.code}'];

    product.countriesTagsInLanguages = {};
    product.countriesTagsInLanguages![language] =
        source['countries_tags_${language.code}'];
  }
}
