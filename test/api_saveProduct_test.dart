import 'package:openfoodfacts/model/Additives.dart';
import 'package:openfoodfacts/model/Nutriments.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/model/Status.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:openfoodfacts/utils/UnitHelper.dart';
import 'package:test/test.dart';
import 'test_constants.dart';

void main() {
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

      expect(result.product!.nutriments!.novaGroup, 4);
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
          nutrimentDataPer: 'serving',
          ingredientsText:
              'fortified wheat flour, chocolate chips (25%), sugar, palm oil,  golden syrup, whey and whey derivatives (milk), raising agents, salt, flavouring',
          nutriments: Nutriments(novaGroup: 4),
          additives: Additives(['en:e150d'], ['E150d']));
      Status status = await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        product,
        queryType: QueryType.TEST,
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
        queryType: QueryType.TEST,
      );

      testProductResult1(result);

      // save and get the existing product to test, if no attributes get lost
      Product product2 =
          Product(barcode: barcode_1, productName: 'Maryland Choc Chip');
      Status status2 = await OpenFoodAPIClient.saveProduct(
          TestConstants.TEST_USER, product2,
          queryType: QueryType.TEST);
      expect(status2.status, 1);
      expect(status2.statusVerbose, 'fields saved');

      ProductResult result2 = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER, queryType: QueryType.TEST);

      testProductResult1(result2);
    });

    test('dont overwrite language', () async {
      String barcode = '4008391212596';

      // save french product name
      Product frenchProduct = Product(
        barcode: barcode,
        productNameInLangs: {
          OpenFoodFactsLanguage.FRENCH: "Flocons d'epeautre au blé complet"
        },
        quantity: '500 g',
        brands: 'Seitenbacher',
        lang: OpenFoodFactsLanguage.FRENCH,
      );

      Status frenchStatus = await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        frenchProduct,
        queryType: QueryType.TEST,
      );
      expect(frenchStatus.status, 1);
      expect(frenchStatus.statusVerbose, 'fields saved');

      // save german product name
      Product germanProduct = Product(
        barcode: barcode,
        productNameInLangs: {OpenFoodFactsLanguage.GERMAN: 'Dinkelflakes'},
        quantity: '500 g',
        brands: 'Seitenbacher',
        lang: OpenFoodFactsLanguage.GERMAN,
      );

      Status germanStatus = await OpenFoodAPIClient.saveProduct(
          TestConstants.TEST_USER, germanProduct,
          queryType: QueryType.TEST);
      expect(germanStatus.status, 1);
      expect(germanStatus.statusVerbose, 'fields saved');

      // get french product
      ProductQueryConfiguration frenchConfig = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.FRENCH,
          fields: [
            ProductField.NAME,
            ProductField.BRANDS,
            ProductField.QUANTITY
          ]);
      var frenchResult = await OpenFoodAPIClient.getProduct(frenchConfig,
          queryType: QueryType.TEST);
      assert(frenchResult.product != null);
      assert(frenchResult.product!.productName != null);

      // get german product
      ProductQueryConfiguration germanConfig = ProductQueryConfiguration(
          barcode,
          language: OpenFoodFactsLanguage.GERMAN,
          fields: [
            ProductField.NAME,
            ProductField.BRANDS,
            ProductField.QUANTITY
          ]);
      var germanResult = await OpenFoodAPIClient.getProduct(germanConfig,
          queryType: QueryType.TEST);

      assert(germanResult.product != null);
      assert(germanResult.product!.productName != null);
    });

    test('add new product test 2', () async {
      Product product = Product(
        barcode: '8008698011065',
        productName: 'Meisterbäckers Vital',
        quantity: '350g',
        brands: 'Schär',
        lang: OpenFoodFactsLanguage.GERMAN,
      );
      Status status = await OpenFoodAPIClient.saveProduct(
          TestConstants.TEST_USER, product,
          queryType: QueryType.TEST);

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
          TestConstants.TEST_USER, product,
          queryType: QueryType.TEST);

      expect(status.status, 1);
      expect(status.statusVerbose, 'fields saved');
    });

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
          TestConstants.TEST_USER, product,
          queryType: QueryType.TEST);

      expect(status.status, 1);
      expect(status.statusVerbose, 'fields saved');
    });

    test('add new product test 5', () async {
      var nutriments = Nutriments();
      nutriments.energy = 365;
      nutriments.carbohydrates = 12;
      nutriments.proteins = 6;
      nutriments.fat = 0.1;

      Product product = Product(
          barcode: '7340011364184',
          productName: 'Chili beans',
          nutrimentDataPer: '100g',
          nutriments: nutriments);

      Status status = await OpenFoodAPIClient.saveProduct(
          TestConstants.TEST_USER, product,
          queryType: QueryType.TEST);

      expect(status.status, 1);
      expect(status.statusVerbose, 'fields saved');
    });

    test('add new product test 6', () async {
      Product product = Product(
          barcode: '7340011364184',
          categories: 'Product categories test 1,Product categories test 2',
          packaging: 'Product packaging test 1,Product packaging test 2',
          labels: 'Product labels test 1,Product labels test 2');

      Status status = await OpenFoodAPIClient.saveProduct(
          TestConstants.TEST_USER, product,
          queryType: QueryType.TEST);

      expect(status.status, 1);
      expect(status.statusVerbose, 'fields saved');

      ProductQueryConfiguration configurations =
          ProductQueryConfiguration('7340011364184');
      ProductResult result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER, queryType: QueryType.TEST);

      expect(result.product!.labels,
          'Product labels test 1,Product labels test 2');
      expect(result.product!.labelsTags,
          ['en:product-labels-test-1', 'en:product-labels-test-2']);
      expect(result.product!.packaging,
          'Product packaging test 1,Product packaging test 2');
      expect(result.product!.packagingTags,
          ['product-packaging-test-1', 'product-packaging-test-2']);
      expect(result.product!.categories,
          'Product categories test 1,Product categories test 2');
      expect(result.product!.categoriesTags,
          ['en:product-categories-test-1', 'en:product-categories-test-2']);
    });

    test('confirm that nutrient fields are saved', () async {
      const QueryType QUERY_TYPE = QueryType.TEST;
      const User USER = TestConstants.TEST_USER;
      const double ENERGY = 365;
      const double CARBOHYDRATES = 12;
      const double PROTEINS = 6;
      const double FAT = 0.1;
      const String BARCODE = '7340011364184';
      const String PRODUCT_NAME = 'Chili beans';
      const String NUTRIMENT_DATA_PER = '100g';

      for (int i = 1; i >= 0; i--) {
        final Nutriments nutriments = Nutriments(
          energy: ENERGY + i,
          energyUnit: Unit.KJ,
          carbohydrates: CARBOHYDRATES + i,
          proteins: PROTEINS + i,
          fat: FAT + i,
        );

        final Product newProduct = Product(
          barcode: BARCODE,
          productName: PRODUCT_NAME,
          nutrimentDataPer: NUTRIMENT_DATA_PER,
          nutriments: nutriments,
        );

        final Status status = await OpenFoodAPIClient.saveProduct(
          USER,
          newProduct,
          queryType: QUERY_TYPE,
        );

        expect(status.status, 1);
        expect(status.statusVerbose, 'fields saved');

        final ProductResult result = await OpenFoodAPIClient.getProductRaw(
          BARCODE,
          OpenFoodFactsLanguage.ENGLISH,
          user: USER,
          queryType: QUERY_TYPE,
        );

        expect(result.status, 1);
        expect(result.barcode, BARCODE);
        final Product? searchedProduct = result.product;
        expect(searchedProduct != null, true);
        if (searchedProduct != null) {
          expect(searchedProduct.barcode, BARCODE);
          expect(searchedProduct.productName, PRODUCT_NAME);
          expect(searchedProduct.nutrimentDataPer, NUTRIMENT_DATA_PER);
          var searchedNutriments = searchedProduct.nutriments;
          expect(searchedNutriments != null, true);
          if (searchedNutriments != null) {
            expect(searchedNutriments.energy, nutriments.energy);
            expect(searchedNutriments.carbohydrates, nutriments.carbohydrates);
            expect(searchedNutriments.proteins, nutriments.proteins);
            expect(searchedNutriments.fat, nutriments.fat);
          }
        }
      }
    });
  });
}
