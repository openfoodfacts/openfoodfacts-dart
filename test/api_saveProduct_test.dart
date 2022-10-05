import 'dart:math';

import 'package:openfoodfacts/model/Nutrient.dart';
import 'package:openfoodfacts/model/Nutriments.dart';
import 'package:openfoodfacts/model/PerSize.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;

  group('$OpenFoodAPIClient add new products', () {
    String barcode_1 = '0048151623426';
    String quantity_1 = '230g';
    String servingSize_1 = '100g';
    double servingQuantity_1 = 100;

    void testProductResult1(ProductResult result) {
      expect(result.status, 1);
      expect(result.barcode, barcode_1);
      expect(result.product != null, true);
      expect(result.product!.barcode, barcode_1);

      expect(result.product!.quantity != null, true);
      expect(result.product!.quantity, quantity_1);

      expect(result.product!.servingQuantity != null, true);
      expect(result.product!.servingQuantity, servingQuantity_1);

      expect(result.product!.servingSize != null, true);
      expect(result.product!.servingSize, servingSize_1);
    }

    test('save product test, set serving-size', () async {
      Product product = Product(
          barcode: barcode_1,
          productName: 'Maryland Choc Chip',
          quantity: quantity_1,
          servingSize: servingSize_1,
          servingQuantity: servingQuantity_1,
          lang: OpenFoodFactsLanguage.ENGLISH,
          brands: 'Golden Cookies',
          nutrimentEnergyUnit: 'kJ',
          nutrimentDataPer: PerSize.serving.offTag,
          ingredientsText:
              'fortified wheat flour, chocolate chips (25%), sugar, palm oil,  golden syrup, whey and whey derivatives (milk), raising agents, salt, flavouring',
          nutriments: Nutriments.empty(),
          additives: Additives(['en:e150d'], ['E150d']));
      Status status = await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        product,
      );

      expect(status.status, 1);
      expect(status.statusVerbose, 'fields saved');

      ProductQueryConfiguration configurations = ProductQueryConfiguration(
          barcode_1,
          language: OpenFoodFactsLanguage.ENGLISH,
          fields: [ProductField.ALL]);
      ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );

      testProductResult1(result);

      // save and get the existing product to test, if no attributes get lost
      Product product2 =
          Product(barcode: barcode_1, productName: 'Maryland Choc Chip');
      Status status2 = await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        product2,
      );
      expect(status2.status, 1);
      expect(status2.statusVerbose, 'fields saved');

      ProductResult result2 = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );

      testProductResult1(result2);
    }, skip: 'Random results');

    /// Returns a timestamp up to the minute level.
    String _getMinuteTimestamp() =>
        DateTime.now().toIso8601String().substring(0, 16);

    test('dont overwrite language', () async {
      const String barcode = '4008391212596';
      // Assign time-related product names, to make sure we won't fail to update
      // the product and then read a previously written value.
      // In github tests it looks like the same test is being run twice
      // almost in parallel.
      // If we stay at the minute level we're relatively safe.
      final String frenchProductName =
          "Flocons d'epeautre au blé complet ${_getMinuteTimestamp()}";
      final String germanProductName = 'Dinkelflakes${_getMinuteTimestamp()}';

      // save french product name
      final Product frenchProduct = Product(
        barcode: barcode,
        productNameInLanguages: {
          OpenFoodFactsLanguage.FRENCH: frenchProductName
        },
        quantity: '500 g',
        brands: 'Seitenbacher',
        lang: OpenFoodFactsLanguage.FRENCH,
      );

      final Status frenchStatus = await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        frenchProduct,
      );
      expect(frenchStatus.status, 1);
      expect(frenchStatus.statusVerbose, 'fields saved');

      // save german product name
      final Product germanProduct = Product(
        barcode: barcode,
        productNameInLanguages: {
          OpenFoodFactsLanguage.GERMAN: germanProductName
        },
        quantity: '500 g',
        brands: 'Seitenbacher',
        lang: OpenFoodFactsLanguage.GERMAN,
      );

      final Status germanStatus = await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        germanProduct,
      );
      expect(germanStatus.status, 1);
      expect(germanStatus.statusVerbose, 'fields saved');

      // get french fields for product
      final ProductQueryConfiguration frenchConfig = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.FRENCH,
          fields: [
            ProductField.NAME,
            ProductField.BRANDS,
            ProductField.QUANTITY
          ]);
      final frenchResult = await OpenFoodAPIClient.getProduct(
        frenchConfig,
      );
      expect(frenchResult.product, isNotNull);
      expect(frenchResult.product!.productName, frenchProductName);

      // get german fields for product
      final ProductQueryConfiguration germanConfig = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [
            ProductField.NAME,
            ProductField.BRANDS,
            ProductField.QUANTITY
          ]);
      final germanResult = await OpenFoodAPIClient.getProduct(
        germanConfig,
      );

      expect(germanResult.product, isNotNull);
      expect(germanResult.product!.productName, germanProductName);

      // get preferably French, then German fields for product
      final ProductQueryConfiguration frenchGermanConfig =
          ProductQueryConfiguration(barcode, languages: [
        OpenFoodFactsLanguage.FRENCH,
        OpenFoodFactsLanguage.GERMAN,
      ], fields: [
        ProductField.NAME,
        ProductField.BRANDS,
        ProductField.QUANTITY
      ]);
      final frenchGermanResult = await OpenFoodAPIClient.getProduct(
        frenchGermanConfig,
      );

      expect(frenchGermanResult.product, isNotNull);
      expect(frenchGermanResult.product!.productName, frenchProductName);
    }, skip: 'Too often 504 Gateway Time-out');
