import 'package:openfoodfacts/model/NutrientLevels.dart';
import 'package:openfoodfacts/utils/HttpHelper.dart';
import 'package:test/test.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/model/ProductResult.dart';
import 'package:openfoodfacts/model/ProductImage.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';
import 'package:openfoodfacts/utils/ProductQueryConfigurations.dart';

import 'test_constants.dart';

void main() {
  setUpAll(() async {
    new HttpHelper().isTestMode = true;
  });

  group('$OpenFoodAPIClient get products', () {
    test('get product Coca Cola Light', () async {
      String barcode = "5000112548167";

      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER);

      expect(result != null, true);
      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product.barcode, barcode);

      // only german ingredients
      expect(result.product.ingredientsText != null, true);

      print(result.product.ingredientsText);
      expect(result.product.ingredients != null, true);
      expect(result.product.ingredients.length, 10);
      print("Serving Size: ");
      print(result.product.servingSize);

      expect(result.product.ingredients.any((i) => i.text == "Wasser"), true);
      expect(
          result.product.ingredients.any((i) => i.text == "Kohlensäure"), true);
      expect(
          result.product.ingredients.any((i) => i.text == "Farbstoff E 150d"),
          true);
      expect(
          result.product.ingredients.any((i) =>
              i.text == "Säuerungsmittel Phosphorsäure und Citronensäure"),
          true);
      expect(result.product.ingredients.any((i) => i.text == "Süßungsmittel"),
          true);

      expect(result.product.ingredients.any((i) => i.text == "Natriumcyclamat"),
          true);
      expect(
          result.product.ingredients.any((i) => i.text == "Acesulfam K"), true);
      expect(result.product.ingredients.any((i) => i.text == "Aspartam"), true);
      expect(result.product.ingredients.any((i) => i.text == "Aroma"), true);
      expect(result.product.ingredients.any((i) => i.text == "Aroma Koffein"),
          true);

      expect(result.product.selectedImages.length, 9);

      expect(result.product.nutriments != null, true);

      expect(result.product.nutriments.energy, 0.8);
      expect(result.product.nutriments.sugars, 0.0);
      expect(result.product.nutriments.salt, 0.02);
      expect(result.product.nutriments.fiber, null);
      expect(result.product.nutriments.fat, null);
      expect(result.product.nutriments.saturatedFat, null);
      expect(result.product.nutriments.proteins, null);
      expect(result.product.nutriments.novaGroup, 4);
      expect(result.product.nutriments.fatServing == null, true);
      expect(result.product.nutriments.carbohydratesServing == null, true);

      expect(result.product.additives.ids[0], "en:e150d");
      expect(result.product.additives.names[0], "E150d");
      expect(result.product.additives.ids[4], "en:e950");
      expect(result.product.additives.names[4], "E950");

      expect(result.product.servingSize == null, true);

      expect(
          result.product.nutrientLevels.levels[NutrientLevels.NUTRIENT_SUGARS],
          Level.LOW);
      expect(result.product.nutrientLevels.levels[NutrientLevels.NUTRIENT_SALT],
          Level.LOW);

      expect(result.product.images != null, true);
      expect(result.product.images.length, 20);
      expect(
          result.product.images
              .singleWhere((image) =>
                  image.field == ImageField.INGREDIENTS &&
                  image.size == ImageSize.DISPLAY &&
                  image.language == OpenFoodFactsLanguage.GERMAN)
              .url,
          "https://static.openfoodfacts.org/images/products/500/011/254/8167/ingredients_de.7.400.jpg");
    });

    test('get product tiny twists - Rold Gold Pretzels - 16 OZ. (1 LB) 453.6g',
        () async {
      String barcode = '0028400047685';
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.ENGLISH,
          fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER);
      expect(result != null, true);
      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product.barcode, barcode);

      expect(result.product.servingSize != null, true);
      expect(result.product.nutriments.carbohydratesServing != null, true);
      expect(result.product.nutriments.proteinsServing != null, true);
      expect(result.product.nutriments.saltServing != null, true);
      expect(result.product.nutriments.proteinsServing != null, true);
      expect(result.product.nutriments.fatServing != null, true);

      print(result.product.nutriments.carbohydratesServing);
    });

    test('get product Danish Butter Cookies & Chocolate Chip Cookies',
        () async {
      String barcode = "5701184005007";
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER);

      expect(result != null, true);
      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product.barcode, barcode);
      expect(result.product.brandsTags[0], "kelsin");

      // only german ingredients
      expect(result.product.ingredientsText != null, true);
      print(result.product.ingredientsText);

      expect(result.product.ingredients != null, true);
      expect(result.product.ingredients.length, 18);

      expect(result.product.ingredients.any((i) => i.text == "Buttergebäck"),
          true);
      expect(
          result.product.ingredients.any((i) => i.text == "Weizenmehl"), true);
      expect(result.product.ingredients.any((i) => i.text == "Zucker"), true);
      expect(result.product.ingredients.any((i) => i.text == "Butter"), true);
      expect(
          result.product.ingredients.any((i) => i.text == "Speisesalz"), true);

      expect(result.product.ingredients.any((i) => i.text == "Backtriebmittel"),
          true);
      expect(
          result.product.ingredients
              .any((i) => i.text == "Ammouniumhydrogencarbonat"),
          true);
      expect(
          result.product.ingredients.any((i) => i.text == "Invertzuckersirup"),
          true);
      expect(
          result.product.ingredients.any((i) => i.text == "natürliches Aroma"),
          true);
      expect(
          result.product.ingredients
              .any((i) => i.text == "Schokolade Mürbegebäck"),
          true);

      expect(result.product.ingredients.any((i) => i.text == "Pflanzenfett"),
          true);
      expect(result.product.ingredients.any((i) => i.text == "Palm"), true);
      expect(
          result.product.ingredients
              .any((i) => i.text == "Schokoladenstückchen"),
          true);
      expect(
          result.product.ingredients.any((i) => i.text == "Kakaomasse"), true);
      expect(
          result.product.ingredients.any((i) => i.text == "Kakaobutter"), true);

      expect(
          result.product.ingredients.any((i) => i.text == "Emulgator"), true);
      expect(result.product.ingredients.any((i) => i.text == "Lecithin"), true);
      expect(
          result.product.ingredients
              .any((i) => i.text == "fettarmes Kakaopulver"),
          true);

      expect(result.product.selectedImages.length, 9);

      expect(result.product.nutriscore, "e");

      expect(result.product.nutriments != null, true);

      expect(result.product.nutriments.energy, 2125.0);
      expect(result.product.nutriments.sugars, 28.0);
      expect(result.product.nutriments.salt, 0.31);
      expect(result.product.nutriments.fiber, null);
      expect(result.product.nutriments.fat, 25.0);
      expect(result.product.nutriments.saturatedFat, 15.0);
      expect(result.product.nutriments.proteins, 5.3);
      expect(result.product.nutriments.novaGroup, 4);
    });

    test('get product Pâte brisée', () async {
      String barcode = "20004361";
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.FRENCH,
          fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER);

      expect(result != null, true);
      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product.barcode, barcode);
      expect(result.product.productName, "Pâte brisée");

      // only france ingredients
      expect(result.product.ingredientsText != null, true);
      print(result.product.ingredientsText);

      expect(result.product.ingredients != null, true);
      expect(result.product.ingredients.length, 12);

      expect(result.product.ingredients.any((i) => i.text == "Farine de blé"),
          true);
      expect(
          result.product.ingredients
              .any((i) => i.text == "matière grasse non hydrogénée"),
          true);
      expect(
          result.product.ingredients.any((i) => i.text == "graisse de palme"),
          true);
      expect(result.product.ingredients.any((i) => i.text == "huile de colza"),
          true);
      expect(result.product.ingredients.any((i) => i.text == "colorant"), true);

      expect(result.product.ingredients.any((i) => i.text == "caroténoïdes"),
          true);
      expect(result.product.ingredients.any((i) => i.text == "eau"), true);
      expect(
          result.product.ingredients.any((i) => i.text == "alcool éthylique"),
          true);
      expect(result.product.ingredients.any((i) => i.text == "sel"), true);
      expect(
          result.product.ingredients
              .any((i) => i.text == "jus de citron concentré"),
          true);

      expect(
          result.product.ingredients
              .any((i) => i.text == "agent de traitement de la farine"),
          true);
      expect(
          result.product.ingredients.any((i) => i.text == "L-cystéine"), true);

      expect(result.product.selectedImages.length, 9);
      expect(
          result.product.selectedImages
              .where((image) => image.language == OpenFoodFactsLanguage.FRENCH)
              .length,
          6);
      expect(
          result.product.selectedImages
              .where((image) => image.field == ImageField.FRONT)
              .length,
          3);
      expect(
          result.product.selectedImages
              .where((image) => image.field == ImageField.INGREDIENTS)
              .length,
          3);
      expect(
          result.product.selectedImages
              .where((image) => image.field == ImageField.NUTRITION)
              .length,
          3);
      expect(
          result.product.selectedImages
              .where((image) => image.size == ImageSize.THUMB)
              .length,
          3);
      expect(
          result.product.selectedImages
              .where((image) => image.size == ImageSize.DISPLAY)
              .length,
          3);
      expect(
          result.product.selectedImages
              .where((image) => image.size == ImageSize.SMALL)
              .length,
          3);

      expect(result.product.nutriments != null, true);

      expect(result.product.nutriments.energy, 1736.0);
      expect(result.product.nutriments.sugars, 2.8);
      expect(result.product.nutriments.salt, 0.9);
      expect(result.product.nutriments.fiber, 1.1);
      expect(result.product.nutriments.fat, 23.3);
      expect(result.product.nutriments.saturatedFat, 10.7);
      expect(result.product.nutriments.proteins, 6.3);
      expect(result.product.nutriments.novaGroup, 4);
    });

    test('product not available', () async {
      String barcode = "11111111111111111111111111";
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER);
      assert(result != null);
      assert(result.product == null);
    });

    test('product ingredients', () async {
      String barcode = "4316268596299";
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER);

      assert(result != null);
      assert(result.product != null);
      print("number of ingredients: " +
          result.product.ingredients.length.toString());
      assert(result.product.ingredientsText != null);
    });

    test('product fields', () async {
      String barcode = "20004361";
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.NAME, ProductField.BRANDS_TAGS]);
      ProductResult result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER);

      assert(result != null);
      assert(result.product != null);
      assert(result.product.productName != null);
      assert(result.product.brandsTags != null);
      assert(result.product.ingredients.length == 0);
      assert(result.product.ingredientsText == null);
      assert(result.product.productNameDE == null);
      assert(result.product.additives == null);
      assert(result.product.nutrientLevels == null);
      assert(result.product.lang == OpenFoodFactsLanguage.UNDEFINED);

      configurations = ProductQueryConfiguration(barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.NAME, ProductField.LANGUAGE]);
      result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER);

      assert(result != null);
      assert(result.product != null);
      assert(result.product.productName != null);
      assert(result.product.brandsTags == null);
      assert(result.product.ingredients.length == 0);
      assert(result.product.ingredientsText == null);
      assert(result.product.productNameDE == null);
      assert(result.product.additives == null);
      assert(result.product.nutrientLevels == null);

      // This product is not available in German
      // -> API fallback to default language (for this product French)
      assert(result.product.lang == OpenFoodFactsLanguage.FRENCH);
    });
  });
}
