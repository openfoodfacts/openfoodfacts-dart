import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Tests about "get product" that need to save data first.
/// Therefore, in TEST env.
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;

  // Returns a book barcode (978...), that cannot be confused with food.
  String getBookBarcode(final int index) => '${9780000000000 + index}';

  group('$OpenFoodAPIClient get-save products', () {
    test('get product Coca Cola Light', () async {
      final String barcode = getBookBarcode(0);
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
      'product with quotes',
      () async {
        String barcode = '2222222222223';
        Product product = Product(
          barcode: barcode,
          productName: 'Quoted Coca "cola"',
          lang: OpenFoodFactsLanguage.GERMAN,
          brands: 'Quoted Coca "Cola"',
        );

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
        );

        expect(result.product!.productName, equals('Quoted Coca "cola"'));
        expect(result.product!.brands, equals('Quoted Coca "Cola"'));
      },
    );
  },
      timeout: Timeout(
        // some tests can be slow here
        Duration(seconds: 300),
      ));

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
