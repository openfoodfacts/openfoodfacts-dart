import 'package:test/test.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/model/SendProduct.dart';
import 'package:openfoodfacts/model/Status.dart';
import 'package:openfoodfacts/model/User.dart';

void main() {
  group('succesful api calls', ()  {

    User user = new User(
        userId: "off",
        password: "off",
        comment: "dart API test"
    );

    test('add new product test 1', () async {
      SendProduct product = new SendProduct(
        barcode: "0048151623426",
        productName: "Maryland Choc Chip",
        quantity: "230g",
        lang: "en",
        brands: "Golden Cookies",
        nutrimentEnergy: "450",
        nutrimentEnergyUnit: "kJ",
        nutrimentDataPer: "serving",
        ingredientsText: "fortified wheat flour, chocolate chips (25%), sugar, palm oil,  golden syrup, whey and whey derivatives (milk), raising agents, salt, flavouring",
      );
      Status status = await OpenFoodAPIClient.saveProduct(user, product);

      expect(status != null, true);
      expect(status.status, 1);
      expect(status.statusVerbose, "fields saved");
    });

    test('add new product test 2', () async {
      SendProduct product = new SendProduct(
        barcode: "8008698011065",
        productName: "Meisterbäckers Vital",
        quantity: "350g",
        brands: "Schär",
        lang: "de",
      );
      Status status = await OpenFoodAPIClient.saveProduct(user, product);

      expect(status != null, true);
      expect(status.status, 1);
      expect(status.statusVerbose, "fields saved");
    });

    test('add new product test 3', () async {
      SendProduct product = new SendProduct(
        barcode: "4250752200784",
        productName: "Johanneskraut-Rotöl Kapseln",
        quantity: "30 Kapseln",
        brands: "Abtei",
        lang: "de",
        ingredientsText: "Johanneskraut, Maisöl, Phospholipide (Sojabohnen, Ponceau 4R)",
      );
      Status status = await OpenFoodAPIClient.saveProduct(user, product);

      expect(status != null, true);
      expect(status.status, 1);
      expect(status.statusVerbose, "fields saved");
    });
  });
}
