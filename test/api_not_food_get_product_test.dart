import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;

  const Map<ProductType, String> domains = <ProductType, String>{
    ProductType.beauty: 'openbeautyfacts.org',
    ProductType.product: 'openproductsfacts.org',
    ProductType.petFood: 'openpetfoodfacts.org',
    ProductType.food: 'openfoodfacts.org',
  };

  const Map<ProductType, String> barcodes = <ProductType, String>{
    ProductType.beauty: '3600551054476',
    ProductType.product: '7898927451035',
    ProductType.petFood: '3564700266809',
  };

  group('$OpenFoodAPIClient get not food products', () {
    Future<void> findProduct(
      final String barcode,
      final ProductType expectedProductType,
      final ProductType serverProductType,
    ) async {
      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(
        barcode,
        language: OpenFoodFactsLanguage.ENGLISH,
        fields: [
          ProductField.BARCODE,
          ProductField.PRODUCT_TYPE,
        ],
        version: ProductQueryVersion(2),
      );
      await getProductTooManyRequestsManager.waitIfNeeded();
      final OldProductResult result = await OpenFoodAPIClient.getOldProduct(
        configurations,
        uriHelper: UriProductHelper(
          domain: domains[serverProductType]!,
        ),
      );
      if (expectedProductType == serverProductType) {
        expect(result.status, 1);
        expect(result.barcode, barcode);
        expect(result.product, isNotNull);
        expect(result.product!.barcode, barcode);
        expect(result.product!.productType, expectedProductType);
      } else {
        expect(result.status, 0);
        expect(result.barcode, barcode);
        expect(result.product, isNull);
      }
    }

    test('get OxF product', () async {
      for (MapEntry<ProductType, String> item in barcodes.entries) {
        final ProductType productType = item.key;
        final String barcode = item.value;
        for (final ProductType serverProductType in ProductType.values) {
          await findProduct(
            barcode,
            productType,
            serverProductType,
          );
        }
      }
    });
  },
      timeout: Timeout(
        // some tests can be slow here
        Duration(seconds: 300),
      ));
}
