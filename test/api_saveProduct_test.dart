import 'package:flutter_test/flutter_test.dart';
import 'package:openfoodfacts/model/Additives.dart';
import 'package:openfoodfacts/model/Nutriments.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/model/Status.dart';
import 'package:openfoodfacts/utils/HttpHelper.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/UnitHelper.dart';
import 'test_constants.dart';

void main() {
  group('$OpenFoodAPIClient add new products', () {
    setUpAll(() async {
      HttpHelper().isTestMode = true;
    });

    test('add new product test 1', () async {
      Product product = Product(
          barcode: "0048151623426",
          productName: "Maryland Choc Chip",
          quantity: "230g",
          lang: OpenFoodFactsLanguage.ENGLISH,
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
      Product product = Product(
        barcode: "8008698011065",
        productName: "Meisterbäckers Vital",
        quantity: "350g",
        brands: "Schär",
        lang: OpenFoodFactsLanguage.GERMAN,
      );
      Status status =
          await OpenFoodAPIClient.saveProduct(TestConstants.TEST_USER, product);

      expect(status != null, true);
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
      Status status =
          await OpenFoodAPIClient.saveProduct(TestConstants.TEST_USER, product);

      expect(status != null, true);
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
      Status status =
          await OpenFoodAPIClient.saveProduct(TestConstants.TEST_USER, product);

      expect(status != null, true);
      expect(status.status, 1);
      expect(status.statusVerbose, "fields saved");
    });

    test('confirm that fields are saved', () async {
      double energy = 365;
      double carbs = 12;
      double proteins = 6;
      double fat = 0.1;
      var nutriments = Nutriments();
      nutriments.energy = energy;
      nutriments.energyUnit = Unit.KJ;
      nutriments.carbohydrates = carbs;
      nutriments.proteins = proteins;
      nutriments.fat = fat;

      String barcode = "7340011364184";
      String productName = "Chili beans";
      String nutrimentDataPer = "100g";
      var newProduct = Product(
          barcode: barcode,
          productName: productName,
          nutrimentDataPer: nutrimentDataPer,
          nutriments: nutriments);

      Status status = await OpenFoodAPIClient.saveProduct(TestConstants.TEST_USER, newProduct);

      expect(status != null, true);
      expect(status.status, 1);
      expect(status.statusVerbose, "fields saved");

      ProductResult result = await OpenFoodAPIClient.getProductRaw(
          barcode, OpenFoodFactsLanguage.ENGLISH,
          user: TestConstants.TEST_USER);

      expect(result != null, true);
      expect(result.status, 1);
      expect(result.barcode, barcode);
      var searchedProduct = result.product;
      expect(searchedProduct != null, true);
      expect(searchedProduct.barcode, barcode);
      expect(searchedProduct.productName, productName);
      expect(searchedProduct.nutrimentDataPer, nutrimentDataPer);
      var searchedNutriments = searchedProduct.nutriments;
      expect(searchedNutriments.energy, energy);
      expect(searchedNutriments.carbohydrates, carbs);
      expect(searchedNutriments.proteins, proteins);
      expect(searchedNutriments.fat, fat);
    });
  });
}
