import 'package:flutter_test/flutter_test.dart';
import 'package:openfoodfacts/model/Additives.dart';
import 'package:openfoodfacts/model/Nutriments.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/model/Status.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'test_constants.dart';

void main() {
  group('$OpenFoodAPIClient add new products', () {
    String barcode_1 = "0048151623426";
    String quantity_1 = "230g";
    String servingSize_1 = "100g";
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
          productName: "Maryland Choc Chip",
          quantity: quantity_1,
          servingSize: servingSize_1,
          servingQuantity: servingQuantity_1,
          lang: OpenFoodFactsLanguage.ENGLISH,
          brands: "Golden Cookies",
          nutrimentEnergyUnit: "kJ",
          nutrimentDataPer: "serving",
          ingredientsText:
              "fortified wheat flour, chocolate chips (25%), sugar, palm oil,  golden syrup, whey and whey derivatives (milk), raising agents, salt, flavouring",
          nutriments: Nutriments(novaGroup: 4),
          additives: Additives(["en:e150d"], ["E150d"]));
      Status status = await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        product,
        queryType: QueryType.TEST,
      );

      expect(status.status, 1);
      expect(status.statusVerbose, "fields saved");

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
          Product(barcode: barcode_1, productName: "Maryland Choc Chip");
      Status status2 = await OpenFoodAPIClient.saveProduct(
          TestConstants.TEST_USER, product2,
          queryType: QueryType.TEST);
      expect(status2.status, 1);
      expect(status2.statusVerbose, "fields saved");

      ProductResult result2 = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER, queryType: QueryType.TEST);

      testProductResult1(result2);
    });

    test('dont overwrite language', () async {
      String barcode = "4008391212596";

      // save french product name
      Product frenchProduct = Product(
        barcode: barcode,
        productNameFR: "Flocons d'epeautre au blé complet",
        quantity: "500 g",
        brands: "Seitenbacher",
        lang: OpenFoodFactsLanguage.FRENCH,
      );

      Status frenchStatus = await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        frenchProduct,
        queryType: QueryType.TEST,
      );
      expect(frenchStatus.status, 1);
      expect(frenchStatus.statusVerbose, "fields saved");

      // save german product name
      Product germanProduct = Product(
        barcode: barcode,
        productNameDE: "Dinkelflakes",
        quantity: "500 g",
        brands: "Seitenbacher",
        lang: OpenFoodFactsLanguage.GERMAN,
      );

      Status germanStatus = await OpenFoodAPIClient.saveProduct(
          TestConstants.TEST_USER, germanProduct,
          queryType: QueryType.TEST);
      expect(germanStatus.status, 1);
      expect(germanStatus.statusVerbose, "fields saved");

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
        barcode: "8008698011065",
        productName: "Meisterbäckers Vital",
        quantity: "350g",
        brands: "Schär",
        lang: OpenFoodFactsLanguage.GERMAN,
      );
      Status status = await OpenFoodAPIClient.saveProduct(
          TestConstants.TEST_USER, product,
          queryType: QueryType.TEST);

      expect(status.status, 1);
      expect(status.statusVerbose, "fields saved");
    });

    test('add new product test 3', () async {
      Product product = Product(
        barcode: "4250752200784",
        productName: "Johanneskraut-Rotöl Kapseln",
        quantity: "30 Kapseln",
        brands: "Abtei",
        lang: OpenFoodFactsLanguage.GERMAN,
        ingredientsText:
            "Johanneskraut, Maisöl, Phospholipide (Sojabohnen, Ponceau 4R)",
      );
      Status status = await OpenFoodAPIClient.saveProduct(
          TestConstants.TEST_USER, product,
          queryType: QueryType.TEST);

      expect(status.status, 1);
      expect(status.statusVerbose, "fields saved");
    });

    test('add new product test 4', () async {
      Product product = Product(
          barcode: "4052700676180",
          productName: "Calcium + Vitamin D3 + C",
          quantity: "14 Tabletten",
          brands: "DocMorris",
          lang: OpenFoodFactsLanguage.GERMAN,
          ingredientsText:
              "Säurungsmittel Citronensäure, Calciumcarbonat, Natriumhydrogencarbonat",
          categories: "Nahrungsergänzungsmittel, Vitamine");
      Status status = await OpenFoodAPIClient.saveProduct(
          TestConstants.TEST_USER, product,
          queryType: QueryType.TEST);

      expect(status.status, 1);
      expect(status.statusVerbose, "fields saved");
    });

    test('add new product test 5', () async {
      var nutriments = Nutriments();
      nutriments.energy = 365;
      nutriments.carbohydrates = 12;
      nutriments.proteins = 6;
      nutriments.fat = 0.1;

      Product product = Product(
          barcode: "7340011364184",
          productName: "Chili beans",
          nutrimentDataPer: "100g",
          nutriments: nutriments);

      Status status = await OpenFoodAPIClient.saveProduct(
          TestConstants.TEST_USER, product,
          queryType: QueryType.TEST);

      expect(status.status, 1);
      expect(status.statusVerbose, "fields saved");
    });
  });
}
