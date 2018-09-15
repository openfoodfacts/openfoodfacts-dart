import 'package:test/test.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/model/SendImage.dart';
import 'package:openfoodfacts/model/Status.dart';
import 'package:openfoodfacts/model/User.dart';

void main() {
  group('succesful api calls', ()  {
    User user = new User(
        userId: "grumpf",
        password: "OpenFoodFacts77",
        comment: "dart API test"
    );

    test('add front image test', () async {
      SendImage image = new SendImage(
        lang: "de",
        barcode: "4250752200784",
        imageField: SendImage.FIELD_FRONT,
        imageUrl: Uri.parse("assets/front_de.jpg"),
      );
      Status status = await OpenFoodAPIClient.addProductImage(user, image);

      expect(status != null, true);
      expect(status.status, "1");
      expect(status.statusVerbose, "fields saved");
    });

    test('add ingredients image test', () async {
      SendImage image = new SendImage(
        lang: "en",
        barcode: "0048151623426",
        imageField: SendImage.FIELD_INGREDIENTS,
        imageUrl: Uri.parse("assets/ingredients_en.jpg"),
      );
      Status status = await OpenFoodAPIClient.addProductImage(user, image);

      expect(status != null, true);
      expect(status.status, "1");
      expect(status.statusVerbose, "fields saved");
    });
  });
}
