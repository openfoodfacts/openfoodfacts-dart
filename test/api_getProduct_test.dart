import 'package:openfoodfacts/model/AttributeGroup.dart';
import 'package:openfoodfacts/model/Attribute.dart';
import 'package:openfoodfacts/model/EcoscoreData.dart';
import 'package:openfoodfacts/model/NutrientLevels.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/model/ProductResult.dart';
import 'package:openfoodfacts/model/ProductImage.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';
import 'package:openfoodfacts/utils/ProductQueryConfigurations.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:openfoodfacts/utils/UnitHelper.dart';

import 'test_constants.dart';

void main() {
  group('$OpenFoodAPIClient get products', () {
    test('get product Coca Cola Light', () async {
      String barcode = "1111111111111";

      //First add the product to the Test DB
      Product product = Product(
          barcode: barcode,
          productName: "Coca Cola Light",
          lang: OpenFoodFactsLanguage.GERMAN,
          countries: "Frankreich,Deutschland",
          brands: "Coca Cola",
          nutrimentDataPer: "serving",
          nutrimentEnergyUnit: "kcal",
          servingSize: "100g",
          ingredientsText:
              "Wasser, Kohlensäure, e150d, Citronensäure,  Phosphorsäure, Süßungsmittel, Natriumcyclamat, Acesulfam K, Aroma, Aroma Koffein, Aspartam",
          additives: Additives(["en:e150d, en:e950"], ["E150d, E950"]));

      await OpenFoodAPIClient.saveProduct(TestConstants.TEST_USER, product,
          queryType: QueryType.TEST);

      SendImage fontImage = SendImage(
        lang: OpenFoodFactsLanguage.GERMAN,
        barcode: barcode,
        imageField: ImageField.FRONT,
        imageUrl: Uri.file("test/test_assets/front_coca_light_de.jpg"),
      );
      await OpenFoodAPIClient.addProductImage(
          TestConstants.TEST_USER, fontImage,
          queryType: QueryType.TEST);

      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER, queryType: QueryType.TEST);

      expect(result != null, true);
      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product.barcode, barcode);
      expect(result.product.lastModified != null, true);

      // only german ingredients
      expect(result.product.ingredientsText != null, true);

      expect(result.product.ingredients != null, true);
      expect(result.product.ingredients.length, 11);

      expect(result.product.ingredients.any((i) => i.text == "Wasser"), true);
      expect(
          result.product.ingredients.any((i) => i.text == "Kohlensäure"), true);
      expect(result.product.ingredients.any((i) => i.text == "e150d"), true);
      expect(result.product.ingredients.any((i) => i.text == "Citronensäure"),
          true);
      expect(result.product.ingredients.any((i) => i.text == "Phosphorsäure"),
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

      expect(result.product.selectedImages.length, 3);

      /* Activate those tests once the issue  #48 is fixed
       expect(result.product.nutriments != null, true);
      expect(result.product.nutriments.energy, 0.8);
      expect(result.product.nutriments.sugars, 0.0);
      expect(result.product.nutriments.salt, 0.01);
      expect(result.product.nutriments.fiber, null);
      expect(result.product.nutriments.fat, null);
      expect(result.product.nutriments.saturatedFat, null);
      expect(result.product.nutriments.proteins, null);
      expect(result.product.nutriments.novaGroup, 4);
      expect(result.product.nutriments.fatServing == null, true);
      expect(result.product.nutriments.carbohydratesServing == null, false);
      expect(
          result.product.nutrientLevels.levels[NutrientLevels.NUTRIENT_SUGARS],
          Level.LOW);
      expect(result.product.nutrientLevels.levels[NutrientLevels.NUTRIENT_SALT],
          Level.LOW);
      */

      expect(result.product.additives.ids[0], "en:e150d");
      expect(result.product.additives.names[0], "E150d");
      expect(result.product.additives.ids[4], "en:e950");
      expect(result.product.additives.names[4], "E950");

      expect(result.product.images != null, true);
      expect(result.product.images.length, 4);
      expect(
          result.product.images
              .singleWhere((image) =>
                  image.field == ImageField.FRONT &&
                  image.size == ImageSize.DISPLAY &&
                  image.language == OpenFoodFactsLanguage.GERMAN)
              .url,
          "https://static.openfoodfacts.net/images/products/111/111/111/1111/front_de.18.400.jpg");

      expect(result.product.countries, "Frankreich,Deutschland");
    });

    test('get product tiny twists - Rold Gold Pretzels - 16 OZ. (1 LB) 453.6g',
        () async {
      //Refactor the test once the issue  #48 is fixed
      String barcode = '0028400047685';

      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.ENGLISH,
          fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER, queryType: QueryType.TEST);
      expect(result != null, true);
      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product.barcode, barcode);

      expect(result.product.nutriments.carbohydratesServing != null, true);
      expect(result.product.nutriments.proteinsServing != null, true);
      expect(result.product.nutriments.saltServing != null, true);
      expect(result.product.nutriments.proteinsServing != null, true);
      expect(result.product.nutriments.fatServing != null, true);

      expect(result.product.countries, "United States");
    });

    test('get product Danish Butter Cookies & Chocolate Chip Cookies',
        () async {
      String barcode = "5701184005007";
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER, queryType: QueryType.TEST);

      expect(result != null, true);
      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product.barcode, barcode);
      expect(result.product.brandsTags[0], "kelsin");

      // only german ingredients
      expect(result.product.ingredientsText != null, true);

      expect(result.product.ingredients != null, true);
      expect(result.product.ingredients.length, 21);

      expect(result.product.ingredients.any((i) => i.text == "Buttergebäck"),
          true);
      expect(
          result.product.ingredients.any((i) => i.text == "Weizenmehl"), false);
      expect(result.product.ingredients.any((i) => i.text == "Zucker"), true);
      expect(result.product.ingredients.any((i) => i.text == "Butter"), false);
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

      expect(result.product.environmentImpactLevels == null, true);

      expect(result.product.nutriments.energy, 2125.0);
      expect(result.product.nutriments.sugars, 28.0);
      expect(result.product.nutriments.salt, 0.31);
      expect(result.product.nutriments.fiber, null);
      expect(result.product.nutriments.fat, 25.0);
      expect(result.product.nutriments.saturatedFat, 15.0);
      expect(result.product.nutriments.proteins, 5.3);
      expect(result.product.nutriments.novaGroup, 4);
    });

    test('get product Dole Packaged Foods Company 100% pineapple juice',
        () async {
      String barcode = "0038900009472";
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.ENGLISH,
          fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER, queryType: QueryType.TEST);

      expect(result != null, true);
      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product.barcode, barcode);

      expect(result.product.nutriments.iron, 0.00041);
      expect(result.product.nutriments.ironUnit, Unit.MILLI_G);
      expect(result.product.nutriments.vitaminC, 0.0339);
      expect(result.product.nutriments.vitaminCUnit, Unit.MILLI_G);
    });

    test('get product Confiture Rhubarbe Fraises extra', () async {
      String barcode = "3301595000305";
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.FRENCH,
          fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER, queryType: QueryType.TEST);

      expect(result != null, true);
      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product.barcode, barcode);
      expect(result.product.productName, "Confiture Rhubarbe Fraises extra");

      // only france ingredients
      expect(result.product.ingredientsText != null, true);

      expect(result.product.ingredients != null, true);
      expect(result.product.ingredients.length, 3);

      expect(result.product.ingredients.any((i) => i.text == "Farine de blé"),
          false);
      expect(
          result.product.ingredients
              .any((i) => i.text == "matière grasse non hydrogénée"),
          false);
      expect(
          result.product.ingredients.any((i) => i.text == "graisse de palme"),
          false);
      expect(result.product.ingredients.any((i) => i.text == "huile de colza"),
          false);
      expect(
          result.product.ingredients.any((i) => i.text == "colorant"), false);

      expect(result.product.ingredients.any((i) => i.text == "caroténoïdes"),
          false);
      expect(result.product.ingredients.any((i) => i.text == "eau"), false);
      expect(
          result.product.ingredients.any((i) => i.text == "alcool éthylique"),
          false);
      expect(result.product.ingredients.any((i) => i.text == "sel"), false);
      expect(
          result.product.ingredients
              .any((i) => i.text == "jus de citron concentré"),
          false);

      expect(
          result.product.ingredients
              .any((i) => i.text == "agent de traitement de la farine"),
          false);
      expect(
          result.product.ingredients.any((i) => i.text == "L-cystéine"), false);

      expect(result.product.selectedImages.length, 9);
      expect(
          result.product.selectedImages
              .where((image) => image.language == OpenFoodFactsLanguage.FRENCH)
              .length,
          9);
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

      expect(result.product.allergens.ids.length, 0);

      expect(result.product.nutriments != null, true);

      expect(result.product.nutriments.energy, 1081.0);
      expect(result.product.nutriments.sugars, 57.0);
      expect(result.product.nutriments.salt, 0.06);

      //This field does not exist on the product 20004361
      // (Seems that the product was updated in meantime)
      //expect(result.product.nutriments.fiber, 1.1);

      expect(result.product.nutriments.fat, 0.0);
      expect(result.product.nutriments.saturatedFat, 0.0);
      expect(result.product.nutriments.proteins, 0.6);
      expect(result.product.nutriments.novaGroup, 3);
      expect(result.product.storesTags.length, 1);

      expect(result.product.countriesTags, ["en:france"]);
    });

    test('product not available', () async {
      String barcode = "11111111111111111111111111";
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER, queryType: QueryType.TEST);
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
          user: TestConstants.TEST_USER, queryType: QueryType.TEST);

      assert(result != null);
      assert(result.product != null);
      assert(result.product.ingredientsText != null);
    });

    test('product ecoscore', () async {
      String barcode = "5000112548167";
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.ENGLISH,
          fields: [
            ProductField.ECOSCORE_GRADE,
            ProductField.ECOSCORE_SCORE,
            ProductField.ECOSCORE_DATA
          ]);
      ProductResult result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER, queryType: QueryType.TEST);

      assert(result != null);
      assert(result.product != null);
      assert(result.product.ecoscoreGrade != null);

      assert(result.product.ecoscoreScore != null);
      assert(result.product.ecoscoreData.grade != null);
      assert(result.product.ecoscoreData.score != null);
      assert(result.product.ecoscoreData.status == EcoscoreStatus.KNOWN);
      assert(result
              .product.ecoscoreData.adjustments.originsOfIngredients.epiScore !=
          null);
      assert(result
              .product.ecoscoreData.adjustments.originsOfIngredients.epiValue !=
          null);
      assert(result.product.ecoscoreData.adjustments.originsOfIngredients
              .transportationScore !=
          null);
      assert(result.product.ecoscoreData.adjustments.originsOfIngredients
              .transportationValue !=
          null);
      assert(result.product.ecoscoreData.adjustments.packaging.score != null);
      assert(result.product.ecoscoreData.adjustments.packaging.value != null);
    });

    test('product environment impact levels', () async {
      String barcode = "7613331814562";
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.ENGLISH,
          fields: [ProductField.ENVIRONMENT_IMPACT_LEVELS]);
      ProductResult result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER, queryType: QueryType.TEST);

      assert(result != null);
      assert(result.product != null);
      assert(result.product.environmentImpactLevels != null);
      assert(result.product.environmentImpactLevels.levels.first == Level.HIGH);
    });

    test('product fields', () async {
      String barcode = "20004361";
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.NAME, ProductField.BRANDS_TAGS]);
      ProductResult result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER, queryType: QueryType.TEST);

      assert(result != null);
      assert(result.product != null);
      assert(result.product.productName != null);
      assert(result.product.brandsTags != null);
      assert(result.product.ingredients == null);
      assert(result.product.ingredientsText == null);
      assert(result.product.productNameDE == null);
      assert(result.product.additives.ids.isEmpty);
      assert(result.product.additives.names.isEmpty);
      assert(result.product.nutrientLevels.levels.isEmpty);
      assert(result.product.lang == OpenFoodFactsLanguage.UNDEFINED);

      configurations = ProductQueryConfiguration(barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.NAME, ProductField.LANGUAGE]);
      result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER, queryType: QueryType.TEST);

      assert(result != null);
      assert(result.product != null);
      assert(result.product.productName != null);
      assert(result.product.brandsTags == null);
      assert(result.product.ingredients == null);
      assert(result.product.ingredientsText == null);
      assert(result.product.productNameDE == null);
      assert(result.product.additives.ids.isEmpty);
      assert(result.product.additives.names.isEmpty);
      assert(result.product.nutrientLevels.levels.isEmpty);
      assert(result.product.lang == OpenFoodFactsLanguage.FRENCH);

      configurations = ProductQueryConfiguration(barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.NAME, ProductField.COUNTRIES]);
      result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER, queryType: QueryType.TEST);

      assert(result != null);
      assert(result.product != null);
      assert(result.product.productName != null);
      assert(result.product.brandsTags == null);
      assert(result.product.ingredients == null);
      assert(result.product.ingredientsText == null);
      assert(result.product.productNameDE == null);
      assert(result.product.additives.ids.isEmpty);
      assert(result.product.additives.names.isEmpty);
      assert(result.product.nutrientLevels.levels.isEmpty);
      assert(result.product.lang == OpenFoodFactsLanguage.UNDEFINED);
      assert(result.product.countries != null);

      configurations = ProductQueryConfiguration(barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.NAME, ProductField.COUNTRIES_TAGS]);
      result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER, queryType: QueryType.TEST);

      assert(result != null);
      assert(result.product != null);
      assert(result.product.productName != null);
      assert(result.product.brandsTags == null);
      assert(result.product.ingredients == null);
      assert(result.product.ingredientsText == null);
      assert(result.product.productNameDE == null);
      assert(result.product.additives.ids.isEmpty);
      assert(result.product.additives.names.isEmpty);
      assert(result.product.nutrientLevels.levels.isEmpty);
      assert(result.product.lang == OpenFoodFactsLanguage.UNDEFINED);
      assert(result.product.countriesTags != null);
    });

    test('attribute groups', () async {
      String barcode = "3700214614266";
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.ENGLISH,
          fields: [ProductField.NAME, ProductField.ATTRIBUTE_GROUPS]);
      ProductResult result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER, queryType: QueryType.TEST);

      assert(result != null);
      assert(result.product != null);
      assert(result.product.productName != null);
      assert(result.product.attributeGroups != null);

      AttributeGroup group;

      group = result.product.attributeGroups
          .singleWhere((element) => element.id == 'nutritional_quality');
      assert(group != null);
      final List<Attribute> nutritionalQuality = group.attributes;
      assert(nutritionalQuality.first.id == 'nutriscore');
      assert(nutritionalQuality.first.settingName == null);
      assert(nutritionalQuality.first.settingNote == null);
      assert(nutritionalQuality.first.description == '');
      assert(nutritionalQuality.first.descriptionShort ==
          'Poor nutritional quality');
      assert(nutritionalQuality.first.title == 'Nutri-Score D');
      assert(nutritionalQuality.first.name == 'Nutri-Score');
      assert(nutritionalQuality.first.match == 30);
      assert(nutritionalQuality.first.status == 'known');
      assert(nutritionalQuality[1].id == 'low_salt');
      assert(nutritionalQuality[2].id == 'low_fat');
      assert(nutritionalQuality[3].id == 'low_sugars');
      assert(nutritionalQuality[4].id == 'low_saturated_fat');

      group = result.product.attributeGroups
          .singleWhere((element) => element.id == 'processing');
      assert(group != null);
      final List<Attribute> processing = group.attributes;
      assert(processing != null);
      assert(processing.first.id == 'nova');

      group = result.product.attributeGroups
          .singleWhere((element) => element.id == 'labels');
      assert(group != null);
    });

    test('get product without setting OpenFoodFactsLanguage or ProductField; ',
        () async {
      String barcode = "5000112548167";

      //Get product without setting OpenFoodFactsLanguage or ProductField
      ProductQueryConfiguration configurations =
          ProductQueryConfiguration(barcode);
      ProductResult result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER);

      expect(result != null, true);
      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product.barcode, barcode);
      expect(result.product.lastModified != null, true);
      expect(result.product.ingredientsText != null, true);

      expect(result.product.ingredients != null, true);
      expect(result.product.ingredients.length, 13);
      expect(result.product.ingredients.any((i) => i.text == "e150d"), true);

      expect(result.product.additives.ids[0], "en:e150d");
      expect(result.product.additives.names[0], "E150d");
      expect(result.product.additives.ids[4], "en:e950");
      expect(result.product.additives.names[4], "E950");

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

      //Get product without setting ProductField
      configurations = ProductQueryConfiguration(barcode,
          language: OpenFoodFactsLanguage.GERMAN);
      result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER, queryType: QueryType.TEST);

      expect(result != null, true);
      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product.barcode, barcode);
      expect(result.product.lastModified != null, true);

      expect(result.product.ingredientsText != null, true);

      expect(result.product.ingredients != null, true);
      expect(result.product.ingredients.length, 11);

      expect(result.product.ingredients.any((i) => i.text == "Wasser"), true);
      expect(
          result.product.ingredients.any((i) => i.text == "Kohlensäure"), true);
      expect(result.product.ingredients.any((i) => i.text == "e150d"), true);

      expect(result.product.additives.ids[0], "en:e150d");
      expect(result.product.additives.names[0], "E150d");
      expect(result.product.additives.ids[4], "en:e950");
      expect(result.product.additives.names[4], "E950");

      expect(
          result.product.nutrientLevels.levels[NutrientLevels.NUTRIENT_SUGARS],
          Level.LOW);
      expect(result.product.nutrientLevels.levels[NutrientLevels.NUTRIENT_SALT],
          Level.LOW);

      expect(result.product.images != null, true);
      expect(result.product.images.length, 24);
      expect(
          result.product.images
              .singleWhere((image) =>
                  image.field == ImageField.INGREDIENTS &&
                  image.size == ImageSize.DISPLAY &&
                  image.language == OpenFoodFactsLanguage.GERMAN)
              .url,
          "https://static.openfoodfacts.net/images/products/500/011/254/8167/ingredients_de.7.400.jpg");

      //Get product without setting OpenFoodFactsLanguage
      configurations =
          ProductQueryConfiguration(barcode, fields: [ProductField.ALL]);
      result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER, queryType: QueryType.TEST);

      expect(result != null, true);
      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product.barcode, barcode);
      expect(result.product.lastModified != null, true);

      expect(result.product.ingredientsText != null, true);

      expect(result.product.ingredients != null, true);
      expect(result.product.ingredients.length, 11);

      expect(result.product.ingredients.any((i) => i.text == "Wasser"), true);
      expect(
          result.product.ingredients.any((i) => i.text == "Kohlensäure"), true);
      expect(result.product.ingredients.any((i) => i.text == "e150d"), true);
      expect(result.product.ingredients.any((i) => i.text == "Citronensäure"),
          true);
      expect(result.product.ingredients.any((i) => i.text == "Phosphorsäure"),
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

      expect(result.product.selectedImages.length, 18);

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
      expect(result.product.nutriments.carbohydratesServing == null, false);

      expect(result.product.additives.ids[0], "en:e150d");
      expect(result.product.additives.names[0], "E150d");
      expect(result.product.additives.ids[4], "en:e950");
      expect(result.product.additives.names[4], "E950");

      expect(
          result.product.nutrientLevels.levels[NutrientLevels.NUTRIENT_SUGARS],
          Level.LOW);
      expect(result.product.nutrientLevels.levels[NutrientLevels.NUTRIENT_SALT],
          Level.LOW);

      expect(result.product.images != null, true);
      expect(result.product.images.length, 24);
      expect(
          result.product.images
              .singleWhere((image) =>
                  image.field == ImageField.INGREDIENTS &&
                  image.size == ImageSize.DISPLAY &&
                  image.language == OpenFoodFactsLanguage.GERMAN)
              .url,
          "https://static.openfoodfacts.net/images/products/500/011/254/8167/ingredients_de.7.400.jpg");
    });
  });
}
