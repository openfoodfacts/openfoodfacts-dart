import 'package:openfoodfacts/utils/ImageHelper.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';

import '../model/Product.dart';
import '../model/ProductImage.dart';
import '../model/Ingredient.dart';

class ProductHelper {
  /// reduce the set of images of the product depending on the given language.
  static void removeImages(Product product, OpenFoodFactsLanguage language) {
    if (product.selectedImages == null) {
      return;
    }

    for (var field in ImageField.values) {
      if (product.selectedImages
          .any((i) => i.field == field && i.language == language)) {
        product.selectedImages
            .removeWhere((i) => i.field == field && i.language != language);
      }
    }
  }

  // generate a image url for each product image entry
  static void createImageUrls(Product product) {
    if (product.images == null) {
      return;
    }

    for (ProductImage image in product.images) {
      image.url = ImageHelper.buildUrl(product.barcode, image);
    }
  }

  /// prepare the ingredients for the given product.
  /// parse the language specific ingredient text into ingredient objects.
  static void parseIngredients(Product product) {
    // override the current list of ingredients
    product.ingredients = new List<Ingredient>();

    if (product.ingredientsText != null && product.ingredientsText.isNotEmpty) {
      // find the names of all ingredients within the given string.
      // An item can contain 0-n spaces or hyphens "-"
      // An element may contain 1-n letters
      // An element may contain numbers if there is a letter directly in front of it. (E150d)
      Iterable<Match> matches = new RegExp(
              r"(([\s-_])*([a-zA-ZäöüÄÖÜßàâæçèéêëîïôœùûüÿÀÂÆÇÈÉÊËÎÏÔŒÙÛÜŸ])+([\s0-9%])*)+([\w])*")
          .allMatches(product.ingredientsText);

      for (var m in matches) {
        String name = m.group(0).trim();

        // avoid empty ingredients
        if (name.isNotEmpty) {
          // remove numbers with percent (e.g. 12%)
          name = name.replaceAll(new RegExp(r"(([0-9])*%)"), "").trim();

          // main ingredients starts with an underscore "_" (e.g. _Weizenmehl_)
          var bold = name.startsWith("_") && name.endsWith("_");
          if (bold) {
            name = name.replaceAll("_", "");
          }

          // avoid duplicates
          if (!product.ingredients.any((i) => i.text == name)) {
            product.ingredients.add(new Ingredient(text: name, bold: bold));
          }
        }
      }
    }
  }
}
