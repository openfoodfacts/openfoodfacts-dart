import 'package:flutter_test/flutter_test.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/model/SendImage.dart';
import 'package:openfoodfacts/model/ProductImage.dart';
import 'package:openfoodfacts/model/Status.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'test_constants.dart';

void main() {
  group('$OpenFoodAPIClient add product images', () {
/*    setUpAll(() async {
      // test mode is not working here.
      // image uploads are addressed to production database in every case. Oo
      new HttpHelper().isTestMode = true;
    });*/

    test('add front image test', () async {
      SendImage image = new SendImage(
        lang: OpenFoodFactsLanguage.GERMAN,
        barcode: "4250752200784",
        imageField: ImageField.FRONT,
        imageUrl: Uri.parse("assets/front_de.jpg"),
      );
      Status status = await OpenFoodAPIClient.addProductImage(
          TestConstants.TEST_USER, image,
          queryType: QueryType.TEST);

      expect(status != null, true);
      expect(status.status, "status not ok");
      expect(status.error, "This picture has already been sent.");
    });

    test('add ingredients image test', () async {
      SendImage image = new SendImage(
        lang: OpenFoodFactsLanguage.ENGLISH,
        barcode: "0048151623426",
        imageField: ImageField.INGREDIENTS,
        imageUrl: Uri.parse("assets/ingredients_en.jpg"),
      );
      Status status = await OpenFoodAPIClient.addProductImage(
          TestConstants.TEST_USER, image,
          queryType: QueryType.TEST);

      expect(status != null, true);
      expect(status.status, "status not ok");
      expect(status.error, "This picture has already been sent.");
    });

    test('add ingredients image test', () async {
      SendImage image = new SendImage(
        lang: OpenFoodFactsLanguage.DANISH,
        barcode: "5722970900207",
        imageField: ImageField.FRONT,
        imageUrl: Uri.parse("assets/corn_da.jpg"),
      );
      Status status = await OpenFoodAPIClient.addProductImage(
          TestConstants.TEST_USER, image,
          queryType: QueryType.TEST);

      expect(status != null, true);
      assert(status.error != "field imgupload_front_xx not set");
    });
  });
}
