import 'package:http/http.dart' as http;
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  const int HTTP_OK = 200;

  const BARCODE_UNKNOWN = '11111111111111111111111111';
  const BARCODE_DANISH_BUTTER_COOKIES = '5701184005007';

  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;

  void findExpectedIngredients(
    final List<Ingredient> ingredients,
    final List<String> labels,
  ) {
    bool foundIngredient(
      final String label,
      final List<Ingredient> ingredients,
    ) {
      for (final Ingredient ingredient in ingredients) {
        if (ingredient.text == label) {
          return true;
        }
        if (ingredient.ingredients != null) {
          if (foundIngredient(label, ingredient.ingredients!)) {
            return true;
          }
        }
      }
      return false;
    }

    for (final String label in labels) {
      expect(
        foundIngredient(label, ingredients),
        true,
        reason: 'Could not find ingredient "$label"',
      );
    }
  }

  group('$OpenFoodAPIClient get products', () {
    test('get product tiny twists - Rold Gold Pretzels - 16 OZ. (1 LB) 453.6g',
        () async {
      //Refactor the test once the issue  #48 is fixed
      String barcode = '0028400047685';

      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.ENGLISH,
        fields: [ProductField.ALL],
        version: ProductQueryVersion.v3,
      );
      final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
      );
      expect(result.status, ProductResultV3.statusSuccess);
      expect(result.barcode, barcode);
      expect(result.product, isNotNull);
      expect(result.product!.barcode, barcode);

      expect(result.product!.nutriments, isNotNull);
      final Nutriments nutriments = result.product!.nutriments!;
      const PerSize perSize = PerSize.serving;
      expect(nutriments.getValue(Nutrient.carbohydrates, perSize), isNotNull);
      expect(nutriments.getValue(Nutrient.proteins, perSize), isNotNull);
      expect(nutriments.getValue(Nutrient.salt, perSize), isNotNull);
      expect(nutriments.getValue(Nutrient.fat, perSize), isNotNull);

      expect(result.product!.countries, 'United States');
    });

    test('check alcohol data', () async {
      const String barcode = '3119780259625';

      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.ENGLISH,
        fields: [ProductField.ALL],
        version: ProductQueryVersion.v3,
      );
      ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
      );
      expect(result.status, ProductResultV3.statusSuccess);
      expect(result.barcode, barcode);
      expect(result.product, isNotNull);
      expect(result.product!.barcode, barcode);

      const Nutrient alcohol = Nutrient.alcohol;
      expect(result.product!.nutriments, isNotNull);
      final Nutriments nutriments = result.product!.nutriments!;

      // probably at least 4% vol
      expect(
        nutriments.getValue(alcohol, PerSize.oneHundredGrams),
        greaterThanOrEqualTo(4),
      );
      // no reason why values should be different
      expect(
        nutriments.getValue(alcohol, PerSize.serving),
        nutriments.getValue(alcohol, PerSize.oneHundredGrams),
      );
    });

    test('get product Danish Butter Cookies & Chocolate Chip Cookies',
        () async {
      const String barcode = BARCODE_DANISH_BUTTER_COOKIES;
      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.GERMAN,
        fields: [ProductField.ALL],
        version: ProductQueryVersion.v3,
      );
      final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
      );

      expect(result.status, ProductResultV3.statusSuccess);
      expect(result.barcode, barcode);
      expect(result.product, isNotNull);
      expect(result.product!.barcode, barcode);
      expect(result.product!.brandsTags![0], 'kelsin');

      // only german ingredients
      expect(result.product!.ingredientsText, isNotNull);

      expect(result.product!.ingredients, isNotNull);
      expect(result.product!.ingredients!.length, 9);

      findExpectedIngredients(
        result.product!.ingredients!,
        [
          'Buttergebäck',
          '_Weizenmehl_',
          'Zucker',
          '_Butter_',
          'Speisesalz',
          'Backtriebmittel',
          'Ammouniumhydrogencarbonat',
          'Invertzuckersirup',
          'natürliches Aroma',
          'Schokolade Mürbegebäck',
          'PflanzenPalmfett',
          'Schokoladenstückchen',
          'Kakaomasse',
          'Kakaobutter',
          'Emulgator',
          'Lecithin',
          'fettarmes Kakaopulver',
        ],
      );

      expect(result.product!.selectedImages!.length, 9);

      expect(result.product!.nutriscore, 'e');

      expect(result.product!.nutriments, isNotNull);
      final Nutriments nutriments = result.product!.nutriments!;

      const PerSize perSize = PerSize.oneHundredGrams;
      expect(nutriments.getValue(Nutrient.energyKJ, perSize), 2125.0);
      expect(nutriments.getValue(Nutrient.sugars, perSize), 28.0);
      expect(nutriments.getValue(Nutrient.salt, perSize), 0.3);
      expect(nutriments.getValue(Nutrient.fiber, perSize), isNull);
      expect(nutriments.getValue(Nutrient.fat, perSize), 25.0);
      expect(nutriments.getValue(Nutrient.saturatedFat, perSize), 15.0);
      expect(nutriments.getValue(Nutrient.proteins, perSize), 5.3);
      expect(result.product!.novaGroup, 4);
    });

    test('get product Dole Packaged Foods Company 100% pineapple juice',
        () async {
      const String barcode = '0038900009472';
      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.ENGLISH,
        fields: [ProductField.ALL],
        version: ProductQueryVersion.v3,
      );
      final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
      );

      expect(result.status, ProductResultV3.statusSuccess);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product!.barcode, barcode);

      expect(result.product!.nutriments, isNotNull);
      final Nutriments nutriments = result.product!.nutriments!;
      const PerSize perSize = PerSize.oneHundredGrams;

      expect(nutriments.getValue(Nutrient.iron, perSize), 0.00041);
      expect(nutriments.getValue(Nutrient.vitaminC, perSize), 0.0339);
    });

    test('get uncommon nutrients', () async {
      // PROD data as of 2021-07-16
      const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.FRENCH;
      const List<ProductField> fields = [ProductField.NUTRIMENTS];
      ProductResultV3 result;
      late Nutriments nutriments;

      result = await OpenFoodAPIClient.getProductV3(
        ProductQueryConfiguration(
          '5060517883638',
          language: language,
          fields: fields,
          version: ProductQueryVersion.v3,
        ),
      );
      expect(result.product!.nutriments, isNotNull);
      nutriments = result.product!.nutriments!;
      expect(
        nutriments.getValue(Nutrient.pantothenicAcid, PerSize.oneHundredGrams),
        .0042,
      );
      expect(
        nutriments.getValue(Nutrient.pantothenicAcid, PerSize.serving),
        isNull,
      );

      result = await OpenFoodAPIClient.getProductV3(
        ProductQueryConfiguration(
          '7612100018477',
          language: language,
          fields: fields,
          version: ProductQueryVersion.v3,
        ),
      );
      expect(result.product!.nutriments, isNotNull);
      nutriments = result.product!.nutriments!;
      expect(
        nutriments.getValue(Nutrient.biotin, PerSize.oneHundredGrams),
        0.0,
      );
      expect(nutriments.getValue(Nutrient.biotin, PerSize.serving), isNull);

      result = await OpenFoodAPIClient.getProductV3(
        ProductQueryConfiguration(
          '3057640257773',
          language: language,
          fields: fields,
          version: ProductQueryVersion.v3,
        ),
      );
      expect(result.product!.nutriments, isNotNull);
      nutriments = result.product!.nutriments!;
      expect(
        nutriments.getValue(Nutrient.chloride, PerSize.oneHundredGrams),
        .0015,
      );
      expect(
        nutriments.getValue(Nutrient.chloride, PerSize.serving),
        .015,
      );

      result = await OpenFoodAPIClient.getProductV3(
        ProductQueryConfiguration(
          '4260556630007',
          language: language,
          fields: fields,
          version: ProductQueryVersion.v3,
        ),
      );
      expect(result.product!.nutriments, isNotNull);
      nutriments = result.product!.nutriments!;
      expect(
        nutriments.getValue(Nutrient.chromium, PerSize.oneHundredGrams),
        .000002,
      );
      expect(
        nutriments.getValue(Nutrient.chromium, PerSize.serving),
        .00001,
      );
      expect(
        nutriments.getValue(Nutrient.iodine, PerSize.oneHundredGrams),
        .0000075,
      );
      expect(
        nutriments.getValue(Nutrient.iodine, PerSize.serving),
        .0000375,
      );
      expect(
        nutriments.getValue(Nutrient.manganese, PerSize.oneHundredGrams),
        .0001,
      );
      expect(
        nutriments.getValue(Nutrient.manganese, PerSize.serving),
        .0005,
      );
      expect(
        nutriments.getValue(Nutrient.molybdenum, PerSize.oneHundredGrams),
        .000004,
      );
      expect(
        nutriments.getValue(Nutrient.molybdenum, PerSize.serving),
        .00002,
      );

      result = await OpenFoodAPIClient.getProductV3(
        ProductQueryConfiguration(
          '3155251205319',
          language: language,
          fields: fields,
          version: ProductQueryVersion.v3,
        ),
      );
      expect(result.product!.nutriments, isNotNull);
      nutriments = result.product!.nutriments!;
      expect(
        nutriments.getValue(Nutrient.omega3, PerSize.oneHundredGrams),
        4,
      );
      expect(
        nutriments.getValue(Nutrient.omega3, PerSize.serving),
        4,
      );
      expect(
        nutriments.getValue(Nutrient.omega6, PerSize.oneHundredGrams),
        9.1,
      );
      expect(
        nutriments.getValue(Nutrient.omega6, PerSize.serving),
        9.1,
      );

      result = await OpenFoodAPIClient.getProductV3(
        ProductQueryConfiguration(
          '5000159461122',
          language: language,
          fields: fields,
          version: ProductQueryVersion.v3,
        ),
      );
      expect(result.product!.nutriments, isNotNull);
      nutriments = result.product!.nutriments!;
      expect(
        nutriments.getValue(Nutrient.transFat, PerSize.oneHundredGrams),
        0.1,
      );
      expect(
        nutriments.getValue(Nutrient.transFat, PerSize.serving),
        0.05,
      );
    });

    test('get product Confiture Rhubarbe Fraises extra', () async {
      const String barcode = '3301595000305';
      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.FRENCH,
        fields: [ProductField.ALL],
        version: ProductQueryVersion.v3,
      );
      final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
      );

      expect(result.status, ProductResultV3.statusSuccess);
      expect(result.barcode, barcode);
      expect(result.product, isNotNull);
      expect(result.product!.barcode, barcode);
      expect(result.product!.productName, 'confiture rhubarbe fraises extra');

      // only france ingredients
      expect(result.product!.ingredientsText, isNotNull);

      expect(result.product!.ingredients, isNotNull);
      expect(result.product!.ingredients!.length, 3);

      void checkIngredientNotThere(final String ingredient) => expect(
            result.product!.ingredients!.any((i) => i.text == ingredient),
            false,
          );

      final List<String> ingredientsNotThere = <String>[
        'Farine de blé',
        'matière grasse non hydrogénée',
        'graisse de palme',
        'huile de colza',
        'colorant',
        'caroténoïdes',
        'eau',
        'alcool éthylique',
        'sel',
        'jus de citron concentré',
        'agent de traitement de la farine',
        'L-cystéine',
      ];
      for (final String ingredient in ingredientsNotThere) {
        checkIngredientNotThere(ingredient);
      }

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

      expect(result.product!.allergens!.ids, isEmpty);

      expect(result.product!.nutriments, isNotNull);
      final Nutriments nutriments = result.product!.nutriments!;
      const PerSize perSize = PerSize.oneHundredGrams;

      expect(nutriments.getValue(Nutrient.energyKJ, perSize), 1081.0);
      expect(nutriments.getValue(Nutrient.sugars, perSize), 57.0);
      expect(nutriments.getValue(Nutrient.salt, perSize), 0.06);
      expect(nutriments.getValue(Nutrient.fiber, perSize), 1.2);
      expect(nutriments.getValue(Nutrient.fat, perSize), 0.0);
      expect(nutriments.getValue(Nutrient.saturatedFat, perSize), 0.0);
      expect(nutriments.getValue(Nutrient.proteins, perSize), 0.6);

      expect(result.product!.novaGroup, 3);
      expect(result.product!.storesTags!.length, 1);

      expect(result.product!.countriesTags, ['en:france']);
    });

    test('product not available', () async {
      String barcode = BARCODE_UNKNOWN;
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.GERMAN,
        fields: [ProductField.ALL],
        version: ProductQueryVersion.v3,
      );
      ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
      );
      expect(result.product, isNull);
    });

    test('product ingredients', () async {
      const String barcode = '4316268596299';
      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.GERMAN,
        fields: [ProductField.ALL],
        version: ProductQueryVersion.v3,
      );
      final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
      );

      expect(result.product, isNotNull);
      expect(result.product!.ingredientsText, isNotNull);
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
        ],
        version: ProductQueryVersion.v3,
      );
      ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
      );

      expect(result.product, isNotNull);
      expect(result.product!.ecoscoreGrade, isNotNull);
      expect(result.product!.ecoscoreScore, isNotNull);
      expect(result.product!.ecoscoreData!.agribalyse, isNotNull);
      expect(result.product!.ecoscoreData!.adjustments, isNotNull);
    });

    test('product fields', () async {
      const String barcode = '7300400481588';
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.GERMAN,
        fields: [
          ProductField.NAME,
          ProductField.BRANDS_TAGS,
          ProductField.ABBREVIATED_NAME,
          ProductField.ABBREVIATED_NAME_ALL_LANGUAGES,
          ProductField.BRANDS,
          ProductField.QUANTITY,
        ],
        version: ProductQueryVersion.v3,
      );
      ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
      );

      expect(result.product, isNotNull);
      expect(result.product!.productName, isNotNull);
      expect(result.product!.brandsTags, isNotNull);
      expect(result.product!.ingredients, isNull);
      expect(result.product!.ingredientsText, isNull);
      expect(result.product!.productNameInLanguages, isNull);
      expect(result.product!.additives!.ids, isEmpty);
      expect(result.product!.additives!.names, isEmpty);
      expect(result.product!.nutrientLevels!.levels, isEmpty);
      expect(result.product!.lang, OpenFoodFactsLanguage.UNDEFINED);
      expect(result.product!.abbreviatedName, isNotNull);
      expect(result.product!.abbreviatedNameInLanguages, isNotNull);
      expect(
        result
            .product!.abbreviatedNameInLanguages![OpenFoodFactsLanguage.FRENCH],
        isNotNull,
      );
      expect(result.product!.brands, isNotNull);
      expect(result.product!.quantity, isNotNull);

      configurations = ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.GERMAN,
        fields: [ProductField.NAME, ProductField.LANGUAGE],
        version: ProductQueryVersion.v3,
      );
      result = await OpenFoodAPIClient.getProductV3(
        configurations,
      );

      expect(result.product, isNotNull);
      expect(result.product!.productName, isNotNull);
      expect(result.product!.brandsTags, isNull);
      expect(result.product!.ingredients, isNull);
      expect(result.product!.ingredientsText, isNull);
      expect(result.product!.productNameInLanguages, isNull);
      expect(result.product!.additives!.ids, isEmpty);
      expect(result.product!.additives!.names, isEmpty);
      expect(result.product!.nutrientLevels!.levels, isEmpty);

      configurations = ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.GERMAN,
        fields: [ProductField.NAME, ProductField.COUNTRIES],
        version: ProductQueryVersion.v3,
      );
      result = await OpenFoodAPIClient.getProductV3(
        configurations,
      );

      expect(result.product, isNotNull);
      expect(result.product!.productName, isNotNull);
      expect(result.product!.brandsTags, isNull);
      expect(result.product!.ingredients, isNull);
      expect(result.product!.ingredientsText, isNull);
      expect(result.product!.productNameInLanguages, isNull);
      expect(result.product!.additives!.ids, isEmpty);
      expect(result.product!.additives!.names, isEmpty);
      expect(result.product!.nutrientLevels!.levels, isEmpty);
      expect(result.product!.lang, OpenFoodFactsLanguage.UNDEFINED);
      expect(result.product!.countries, isNotNull);

      configurations = ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.GERMAN,
        fields: [ProductField.NAME, ProductField.COUNTRIES_TAGS],
        version: ProductQueryVersion.v3,
      );
      result = await OpenFoodAPIClient.getProductV3(
        configurations,
      );

      expect(result.product, isNotNull);
      expect(result.product!.productName, isNotNull);
      expect(result.product!.brandsTags, isNull);
      expect(result.product!.ingredients, isNull);
      expect(result.product!.ingredientsText, isNull);
      expect(result.product!.productNameInLanguages, isNull);
      expect(result.product!.additives!.ids, isEmpty);
      expect(result.product!.additives!.names, isEmpty);
      expect(result.product!.nutrientLevels!.levels, isEmpty);
      expect(result.product!.lang, OpenFoodFactsLanguage.UNDEFINED);
      expect(result.product!.countriesTags, isNotNull);
    });

    test('attribute groups', () async {
      String barcode = '3700214614266';
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.ENGLISH,
        fields: [ProductField.NAME, ProductField.ATTRIBUTE_GROUPS],
        version: ProductQueryVersion.v3,
      );
      ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
      );

      expect(result.product, isNotNull);
      expect(result.product!.productName, isNotNull);
      expect(result.product!.attributeGroups, isNotNull);

      AttributeGroup group;

      group = result.product!.attributeGroups!
          .singleWhere((element) => element.id == 'nutritional_quality');
      final List<Attribute> nutritionalQuality = group.attributes!;
      expect(nutritionalQuality.first.id, 'nutriscore');
      expect(nutritionalQuality.first.settingName, isNull);
      expect(nutritionalQuality.first.settingNote, isNull);
      expect(nutritionalQuality.first.description, '');
      expect(nutritionalQuality.first.descriptionShort,
          'Poor nutritional quality');
      expect(nutritionalQuality.first.title, 'Nutri-Score D');
      expect(nutritionalQuality.first.name, 'Nutri-Score');
      expect(nutritionalQuality.first.match,
          greaterThan(29)); // 20230602: 29.4444444444444
      expect(nutritionalQuality.first.status, 'known');
      expect(nutritionalQuality[1].id, 'low_salt');
      expect(nutritionalQuality[2].id, 'low_fat');
      expect(nutritionalQuality[3].id, 'low_sugars');
      expect(nutritionalQuality[4].id, 'low_saturated_fat');
      expect(nutritionalQuality.first.panelId, 'nutriscore');

      group = result.product!.attributeGroups!
          .singleWhere((element) => element.id == 'processing');
      final List<Attribute> processing = group.attributes!;
      expect(processing.first.id, 'nova');

      group = result.product!.attributeGroups!
          .singleWhere((element) => element.id == 'labels');

      final Set<ProductImprovement> improvements =
          result.product!.getProductImprovements();
      expect(improvements.contains(ProductImprovement.ORIGINS_TO_BE_COMPLETED),
          false);
    });

    test('get product without setting OpenFoodFactsLanguage or ProductField; ',
        () async {
      const String barcode = '5000112548167';
      const int numberOfImages = 53; // was 53 in 20231125

      //Get product without setting OpenFoodFactsLanguage or ProductField
      ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        ProductQueryConfiguration(
          barcode,
          version: ProductQueryVersion.v3,
        ),
      );

      expect(result.status, ProductResultV3.statusSuccess);
      expect(result.barcode, barcode);
      expect(result.product, isNotNull);
      expect(result.product!.barcode, barcode);
      expect(result.product!.lastModified, isNotNull);
      expect(result.product!.ingredientsText, isNotNull);

      expect(result.product!.ingredients, isNotNull);
      expect(result.product!.ingredients, hasLength(7));
      findExpectedIngredients(result.product!.ingredients!, ['Aroma']);

      expect(result.product!.additives!.ids[0], 'en:e150d');
      expect(result.product!.additives!.names[0], 'E150d');
      expect(result.product!.additives!.ids[4], 'en:e950');
      expect(result.product!.additives!.names[4], 'E950');

      expect(
          result
              .product!.nutrientLevels!.levels[NutrientLevels.NUTRIENT_SUGARS],
          NutrientLevel.LOW);
      expect(
          result.product!.nutrientLevels!.levels[NutrientLevels.NUTRIENT_SALT],
          NutrientLevel.LOW);

      expect(result.product!.images, isNotNull);
      expect(
          result.product!.images!.length, greaterThanOrEqualTo(numberOfImages));
      expect(
          result.product!.images!
              .singleWhere((image) =>
                  image.field == ImageField.INGREDIENTS &&
                  image.size == ImageSize.DISPLAY &&
                  image.language == OpenFoodFactsLanguage.GERMAN)
              .url,
          'https://images.openfoodfacts.org/images/products/500/011/254/8167/ingredients_de.7.400.jpg');

      //Get product without setting ProductField
      result = await OpenFoodAPIClient.getProductV3(
        ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          version: ProductQueryVersion.v3,
        ),
      );

      expect(result.status, ProductResultV3.statusSuccess);
      expect(result.barcode, barcode);
      expect(result.product, isNotNull);
      expect(result.product!.barcode, barcode);
      expect(result.product!.lastModified, isNotNull);

      expect(result.product!.ingredientsText, isNotNull);

      expect(result.product!.ingredients, isNotNull);
      expect(result.product!.ingredients, hasLength(7));

      findExpectedIngredients(
        result.product!.ingredients!,
        [
          'Wasser',
          'Kohlensäure',
        ],
      );

      expect(result.product!.additives!.ids[0], 'en:e150d');
      expect(result.product!.additives!.names[0], 'E150d');
      expect(result.product!.additives!.ids[4], 'en:e950');
      expect(result.product!.additives!.names[4], 'E950');

      expect(
          result
              .product!.nutrientLevels!.levels[NutrientLevels.NUTRIENT_SUGARS],
          NutrientLevel.LOW);
      expect(
          result.product!.nutrientLevels!.levels[NutrientLevels.NUTRIENT_SALT],
          NutrientLevel.LOW);

      expect(result.product!.images, isNotNull);
      expect(
          result.product!.images!.length, greaterThanOrEqualTo(numberOfImages));
      expect(
          result.product!.images!
              .singleWhere((image) =>
                  image.field == ImageField.INGREDIENTS &&
                  image.size == ImageSize.DISPLAY &&
                  image.language == OpenFoodFactsLanguage.GERMAN)
              .url,
          'https://images.openfoodfacts.org/images/products/500/011/254/8167/ingredients_de.7.400.jpg');

      //Get product without setting OpenFoodFactsLanguage
      result = await OpenFoodAPIClient.getProductV3(
        ProductQueryConfiguration(
          barcode,
          fields: [ProductField.ALL],
          version: ProductQueryVersion.v3,
        ),
      );

      expect(result.status, ProductResultV3.statusSuccess);
      expect(result.barcode, barcode);
      expect(result.product, isNotNull);
      expect(result.product!.barcode, barcode);
      expect(result.product!.lastModified, isNotNull);

      expect(result.product!.ingredientsText, isNotNull);

      expect(result.product!.ingredients, isNotNull);
      expect(result.product!.ingredients, hasLength(7));

      findExpectedIngredients(
        result.product!.ingredients!,
        [
          'Wasser',
          'Kohlensäure',
          'Süßungsmittel',
          'Aroma',
          'Aroma Koffein',
        ],
      );

      expect(result.product!.selectedImages, hasLength(15));

      expect(result.product!.nutriments, isNotNull);
      final Nutriments nutriments = result.product!.nutriments!;
      const PerSize perSize = PerSize.oneHundredGrams;

      expect(nutriments.getValue(Nutrient.energyKJ, perSize), 0.8);
      expect(nutriments.getValue(Nutrient.sugars, perSize), 0.0);
      expect(nutriments.getValue(Nutrient.salt, perSize), 0.01);
      expect(nutriments.getValue(Nutrient.fiber, perSize), 0.0);
      expect(nutriments.getValue(Nutrient.fat, perSize), 0.0);
      expect(nutriments.getValue(Nutrient.saturatedFat, perSize), 0.0);
      expect(nutriments.getValue(Nutrient.proteins, perSize), 0.0);
      expect(result.product!.novaGroup, 4);
      expect(nutriments.getValue(Nutrient.fat, PerSize.serving), isNotNull);
      expect(nutriments.getValue(Nutrient.carbohydrates, PerSize.serving),
          isNotNull);

      expect(result.product!.additives!.ids[0], 'en:e150d');
      expect(result.product!.additives!.names[0], 'E150d');
      expect(result.product!.additives!.ids[4], 'en:e950');
      expect(result.product!.additives!.names[4], 'E950');

      expect(
          result
              .product!.nutrientLevels!.levels[NutrientLevels.NUTRIENT_SUGARS],
          NutrientLevel.LOW);
      expect(
          result.product!.nutrientLevels!.levels[NutrientLevels.NUTRIENT_SALT],
          NutrientLevel.LOW);

      expect(result.product!.images, isNotNull);
      expect(result.product!.images, hasLength(numberOfImages));
      expect(
          result.product!.images!
              .singleWhere((image) =>
                  image.field == ImageField.INGREDIENTS &&
                  image.size == ImageSize.DISPLAY &&
                  image.language == OpenFoodFactsLanguage.GERMAN)
              .url,
          'https://images.openfoodfacts.org/images/products/500/011/254/8167/ingredients_de.7.400.jpg');

      final Set<ProductImprovement> improvements =
          result.product!.getProductImprovements();
      expect(improvements.contains(ProductImprovement.ORIGINS_TO_BE_COMPLETED),
          true);
    });

    test(
        'vegan, vegetarian and palm oil ingredients of Danish Butter Cookies & Chocolate Chip Cookies',
        () async {
      final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        ProductQueryConfiguration(
          '3017620429484',
          language: OpenFoodFactsLanguage.FRENCH,
          fields: [ProductField.ALL],
          version: ProductQueryVersion.v3,
        ),
      );

      final Ingredient ingredient = result.product!.ingredients!.firstWhere(
        (ingredient) => ingredient.text == 'huile de palme',
      );
      expect(ingredient.vegan, IngredientSpecialPropertyStatus.POSITIVE);
      expect(ingredient.vegetarian, IngredientSpecialPropertyStatus.POSITIVE);
      expect(ingredient.fromPalmOil, IngredientSpecialPropertyStatus.POSITIVE);
    });

    test('get knowledge panels', () async {
      const Set<String> someExpectedKeys = <String>{
        'ecoscore',
        'environment_card',
        'health_card',
        'ingredients',
        'nutriscore',
        'root',
      };
      final ProductResultV3 productResult =
          await OpenFoodAPIClient.getProductV3(
        ProductQueryConfiguration(
          BARCODE_DANISH_BUTTER_COOKIES,
          language: OpenFoodFactsLanguage.FRENCH,
          fields: <ProductField>[ProductField.KNOWLEDGE_PANELS],
          version: ProductQueryVersion.v3,
        ),
      );
      expect(productResult.product, isNotNull);
      expect(productResult.product!.knowledgePanels, isNotNull);
      expect(
        productResult.product!.knowledgePanels!.panelIdToPanelMap.keys,
        containsAll(someExpectedKeys),
      );
    });
  },
      timeout: Timeout(
        // some tests can be slow here
        Duration(seconds: 300),
      ));

  test('get invalid barcodes', () async {
    final String url = InvalidBarcodes.getUrl();
    final http.Response response = await http.get(Uri.parse(url));
    expect(response.statusCode, HTTP_OK);
    final String jsonString = response.body;
    InvalidBarcodes invalidBarcodes =
        InvalidBarcodes.loadFromJSONString(jsonString);
    expect(invalidBarcodes.isBlacklisted('15600703'), isTrue);
    expect(
        invalidBarcodes.isBlacklisted(BARCODE_DANISH_BUTTER_COOKIES), isFalse);

    invalidBarcodes = InvalidBarcodes.base();
    expect(invalidBarcodes.isBlacklisted('15600703'), isTrue);
    expect(
        invalidBarcodes.isBlacklisted(BARCODE_DANISH_BUTTER_COOKIES), isFalse);
  });

  test('get product uri', () async {
    const String barcode = BARCODE_DANISH_BUTTER_COOKIES;
    OpenFoodAPIConfiguration.uuid = 'Should not appear in the url';

    expect(
      OpenFoodAPIClient.getProductUri(
        barcode,
        language: OpenFoodFactsLanguage.SPANISH,
        country: OpenFoodFactsCountry.GERMANY,
        replaceSubdomain: true,
      ).host,
      'de-es.openfoodfacts.org',
    );
    expect(
      OpenFoodAPIClient.getProductUri(
        barcode,
        language: OpenFoodFactsLanguage.SPANISH,
        country: OpenFoodFactsCountry.GERMANY,
        replaceSubdomain: false,
      ).host,
      'world.openfoodfacts.org',
    );

    OpenFoodAPIConfiguration.globalCountry =
        OpenFoodFactsCountry.UNITED_KINGDOM;
    expect(
      OpenFoodAPIClient.getProductUri(barcode, replaceSubdomain: true).host,
      'uk.openfoodfacts.org',
    );
    expect(
      OpenFoodAPIClient.getProductUri(
        barcode,
        language: OpenFoodFactsLanguage.SPANISH,
        country: OpenFoodFactsCountry.GERMANY,
        replaceSubdomain: true,
      ).host,
      'de-es.openfoodfacts.org',
    );

    OpenFoodAPIConfiguration.globalLanguages = [
      OpenFoodFactsLanguage.BRETON,
      OpenFoodFactsLanguage.FRENCH
    ];
    expect(
      OpenFoodAPIClient.getProductUri(barcode, replaceSubdomain: true).host,
      'uk-br.openfoodfacts.org',
    );
    expect(
      OpenFoodAPIClient.getProductUri(
        barcode,
        language: OpenFoodFactsLanguage.SPANISH,
        country: OpenFoodFactsCountry.GERMANY,
        replaceSubdomain: true,
      ).toString(),
      'https://de-es.openfoodfacts.org/product/$barcode',
    );
  });

  test('get crowdin uri', () async {
    expect(
      OpenFoodAPIClient.getCrowdinUri(
        OpenFoodFactsLanguage.SPANISH,
      ).toString(),
      'https://crowdin.com/project/openfoodfacts/es',
    );
  });

  test('get taxonomy translation uri', () async {
    const List<OpenFoodFactsLanguage> languages = <OpenFoodFactsLanguage>[
      OpenFoodFactsLanguage.FRENCH,
      OpenFoodFactsLanguage.ENGLISH,
    ];
    for (final OpenFoodFactsLanguage language in languages) {
      for (final TagType tagType in TagType.values) {
        try {
          final String url = OpenFoodAPIClient.getTaxonomyTranslationUri(
            tagType,
            language: language,
          ).toString();
          expect(
            url,
            'https://world-${language.offTag}.openfoodfacts.org/'
            '${tagType.offTag}'
            '?translate=1',
          );
        } catch (e) {
          expect(tagType, TagType.EMB_CODES);
        }
      }
    }
  });

  test('get new product fields', () async {
    late ProductQueryConfiguration configuration;
    late ProductResultV3 result;

    configuration = ProductQueryConfiguration(
      BARCODE_DANISH_BUTTER_COOKIES,
      fields: [ProductField.COMPARED_TO_CATEGORY],
      version: ProductQueryVersion.v3,
    );
    result = await OpenFoodAPIClient.getProductV3(
      configuration,
    );
    expect(result.status, ProductResultV3.statusSuccess);
    expect(result.product, isNotNull);
    expect(result.product!.comparedToCategory, isNotNull);

    configuration = ProductQueryConfiguration(
      '7300400481588',
      fields: [ProductField.WEBSITE],
      version: ProductQueryVersion.v3,
    );
    result = await OpenFoodAPIClient.getProductV3(
      configuration,
    );
    expect(result.status, ProductResultV3.statusSuccess);
    expect(result.product, isNotNull);
    expect(result.product!.website, isNotNull);
    expect(result.product!.website, isNotEmpty);

    configuration = ProductQueryConfiguration(
      '8076809517881',
      fields: [ProductField.OBSOLETE],
      version: ProductQueryVersion.v3,
    );
    result = await OpenFoodAPIClient.getProductV3(
      configuration,
    );
    expect(result.status, ProductResultV3.statusSuccess);
    expect(result.product, isNotNull);
    expect(result.product!.obsolete, isNotNull);
    expect(result.product!.obsolete, isTrue);

    configuration = ProductQueryConfiguration(
      '7300400481588',
      fields: [ProductField.OBSOLETE],
      version: ProductQueryVersion.v3,
    );
    result = await OpenFoodAPIClient.getProductV3(
      configuration,
    );
    expect(result.status, ProductResultV3.statusSuccess);
    expect(result.product, isNotNull);
    expect(result.product!.obsolete, isNotNull);
    expect(result.product!.obsolete, isFalse);

    configuration = ProductQueryConfiguration(
      '3033710065066',
      fields: [
        ProductField.LAST_CHECKED,
        ProductField.LAST_CHECKER,
        ProductField.LAST_MODIFIED,
        ProductField.LAST_MODIFIER,
        ProductField.CREATED,
        ProductField.CREATOR,
        ProductField.EDITORS,
        ProductField.LAST_EDITOR,
        ProductField.LAST_IMAGE,
        ProductField.ENTRY_DATES,
        ProductField.LAST_CHECK_DATES,
        ProductField.LAST_EDIT_DATES,
        ProductField.LAST_IMAGE_DATES,
      ],
      version: ProductQueryVersion.v3,
    );
    result = await OpenFoodAPIClient.getProductV3(
      configuration,
    );
    expect(result.status, ProductResultV3.statusSuccess);
    expect(result.product, isNotNull);
    expect(result.product!.lastModified, isNotNull);
    expect(
      JsonHelper.dateToTimestamp(result.product!.lastModified),
      greaterThanOrEqualTo(1677130480),
    ); // value on 2023-02-28
    expect(result.product!.lastModifiedBy, isNotNull);
    expect(result.product!.lastModifiedBy, isNotEmpty);
    expect(result.product!.lastChecked, isNotNull);
    expect(
      JsonHelper.dateToTimestamp(result.product!.lastChecked),
      greaterThanOrEqualTo(1541687984),
    ); // value on 2023-02-28
    expect(result.product!.lastChecker, isNotNull);
    expect(result.product!.lastChecker, isNotEmpty);
    expect(result.product!.created, isNotNull);
    expect(
      JsonHelper.dateToTimestamp(result.product!.created),
      1340658486,
    ); // value on 2023-02-28
    expect(result.product!.creator, isNotNull);
    expect(result.product!.creator, isNotEmpty);
    expect(result.product!.editors, isNotNull);
    expect(
      result.product!.editors!.length,
      greaterThanOrEqualTo(60),
    ); // value on 2023-02-28
    expect(result.product!.lastEditor, isNotNull);
    expect(result.product!.lastEditor, isNotEmpty);
    expect(
      JsonHelper.dateToTimestamp(result.product!.lastImage),
      greaterThanOrEqualTo(1640852418),
    ); // value on 2023-02-28
    expect(result.product!.lastImageDates, isNotNull);
    expect(result.product!.lastImageDates, hasLength(3));
    expect(result.product!.lastEditDates, isNotNull);
    expect(result.product!.lastEditDates, hasLength(3));
    expect(result.product!.lastCheckDates, isNotNull);
    expect(result.product!.lastCheckDates, hasLength(3));
    expect(result.product!.entryDates, isNotNull);
    expect(result.product!.entryDates, hasLength(3));
  });

  group('$OpenFoodAPIClient get new packagings field', () {
    const String barcode = '3661344723290';
    const String searchTerms = 'skyr les 2 vaches';
    const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.FRENCH;
    const OpenFoodFactsCountry country = OpenFoodFactsCountry.FRANCE;
    const ProductQueryVersion version = ProductQueryVersion.v3;

    void checkProduct(final Product product) {
      void checkLocalizedTag(final LocalizedTag? tag) {
        expect(tag, isNotNull);
        expect(tag!.id, isNotNull);
        expect(tag.lcName, isNotNull);
      }

      expect(product.packagings, isNotNull);
      expect(product.packagings!.length, greaterThanOrEqualTo(3));
      for (final ProductPackaging packaging in product.packagings!) {
        checkLocalizedTag(packaging.shape);
        checkLocalizedTag(packaging.material);
        checkLocalizedTag(packaging.recycling);
        expect(packaging.recycling!.id, 'en:recycle');
      }
    }

    test('as a single field on a barcode search', () async {
      final ProductResultV3 productResult =
          await OpenFoodAPIClient.getProductV3(
        ProductQueryConfiguration(
          barcode,
          fields: [ProductField.PACKAGINGS],
          language: language,
          country: country,
          version: version,
        ),
      );
      expect(productResult.status, ProductResultV3.statusSuccess);
      expect(productResult.product, isNotNull);
      checkProduct(productResult.product!);
    });

    test('as a part of ALL fields on a barcode search', () async {
      final ProductResultV3 productResult =
          await OpenFoodAPIClient.getProductV3(
        ProductQueryConfiguration(
          barcode,
          fields: [ProductField.ALL],
          language: language,
          country: country,
          version: version,
        ),
      );
      expect(productResult.status, ProductResultV3.statusSuccess);
      expect(productResult.product, isNotNull);
      checkProduct(productResult.product!);
    });

    test('as a single field on a search query', () async {
      final SearchResult searchResult = await OpenFoodAPIClient.searchProducts(
        null,
        ProductSearchQueryConfiguration(
          parametersList: [
            SearchTerms(terms: [searchTerms])
          ],
          fields: [ProductField.PACKAGINGS, ProductField.BARCODE],
          language: language,
          country: country,
          version: version,
        ),
      );
      expect(searchResult.products, isNotNull);
      expect(searchResult.products, isNotEmpty);
      bool found = false;
      for (final Product product in searchResult.products!) {
        if (product.barcode != barcode) {
          continue;
        }
        found = true;
        checkProduct(product);
      }
      expect(found, isTrue);
    });

    test('as a part of ALL fields on a search query', () async {
      final SearchResult searchResult = await OpenFoodAPIClient.searchProducts(
        null,
        ProductSearchQueryConfiguration(
          parametersList: [
            SearchTerms(terms: [searchTerms])
          ],
          fields: [ProductField.ALL],
          language: language,
          country: country,
          version: version,
        ),
      );
      expect(searchResult.products, isNotNull);
      expect(searchResult.products, isNotEmpty);
      bool found = false;
      for (final Product product in searchResult.products!) {
        if (product.barcode != barcode) {
          continue;
        }
        found = true;
        checkProduct(product);
      }
      expect(found, isTrue);
    });

    test('as a part of RAW fields on a search query', () async {
      try {
        await OpenFoodAPIClient.searchProducts(
          null,
          ProductSearchQueryConfiguration(
            parametersList: [
              SearchTerms(terms: [searchTerms])
            ],
            fields: [ProductField.RAW],
            language: language,
            country: country,
            version: version,
          ),
        );
      } catch (e) {
        // In RAW mode the packagings are mere String's instead of LocalizedTag's.
        // Therefore we expect an Exception.
        return;
      }
      fail('On Raw');
    });
  });
}