/*
Like that:
<html>
<head><title>504 Gateway Time-out</title></head>
<body>
<center><h1>504 Gateway Time-out</h1></center>
<hr><center>nginx/1.23.1</center>
</body>
</html>
 */

    test('add new product test 2', () async {
      Product product = Product(
        barcode: '8008698011065',
        productName: 'Meisterbäckers Vital',
        quantity: '350g',
        brands: 'Schär',
        lang: OpenFoodFactsLanguage.GERMAN,
      );
      Status status = await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        product,
      );

      expect(status.status, 1);
      expect(status.statusVerbose, 'fields saved');
    });

    test('add new product test 3', () async {
      Product product = Product(
        barcode: '4250752200784',
        productName: 'Johanneskraut-Rotöl Kapseln',
        quantity: '30 Kapseln',
        brands: 'Abtei',
        lang: OpenFoodFactsLanguage.GERMAN,
        ingredientsText:
            'Johanneskraut, Maisöl, Phospholipide (Sojabohnen, Ponceau 4R)',
      );
      Status status = await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        product,
      );

      expect(status.status, 1);
      expect(status.statusVerbose, 'fields saved');
    }, skip: 'Works randomly');

    test('add new product test 4', () async {
      Product product = Product(
          barcode: '4052700676180',
          productName: 'Calcium + Vitamin D3 + C',
          quantity: '14 Tabletten',
          brands: 'DocMorris',
          lang: OpenFoodFactsLanguage.GERMAN,
          ingredientsText:
              'Säurungsmittel Citronensäure, Calciumcarbonat, Natriumhydrogencarbonat',
          categories: 'Nahrungsergänzungsmittel, Vitamine');
      Status status = await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        product,
      );

      expect(status.status, 1);
      expect(status.statusVerbose, 'fields saved');
    });

    test('add new product test 5', () async {
      const PerSize perSize = PerSize.oneHundredGrams;
      final Nutriments nutriments = Nutriments.empty()
        ..setValue(Nutrient.carbohydrates, perSize, 12)
        ..setValue(Nutrient.proteins, perSize, 6)
        ..setValue(Nutrient.fat, perSize, 0.1)
        ..setValue(Nutrient.energyKJ, perSize, 365);

      Product product = Product(
          barcode: '7340011364184',
          productName: 'Chili beans',
          nutrimentDataPer: PerSize.oneHundredGrams.offTag,
          nutriments: nutriments);

      Status status = await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        product,
      );

      expect(status.status, 1);
      expect(status.statusVerbose, 'fields saved');
    }, skip: 'Works randomly');

    test('add new product test 6', () async {
      Product product = Product(
          barcode: '7340011364184',
          categories: 'Product categories test 1,Product categories test 2',
          packaging: 'Product packaging test 1,Product packaging test 2',
          labels: 'Product labels test 1,Product labels test 2');

      Status status = await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        product,
      );

      expect(status.status, 1);
      expect(status.statusVerbose, 'fields saved');

      ProductQueryConfiguration configurations =
          ProductQueryConfiguration('7340011364184');
      ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );

      expect(result.product!.labels,
          'Product labels test 1,Product labels test 2');
      expect(result.product!.labelsTags,
          ['en:product-labels-test-1', 'en:product-labels-test-2']);
      expect(result.product!.packaging,
          'Product packaging test 1,Product packaging test 2');
      expect(result.product!.packagingTags,
          ['en:product-packaging-test-1', 'en:product-packaging-test-2']);
      expect(result.product!.categories,
          'Product categories test 1,Product categories test 2');
      expect(result.product!.categoriesTags,
          ['en:product-categories-test-1', 'en:product-categories-test-2']);
    }, skip: 'Works randomly');

    test('confirm that nutrient fields are saved', () async {
      const User USER = TestConstants.TEST_USER;
      const double ENERGY = 365;
      const double CARBOHYDRATES = 12;
      const double PROTEINS = 6;
      const double FAT = 0.1;
      const double VITAMIN_B12 = 0.15;
      const String BARCODE = '7340011364184';
      const String PRODUCT_NAME = 'Chili beans';
      final String nutrimentDataPer = PerSize.oneHundredGrams.offTag;

      const PerSize perSize = PerSize.oneHundredGrams;
      for (int i = 2; i >= 0; i--) {
        final Nutriments nutriments = Nutriments.empty()
          ..setValue(Nutrient.energyKJ, perSize, ENERGY + i)
          ..setValue(Nutrient.carbohydrates, perSize, CARBOHYDRATES + i)
          ..setValue(Nutrient.proteins, perSize, PROTEINS + i)
          ..setValue(Nutrient.vitaminB12, perSize, VITAMIN_B12 + i)
          ..setValue(Nutrient.fat, perSize, FAT + i);

        final Product newProduct = Product(
          barcode: BARCODE,
          productName: PRODUCT_NAME,
          nutrimentDataPer: nutrimentDataPer,
          nutriments: nutriments,
        );

        final Status status = await OpenFoodAPIClient.saveProduct(
          USER,
          newProduct,
        );

        expect(status.status, 1);
        expect(status.statusVerbose, 'fields saved');

        final ProductResult result = await OpenFoodAPIClient.getProductRaw(
          BARCODE,
          OpenFoodFactsLanguage.ENGLISH,
          user: USER,
        );

        expect(result.status, 1);
        expect(result.barcode, BARCODE);
        final Product? searchedProduct = result.product;
        expect(searchedProduct != null, true);
        if (searchedProduct != null) {
          expect(searchedProduct.barcode, BARCODE);
          expect(searchedProduct.productName, PRODUCT_NAME);
          expect(searchedProduct.nutrimentDataPer, nutrimentDataPer);
          var searchedNutriments = searchedProduct.nutriments;
          expect(searchedNutriments, isNotNull);
          if (searchedNutriments != null) {
            final List<Nutrient> nutrients = <Nutrient>[
              Nutrient.energyKJ,
              Nutrient.carbohydrates,
              Nutrient.proteins,
              Nutrient.fat,
              Nutrient.vitaminB12,
            ];
            for (final Nutrient nutrient in nutrients) {
              expect(
                searchedNutriments.getValue(nutrient, perSize),
                nutriments.getValue(nutrient, perSize),
                reason: 'should be the same values for $nutrient',
              );
            }
          }
        }
      }
    }, skip: 'Works randomly');

    String _generateRandomString(int len) {
      var r = Random();
      return String.fromCharCodes(
          List.generate(len, (index) => r.nextInt(33) + 89));
    }

    test('Invalid user saves product', () async {
      Product product = Product(
        barcode: '7340011364184',
      );
      Status status = await OpenFoodAPIClient.saveProduct(
        User(
          userId: 'invaliduser',
          password: _generateRandomString(16),
        ),
        product,
      );
      expect(status.isWrongUsernameOrPassword(), isTrue);
    });

    test(
      'get+update+get calcium',
      () async {
        const String barcode = '3273220180259'; // Soy milk
        final ProductQueryConfiguration configurations =
            ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.FRENCH,
          fields: [ProductField.ALL],
        );

        // Step 1: get the product
        ProductResult result = await OpenFoodAPIClient.getProduct(
          configurations,
          user: TestConstants.TEST_USER,
        );
        expect(result.status, 1);
        expect(result.product, isNotNull);
        expect(result.product!.nutriments, isNotNull);
        final Nutriments nutriments = result.product!.nutriments!;
        const PerSize perSize = PerSize.oneHundredGrams;
        final double? initialValue =
            nutriments.getValue(Nutrient.calcium, perSize);
        expect(initialValue, isNotNull); // in real life: 120mg

        // Step 2: save the slightly altered product
        final double nextValue = initialValue! + .001;
        nutriments.setValue(Nutrient.calcium, perSize, nextValue);

        final Product savedProduct = Product(barcode: barcode);
        savedProduct.nutriments = nutriments;
        final Status status = await OpenFoodAPIClient.saveProduct(
          TestConstants.TEST_USER,
          savedProduct,
        );
        expect(status.status, 1);
        expect(status.error, null);

        // Step 3: check if the value was correctly saved
        result = await OpenFoodAPIClient.getProduct(
          configurations,
          user: TestConstants.TEST_USER,
        );
        expect(result.status, 1);
        expect(result.product, isNotNull);
        expect(result.product!.nutriments, isNotNull);
        final double? latestValue =
            result.product!.nutriments!.getValue(Nutrient.calcium, perSize);
        expect(latestValue, nextValue);
      },
    );
  },
      timeout: Timeout(
        // some tests can be slow here
        Duration(seconds: 90),
      ));

  group('No nutrition data', () {
    test('No nutrition data with nutriments', () async {
      Product product = Product(
          noNutritionData: true,
          nutriments: Nutriments.empty()
              .setValue(Nutrient.salt, PerSize.oneHundredGrams, 1.0));

      expect(product.noNutritionData, isTrue);
      expect(product.nutriments, isNull);
    });

    test('Nutriments', () async {
      Product product = Product(
          nutriments: Nutriments.empty()
            ..setValue(Nutrient.salt, PerSize.oneHundredGrams, 1.0));

      expect(product.noNutritionData, isFalse);
      expect(product.nutriments, isNotNull);
    });
  });
}
