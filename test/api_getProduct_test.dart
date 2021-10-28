import 'package:http/http.dart' as http;
import 'package:openfoodfacts/model/Attribute.dart';
import 'package:openfoodfacts/model/AttributeGroup.dart';
import 'package:openfoodfacts/model/NutrientLevels.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/personalized_search/available_attribute_groups.dart';
import 'package:openfoodfacts/personalized_search/available_preference_importances.dart';
import 'package:openfoodfacts/personalized_search/available_product_preferences.dart';
import 'package:openfoodfacts/personalized_search/matched_product.dart';
import 'package:openfoodfacts/personalized_search/preference_importance.dart';
import 'package:openfoodfacts/personalized_search/product_preferences_manager.dart';
import 'package:openfoodfacts/personalized_search/product_preferences_selection.dart';
import 'package:openfoodfacts/utils/InvalidBarcodes.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:openfoodfacts/utils/UnitHelper.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  const int _HTTP_OK = 200;

  const _BARCODE_UNKNOWN = '11111111111111111111111111';
  const _BARCODE_DANISH_BUTTER_COOKIES = '5701184005007';

  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;

  group('$OpenFoodAPIClient get products', () {
    test('get product Coca Cola Light', () async {
      String barcode = '1111111111111';

      //First add the product to the Test DB
      Product product = Product(
        barcode: barcode,
        productName: 'Coca Cola Light',
        lang: OpenFoodFactsLanguage.GERMAN,
        countries: 'Frankreich,Deutschland',
        brands: 'Coca Cola',
        nutrimentDataPer: 'serving',
        nutrimentEnergyUnit: 'kcal',
        servingSize: '100g',
        ingredientsText:
            'Wasser, Kohlensäure, e150d, Citronensäure,  Phosphorsäure, Süßungsmittel, Natriumcyclamat, Acesulfam K, Aroma, Aroma Koffein, Aspartam',
        additives: Additives(['en:e150d, en:e950'], ['E150d, E950']),
      );

      await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        product,
      );

      SendImage fontImage = SendImage(
        lang: OpenFoodFactsLanguage.GERMAN,
        barcode: barcode,
        imageField: ImageField.FRONT,
        imageUri: Uri.file('test/test_assets/front_coca_light_de.jpg'),
      );
      await OpenFoodAPIClient.addProductImage(
        TestConstants.TEST_USER,
        fontImage,
      );

      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );

      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product!.barcode, barcode);
      expect(result.product!.lastModified != null, true);

      // only german ingredients
      expect(result.product!.ingredientsText != null, true);

      expect(result.product!.ingredients != null, true);
      expect(result.product!.ingredients!.length, 11);

      expect(result.product!.ingredients!.any((i) => i.text == 'Wasser'), true);
      expect(result.product!.ingredients!.any((i) => i.text == 'Kohlensäure'),
          true);
      expect(result.product!.ingredients!.any((i) => i.text == 'e150d'), true);
      expect(result.product!.ingredients!.any((i) => i.text == 'Citronensäure'),
          true);
      expect(result.product!.ingredients!.any((i) => i.text == 'Phosphorsäure'),
          true);
      expect(result.product!.ingredients!.any((i) => i.text == 'Süßungsmittel'),
          true);

      expect(
          result.product!.ingredients!.any((i) => i.text == 'Natriumcyclamat'),
          true);
      expect(result.product!.ingredients!.any((i) => i.text == 'Acesulfam K'),
          true);
      expect(
          result.product!.ingredients!.any((i) => i.text == 'Aspartam'), true);
      expect(result.product!.ingredients!.any((i) => i.text == 'Aroma'), true);
      expect(result.product!.ingredients!.any((i) => i.text == 'Aroma Koffein'),
          true);

      assert(result.product!.selectedImages!.isNotEmpty);

      expect(result.product!.additives!.ids[0], 'en:e150d');
      expect(result.product!.additives!.names[0], 'E150d');
      expect(result.product!.additives!.ids[4], 'en:e950');
      expect(result.product!.additives!.names[4], 'E950');

      expect(result.product!.images != null, true);
      expect(result.product!.images!.length, 4);
      expect(result.product!.countries, 'Frankreich,Deutschland');
    });

    test('get product tiny twists - Rold Gold Pretzels - 16 OZ. (1 LB) 453.6g',
        () async {
      //Refactor the test once the issue  #48 is fixed
      String barcode = '0028400047685';

      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.ENGLISH,
          fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );
      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product!.barcode, barcode);

      expect(result.product!.nutriments!.carbohydratesServing != null, true);
      expect(result.product!.nutriments!.proteinsServing != null, true);
      expect(result.product!.nutriments!.saltServing != null, true);
      expect(result.product!.nutriments!.proteinsServing != null, true);
      expect(result.product!.nutriments!.fatServing != null, true);

      expect(result.product!.countries, 'United States');
    });

    test('check alcohol data', () async {
      const String barcode = '3119780259625';

      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(barcode,
              language: OpenFoodFactsLanguage.ENGLISH,
              fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );
      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product!.barcode, barcode);

      // probably at least 4% vol
      expect(result.product!.nutriments!.alcohol! >= 4, true);
      // no reason why values should be different
      expect(
          result.product!.nutriments!.alcohol ==
              result.product!.nutriments!.alcoholServing,
          true);
      // "% vol" is an unknown unit
      expect(result.product!.nutriments!.alcoholUnit, Unit.UNKNOWN);
    });

    test('get product Danish Butter Cookies & Chocolate Chip Cookies',
        () async {
      String barcode = _BARCODE_DANISH_BUTTER_COOKIES;
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );

      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product!.barcode, barcode);
      expect(result.product!.brandsTags![0], 'kelsin');

      // only german ingredients
      expect(result.product!.ingredientsText != null, true);

      expect(result.product!.ingredients != null, true);
      expect(result.product!.ingredients!.length, 24);

      expect(result.product!.ingredients!.any((i) => i.text == 'Buttergebäck'),
          true);
      expect(result.product!.ingredients!.any((i) => i.text == 'Weizenmehl'),
          false);
      expect(result.product!.ingredients!.any((i) => i.text == 'Zucker'), true);
      expect(
          result.product!.ingredients!.any((i) => i.text == 'Butter'), false);
      expect(result.product!.ingredients!.any((i) => i.text == 'Speisesalz'),
          true);

      expect(
          result.product!.ingredients!.any((i) => i.text == 'Backtriebmittel'),
          true);
      expect(
          result.product!.ingredients!
              .any((i) => i.text == 'Ammouniumhydrogencarbonat'),
          true);
      expect(
          result.product!.ingredients!
              .any((i) => i.text == 'Invertzuckersirup'),
          true);
      expect(
          result.product!.ingredients!
              .any((i) => i.text == 'natürliches Aroma'),
          true);
      expect(
          result.product!.ingredients!
              .any((i) => i.text == 'Schokolade Mürbegebäck'),
          true);

      expect(result.product!.ingredients!.any((i) => i.text == 'Pflanzenfett'),
          true);
      expect(result.product!.ingredients!.any((i) => i.text == 'Palm'), true);
      expect(
          result.product!.ingredients!
              .any((i) => i.text == 'Schokoladenstückchen'),
          true);
      expect(result.product!.ingredients!.any((i) => i.text == 'Kakaomasse'),
          true);
      expect(result.product!.ingredients!.any((i) => i.text == 'Kakaobutter'),
          true);

      expect(
          result.product!.ingredients!.any((i) => i.text == 'Emulgator'), true);
      expect(
          result.product!.ingredients!.any((i) => i.text == 'Lecithin'), true);
      expect(
          result.product!.ingredients!
              .any((i) => i.text == 'fettarmes Kakaopulver'),
          true);

      expect(result.product!.selectedImages!.length, 9);

      expect(result.product!.nutriscore, 'e');

      expect(result.product!.nutriments != null, true);

      expect(result.product!.environmentImpactLevels == null, true);

      expect(result.product!.nutriments!.energy, 2125.0);
      expect(result.product!.nutriments!.sugars, 28.0);
      expect(result.product!.nutriments!.salt, 0.3);
      expect(result.product!.nutriments!.fiber, null);
      expect(result.product!.nutriments!.fat, 25.0);
      expect(result.product!.nutriments!.saturatedFat, 15.0);
      expect(result.product!.nutriments!.proteins, 5.3);
      expect(result.product!.nutriments!.novaGroup, 4);
    });

    test('get product Dole Packaged Foods Company 100% pineapple juice',
        () async {
      String barcode = '0038900009472';
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.ENGLISH,
          fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );

      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product!.barcode, barcode);

      expect(result.product!.nutriments!.iron, 0.00041);
      expect(result.product!.nutriments!.ironUnit, Unit.MILLI_G);
      expect(result.product!.nutriments!.vitaminC, 0.0339);
      expect(result.product!.nutriments!.vitaminCUnit, Unit.MILLI_G);
    });

    test('get uncommon nutrients', () async {
      // PROD data as of 2021-07-16
      const QueryType queryType = QueryType.PROD;
      const User user = TestConstants.PROD_USER;
      const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.FRENCH;
      const List<ProductField> fields = [ProductField.NUTRIMENTS];
      ProductResult result;

      result = await OpenFoodAPIClient.getProduct(
        ProductQueryConfiguration(
          '5060517883638',
          language: language,
          fields: fields,
        ),
        user: user,
        queryType: queryType,
      );
      expect(result.product!.nutriments!.pantothenicAcid, .0042);
      expect(result.product!.nutriments!.pantothenicAcidUnit, Unit.MILLI_G);
      expect(result.product!.nutriments!.pantothenicAcidServing, null);

      result = await OpenFoodAPIClient.getProduct(
        ProductQueryConfiguration(
          '7612100018477',
          language: language,
          fields: fields,
        ),
        user: user,
        queryType: queryType,
      );
      expect(result.product!.nutriments!.biotin, 0.0);
      expect(result.product!.nutriments!.biotinUnit, Unit.G);
      expect(result.product!.nutriments!.biotinServing, null);

      result = await OpenFoodAPIClient.getProduct(
        ProductQueryConfiguration(
          '3057640257773',
          language: language,
          fields: fields,
        ),
        user: user,
        queryType: queryType,
      );
      expect(result.product!.nutriments!.chloride, .015);
      expect(result.product!.nutriments!.chlorideUnit, Unit.MILLI_G);
      expect(result.product!.nutriments!.chlorideServing, .15);

      result = await OpenFoodAPIClient.getProduct(
        ProductQueryConfiguration(
          '4260556630007',
          language: language,
          fields: fields,
        ),
        user: user,
        queryType: queryType,
      );
      expect(result.product!.nutriments!.chromium, .000002);
      expect(result.product!.nutriments!.chromiumUnit, Unit.G);
      expect(result.product!.nutriments!.chromiumServing, .00001);
      expect(result.product!.nutriments!.iodine, .0000075);
      expect(result.product!.nutriments!.iodineUnit, Unit.G);
      expect(result.product!.nutriments!.iodineServing, .0000375);
      expect(result.product!.nutriments!.manganese, .0001);
      expect(result.product!.nutriments!.manganeseUnit, Unit.G);
      expect(result.product!.nutriments!.manganeseServing, .0005);
      expect(result.product!.nutriments!.molybdenum, .000004);
      expect(result.product!.nutriments!.molybdenumUnit, Unit.G);
      expect(result.product!.nutriments!.molybdenumServing, .00002);

      result = await OpenFoodAPIClient.getProduct(
        ProductQueryConfiguration(
          '3155251205319',
          language: language,
          fields: fields,
        ),
        user: user,
        queryType: queryType,
      );
      expect(result.product!.nutriments!.omega3Fat, 4);
      expect(result.product!.nutriments!.omega3FatUnit, Unit.G);
      expect(result.product!.nutriments!.omega3FatServing, 4);
      expect(result.product!.nutriments!.omega6Fat, 9.1);
      expect(result.product!.nutriments!.omega6FatUnit, Unit.G);
      expect(result.product!.nutriments!.omega6FatServing, 9.1);

      result = await OpenFoodAPIClient.getProduct(
        ProductQueryConfiguration(
          '5000159461122',
          language: language,
          fields: fields,
        ),
        user: user,
        queryType: queryType,
      );
      expect(result.product!.nutriments!.transFat, 0.1);
      expect(result.product!.nutriments!.transFatUnit, Unit.G);
      expect(result.product!.nutriments!.transFatServing, 0.05);
    });

    test('get product Confiture Rhubarbe Fraises extra', () async {
      String barcode = '3301595000305';
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.FRENCH,
          fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );

      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product!.barcode, barcode);
      expect(result.product!.productName, 'confiture rhubarbe fraises extra');

      // only france ingredients
      expect(result.product!.ingredientsText != null, true);

      expect(result.product!.ingredients != null, true);
      expect(result.product!.ingredients!.length, 3);

      expect(result.product!.ingredients!.any((i) => i.text == 'Farine de blé'),
          false);
      expect(
          result.product!.ingredients!
              .any((i) => i.text == 'matière grasse non hydrogénée'),
          false);
      expect(
          result.product!.ingredients!.any((i) => i.text == 'graisse de palme'),
          false);
      expect(
          result.product!.ingredients!.any((i) => i.text == 'huile de colza'),
          false);
      expect(
          result.product!.ingredients!.any((i) => i.text == 'colorant'), false);

      expect(result.product!.ingredients!.any((i) => i.text == 'caroténoïdes'),
          false);
      expect(result.product!.ingredients!.any((i) => i.text == 'eau'), false);
      expect(
          result.product!.ingredients!.any((i) => i.text == 'alcool éthylique'),
          false);
      expect(result.product!.ingredients!.any((i) => i.text == 'sel'), false);
      expect(
          result.product!.ingredients!
              .any((i) => i.text == 'jus de citron concentré'),
          false);

      expect(
          result.product!.ingredients!
              .any((i) => i.text == 'agent de traitement de la farine'),
          false);
      expect(result.product!.ingredients!.any((i) => i.text == 'L-cystéine'),
          false);

      expect(result.product!.selectedImages!.length, 9);
      expect(
          result.product!.selectedImages!
              .where((image) => image.language == OpenFoodFactsLanguage.FRENCH)
              .length,
          9);
      expect(
          result.product!.selectedImages!
              .where((image) => image.field == ImageField.FRONT)
              .length,
          3);
      expect(
          result.product!.selectedImages!
              .where((image) => image.field == ImageField.INGREDIENTS)
              .length,
          3);
      expect(
          result.product!.selectedImages!
              .where((image) => image.field == ImageField.NUTRITION)
              .length,
          3);
      expect(
          result.product!.selectedImages!
              .where((image) => image.size == ImageSize.THUMB)
              .length,
          3);
      expect(
          result.product!.selectedImages!
              .where((image) => image.size == ImageSize.DISPLAY)
              .length,
          3);
      expect(
          result.product!.selectedImages!
              .where((image) => image.size == ImageSize.SMALL)
              .length,
          3);

      expect(result.product!.allergens!.ids.length, 0);

      expect(result.product!.nutriments != null, true);

      expect(result.product!.nutriments!.energy, 1081.0);
      expect(result.product!.nutriments!.sugars, 57.0);
      expect(result.product!.nutriments!.salt, 0.06);

      //This field does not exist on the product 20004361
      // (Seems that the product was updated in meantime)
      //expect(result.product.nutriments.fiber, 1.1);

      expect(result.product!.nutriments!.fat, 0.0);
      expect(result.product!.nutriments!.saturatedFat, 0.0);
      expect(result.product!.nutriments!.proteins, 0.6);
      expect(result.product!.nutriments!.novaGroup, 3);
      expect(result.product!.storesTags!.length, 1);

      expect(result.product!.countriesTags, ['en:france']);
    });

    test('product not available', () async {
      String barcode = _BARCODE_UNKNOWN;
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );
      assert(result.product == null);
    });

    test('product ingredients', () async {
      String barcode = '4316268596299';
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );

      assert(result.product != null);
      assert(result.product!.ingredientsText != null);
    });

    test('product ecoscore', () async {
      String barcode = '3229820129488';
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.ENGLISH,
          fields: [
            ProductField.ECOSCORE_GRADE,
            ProductField.ECOSCORE_SCORE,
            ProductField.ECOSCORE_DATA
          ]);
      ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );

      assert(result.product != null);
      assert(result.product!.ecoscoreGrade != null);
      assert(result.product!.ecoscoreScore != null);
      assert(result.product!.ecoscoreData!.agribalyse != null);
      assert(result.product!.ecoscoreData!.adjustments != null);
      assert(result.product!.ecoscoreData!.missingDataWarning == false);
    });

    test('product environment impact levels', () async {
      String barcode = '7613331814562';
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.ENGLISH,
          fields: [ProductField.ENVIRONMENT_IMPACT_LEVELS]);
      ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );

      assert(result.product != null);
      assert(result.product!.environmentImpactLevels != null);
      assert(
          result.product!.environmentImpactLevels!.levels.first == Level.HIGH);
    });

    test('product fields', () async {
      String barcode = '20004361';
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.NAME, ProductField.BRANDS_TAGS]);
      ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );

      assert(result.product != null);
      assert(result.product!.productName != null);
      assert(result.product!.brandsTags != null);
      assert(result.product!.ingredients == null);
      assert(result.product!.ingredientsText == null);
      assert(result.product!.productNameInLanguages == null);
      assert(result.product!.additives!.ids.isEmpty);
      assert(result.product!.additives!.names.isEmpty);
      assert(result.product!.nutrientLevels!.levels.isEmpty);
      assert(result.product!.lang == OpenFoodFactsLanguage.UNDEFINED);

      configurations = ProductQueryConfiguration(barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.NAME, ProductField.LANGUAGE]);
      result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );

      assert(result.product != null);
      assert(result.product!.productName != null);
      assert(result.product!.brandsTags == null);
      assert(result.product!.ingredients == null);
      assert(result.product!.ingredientsText == null);
      assert(result.product!.productNameInLanguages == null);
      assert(result.product!.additives!.ids.isEmpty);
      assert(result.product!.additives!.names.isEmpty);
      assert(result.product!.nutrientLevels!.levels.isEmpty);
      assert(result.product!.lang == OpenFoodFactsLanguage.ENGLISH);

      configurations = ProductQueryConfiguration(barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.NAME, ProductField.COUNTRIES]);
      result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );

      assert(result.product != null);
      assert(result.product!.productName != null);
      assert(result.product!.brandsTags == null);
      assert(result.product!.ingredients == null);
      assert(result.product!.ingredientsText == null);
      assert(result.product!.productNameInLanguages == null);
      assert(result.product!.additives!.ids.isEmpty);
      assert(result.product!.additives!.names.isEmpty);
      assert(result.product!.nutrientLevels!.levels.isEmpty);
      assert(result.product!.lang == OpenFoodFactsLanguage.UNDEFINED);
      assert(result.product!.countries != null);

      configurations = ProductQueryConfiguration(barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.NAME, ProductField.COUNTRIES_TAGS]);
      result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );

      assert(result.product != null);
      assert(result.product!.productName != null);
      assert(result.product!.brandsTags == null);
      assert(result.product!.ingredients == null);
      assert(result.product!.ingredientsText == null);
      assert(result.product!.productNameInLanguages == null);
      assert(result.product!.additives!.ids.isEmpty);
      assert(result.product!.additives!.names.isEmpty);
      assert(result.product!.nutrientLevels!.levels.isEmpty);
      assert(result.product!.lang == OpenFoodFactsLanguage.UNDEFINED);
      assert(result.product!.countriesTags != null);
    });

    test('attribute groups', () async {
      String barcode = '3700214614266';
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.ENGLISH,
          fields: [ProductField.NAME, ProductField.ATTRIBUTE_GROUPS]);
      ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );

      assert(result.product != null);
      assert(result.product!.productName != null);
      assert(result.product!.attributeGroups != null);

      AttributeGroup group;

      group = result.product!.attributeGroups!
          .singleWhere((element) => element.id == 'nutritional_quality');
      final List<Attribute> nutritionalQuality = group.attributes!;
      assert(nutritionalQuality.first.id == 'nutriscore');
      assert(nutritionalQuality.first.settingName == null);
      assert(nutritionalQuality.first.settingNote == null);
      assert(nutritionalQuality.first.description == '');
      assert(nutritionalQuality.first.descriptionShort ==
          'Poor nutritional quality');
      assert(nutritionalQuality.first.title == 'Nutri-Score D');
      assert(nutritionalQuality.first.name == 'Nutri-Score');
      assert(nutritionalQuality.first.match! > 31);
      assert(nutritionalQuality.first.status == 'known');
      assert(nutritionalQuality[1].id == 'low_salt');
      assert(nutritionalQuality[2].id == 'low_fat');
      assert(nutritionalQuality[3].id == 'low_sugars');
      assert(nutritionalQuality[4].id == 'low_saturated_fat');

      group = result.product!.attributeGroups!
          .singleWhere((element) => element.id == 'processing');
      final List<Attribute> processing = group.attributes!;
      assert(processing.first.id == 'nova');

      group = result.product!.attributeGroups!
          .singleWhere((element) => element.id == 'labels');

      final Set<ProductImprovement> improvements =
          result.product!.getProductImprovements();
      expect(improvements.contains(ProductImprovement.ORIGINS_TO_BE_COMPLETED),
          false);
    });

    test('get product without setting OpenFoodFactsLanguage or ProductField; ',
        () async {
      String barcode = '5000112548167';

      //Get product without setting OpenFoodFactsLanguage or ProductField
      ProductQueryConfiguration configurations =
          ProductQueryConfiguration(barcode);
      ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );

      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product!.barcode, barcode);
      expect(result.product!.lastModified != null, true);
      expect(result.product!.ingredientsText != null, true);

      expect(result.product!.ingredients != null, true);
      expect(result.product!.ingredients!.length, 13);
      expect(result.product!.ingredients!.any((i) => i.text == 'Aroma'), true);

      expect(result.product!.additives!.ids[0], 'en:e150d');
      expect(result.product!.additives!.names[0], 'E150d');
      expect(result.product!.additives!.ids[4], 'en:e950');
      expect(result.product!.additives!.names[4], 'E950');

      expect(
          result
              .product!.nutrientLevels!.levels[NutrientLevels.NUTRIENT_SUGARS],
          Level.LOW);
      expect(
          result.product!.nutrientLevels!.levels[NutrientLevels.NUTRIENT_SALT],
          Level.LOW);

      expect(result.product!.images != null, true);
      expect(result.product!.images!.length, 20);
      expect(
          result.product!.images!
              .singleWhere((image) =>
                  image.field == ImageField.INGREDIENTS &&
                  image.size == ImageSize.DISPLAY &&
                  image.language == OpenFoodFactsLanguage.GERMAN)
              .url,
          'https://static.openfoodfacts.net/images/products/500/011/254/8167/ingredients_de.7.400.jpg');

      //Get product without setting ProductField
      configurations = ProductQueryConfiguration(barcode,
          language: OpenFoodFactsLanguage.GERMAN);
      result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );

      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product!.barcode, barcode);
      expect(result.product!.lastModified != null, true);

      expect(result.product!.ingredientsText != null, true);

      expect(result.product!.ingredients != null, true);
      expect(result.product!.ingredients!.length, 13);

      expect(result.product!.ingredients!.any((i) => i.text == 'Wasser'), true);
      expect(result.product!.ingredients!.any((i) => i.text == 'Kohlensäure'),
          true);

      expect(result.product!.additives!.ids[0], 'en:e150d');
      expect(result.product!.additives!.names[0], 'E150d');
      expect(result.product!.additives!.ids[4], 'en:e950');
      expect(result.product!.additives!.names[4], 'E950');

      expect(
          result
              .product!.nutrientLevels!.levels[NutrientLevels.NUTRIENT_SUGARS],
          Level.LOW);
      expect(
          result.product!.nutrientLevels!.levels[NutrientLevels.NUTRIENT_SALT],
          Level.LOW);

      expect(result.product!.images != null, true);
      expect(result.product!.images!.length, 20);
      expect(
          result.product!.images!
              .singleWhere((image) =>
                  image.field == ImageField.INGREDIENTS &&
                  image.size == ImageSize.DISPLAY &&
                  image.language == OpenFoodFactsLanguage.GERMAN)
              .url,
          'https://static.openfoodfacts.net/images/products/500/011/254/8167/ingredients_de.7.400.jpg');

      //Get product without setting OpenFoodFactsLanguage
      configurations =
          ProductQueryConfiguration(barcode, fields: [ProductField.ALL]);
      result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );

      expect(result.status, 1);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product!.barcode, barcode);
      expect(result.product!.lastModified != null, true);

      expect(result.product!.ingredientsText != null, true);

      expect(result.product!.ingredients != null, true);
      expect(result.product!.ingredients!.length, 13);

      expect(result.product!.ingredients!.any((i) => i.text == 'Wasser'), true);
      expect(result.product!.ingredients!.any((i) => i.text == 'Kohlensäure'),
          true);
      expect(result.product!.ingredients!.any((i) => i.text == 'Süßungsmittel'),
          true);
      expect(result.product!.ingredients!.any((i) => i.text == 'Aroma'), true);
      expect(result.product!.ingredients!.any((i) => i.text == 'Aroma Koffein'),
          true);

      expect(result.product!.selectedImages!.length, 15);

      expect(result.product!.nutriments != null, true);

      expect(result.product!.nutriments!.energy, 0.8);
      expect(result.product!.nutriments!.sugars, 0.0);
      expect(result.product!.nutriments!.salt, 0.01);
      expect(result.product!.nutriments!.fiber, null);
      expect(result.product!.nutriments!.fat, 0.0);
      expect(result.product!.nutriments!.saturatedFat, 0.0);
      expect(result.product!.nutriments!.proteins, 0.0);
      expect(result.product!.nutriments!.novaGroup, 4);
      assert(result.product!.nutriments!.fatServing != null);
      expect(result.product!.nutriments!.carbohydratesServing == null, false);

      expect(result.product!.additives!.ids[0], 'en:e150d');
      expect(result.product!.additives!.names[0], 'E150d');
      expect(result.product!.additives!.ids[4], 'en:e950');
      expect(result.product!.additives!.names[4], 'E950');

      expect(
          result
              .product!.nutrientLevels!.levels[NutrientLevels.NUTRIENT_SUGARS],
          Level.LOW);
      expect(
          result.product!.nutrientLevels!.levels[NutrientLevels.NUTRIENT_SALT],
          Level.LOW);

      expect(result.product!.images != null, true);
      expect(result.product!.images!.length, 20);
      expect(
          result.product!.images!
              .singleWhere((image) =>
                  image.field == ImageField.INGREDIENTS &&
                  image.size == ImageSize.DISPLAY &&
                  image.language == OpenFoodFactsLanguage.GERMAN)
              .url,
          'https://static.openfoodfacts.net/images/products/500/011/254/8167/ingredients_de.7.400.jpg');

      final Set<ProductImprovement> improvements =
          result.product!.getProductImprovements();
      expect(improvements.contains(ProductImprovement.ORIGINS_TO_BE_COMPLETED),
          true);
    });

    test(
        'vegan, vegetarian and palm oil ingredients of Danish Butter Cookies & Chocolate Chip Cookies',
        () async {
      String barcode = _BARCODE_DANISH_BUTTER_COOKIES;
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );

      final vegetableFat = result.product!.ingredients!
          .firstWhere((ingredient) => ingredient.text == 'Pflanzenfett');
      expect(vegetableFat.vegan, IngredientSpecialPropertyStatus.POSITIVE);
      expect(vegetableFat.vegetarian, IngredientSpecialPropertyStatus.POSITIVE);
      expect(vegetableFat.fromPalmOil, IngredientSpecialPropertyStatus.MAYBE);
    });

    test('matched product', () async {
      final Map<String, String> attributeImportances = {};
      int refreshCounter = 0;
      final ProductPreferencesManager manager = ProductPreferencesManager(
        ProductPreferencesSelection(
          setImportance: (String attributeId, String importanceIndex) async {
            attributeImportances[attributeId] = importanceIndex;
          },
          getImportance: (String attributeId) =>
              attributeImportances[attributeId] ??
              PreferenceImportance.ID_NOT_IMPORTANT,
          notify: () => refreshCounter++,
        ),
      );
      const String languageCode = 'en';
      final String importanceUrl =
          AvailablePreferenceImportances.getUrl(languageCode);
      final String attributeGroupUrl =
          AvailableAttributeGroups.getUrl(languageCode);
      http.Response response;
      response = await http.get(Uri.parse(importanceUrl));
      expect(response.statusCode, _HTTP_OK);
      final String preferenceImportancesString = response.body;
      response = await http.get(Uri.parse(attributeGroupUrl));
      expect(response.statusCode, _HTTP_OK);
      final String attributeGroupsString = response.body;
      manager.availableProductPreferences =
          AvailableProductPreferences.loadFromJSONStrings(
        preferenceImportancesString: preferenceImportancesString,
        attributeGroupsString: attributeGroupsString,
      );
      expect(refreshCounter, 0);

      const String barcode = '0028400047685';
      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(
        barcode,
        lc: languageCode,
        fields: [ProductField.NAME, ProductField.ATTRIBUTE_GROUPS],
      );
      final ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );
      expect(result.status, 1);
      expect(result.barcode, barcode);

      final String attributeId1 = Attribute.ATTRIBUTE_NUTRISCORE;
      final String attributeId2 = Attribute.ATTRIBUTE_FOREST_FOOTPRINT;
      final String importanceId1 = PreferenceImportance.ID_MANDATORY;
      final String importanceId2 = PreferenceImportance.ID_IMPORTANT;
      await manager.setImportance(attributeId1, importanceId1);
      expect(
          manager.getImportanceIdForAttributeId(attributeId1), importanceId1);
      expect(refreshCounter, 1);
      await manager.setImportance(attributeId2, importanceId2);
      expect(
          manager.getImportanceIdForAttributeId(attributeId2), importanceId2);
      expect(refreshCounter, 2);
      MatchedProduct matchedProduct;

      matchedProduct = MatchedProduct(result.product!, manager);
      assert(matchedProduct.score > 151);
      expect(matchedProduct.status, MatchedProductStatus.YES);

      await manager.setImportance(attributeId1, importanceId2);
      expect(
          manager.getImportanceIdForAttributeId(attributeId1), importanceId2);
      expect(refreshCounter, 3);
      await manager.setImportance(attributeId2, importanceId1);
      expect(
          manager.getImportanceIdForAttributeId(attributeId2), importanceId1);
      expect(refreshCounter, 4);

      matchedProduct = MatchedProduct(result.product!, manager);
      assert(matchedProduct.score > 37.5);
      expect(
          matchedProduct.status,
          MatchedProductStatus
              .YES); // because the score for FOREST is not good enough

      await manager.clearImportances(); // no attribute parameters at all
      expect(refreshCounter, 5);

      matchedProduct = MatchedProduct(result.product!, manager);
      expect(matchedProduct.score, 0.0);
      expect(matchedProduct.status, MatchedProductStatus.YES);
    });

    test(
        'localized fields when a product is not available in a second language',
        () async {
      String barcode = '3333333333333';

      Product englishInputProduct = Product(
        barcode: barcode,
        lang: OpenFoodFactsLanguage.ENGLISH,
        productNameInLanguages: {OpenFoodFactsLanguage.ENGLISH: 'Pancakes'},
        ingredientsTextInLanguages: {
          OpenFoodFactsLanguage.ENGLISH: 'Flour, water'
        },
        categories: 'Beverages',
        countries: 'Russia',
      );

      await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        englishInputProduct,
      );

      final fields = [
        ProductField.NAME,
        ProductField.NAME_IN_LANGUAGES,
        ProductField.INGREDIENTS_TEXT,
        ProductField.INGREDIENTS_TEXT_IN_LANGUAGES,
        ProductField.INGREDIENTS_TAGS,
        ProductField.INGREDIENTS_TAGS_IN_LANGUAGES,
        ProductField.CATEGORIES_TAGS,
        ProductField.CATEGORIES_TAGS_IN_LANGUAGES,
        ProductField.COUNTRIES_TAGS,
        ProductField.COUNTRIES_TAGS_IN_LANGUAGES,
      ];

      ProductQueryConfiguration englishConf = ProductQueryConfiguration(barcode,
          language: OpenFoodFactsLanguage.ENGLISH, fields: fields);
      ProductQueryConfiguration russianConf = ProductQueryConfiguration(barcode,
          language: OpenFoodFactsLanguage.RUSSIAN, fields: fields);

      // English!

      ProductResult englishResult = await OpenFoodAPIClient.getProduct(
        englishConf,
        user: TestConstants.TEST_USER,
      );
      Product englishProduct = englishResult.product!;

      expect(englishProduct.productName, equals('Pancakes'));
      expect(englishProduct.productNameInLanguages,
          equals({OpenFoodFactsLanguage.ENGLISH: 'Pancakes'}));

      expect(englishProduct.ingredientsText, equals('Flour, water'));
      expect(englishProduct.ingredientsTextInLanguages,
          equals({OpenFoodFactsLanguage.ENGLISH: 'Flour, water'}));

      expect(englishProduct.ingredientsTags, equals(['en:flour', 'en:water']));
      expect(
          englishProduct.ingredientsTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: ['Flour', 'Water']
          }));

      expect(englishProduct.categoriesTags, equals(['en:beverages']));
      expect(
          englishProduct.categoriesTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: ['Beverages']
          }));

      expect(englishProduct.countriesTags, equals(['en:russia']));
      expect(
          englishProduct.countriesTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: ['Russia']
          }));

      // Russian!

      ProductResult russianResult = await OpenFoodAPIClient.getProduct(
        russianConf,
        user: TestConstants.TEST_USER,
      );
      Product russianProduct = russianResult.product!;

      expect(russianProduct.productName, equals('Pancakes'));
      expect(russianProduct.productNameInLanguages, isNull);

      expect(russianProduct.ingredientsText, equals('Flour, water'));
      expect(russianProduct.ingredientsTextInLanguages, isNull);

      expect(russianProduct.ingredientsTags, equals(['en:flour', 'en:water']));
      expect(
          russianProduct.ingredientsTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.RUSSIAN: ['Мука', 'Вода']
          }));

      expect(russianProduct.categoriesTags, equals(['en:beverages']));
      expect(
          russianProduct.categoriesTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.RUSSIAN: ['Напитки']
          }));

      expect(russianProduct.countriesTags, equals(['en:russia']));
      expect(
          russianProduct.countriesTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.RUSSIAN: ['Россия']
          }));
    });

    test('localized fields when a product is available in a second language',
        () async {
      String barcode = '2222222222222';

      Product englishInputProduct = Product(
        barcode: barcode,
        lang: OpenFoodFactsLanguage.ENGLISH,
        productNameInLanguages: {OpenFoodFactsLanguage.ENGLISH: 'Pancakes'},
        ingredientsTextInLanguages: {
          OpenFoodFactsLanguage.ENGLISH: 'Flour, water'
        },
        categories: 'Beverages',
        countries: 'Russia',
      );

      Product russianInputProduct = Product(
        barcode: barcode,
        productNameInLanguages: {OpenFoodFactsLanguage.RUSSIAN: 'Блинчики'},
        ingredientsTextInLanguages: {
          OpenFoodFactsLanguage.RUSSIAN: 'Мука, вода'
        },
      );

      await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        englishInputProduct,
      );
      await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        russianInputProduct,
      );

      final fields = [
        ProductField.NAME,
        ProductField.NAME_IN_LANGUAGES,
        ProductField.INGREDIENTS_TEXT,
        ProductField.INGREDIENTS_TEXT_IN_LANGUAGES,
        ProductField.INGREDIENTS_TAGS,
        ProductField.INGREDIENTS_TAGS_IN_LANGUAGES,
        ProductField.CATEGORIES_TAGS,
        ProductField.CATEGORIES_TAGS_IN_LANGUAGES,
        ProductField.COUNTRIES_TAGS,
        ProductField.COUNTRIES_TAGS_IN_LANGUAGES,
      ];

      ProductQueryConfiguration englishConf = ProductQueryConfiguration(barcode,
          language: OpenFoodFactsLanguage.ENGLISH, fields: fields);
      ProductQueryConfiguration russianConf = ProductQueryConfiguration(barcode,
          language: OpenFoodFactsLanguage.RUSSIAN, fields: fields);

      // English!

      ProductResult englishResult = await OpenFoodAPIClient.getProduct(
        englishConf,
        user: TestConstants.TEST_USER,
      );
      Product englishProduct = englishResult.product!;

      expect(englishProduct.productName, equals('Pancakes'));
      expect(englishProduct.productNameInLanguages,
          equals({OpenFoodFactsLanguage.ENGLISH: 'Pancakes'}));

      expect(englishProduct.ingredientsText, equals('Flour, water'));
      expect(englishProduct.ingredientsTextInLanguages,
          equals({OpenFoodFactsLanguage.ENGLISH: 'Flour, water'}));

      expect(englishProduct.ingredientsTags, equals(['en:flour', 'en:water']));
      expect(
          englishProduct.ingredientsTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: ['Flour', 'Water']
          }));

      expect(englishProduct.categoriesTags, equals(['en:beverages']));
      expect(
          englishProduct.categoriesTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: ['Beverages']
          }));

      expect(englishProduct.countriesTags, equals(['en:russia']));
      expect(
          englishProduct.countriesTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: ['Russia']
          }));

      // Russian!

      ProductResult russianResult = await OpenFoodAPIClient.getProduct(
        russianConf,
        user: TestConstants.TEST_USER,
      );
      Product russianProduct = russianResult.product!;

      expect(russianProduct.productName, equals('Блинчики'));
      expect(russianProduct.productNameInLanguages,
          equals({OpenFoodFactsLanguage.RUSSIAN: 'Блинчики'}));

      expect(russianProduct.ingredientsText, equals('Мука, вода'));
      expect(russianProduct.ingredientsTextInLanguages,
          equals({OpenFoodFactsLanguage.RUSSIAN: 'Мука, вода'}));

      expect(russianProduct.ingredientsTags, equals(['en:flour', 'en:water']));
      expect(
          russianProduct.ingredientsTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.RUSSIAN: ['Мука', 'Вода']
          }));

      expect(russianProduct.categoriesTags, equals(['en:beverages']));
      expect(
          russianProduct.categoriesTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.RUSSIAN: ['Напитки']
          }));

      expect(russianProduct.countriesTags, equals(['en:russia']));
      expect(
          russianProduct.countriesTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.RUSSIAN: ['Россия']
          }));
    });

    test('multiple languages and in-languages fields', () async {
      String barcode = '2222222222224';

      Product inputProduct = Product(
        barcode: barcode,
        lang: OpenFoodFactsLanguage.ENGLISH,
        productNameInLanguages: {
          OpenFoodFactsLanguage.ENGLISH: 'Pancakes',
          OpenFoodFactsLanguage.RUSSIAN: 'Блинчики',
          OpenFoodFactsLanguage.GERMAN: 'Pfannkuchen',
        },
        ingredientsTextInLanguages: {
          OpenFoodFactsLanguage.ENGLISH: 'Flour, water',
          OpenFoodFactsLanguage.RUSSIAN: 'Мука, вода',
          OpenFoodFactsLanguage.GERMAN: 'Mehl, wasser',
        },
        categories: 'Beverages',
        countries: 'Russia',
      );

      await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        inputProduct,
      );

      final fields = [
        ProductField.NAME,
        ProductField.NAME_IN_LANGUAGES,
        ProductField.INGREDIENTS_TEXT,
        ProductField.INGREDIENTS_TEXT_IN_LANGUAGES,
        ProductField.INGREDIENTS_TAGS,
        ProductField.INGREDIENTS_TAGS_IN_LANGUAGES,
        ProductField.CATEGORIES_TAGS,
        ProductField.CATEGORIES_TAGS_IN_LANGUAGES,
        ProductField.COUNTRIES_TAGS,
        ProductField.COUNTRIES_TAGS_IN_LANGUAGES,
      ];

      ProductQueryConfiguration conf = ProductQueryConfiguration(barcode,
          languages: [
            OpenFoodFactsLanguage.ENGLISH,
            OpenFoodFactsLanguage.RUSSIAN,
            OpenFoodFactsLanguage.GERMAN
          ],
          fields: fields);

      ProductResult result = await OpenFoodAPIClient.getProduct(
        conf,
        user: TestConstants.TEST_USER,
      );
      Product product = result.product!;

      expect(product.productName, equals('Pancakes'));
      expect(
          product.productNameInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: 'Pancakes',
            OpenFoodFactsLanguage.RUSSIAN: 'Блинчики',
            OpenFoodFactsLanguage.GERMAN: 'Pfannkuchen',
          }));

      expect(product.ingredientsText, equals('Flour, water'));
      expect(
          product.ingredientsTextInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: 'Flour, water',
            OpenFoodFactsLanguage.RUSSIAN: 'Мука, вода',
            OpenFoodFactsLanguage.GERMAN: 'Mehl, wasser',
          }));

      expect(product.ingredientsTags, equals(['en:flour', 'en:water']));
      expect(
          product.ingredientsTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: ['Flour', 'Water'],
            OpenFoodFactsLanguage.RUSSIAN: ['Мука', 'Вода'],
            OpenFoodFactsLanguage.GERMAN: ['Mehl', 'Wasser'],
          }));

      expect(product.categoriesTags, equals(['en:beverages']));
      expect(
          product.categoriesTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: ['Beverages'],
            OpenFoodFactsLanguage.RUSSIAN: ['Напитки'],
            OpenFoodFactsLanguage.GERMAN: ['Getränke'],
          }));

      expect(product.countriesTags, equals(['en:russia']));
      expect(
          product.countriesTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: ['Russia'],
            OpenFoodFactsLanguage.RUSSIAN: ['Россия'],
            OpenFoodFactsLanguage.GERMAN: ['Russland'],
          }));
    });

    test('multiple languages and text fields priority', () async {
      String barcode = '2222222222225';

      Product inputProduct = Product(
        barcode: barcode,
        lang: OpenFoodFactsLanguage.ENGLISH,
        productNameInLanguages: {
          OpenFoodFactsLanguage.ENGLISH: 'Pancakes',
          OpenFoodFactsLanguage.RUSSIAN: 'Блинчики',
          OpenFoodFactsLanguage.GERMAN: 'Pfannkuchen',
        },
        ingredientsTextInLanguages: {
          OpenFoodFactsLanguage.ENGLISH: 'Flour, water',
          OpenFoodFactsLanguage.GERMAN: 'Mehl, wasser',
        },
      );

      await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        inputProduct,
      );

      final fields = [
        ProductField.NAME,
        ProductField.INGREDIENTS_TEXT,
      ];

      // English first
      ProductQueryConfiguration conf = ProductQueryConfiguration(barcode,
          languages: [
            OpenFoodFactsLanguage.ENGLISH,
            OpenFoodFactsLanguage.RUSSIAN,
            OpenFoodFactsLanguage.GERMAN,
          ],
          fields: fields);
      ProductResult result = await OpenFoodAPIClient.getProduct(
        conf,
        user: TestConstants.TEST_USER,
      );
      Product product = result.product!;
      // English was of highest priority so English texts are expected
      expect(product.productName, equals('Pancakes'));
      expect(product.ingredientsText, equals('Flour, water'));

      // German first
      conf = ProductQueryConfiguration(barcode,
          languages: [
            OpenFoodFactsLanguage.GERMAN,
            OpenFoodFactsLanguage.RUSSIAN,
            OpenFoodFactsLanguage.ENGLISH,
          ],
          fields: fields);
      result = await OpenFoodAPIClient.getProduct(
        conf,
        user: TestConstants.TEST_USER,
      );
      product = result.product!;
      // German was of highest priority so German texts are expected
      expect(product.productName, equals('Pfannkuchen'));
      expect(product.ingredientsText, equals('Mehl, wasser'));

      // Russian first
      conf = ProductQueryConfiguration(barcode,
          languages: [
            OpenFoodFactsLanguage.RUSSIAN,
            OpenFoodFactsLanguage.GERMAN,
            OpenFoodFactsLanguage.ENGLISH,
          ],
          fields: fields);
      result = await OpenFoodAPIClient.getProduct(
        conf,
        user: TestConstants.TEST_USER,
      );
      product = result.product!;
      // Russian was of highest priority so Russian _name_ is expected...
      expect(product.productName, equals('Блинчики'));
      // ...but there's no ingredients list in Russian so ingredients list with
      // next priority (German) is expected to be used.
      expect(product.ingredientsText, equals('Mehl, wasser'));
    });

    test('all-languages fields', () async {
      String barcode = '2222222222226';

      Product inputProduct = Product(
        barcode: barcode,
        lang: OpenFoodFactsLanguage.ENGLISH,
        productNameInLanguages: {
          OpenFoodFactsLanguage.ENGLISH: 'Pancakes',
          OpenFoodFactsLanguage.RUSSIAN: 'Блинчики',
          OpenFoodFactsLanguage.GERMAN: 'Pfannkuchen',
        },
        ingredientsTextInLanguages: {
          OpenFoodFactsLanguage.ENGLISH: 'Flour, water',
          OpenFoodFactsLanguage.GERMAN: 'Mehl, wasser',
        },
      );

      await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        inputProduct,
      );

      // Request all available languages for the fields which allow it
      final fields = [
        ProductField.NAME_ALL_LANGUAGES,
        ProductField.INGREDIENTS_TEXT_ALL_LANGUAGES,
      ];
      ProductQueryConfiguration conf =
          ProductQueryConfiguration(barcode, fields: fields);
      ProductResult result = await OpenFoodAPIClient.getProduct(
        conf,
        user: TestConstants.TEST_USER,
      );
      Product product = result.product!;

      // Verify that all the available languages are obtained
      expect(
          product.productNameInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: 'Pancakes',
            OpenFoodFactsLanguage.RUSSIAN: 'Блинчики',
            OpenFoodFactsLanguage.GERMAN: 'Pfannkuchen',
          }));
      expect(
          product.ingredientsTextInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: 'Flour, water',
            OpenFoodFactsLanguage.GERMAN: 'Mehl, wasser',
          }));
    });

    test(
        'requesting all-langs and in-langs fields together does not break anything',
        () async {
      String barcode = '2222222222227';

      Product inputProduct = Product(
        barcode: barcode,
        lang: OpenFoodFactsLanguage.ENGLISH,
        productNameInLanguages: {
          OpenFoodFactsLanguage.ENGLISH: 'Pancakes',
          OpenFoodFactsLanguage.RUSSIAN: 'Блинчики',
          OpenFoodFactsLanguage.GERMAN: 'Pfannkuchen',
        },
        ingredientsTextInLanguages: {
          OpenFoodFactsLanguage.ENGLISH: 'Flour, water',
          OpenFoodFactsLanguage.GERMAN: 'Mehl, wasser',
        },
      );

      await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        inputProduct,
      );

      // Request both 'all-langs' and 'in-langs' fields types
      final fields = [
        ProductField.NAME_ALL_LANGUAGES,
        ProductField.NAME_IN_LANGUAGES,
        ProductField.INGREDIENTS_TEXT_ALL_LANGUAGES,
        ProductField.INGREDIENTS_TEXT_IN_LANGUAGES,
      ];
      // For 'in-langs' fields specify not all of the available languages
      ProductQueryConfiguration conf = ProductQueryConfiguration(barcode,
          languages: [
            OpenFoodFactsLanguage.RUSSIAN,
            OpenFoodFactsLanguage.ENGLISH,
          ],
          fields: fields);
      ProductResult result = await OpenFoodAPIClient.getProduct(
        conf,
        user: TestConstants.TEST_USER,
      );
      Product product = result.product!;

      // Verify that all the available languages are obtained
      expect(
          product.productNameInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: 'Pancakes',
            OpenFoodFactsLanguage.RUSSIAN: 'Блинчики',
            OpenFoodFactsLanguage.GERMAN: 'Pfannkuchen',
          }));
      expect(
          product.ingredientsTextInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: 'Flour, water',
            OpenFoodFactsLanguage.GERMAN: 'Mehl, wasser',
          }));
    });

    test('product with quotes', () async {
      String barcode = '2222222222223';
      Product product = Product(
          barcode: barcode,
          productName: 'Quoted Coca "cola"',
          lang: OpenFoodFactsLanguage.GERMAN,
          brands: 'Quoted Coca "Cola"');

      await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        product,
      );

      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );

      expect(result.product!.productName, equals('Quoted Coca "cola"'));
      expect(result.product!.brands, equals('Quoted Coca "Cola"'));
    });

    test('get ecoscore html description', () async {
      final OpenFoodFactsLanguage language = OpenFoodFactsLanguage.FRENCH;
      String? result;

      result = await OpenFoodAPIClient.getEcoscoreHtmlDescription(
        _BARCODE_DANISH_BUTTER_COOKIES,
        language,
      );
      assert(result != null);

      result = await OpenFoodAPIClient.getEcoscoreHtmlDescription(
        _BARCODE_UNKNOWN,
        language,
      );
      assert(result == null);
    });
  });

  test('get invalid barcodes', () async {
    final String url = InvalidBarcodes.getUrl();
    final http.Response response = await http.get(Uri.parse(url));
    expect(response.statusCode, _HTTP_OK);
    final String jsonString = response.body;
    InvalidBarcodes invalidBarcodes =
        InvalidBarcodes.loadFromJSONString(jsonString);
    assert(invalidBarcodes.isBlacklisted('15600703'));
    assert(!invalidBarcodes.isBlacklisted(_BARCODE_DANISH_BUTTER_COOKIES));

    invalidBarcodes = InvalidBarcodes.base();
    assert(invalidBarcodes.isBlacklisted('15600703'));
    assert(!invalidBarcodes.isBlacklisted(_BARCODE_DANISH_BUTTER_COOKIES));
  });
}
