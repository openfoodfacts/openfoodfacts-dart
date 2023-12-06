import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;

  const UriProductHelper uriHelperBeautyProd = UriProductHelper(
    domain: 'openbeautyfacts.org',
  );
  const UriProductHelper uriHelperProductsProd = UriProductHelper(
    domain: 'openproductsfacts.org',
  );
  const UriProductHelper uriHelperPetFoodProd = UriProductHelper(
    domain: 'openpetfoodfacts.org',
  );

  const String beautyBarcode = '3600550964738';
  const String productsBarcode = '7898927451035';
  const String petFoodBarcode = '3564700266809';

  group('$OpenFoodAPIClient get not food products', () {
    Future<Product?> findProduct(
      final String barcode,
      final UriProductHelper uriHelper,
      final bool shouldBeThere,
    ) async {
      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.ENGLISH,
        fields: [ProductField.BARCODE],
        version: ProductQueryVersion(2),
      );
      final OldProductResult result = await OpenFoodAPIClient.getOldProduct(
        configurations,
        uriHelper: uriHelper,
      );
      if (shouldBeThere) {
        expect(result.status, 1);
        expect(result.barcode, barcode);
        expect(result.product, isNotNull);
        expect(result.product!.barcode, barcode);
      } else {
        expect(result.status, 0);
        expect(result.barcode, barcode);
        expect(result.product, isNull);
      }
      return result.product;
    }

    test('get beauty product', () async {
      final String barcode = beautyBarcode;
      await findProduct(barcode, uriHelperBeautyProd, true);
      await findProduct(barcode, uriHelperProductsProd, false);
      await findProduct(barcode, uriHelperPetFoodProd, false);
      await findProduct(barcode, uriHelperPetFoodProd, false);
      await findProduct(barcode, uriHelperFoodProd, false);
    });

    test('get products product', () async {
      final String barcode = productsBarcode;
      await findProduct(barcode, uriHelperBeautyProd, false);
      await findProduct(barcode, uriHelperProductsProd, true);
      await findProduct(barcode, uriHelperPetFoodProd, false);
      await findProduct(barcode, uriHelperFoodProd, false);
    });

    test('get pet food product', () async {
      final String barcode = petFoodBarcode;
      await findProduct(barcode, uriHelperBeautyProd, false);
      await findProduct(barcode, uriHelperProductsProd, false);
      await findProduct(barcode, uriHelperPetFoodProd, true);
      await findProduct(barcode, uriHelperFoodProd, false);
    });
  },
      timeout: Timeout(
        // some tests can be slow here
        Duration(seconds: 300),
      ));
}
