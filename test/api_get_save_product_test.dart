import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Tests about "get product" that need to save data first.
/// Therefore, in TEST env.
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  const UriProductHelper uriHelper = uriHelperFoodTest;

  // Returns a book barcode (978...), that cannot be confused with food.
  String getBookBarcode(final int index) => '${9780000000000 + index}';

  const List<String> ingredientsTags = <String>['en:flour', 'en:water'];
  const String tagCategory = 'en:beverages';
  const String countryTag = 'en:russia';
  const String englishCategory = 'Beverages';
  const String russianCategory = 'Напитки';
  const String germanCategory = 'Getränke';
  const String englishCountry = 'Russia';
  const String russianCountry = 'Россия';
  const String germanCountry = 'Russland';
  const String englishProductName = 'Pancakes';
  const String englishIngredientsAll = 'Flour, water';
  const List<String> englishIngredientsSplit = <String>['Flour', 'Water'];
  const String germanProductName = 'Pfannkuchen';
  const String germanIngredientsAll = 'Mehl, wasser';
  const List<String> germanIngredientsSplit = <String>['Mehl', 'Wasser'];
  const String russianProductName = 'Блинчики';
  const String russianIngredientsAll = 'Мука, вода';
  const List<String> russianIngredientsSplit = <String>['Мука', 'Вода'];

  /// Returns true if the (TEST) server is in a good mood.
  ///
  /// Will return false if the server is NOT in a good mood, with an explicit
  /// "Bad gateway" exception that condemns the whole purpose of those tests.
  /// No need to run tests in that case, and we're not here to check if the
  /// TEST server works but only if OUR CODE works.
  /// May also throw an exception.
  Future<bool> checkServer() async {
    try {
      await OpenFoodAPIClient.getProductV3(
        ProductQueryConfiguration(
          '7300400481588',
          fields: [ProductField.BARCODE],
          version: ProductQueryVersion.v3,
        ),
        uriHelper: uriHelper,
      );
      return true;
    } catch (e) {
      if (e.toString().contains(TestConstants.badGatewayError)) {
        return false;
      }
      rethrow;
    }
  }

  group('$OpenFoodAPIClient get-save products', () {
    test('get product Coca Cola Light', () async {
      if (!await checkServer()) {
        return;
      }

      final String barcode = getBookBarcode(0);
      const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.GERMAN;
      const String genericName = 'Softdrink';
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
        genericName: genericName,
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
        uriHelper: uriHelper,
        language: language,
      );

      final SendImage fontImage = SendImage(
        lang: language,
        barcode: barcode,
        imageField: ImageField.FRONT,
        imageUri: Uri.file('test/test_assets/front_coca_light_de.jpg'),
      );
      await OpenFoodAPIClient.addProductImage(
        TestConstants.TEST_USER,
        fontImage,
        uriHelper: uriHelper,
      );

      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(
        barcode,
        language: language,
        fields: [ProductField.ALL],
        version: ProductQueryVersion.v3,
      );
      final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
        uriHelper: uriHelper,
      );

      expect(result.status, ProductResultV3.statusSuccess);
      expect(result.barcode, barcode);
      expect(result.product, isNotNull);
      final Product product = result.product!;
      expect(product.barcode, barcode);
      expect(product.lastModified, isNotNull);

      expect(product.genericName, genericName);
      expect(product.genericNameInLanguages, isNotNull);
      expect(product.genericNameInLanguages![language], genericName);

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
      expect(product.images!, hasLength(7));
      expect(product.getRawImages(), hasLength(3));
      expect(product.getMainImages(), hasLength(4));
      expect(product.countries, 'Frankreich,Deutschland');
    });

    test(
        'localized fields when a product is not available in a second language',
        () async {
      if (!await checkServer()) {
        return;
      }

      const String barcode = '3333333333333';

      final Product englishInputProduct = Product(
        barcode: barcode,
        productNameInLanguages: {
          OpenFoodFactsLanguage.ENGLISH: englishProductName,
        },
        ingredientsTextInLanguages: {
          OpenFoodFactsLanguage.ENGLISH: englishIngredientsAll
        },
        categories: englishCategory,
        countries: englishCountry,
      );

      await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        englishInputProduct,
        uriHelper: uriHelper,
        language: OpenFoodFactsLanguage.ENGLISH,
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

      final ProductQueryConfiguration englishConf = ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.ENGLISH,
        fields: fields,
        version: ProductQueryVersion.v3,
      );
      final ProductQueryConfiguration russianConf = ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.RUSSIAN,
        fields: fields,
        version: ProductQueryVersion.v3,
      );

      // English!

      final ProductResultV3 englishResult =
          await OpenFoodAPIClient.getProductV3(
        englishConf,
        uriHelper: uriHelper,
      );
      final Product englishProduct = englishResult.product!;

      expect(englishProduct.productNameInLanguages,
          equals({OpenFoodFactsLanguage.ENGLISH: englishProductName}));

      expect(englishProduct.ingredientsTextInLanguages,
          equals({OpenFoodFactsLanguage.ENGLISH: englishIngredientsAll}));

      expect(englishProduct.ingredientsTags, equals(ingredientsTags));
      expect(
          englishProduct.ingredientsTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: englishIngredientsSplit,
          }));

      expect(englishProduct.categoriesTags, equals([tagCategory]));
      expect(
          englishProduct.categoriesTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: [englishCategory]
          }));

      expect(englishProduct.countriesTags, equals([countryTag]));
      expect(
          englishProduct.countriesTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: [englishCountry]
          }));

      // Russian!

      final ProductResultV3 russianResult =
          await OpenFoodAPIClient.getProductV3(
        russianConf,
        uriHelper: uriHelper,
      );
      final Product russianProduct = russianResult.product!;

      expect(russianProduct.productNameInLanguages, isNull);

      expect(russianProduct.ingredientsTextInLanguages, isNull);

      expect(russianProduct.ingredientsTags, equals(ingredientsTags));
      expect(
          russianProduct.ingredientsTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.RUSSIAN: russianIngredientsSplit,
          }));

      expect(russianProduct.categoriesTags, equals([tagCategory]));
      expect(
          russianProduct.categoriesTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.RUSSIAN: [russianCategory]
          }));

      expect(russianProduct.countriesTags, equals([countryTag]));
      expect(
          russianProduct.countriesTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.RUSSIAN: [russianCountry]
          }));
    });

    test('localized fields when a product is available in a second language',
        () async {
      if (!await checkServer()) {
        return;
      }

      const String barcode = '2222222222222';

      final Product englishInputProduct = Product(
        barcode: barcode,
        productNameInLanguages: {
          OpenFoodFactsLanguage.ENGLISH: englishProductName,
        },
        ingredientsTextInLanguages: {
          OpenFoodFactsLanguage.ENGLISH: englishIngredientsAll
        },
        categories: englishCategory,
        countries: englishCountry,
      );

      final Product russianInputProduct = Product(
        barcode: barcode,
        productNameInLanguages: {
          OpenFoodFactsLanguage.RUSSIAN: russianProductName,
        },
        ingredientsTextInLanguages: {
          OpenFoodFactsLanguage.RUSSIAN: russianIngredientsAll,
        },
      );

      await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        englishInputProduct,
        uriHelper: uriHelper,
        language: OpenFoodFactsLanguage.ENGLISH,
      );
      await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        russianInputProduct,
        uriHelper: uriHelper,
        language: OpenFoodFactsLanguage.RUSSIAN,
      );

      const fields = [
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

      final ProductQueryConfiguration englishConf = ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.ENGLISH,
        fields: fields,
        version: ProductQueryVersion.v3,
      );
      final ProductQueryConfiguration russianConf = ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.RUSSIAN,
        fields: fields,
        version: ProductQueryVersion.v3,
      );

      // English!

      final ProductResultV3 englishResult =
          await OpenFoodAPIClient.getProductV3(
        englishConf,
        uriHelper: uriHelper,
      );
      final Product englishProduct = englishResult.product!;

      expect(englishProduct.productNameInLanguages,
          equals({OpenFoodFactsLanguage.ENGLISH: englishProductName}));

      expect(englishProduct.ingredientsTextInLanguages,
          equals({OpenFoodFactsLanguage.ENGLISH: englishIngredientsAll}));

      expect(englishProduct.ingredientsTags, equals(ingredientsTags));
      expect(
          englishProduct.ingredientsTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: englishIngredientsSplit,
          }));

      expect(englishProduct.categoriesTags, equals([tagCategory]));
      expect(
          englishProduct.categoriesTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: [englishCategory]
          }));

      expect(englishProduct.countriesTags, equals([countryTag]));
      expect(
          englishProduct.countriesTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: [englishCountry]
          }));

      // Russian!

      final ProductResultV3 russianResult =
          await OpenFoodAPIClient.getProductV3(
        russianConf,
        uriHelper: uriHelper,
      );
      final Product russianProduct = russianResult.product!;

      expect(russianProduct.productNameInLanguages,
          equals({OpenFoodFactsLanguage.RUSSIAN: russianProductName}));

      expect(russianProduct.ingredientsTextInLanguages,
          equals({OpenFoodFactsLanguage.RUSSIAN: russianIngredientsAll}));

      expect(russianProduct.ingredientsTags, equals(ingredientsTags));
      expect(
          russianProduct.ingredientsTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.RUSSIAN: russianIngredientsSplit,
          }));

      expect(russianProduct.categoriesTags, equals([tagCategory]));
      expect(
          russianProduct.categoriesTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.RUSSIAN: [russianCategory]
          }));

      expect(russianProduct.countriesTags, equals([countryTag]));
      expect(
          russianProduct.countriesTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.RUSSIAN: [russianCountry]
          }));
    });

    test('multiple languages and in-languages fields', () async {
      if (!await checkServer()) {
        return;
      }

      const String barcode = '2222222222224';

      final Product inputProduct = Product(
        barcode: barcode,
        productNameInLanguages: {
          OpenFoodFactsLanguage.ENGLISH: englishProductName,
          OpenFoodFactsLanguage.RUSSIAN: russianProductName,
          OpenFoodFactsLanguage.GERMAN: germanProductName,
        },
        ingredientsTextInLanguages: {
          OpenFoodFactsLanguage.ENGLISH: englishIngredientsAll,
          OpenFoodFactsLanguage.RUSSIAN: russianIngredientsAll,
          OpenFoodFactsLanguage.GERMAN: germanIngredientsAll,
        },
        categories: englishCategory,
        countries: englishCountry,
      );

      await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        inputProduct,
        uriHelper: uriHelper,
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

      final ProductQueryConfiguration conf = ProductQueryConfiguration(
        barcode,
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.RUSSIAN,
          OpenFoodFactsLanguage.GERMAN
        ],
        fields: fields,
        version: ProductQueryVersion.v3,
      );

      final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        conf,
        uriHelper: uriHelper,
      );
      final Product product = result.product!;

      expect(
          product.productNameInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: englishProductName,
            OpenFoodFactsLanguage.RUSSIAN: russianProductName,
            OpenFoodFactsLanguage.GERMAN: germanProductName,
          }));

      expect(
          product.ingredientsTextInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: englishIngredientsAll,
            OpenFoodFactsLanguage.RUSSIAN: russianIngredientsAll,
            OpenFoodFactsLanguage.GERMAN: germanIngredientsAll,
          }));

      expect(product.ingredientsTags, equals(ingredientsTags));
      expect(
          product.ingredientsTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: englishIngredientsSplit,
            OpenFoodFactsLanguage.RUSSIAN: russianIngredientsSplit,
            OpenFoodFactsLanguage.GERMAN: germanIngredientsSplit,
          }));

      expect(product.categoriesTags, equals([tagCategory]));
      expect(
          product.categoriesTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: [englishCategory],
            OpenFoodFactsLanguage.RUSSIAN: [russianCategory],
            OpenFoodFactsLanguage.GERMAN: [germanCategory],
          }));

      expect(product.countriesTags, equals([countryTag]));
      expect(
          product.countriesTagsInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: [englishCountry],
            OpenFoodFactsLanguage.RUSSIAN: [russianCountry],
            OpenFoodFactsLanguage.GERMAN: [germanCountry],
          }));
    });

    test('all-languages fields', () async {
      if (!await checkServer()) {
        return;
      }

      const String barcode = '2222222222226';

      final Product inputProduct = Product(
        barcode: barcode,
        productNameInLanguages: {
          OpenFoodFactsLanguage.ENGLISH: englishProductName,
          OpenFoodFactsLanguage.RUSSIAN: russianProductName,
          OpenFoodFactsLanguage.GERMAN: germanProductName,
        },
        ingredientsTextInLanguages: {
          OpenFoodFactsLanguage.ENGLISH: englishIngredientsAll,
          OpenFoodFactsLanguage.GERMAN: germanIngredientsAll,
        },
      );

      await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        inputProduct,
        uriHelper: uriHelper,
      );

      // Request all available languages for the fields which allow it
      final fields = [
        ProductField.NAME_ALL_LANGUAGES,
        ProductField.INGREDIENTS_TEXT_ALL_LANGUAGES,
      ];
      final ProductQueryConfiguration conf = ProductQueryConfiguration(
        barcode,
        fields: fields,
        version: ProductQueryVersion.v3,
      );
      final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        conf,
        uriHelper: uriHelper,
      );
      final Product product = result.product!;

      // Verify that all the available languages are obtained
      expect(
          product.productNameInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: englishProductName,
            OpenFoodFactsLanguage.RUSSIAN: russianProductName,
            OpenFoodFactsLanguage.GERMAN: germanProductName,
          }));
      expect(
          product.ingredientsTextInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: englishIngredientsAll,
            OpenFoodFactsLanguage.GERMAN: germanIngredientsAll,
          }));
    });

    test(
        'requesting all-langs and in-langs fields together does not break anything',
        () async {
      if (!await checkServer()) {
        return;
      }

      const String barcode = '2222222222227';

      final Product inputProduct = Product(
        barcode: barcode,
        productNameInLanguages: {
          OpenFoodFactsLanguage.ENGLISH: englishProductName,
          OpenFoodFactsLanguage.RUSSIAN: russianProductName,
          OpenFoodFactsLanguage.GERMAN: germanProductName,
        },
        ingredientsTextInLanguages: {
          OpenFoodFactsLanguage.ENGLISH: englishIngredientsAll,
          OpenFoodFactsLanguage.GERMAN: germanIngredientsAll,
        },
      );

      await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        inputProduct,
        uriHelper: uriHelper,
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
      final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        conf,
        uriHelper: uriHelper,
      );
      final Product product = result.product!;

      // Verify that all the available languages are obtained
      expect(
          product.productNameInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: englishProductName,
            OpenFoodFactsLanguage.RUSSIAN: russianProductName,
            OpenFoodFactsLanguage.GERMAN: germanProductName,
          }));
      expect(
          product.ingredientsTextInLanguages,
          equals({
            OpenFoodFactsLanguage.ENGLISH: englishIngredientsAll,
            OpenFoodFactsLanguage.GERMAN: germanIngredientsAll,
          }));
    });

    test(
      'product with quotes',
      () async {
        if (!await checkServer()) {
          return;
        }

        const String barcode = '2222222222223';
        const String productName = 'Quoted Coca "cola"';
        const String brands = 'Quoted Coca "Cola"';
        final Product product = Product(
          barcode: barcode,
          productName: productName,
          brands: brands,
        );

        await OpenFoodAPIClient.saveProduct(
          TestConstants.TEST_USER,
          product,
          uriHelper: uriHelper,
        );

        final ProductQueryConfiguration configurations =
            ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [ProductField.NAME, ProductField.BRANDS],
          version: ProductQueryVersion.v3,
        );
        final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
          configurations,
          uriHelper: uriHelper,
        );

        expect(result.product!.productName, productName);
        expect(result.product!.brands, brands);
      },
    );
  },
      timeout: Timeout(
        // some tests can be slow here
        Duration(seconds: 300),
      ));

  test('get minified product', () async {
    if (!await checkServer()) {
      return;
    }

    const String barcode = '111111555555';
    const String genericName = 'Softdrink';
    const String labels = 'MyTestLabel';
    const String quantity = '5.5 Liter';

    //First add the product to the Test DB
    final Product product = Product(
      barcode: barcode,
      genericName: genericName,
      labels: labels,
      quantity: quantity,
    );

    await OpenFoodAPIClient.saveProduct(
      TestConstants.TEST_USER,
      product,
      uriHelper: uriHelper,
    );

    final ProductQueryConfiguration configurations = ProductQueryConfiguration(
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
      uriHelper: uriHelper,
    );

    expect(result.status, ProductResultV3.statusSuccess);
    expect(result.product!.barcode, null);
    expect(result.product!.genericName, genericName);
    expect(result.product!.labels, labels);
    expect(result.product!.quantity, quantity);
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
          uriHelper: uriHelper,
        );

    test('Without nutriments', () async {
      if (!await checkServer()) {
        return;
      }

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
        uriHelper: uriHelper,
      );

      expect(result.product!.noNutritionData, isTrue);
      expect(result.product!.nutriments, isNull);
    }, skip: 'Random results');

    test('With nutriments', () async {
      if (!await checkServer()) {
        return;
      }

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
        uriHelper: uriHelper,
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
