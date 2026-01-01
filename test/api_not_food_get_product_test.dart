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
    ProductType.food: '7300400481588',
  };

  Future<void> findProduct(
    final String barcode,
    final ProductType expectedProductType,
    final ProductType serverProductType,
    final ProductTypeFilter? productTypeFilter,
  ) async {
    final ProductQueryConfiguration configurations = ProductQueryConfiguration(
      barcode,
      language: OpenFoodFactsLanguage.ENGLISH,
      fields: [ProductField.BARCODE, ProductField.PRODUCT_TYPE],
      version: ProductQueryVersion.v3,
      productTypeFilter: productTypeFilter,
    );
    await getProductTooManyRequestsManager.waitIfNeeded();
    final bool shouldSucceed =
        expectedProductType == serverProductType ||
        productTypeFilter == ProductTypeFilter.all ||
        productTypeFilter?.offTag == expectedProductType.offTag;
    final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
      configurations,
      uriHelper: UriProductHelper(domain: domains[serverProductType]!),
    );
    if (shouldSucceed) {
      expect(result.status, ProductResultV3.statusSuccess);
      expect(result.barcode, barcode);
      expect(result.product, isNotNull);
      expect(result.product!.barcode, barcode);
      expect(result.product!.productType, expectedProductType);
    } else {
      expect(result.status, ProductResultV3.statusFailure);
      expect(result.barcode, barcode);
      expect(result.product, isNull);
    }
  }

  Future<void> checkProduct(final ProductTypeFilter? filter) async {
    for (MapEntry<ProductType, String> item in barcodes.entries) {
      final ProductType productType = item.key;
      final String barcode = item.value;
      for (final ProductType serverProductType in domains.keys) {
        await findProduct(barcode, productType, serverProductType, filter);
      }
    }
  }

  group(
    '$OpenFoodAPIClient get not food products v3',
    () {
      test('get OxF product without filter', () async => checkProduct(null));

      test(
        'get OxF product with ALL filter',
        () async => checkProduct(ProductTypeFilter.all),
      );

      test('get OxF product with specific filter', () async {
        for (final ProductType productType in ProductType.values) {
          await checkProduct(ProductTypeFilter(productType));
        }
      });
    },
    timeout: Timeout(
      // some tests can be slow here
      Duration(seconds: 300),
    ),
  );
}
