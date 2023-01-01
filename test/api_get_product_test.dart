import 'package:http/http.dart' as http;
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  const int HTTP_OK = 200;

  const BARCODE_UNKNOWN = '11111111111111111111111111';
  const BARCODE_DANISH_BUTTER_COOKIES = '5701184005007';

  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;

  void _findExpectedIngredients(
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
    test('get product Coca Cola Light', () async {
      const String barcode = '1111111111111';
      const List<String> ingredientsText = <String>[
        'Wasser',
        'Kohlensäure',
        'e150d',
        'Citronensäure',
        'Phosphorsäure',
        'Süßungsmittel',
        'Natriumcyclamat',
        'Acesulfam K',
        'Aroma',
        'Aroma Koffein',
        'Aspartam',
      ];

      //First add the product to the Test DB
      final Product inputProduct = Product(
        barcode: barcode,
        productName: 'Coca Cola Light',
        genericName: 'Softdrink',
        lang: OpenFoodFactsLanguage.GERMAN,
        countries: 'Frankreich,Deutschland',
        brands: 'Coca Cola',
        nutrimentDataPer: PerSize.serving.offTag,
        nutrimentEnergyUnit: 'kcal',
        servingSize: '100g',
        ingredientsText: ingredientsText.join(', '),
        additives: Additives(['en:e150d, en:e950'], ['E150d, E950']),
      );

      await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        inputProduct,
      );

      final SendImage fontImage = SendImage(
        lang: OpenFoodFactsLanguage.GERMAN,
        barcode: barcode,
        imageField: ImageField.FRONT,
        imageUri: Uri.file('test/test_assets/front_coca_light_de.jpg'),
      );
      await OpenFoodAPIClient.addProductImage(
        TestConstants.TEST_USER,
        fontImage,
      );

      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.GERMAN,
        fields: [ProductField.ALL],
        version: ProductQueryVersion.v3,
      );
      final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
        user: TestConstants.TEST_USER,
      );

      expect(result.status, ProductResultV3.statusSuccess);
      expect(result.barcode, barcode);
      expect(result.product, isNotNull);
      final Product product = result.product!;
      expect(product.barcode, barcode);
      expect(product.lastModified, isNotNull);

      expect(product.genericName, 'Softdrink');

      // only german ingredients
      expect(product.ingredientsText, isNotNull);

      expect(product.ingredients, isNotNull);
      expect(product.ingredients!.length, ingredientsText.length);
      for (final String ingredient in ingredientsText) {
        expect(product.ingredients!.any((i) => i.text == ingredient), true);
      }

      expect(product.selectedImages!, isNotEmpty);

      expect(product.additives!.ids[0], 'en:e150d');
      expect(product.additives!.names[0], 'E150d');
      expect(product.additives!.ids[4], 'en:e950');
      expect(product.additives!.names[4], 'E950');

      expect(product.images, isNotNull);
      expect(product.images!.length, 4);
      expect(product.countries, 'Frankreich,Deutschland');
    });

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
        user: TestConstants.TEST_USER,
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

    test('get packaging text in languages (Coca-Cola)', () async {
      const String barcode = '5449000000996';
      const List<OpenFoodFactsLanguage> languages = [
        OpenFoodFactsLanguage.ENGLISH,
        OpenFoodFactsLanguage.FRENCH,
      ];

      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(
        barcode,
        languages: languages,
        fields: [ProductField.PACKAGING_TEXT_IN_LANGUAGES],
        version: ProductQueryVersion.v3,
      );
      final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
        user: TestConstants.TEST_USER,
      );
      expect(result.status, ProductResultV3.statusSuccess);
      expect(result.product, isNotNull);
      expect(result.product!.packagingTextInLanguages, isNotNull);
      for (final OpenFoodFactsLanguage language in languages) {
        expect(result.product!.packagingTextInLanguages![language], isNotNull);
      }
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
        user: TestConstants.TEST_USER,
      );
      expect(result.status, ProductResultV3.statusSuccess);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
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
        user: TestConstants.TEST_USER,
      );

      expect(result.status, ProductResultV3.statusSuccess);
      expect(result.barcode, barcode);
      expect(result.product, isNotNull);
      expect(result.product!.barcode, barcode);
      expect(result.product!.brandsTags![0], 'kelsin');
      print(result.product!.packagings![0].toString());
      expect(result.product!.packagings![0].material!.id, 'en:metal');
      expect(result.product!.packagings![0].material!.lcName, 'Metall');
      expect(result.product!.packagings![0].shape!.id, 'en:can');
      expect(result.product!.packagings![0].shape!.lcName, 'Dose');

      // only german ingredients
      expect(result.product!.ingredientsText, isNotNull);

      expect(result.product!.ingredients, isNotNull);
      expect(result.product!.ingredients!.length, 9);

      _findExpectedIngredients(
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
          'Pflanzenfett',
          'Palm',
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
      String barcode = '0038900009472';
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.ENGLISH,
        fields: [ProductField.ALL],
        version: ProductQueryVersion.v3,
      );
      ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
        user: TestConstants.TEST_USER,
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
      const QueryType queryType = QueryType.PROD;
      const User user = TestConstants.PROD_USER;
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
        user: user,
        queryType: queryType,
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
        user: user,
        queryType: queryType,
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
        user: user,
        queryType: queryType,
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
        user: user,
        queryType: queryType,
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
        user: user,
        queryType: queryType,
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
        user: user,
        queryType: queryType,
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
      String barcode = '3301595000305';
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.FRENCH,
        fields: [ProductField.ALL],
        version: ProductQueryVersion.v3,
      );
      ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
        user: TestConstants.TEST_USER,
      );

      expect(result.status, ProductResultV3.statusSuccess);
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

      expect(result.product!.nutriments, isNotNull);
      final Nutriments nutriments = result.product!.nutriments!;
      const PerSize perSize = PerSize.oneHundredGrams;

      expect(nutriments.getValue(Nutrient.energyKJ, perSize), 1081.0);
      expect(nutriments.getValue(Nutrient.sugars, perSize), 57.0);
      expect(nutriments.getValue(Nutrient.salt, perSize), 0.06);

      //This field does not exist on the product 20004361
      // (Seems that the product was updated in meantime)
      //expect(result.product.nutriments.fiber, 1.1);

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
        user: TestConstants.TEST_USER,
      );
      expect(result.product, isNull);
    });

    test('product ingredients', () async {
      String barcode = '4316268596299';
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.GERMAN,
        fields: [ProductField.ALL],
        version: ProductQueryVersion.v3,
      );
      ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
        user: TestConstants.TEST_USER,
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
        user: TestConstants.TEST_USER,
      );

      expect(result.product, isNotNull);
      expect(result.product!.ecoscoreGrade, isNotNull);
      expect(result.product!.ecoscoreScore, isNotNull);
      expect(result.product!.ecoscoreData!.agribalyse, isNotNull);
      expect(result.product!.ecoscoreData!.adjustments, isNotNull);
      expect(result.product!.ecoscoreData!.missingDataWarning, isFalse);
    });

    test('product fields', () async {
      String barcode = '20004361';
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.GERMAN,
        fields: [ProductField.NAME, ProductField.BRANDS_TAGS],
        version: ProductQueryVersion.v3,
      );
      ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
        user: TestConstants.TEST_USER,
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

      configurations = ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.GERMAN,
        fields: [ProductField.NAME, ProductField.LANGUAGE],
        version: ProductQueryVersion.v3,
      );
      result = await OpenFoodAPIClient.getProductV3(
        configurations,
        user: TestConstants.TEST_USER,
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
      expect(result.product!.lang, OpenFoodFactsLanguage.ENGLISH);

      configurations = ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.GERMAN,
        fields: [ProductField.NAME, ProductField.COUNTRIES],
        version: ProductQueryVersion.v3,
      );
      result = await OpenFoodAPIClient.getProductV3(
        configurations,
        user: TestConstants.TEST_USER,
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
        user: TestConstants.TEST_USER,
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
        user: TestConstants.TEST_USER,
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
      expect(nutritionalQuality.first.match, greaterThan(31));
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
      String barcode = '5000112548167';

      //Get product without setting OpenFoodFactsLanguage or ProductField
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
        barcode,
        version: ProductQueryVersion.v3,
      );
      ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
        user: TestConstants.TEST_USER,
      );

      expect(result.status, ProductResultV3.statusSuccess);
      expect(result.barcode, barcode);
      expect(result.product != null, true);
      expect(result.product!.barcode, barcode);
      expect(result.product!.lastModified != null, true);
      expect(result.product!.ingredientsText != null, true);

      expect(result.product!.ingredients != null, true);
      expect(result.product!.ingredients!.length, 7);
      _findExpectedIngredients(result.product!.ingredients!, ['Aroma']);

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
      configurations = ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.GERMAN,
        version: ProductQueryVersion.v3,
      );
      result = await OpenFoodAPIClient.getProductV3(
        configurations,
        user: TestConstants.TEST_USER,
      );

      expect(result.status, ProductResultV3.statusSuccess);
      expect(result.barcode, barcode);
      expect(result.product, isNotNull);
      expect(result.product!.barcode, barcode);
      expect(result.product!.lastModified, isNotNull);

      expect(result.product!.ingredientsText, isNotNull);

      expect(result.product!.ingredients, isNotNull);
      expect(result.product!.ingredients!.length, 7);

      _findExpectedIngredients(
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
      configurations = ProductQueryConfiguration(
        barcode,
        fields: [ProductField.ALL],
        version: ProductQueryVersion.v3,
      );
      result = await OpenFoodAPIClient.getProductV3(
        configurations,
        user: TestConstants.TEST_USER,
      );

      expect(result.status, ProductResultV3.statusSuccess);
      expect(result.barcode, barcode);
      expect(result.product, isNotNull);
      expect(result.product!.barcode, barcode);
      expect(result.product!.lastModified, isNotNull);

      expect(result.product!.ingredientsText, isNotNull);

      expect(result.product!.ingredients, isNotNull);
      expect(result.product!.ingredients!.length, 7);

      _findExpectedIngredients(
        result.product!.ingredients!,
        [
          'Wasser',
          'Kohlensäure',
          'Süßungsmittel',
          'Aroma',
          'Aroma Koffein',
        ],
      );

      expect(result.product!.selectedImages!.length, 15);

      expect(result.product!.nutriments, isNotNull);
      final Nutriments nutriments = result.product!.nutriments!;
      const PerSize perSize = PerSize.oneHundredGrams;

      expect(nutriments.getValue(Nutrient.energyKJ, perSize), 0.8);
      expect(nutriments.getValue(Nutrient.sugars, perSize), 0.0);
      expect(nutriments.getValue(Nutrient.salt, perSize), 0.01);
      expect(nutriments.getValue(Nutrient.fiber, perSize), isNull);
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
      String barcode = BARCODE_DANISH_BUTTER_COOKIES;
      ProductQueryConfiguration configurations = ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.GERMAN,
        fields: [ProductField.ALL],
        version: ProductQueryVersion.v3,
      );
      ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
        user: TestConstants.TEST_USER,
      );

      final vegetableFat = result.product!.ingredients!
          .firstWhere((ingredient) => ingredient.text == 'Pflanzenfett');
      expect(vegetableFat.vegan, IngredientSpecialPropertyStatus.POSITIVE);
      expect(vegetableFat.vegetarian, IngredientSpecialPropertyStatus.POSITIVE);
      expect(vegetableFat.fromPalmOil, IngredientSpecialPropertyStatus.MAYBE);
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

      ProductQueryConfiguration englishConf = ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.ENGLISH,
        fields: fields,
        version: ProductQueryVersion.v3,
      );
      ProductQueryConfiguration russianConf = ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.RUSSIAN,
        fields: fields,
        version: ProductQueryVersion.v3,
      );

      // English!

      ProductResultV3 englishResult = await OpenFoodAPIClient.getProductV3(
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

      ProductResultV3 russianResult = await OpenFoodAPIClient.getProductV3(
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

      ProductQueryConfiguration englishConf = ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.ENGLISH,
        fields: fields,
        version: ProductQueryVersion.v3,
      );
      ProductQueryConfiguration russianConf = ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.RUSSIAN,
        fields: fields,
        version: ProductQueryVersion.v3,
      );

      // English!

      ProductResultV3 englishResult = await OpenFoodAPIClient.getProductV3(
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

      ProductResultV3 russianResult = await OpenFoodAPIClient.getProductV3(
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
    }, skip: 'Random results');

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

      ProductQueryConfiguration conf = ProductQueryConfiguration(
        barcode,
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.RUSSIAN,
          OpenFoodFactsLanguage.GERMAN
        ],
        fields: fields,
        version: ProductQueryVersion.v3,
      );

      ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
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
      ProductQueryConfiguration conf = ProductQueryConfiguration(
        barcode,
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.RUSSIAN,
          OpenFoodFactsLanguage.GERMAN,
        ],
        fields: fields,
        version: ProductQueryVersion.v3,
      );
      ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        conf,
        user: TestConstants.TEST_USER,
      );
      Product product = result.product!;
      // English was of highest priority so English texts are expected
      expect(product.productName, equals('Pancakes'));
      expect(product.ingredientsText, equals('Flour, water'));

      // German first
      conf = ProductQueryConfiguration(
        barcode,
        languages: [
          OpenFoodFactsLanguage.GERMAN,
          OpenFoodFactsLanguage.RUSSIAN,
          OpenFoodFactsLanguage.ENGLISH,
        ],
        fields: fields,
        version: ProductQueryVersion.v3,
      );
      result = await OpenFoodAPIClient.getProductV3(
        conf,
        user: TestConstants.TEST_USER,
      );
      product = result.product!;
      // German was of highest priority so German texts are expected
      expect(product.productName, equals('Pfannkuchen'));
      expect(product.ingredientsText, equals('Mehl, wasser'));

      // Russian first
      conf = ProductQueryConfiguration(
        barcode,
        languages: [
          OpenFoodFactsLanguage.RUSSIAN,
          OpenFoodFactsLanguage.GERMAN,
          OpenFoodFactsLanguage.ENGLISH,
        ],
        fields: fields,
        version: ProductQueryVersion.v3,
      );
      result = await OpenFoodAPIClient.getProductV3(
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
      ProductQueryConfiguration conf = ProductQueryConfiguration(
        barcode,
        fields: fields,
        version: ProductQueryVersion.v3,
      );
      ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
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
      ProductQueryConfiguration conf = ProductQueryConfiguration(
        barcode,
        languages: [
          OpenFoodFactsLanguage.RUSSIAN,
          OpenFoodFactsLanguage.ENGLISH,
        ],
        fields: fields,
        version: ProductQueryVersion.v3,
      );
      ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
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
        fields: [ProductField.ALL],
        version: ProductQueryVersion.v3,
      );
      ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
        user: TestConstants.TEST_USER,
      );

      expect(result.product!.productName, equals('Quoted Coca "cola"'));
      expect(result.product!.brands, equals('Quoted Coca "Cola"'));
    },
        timeout: Timeout(
          // some tests can be slow here
          Duration(seconds: 90),
        ));

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
        queryType: QueryType.PROD,
        user: TestConstants.PROD_USER,
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

  test('get images freshness', () async {
    final List<OpenFoodFactsLanguage> languages = [
      OpenFoodFactsLanguage.ENGLISH,
      OpenFoodFactsLanguage.RUSSIAN,
      OpenFoodFactsLanguage.GERMAN,
      OpenFoodFactsLanguage.FRENCH,
    ];
    final ProductResultV3 productResult = await OpenFoodAPIClient.getProductV3(
      ProductQueryConfiguration(
        BARCODE_DANISH_BUTTER_COOKIES,
        languages: languages,
        fields: [ProductField.IMAGES_FRESHNESS_IN_LANGUAGES],
        version: ProductQueryVersion.v3,
      ),
    );
    final Product product = productResult.product!;
    const int TEN_YEARS = 10 * 365 * 24 * 3600;
    for (final OpenFoodFactsLanguage language in languages) {
      final Map<ImageField, int> freshnesses =
          product.imagesFreshnessInLanguages![language]!;
      for (final ImageField imageField in ImageField.values) {
        final int? freshness = freshnesses[imageField];
        if (freshness != null) {
          expect(freshness >= 0, isTrue);
          expect(freshness < TEN_YEARS, isTrue);
        }
      }
    }
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
      'de-es.openfoodfacts.net',
    );
    expect(
      OpenFoodAPIClient.getProductUri(
        barcode,
        language: OpenFoodFactsLanguage.SPANISH,
        country: OpenFoodFactsCountry.GERMANY,
        replaceSubdomain: false,
      ).host,
      'world.openfoodfacts.net',
    );

    OpenFoodAPIConfiguration.globalCountry =
        OpenFoodFactsCountry.UNITED_KINGDOM;
    expect(
      OpenFoodAPIClient.getProductUri(barcode, replaceSubdomain: true).host,
      'uk.openfoodfacts.net',
    );
    expect(
      OpenFoodAPIClient.getProductUri(
        barcode,
        language: OpenFoodFactsLanguage.SPANISH,
        country: OpenFoodFactsCountry.GERMANY,
        replaceSubdomain: true,
      ).host,
      'de-es.openfoodfacts.net',
    );

    OpenFoodAPIConfiguration.globalLanguages = [
      OpenFoodFactsLanguage.BRETON,
      OpenFoodFactsLanguage.FRENCH
    ];
    expect(
      OpenFoodAPIClient.getProductUri(barcode, replaceSubdomain: true).host,
      'uk-br.openfoodfacts.net',
    );
    expect(
      OpenFoodAPIClient.getProductUri(
        barcode,
        language: OpenFoodFactsLanguage.SPANISH,
        country: OpenFoodFactsCountry.GERMANY,
        replaceSubdomain: true,
        queryType: QueryType.PROD,
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
            'https://world-${language.offTag}.openfoodfacts.net/'
            '${tagType.offTag}'
            '?translate=1',
          );
        } catch (e) {
          expect(tagType, TagType.EMB_CODES);
        }
      }
    }
  });

  test('get minified product', () async {
    String barcode = '111111555555';

    //First add the product to the Test DB
    Product product = Product(
      barcode: barcode,
      lang: OpenFoodFactsLanguage.GERMAN,
      genericName: 'Softdrink',
      labels: 'MyTestLabel',
      quantity: '5.5 Liter',
    );

    await OpenFoodAPIClient.saveProduct(
      TestConstants.TEST_USER,
      product,
    );

    ProductQueryConfiguration configurations = ProductQueryConfiguration(
      barcode,
      language: OpenFoodFactsLanguage.GERMAN,
      fields: [
        ProductField.GENERIC_NAME,
        ProductField.LABELS,
        ProductField.QUANTITY,
      ],
      version: ProductQueryVersion.v3,
    );

    final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
      configurations,
      user: TestConstants.TEST_USER,
    );

    expect(result.status, ProductResultV3.statusSuccess);
    expect(result.product?.barcode, null);
    expect(result.product?.genericName, 'Softdrink');
    expect(result.product?.labels, 'MyTestLabel');
    expect(result.product?.quantity, '5.5 Liter');
  },
      timeout: Timeout(
        // some tests can be slow here
        Duration(seconds: 90),
      ));

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
      queryType: QueryType.PROD,
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
      queryType: QueryType.PROD,
    );
    expect(result.status, ProductResultV3.statusSuccess);
    expect(result.product, isNotNull);
    expect(result.product!.website, isNotNull);
    expect(result.product!.website, isNotEmpty);

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
      ],
      version: ProductQueryVersion.v3,
    );
    result = await OpenFoodAPIClient.getProductV3(
      configuration,
      queryType: QueryType.PROD,
    );
    expect(result.status, ProductResultV3.statusSuccess);
    expect(result.product, isNotNull);
    expect(result.product!.lastModified, isNotNull);
    expect(
      JsonHelper.dateToTimestamp(result.product!.lastModified),
      greaterThanOrEqualTo(1667683782),
    ); // value on 2022-12-05
    expect(result.product!.lastModifiedBy, isNotNull);
    expect(result.product!.lastModifiedBy, isNotEmpty);
    expect(result.product!.lastChecked, isNotNull);
    expect(
      JsonHelper.dateToTimestamp(result.product!.lastChecked),
      greaterThanOrEqualTo(1541687984),
    ); // value on 2022-12-05
    expect(result.product!.lastChecker, isNotNull);
    expect(result.product!.lastChecker, isNotEmpty);
    expect(result.product!.created, isNotNull);
    expect(
      JsonHelper.dateToTimestamp(result.product!.created),
      greaterThanOrEqualTo(1340658486),
    ); // value on 2022-12-05
    expect(result.product!.creator, isNotNull);
    expect(result.product!.creator, isNotEmpty);
    expect(result.product!.editors, isNotNull);
    expect(
      result.product!.editors!.length,
      greaterThanOrEqualTo(59),
    ); // value on 2022-12-05
  });

  test('get new packagings field', () async {
    const String barcode = '3661344723290';
    const String searchTerms = 'skyr les 2 vaches';
    const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.FRENCH;
    const OpenFoodFactsCountry country = OpenFoodFactsCountry.FRANCE;
    const ProductQueryVersion version = ProductQueryVersion.v3;
    const QueryType queryType = QueryType.PROD;
    const User user = TestConstants.PROD_USER;

    late ProductResultV3 productResult;
    late SearchResult searchResult;

    void checkProduct(final Product product) {
      void checkLocalizedTag(final LocalizedTag? tag) {
        expect(tag, isNotNull);
        expect(tag!.id, isNotNull);
        expect(tag.lcName, isNotNull);
      }

      expect(product.packagings, isNotNull);
      expect(product.packagings!.length, 3);
      for (final ProductPackaging packaging in product.packagings!) {
        checkLocalizedTag(packaging.shape);
        checkLocalizedTag(packaging.material);
        checkLocalizedTag(packaging.recycling);
        expect(packaging.recycling!.id, 'en:recycle');
      }
    }

    // checking PACKAGINGS as a single field on a barcode search
    productResult = await OpenFoodAPIClient.getProductV3(
      ProductQueryConfiguration(
        barcode,
        fields: [ProductField.PACKAGINGS],
        language: language,
        country: country,
        version: version,
      ),
      queryType: queryType,
      user: user,
    );
    expect(productResult.status, ProductResultV3.statusSuccess);
    expect(productResult.product, isNotNull);
    checkProduct(productResult.product!);

    // checking PACKAGINGS as a part of ALL fields on a barcode search
    productResult = await OpenFoodAPIClient.getProductV3(
      ProductQueryConfiguration(
        barcode,
        fields: [ProductField.ALL],
        language: language,
        country: country,
        version: version,
      ),
      queryType: queryType,
      user: user,
    );
    expect(productResult.status, ProductResultV3.statusSuccess);
    expect(productResult.product, isNotNull);
    checkProduct(productResult.product!);

    late bool found;
    // checking PACKAGINGS as a single field on a search query
    searchResult = await OpenFoodAPIClient.searchProducts(
      user,
      ProductSearchQueryConfiguration(
        parametersList: [
          SearchTerms(terms: [searchTerms])
        ],
        fields: [ProductField.PACKAGINGS, ProductField.BARCODE],
        language: language,
        country: country,
        version: version,
      ),
      queryType: queryType,
    );
    expect(searchResult.products, isNotNull);
    expect(searchResult.products, isNotEmpty);
    found = false;
    for (final Product product in searchResult.products!) {
      if (product.barcode != barcode) {
        continue;
      }
      found = true;
      checkProduct(product);
    }
    expect(found, isTrue);

    // checking PACKAGINGS as a part of ALL fields on a search query
    searchResult = await OpenFoodAPIClient.searchProducts(
      user,
      ProductSearchQueryConfiguration(
        parametersList: [
          SearchTerms(terms: [searchTerms])
        ],
        fields: [ProductField.ALL],
        language: language,
        country: country,
        version: version,
      ),
      queryType: queryType,
    );
    expect(searchResult.products, isNotNull);
    expect(searchResult.products, isNotEmpty);
    found = false;
    for (final Product product in searchResult.products!) {
      if (product.barcode != barcode) {
        continue;
      }
      found = true;
      checkProduct(product);
    }
    expect(found, isTrue);

    // checking PACKAGINGS as a part of RAW fields on a search query
    try {
      searchResult = await OpenFoodAPIClient.searchProducts(
        user,
        ProductSearchQueryConfiguration(
          parametersList: [
            SearchTerms(terms: [searchTerms])
          ],
          fields: [ProductField.RAW],
          language: language,
          country: country,
          version: version,
        ),
        queryType: queryType,
      );
    } catch (e) {
      // In RAW mode the packagings are mere String's instead of LocalizedTag's.
      // Therefore we expect an Exception.
      return;
    }
    fail('On Raw');
  });

  group('no nutrition data', () {
    // This is barcode refers to a test product
    const String barcode = '111111555555';

    Future<Status> uploadProduct({required bool noNutritionData}) =>
        OpenFoodAPIClient.saveProduct(
          TestConstants.TEST_USER,
          Product(
            barcode: barcode,
            noNutritionData: noNutritionData,
            nutriments: noNutritionData != true
                ? (Nutriments.empty()
                  ..setValue(Nutrient.salt, PerSize.oneHundredGrams, 10.0))
                : null,
          ),
        );

    test('Without nutriments', () async {
      await uploadProduct(noNutritionData: true);

      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(
        barcode,
        fields: [
          ProductField.NO_NUTRITION_DATA,
          ProductField.NUTRIMENTS,
        ],
        version: ProductQueryVersion.v3,
      );

      final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
        user: TestConstants.TEST_USER,
      );

      expect(result.product!.noNutritionData, isTrue);
      expect(result.product!.nutriments, isNull);
    }, skip: 'Random results');

    test('With nutriments', () async {
      await uploadProduct(noNutritionData: false);

      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(
        barcode,
        fields: [
          ProductField.NO_NUTRITION_DATA,
          ProductField.NUTRIMENTS,
        ],
        version: ProductQueryVersion.v3,
      );

      final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
        user: TestConstants.TEST_USER,
      );

      expect(result.product!.noNutritionData, isFalse);
      expect(result.product!.nutriments, isNotNull);
    });

    test('Empty nutriments', () async {
      final Nutriments nutriments = Nutriments.empty();

      expect(nutriments.isEmpty(), isTrue);
      expect(nutriments.isEmpty(isNullEmpty: true), isTrue);
      expect(nutriments.isEmpty(isNullEmpty: false), isTrue);

      nutriments.setValue(Nutrient.calcium, PerSize.oneHundredGrams, 12);
      expect(nutriments.isEmpty(), isFalse);
      expect(nutriments.isEmpty(isNullEmpty: true), isFalse);
      expect(nutriments.isEmpty(isNullEmpty: false), isFalse);

      nutriments.setValue(Nutrient.calcium, PerSize.oneHundredGrams, null);
      expect(nutriments.isEmpty(), isFalse);
      expect(nutriments.isEmpty(isNullEmpty: true), isTrue);
      expect(nutriments.isEmpty(isNullEmpty: false), isFalse);
    });
  }, timeout: Timeout(Duration(seconds: 90)));
}
