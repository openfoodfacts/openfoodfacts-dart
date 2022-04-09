import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/AddableProductFields.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';
import 'test_constants.dart';

/// Unit/Integration tests around OpenFoodAPIClient.addProductFields
void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;

  group('$OpenFoodAPIClient add product fields', () {
    const String barcode = '0048151623426';
    const String initialBrand = 'Golden Cookies';
    const List<String> additionalBrands = <String>['djobi', 'djoba'];
    const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.ENGLISH;

    test('add brand', () async {
      late Status status;
      late Product product;
      late ProductResult productResult;
      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(
        barcode,
        language: language,
        fields: [ProductField.ALL],
      );

      // brands from scratch
      product = Product(
        barcode: barcode,
        lang: OpenFoodFactsLanguage.ENGLISH,
        brands: initialBrand,
      );
      status = await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        product,
      );
      expect(status.status, 1);
      expect(status.statusVerbose, 'fields saved');

      // cumulative list of brands
      String expectedBrands = initialBrand;

      productResult = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );
      expect(productResult.product, isNotNull);
      expect(productResult.product!.brands, expectedBrands);

      for (final String additionalBrand in additionalBrands) {
        expectedBrands += ', $additionalBrand';

        status = await OpenFoodAPIClient.addProductFields(
          TestConstants.TEST_USER,
          barcode,
          <AddableProductField, String>{
            AddableProductField.BRANDS: additionalBrand,
          },
        );
        expect(status.status, 1);
        expect(status.statusVerbose, 'fields saved');

        productResult = await OpenFoodAPIClient.getProduct(
          configurations,
          user: TestConstants.TEST_USER,
        );
        expect(productResult.product, isNotNull);
        expect(productResult.product!.brands, expectedBrands);
      }
    });
  },
      timeout: Timeout(
        // some tests can be slow here
        Duration(seconds: 90),
      ));
}
