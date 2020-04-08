import 'package:flutter_test/flutter_test.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/model/SendImage.dart';
import 'package:openfoodfacts/model/ProductImage.dart';
import 'package:openfoodfacts/model/Status.dart';
import 'package:openfoodfacts/utils/HttpHelper.dart';
import 'test_constants.dart';

void main() {
  group('$OpenFoodAPIClient add product images', () {
    setUpAll(() async {
      // test mode is not working here.
      // image uploads are addressed to production database in every case. Oo
      new HttpHelper().isTestMode = true;
    });

    test('add front image test', () async {
      SendImage image = new SendImage(
        lang: "de",
        barcode: "4250752200784",
        imageField: ProductImage.FIELD_FRONT,
        imageUrl: Uri.parse("assets/front_de.jpg"),
      );
      Status status = await OpenFoodAPIClient.addProductImage(
          TestConstants.TEST_USER, image);

      expect(status != null, true);
      expect(status.status, "status ok");
    });

    test('add ingredients image test', () async {
      SendImage image = new SendImage(
        lang: "en",
        barcode: "0048151623426",
        imageField: ProductImage.FIELD_INGREDIENTS,
        imageUrl: Uri.parse("assets/ingredients_en.jpg"),
      );
      Status status = await OpenFoodAPIClient.addProductImage(
          TestConstants.TEST_USER, image);

      expect(status != null, true);
      expect(status.status, "status ok");
    });
  });
}
