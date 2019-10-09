import '../model/Product.dart';
import '../model/ProductImage.dart';
import '../model/User.dart';
import '../model/Ingredient.dart';


class ProductHelper {

  /// reduce the set of images of the product depending on the given language.
  static void removeImages(Product product, String language) {
    if (product.selectedImages == null || product.selectedImages.list == null) {
      return;
    }

    for (String field in ProductImage.FIELDS) {
      if (product.selectedImages.list.any(
              (i) => i.field == field && i.language == language)) {
        product.selectedImages.list.removeWhere(
                (i) => i.field == field && i.language != language);
      }
    }
  }

  /// prepare the product name for the given product.
  /// remove name strings of other languages.
  static void prepareProductName(Product product, String lang) {
    // choose the language specific product name
    switch (lang) {
      case User.LANGUAGE_DE:
        product.productName = product.productNameDE ?? product.productName;
        break;
      case User.LANGUAGE_UNDEFINED:
      case User.LANGUAGE_EN:
        product.productName = product.productNameEN ?? product.productName;
        break;
      case User.LANGUAGE_FR:
        product.productName = product.productNameFR ?? product.productName;
        break;
      default:
        break;
    }

    // remove unused fields
    product.productNameDE = null;
    product.productNameEN = null;
    product.productNameFR = null;
  }

  /// prepare the ingredients for the given product.
  /// parse the language specific ingredient text into ingredient objects.
  static void parseIngredients(Product product, String lang) {
    // choose the language specific string of ingredients
    switch (lang) {
      case User.LANGUAGE_DE:
        product.ingredientsText = product.ingredientsTextDE ?? product.ingredientsText;
        break;
      case User.LANGUAGE_UNDEFINED:
      case User.LANGUAGE_EN:
        product.ingredientsText = product.ingredientsTextEN ?? product.ingredientsText;
        break;
      case User.LANGUAGE_FR:
        product.ingredientsText = product.ingredientsTextFR ?? product.ingredientsText;
        break;
      default:
        break;
    }

    // override the current list of ingredients
    product.ingredients = new List<Ingredient>();
    product.ingredientsTextDE = null;
    product.ingredientsTextEN = null;
    product.ingredientsTextFR = null;

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