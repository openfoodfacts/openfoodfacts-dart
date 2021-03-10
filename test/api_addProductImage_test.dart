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
    test('add front image test', () async {
      SendImage image = SendImage(
        lang: OpenFoodFactsLanguage.GERMAN,
        barcode: '4250752200784',
        imageField: ImageField.FRONT,
        imageUrl: Uri.file('test/test_assets/front_de.jpg'),
      );
      Status status = await OpenFoodAPIClient.addProductImage(
          TestConstants.TEST_USER, image,
          queryType: QueryType.TEST);

      expect(status.status, 'status not ok');
      expect(status.error, 'This picture has already been sent.');
    });

    test('add ingredients image test', () async {
      SendImage image = SendImage(
        lang: OpenFoodFactsLanguage.ENGLISH,
        barcode: '0048151623426',
        imageField: ImageField.INGREDIENTS,
        imageUrl: Uri.file('test/test_assets/ingredients_en.jpg'),
      );
      Status status = await OpenFoodAPIClient.addProductImage(
          TestConstants.TEST_USER, image,
          queryType: QueryType.TEST);

      expect(status.status, 'status not ok');
      expect(status.error, 'This picture has already been sent.');
    });

    test('add ingredients image test', () async {
      SendImage image = SendImage(
        lang: OpenFoodFactsLanguage.DANISH,
        barcode: '5722970900207',
        imageField: ImageField.FRONT,
        imageUrl: Uri.file('test/test_assets/corn_da.jpg'),
      );
      Status status = await OpenFoodAPIClient.addProductImage(
          TestConstants.TEST_USER, image,
          queryType: QueryType.TEST);

      assert(status.error != 'field imgupload_front_xx not set');
    });

    test('Read image from PROD', () async {
      //Get product without setting ProductField
      ProductQueryConfiguration configurations =
          ProductQueryConfiguration('7622210449283');
      ProductResult result = await OpenFoodAPIClient.getProduct(configurations,
          user: TestConstants.TEST_USER, queryType: QueryType.TEST);

      expect(result.status != null, true);
      expect(
          result.product!.images!
              .singleWhere((image) =>
                  image.field == ImageField.FRONT &&
                  image.size == ImageSize.DISPLAY)
              .url,
          'https://static.openfoodfacts.net/images/products/762/221/044/9283/front_fr.286.400.jpg');
    });
  });
}
