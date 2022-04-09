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
    const List<String> additionalValues = <String>['djobi', 'djoba'];
    const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.ENGLISH;
    const User user = TestConstants.TEST_USER;
    const Timeout timeout = Timeout(Duration(seconds: 90));

    void _checkStatus(final Status status) {
      expect(status.status, 1);
      expect(status.statusVerbose, 'fields saved');
    }

    String? _getValue(
      final AddableProductField field,
      final Product product,
    ) {
      switch (field) {
        case AddableProductField.BRANDS:
          return product.brands;
        case AddableProductField.COUNTRIES:
          return product.countries;
        case AddableProductField.STORES:
          return product.stores;
      }
    }

    Future<void> _checkValue(
      final AddableProductField field,
      final String expectedValue,
    ) async {
      final ProductQueryConfiguration configuration = ProductQueryConfiguration(
        barcode,
        language: language,
        fields: [ProductField.ALL],
      );

      final ProductResult productResult = await OpenFoodAPIClient.getProduct(
        configuration,
        user: user,
      );
      expect(productResult.product, isNotNull);
      final String? actualValue = _getValue(field, productResult.product!);
      expect(actualValue, equalsIgnoringCase(expectedValue));
    }

    Future<void> _checkAddableField(
      final AddableProductField field,
      final Product initialProduct,
    ) async {
      late Status status;
      late Product product;

      // from scratch
      product = initialProduct;
      status = await OpenFoodAPIClient.saveProduct(user, product);
      _checkStatus(status);

      // cumulative list
      String expectedValue = _getValue(field, product)!;

      await _checkValue(field, expectedValue);

      for (final String additionalValue in additionalValues) {
        expectedValue += ', $additionalValue';

        status = await OpenFoodAPIClient.addProductFields(
          user,
          barcode,
          <AddableProductField, String>{field: additionalValue},
        );
        _checkStatus(status);

        await _checkValue(field, expectedValue);
      }
    }

    test(
        'add brand',
        () async => _checkAddableField(
              AddableProductField.BRANDS,
              Product(
                  barcode: barcode, lang: language, brands: 'Golden Cookies'),
            ),
        timeout: timeout);

    test(
        'add country',
        () async => _checkAddableField(
              AddableProductField.COUNTRIES,
              Product(
                  barcode: barcode, lang: language, countries: 'United States'),
            ),
        timeout: timeout);

    test(
        'add stores',
        () async => _checkAddableField(
              AddableProductField.STORES,
              Product(barcode: barcode, lang: language, stores: 'Intermarché'),
            ),
        timeout: timeout);
  });
}
