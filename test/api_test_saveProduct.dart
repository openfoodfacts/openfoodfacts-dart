import 'package:flutter_test/flutter_test.dart';
import 'package:openfoodfacts/model/Additives.dart';
import 'package:openfoodfacts/model/Nutriments.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/model/Status.dart';
import 'package:openfoodfacts/utils/HttpHelper.dart';
import 'test_constants.dart';

void main() {
  group('$OpenFoodAPIClient add new products', () {
    setUpAll(() async {
      new HttpHelper().isTestMode = true;
    });

    test('add new product test 1', () async {
      Product product = new Product(
          barcode: "0048151623426",
          productName: "Maryland Choc Chip",
          quantity: "230g",
          lang: "en",
          brands: "Golden Cookies",
          nutrimentEnergyUnit: "kJ",
          nutrimentDataPer: "serving",
          ingredientsText:
              "fortified wheat flour, chocolate chips (25%), sugar, palm oil,  golden syrup, whey and whey derivatives (milk), raising agents, salt, flavouring",
          nutriments: Nutriments(novaGroup: 4),
          additives: Additives(["en:e150d"], ["E150d"]));
      Status status =
          await OpenFoodAPIClient.saveProduct(TestConstants.TEST_USER, product);

      expect(status != null, true);
      expect(status.status, 1);
      expect(status.statusVerbose, "fields saved");
    });

    test('add new product test 2', () async {
      Product product = new Product(
        barcode: "8008698011065",
        productName: "Meisterbäckers Vital",
        quantity: "350g",
        brands: "Schär",
        lang: "de",
      );
      Status status =
          await OpenFoodAPIClient.saveProduct(TestConstants.TEST_USER, product);

      expect(status != null, true);
      expect(status.status, 1);
      expect(status.statusVerbose, "fields saved");
    });

    test('add new product test 3', () async {
      Product product = new Product(
        barcode: "4250752200784",
        productName: "Johanneskraut-Rotöl Kapseln",
        quantity: "30 Kapseln",
        brands: "Abtei",
        lang: "de",
        ingredientsText:
            "Johanneskraut, Maisöl, Phospholipide (Sojabohnen, Ponceau 4R)",
      );
      Status status =
          await OpenFoodAPIClient.saveProduct(TestConstants.TEST_USER, product);

      expect(status != null, true);
      expect(status.status, 1);
      expect(status.statusVerbose, "fields saved");
    });

    test('add new product test 4', () async {
      Product product = new Product(
          barcode: "4052700676180",
          productName: "Calcium + Vitamin D3 + C",
          quantity: "14 Tabletten",
          brands: "DocMorris",
          lang: "de",
          ingredientsText:
              "Säurungsmittel Citronensäure, Calciumcarbonat, Natriumhydrogencarbonat",
          categories: "Nahrungsergänzungsmittel, Vitamine");
      Status status =
          await OpenFoodAPIClient.saveProduct(TestConstants.TEST_USER, product);

      expect(status != null, true);
      expect(status.status, 1);
      expect(status.statusVerbose, "fields saved");
    });
  });
}
