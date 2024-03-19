import 'dart:math';

import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  const UriProductHelper uriHelper = uriHelperFoodTest;

  group('$OpenFoodAPIClient Save product main language', () {
    String barcode_1 = '3017620425035';

    test('Save product main language', () async {
      ProductResultV3 result =
          await OpenFoodAPIClient.getProductV3(ProductQueryConfiguration(
        barcode_1,
        version: ProductQueryVersion.v3,
      ));

      Product? product = result.product;

      expect(product, isNotNull);

      print('Start lang: ${product!.lang}');

      product.lang = OpenFoodFactsLanguage.GERMAN;

      await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        product,
        uriHelper: uriHelper,
      );

      ProductResultV3 result_1 =
          await OpenFoodAPIClient.getProductV3(ProductQueryConfiguration(
        barcode_1,
        version: ProductQueryVersion.v3,
      ));

      Product? product_1 = result_1.product;

      expect(product_1, isNotNull);

      print('End lang: ${product_1!.lang}');

      expect(product_1.lang, OpenFoodFactsLanguage.GERMAN);
    });
  });
}
