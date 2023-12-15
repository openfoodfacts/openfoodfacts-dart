import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';
import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;

  group('$OpenPricesAPIClient get prices', () {
    test('get first prices', () async {
      const int pageNumber = 1;
      const int pageSize = 20;
      final GetPricesResults results = await OpenPricesAPIClient.getPrices(
        pageSize: pageSize,
        pageNumber: pageNumber,
      );
      expect(results.result, isNotNull);
      final GetPricesResult result = results.result!;
      expect(result.pageSize, pageSize);
      expect(result.pageNumber, pageNumber);
      expect(result.total, isNotNull);
      expect(result.numberOfPages, (result.total! / result.pageSize!).ceil());
      expect(result.items, isNotNull);
      expect(result.items, hasLength(pageSize));
      for (final Price price in result.items!) {
        if (price.productCode == null) {
          expect(price.categoryTag, isNotNull);
        } else {
          expect(price.categoryTag, isNull);
        }
        expect(price.price, greaterThan(0));
        expect(price.locationOSMId, greaterThan(0));
      }
    });

    test('get existing location', () async {
      const int locationId = 1;
      final Location? location =
          await OpenPricesAPIClient.getLocation(locationId);
      expect(location, isNotNull);
      expect(location!.locationId, locationId);
      expect(location.osmId, greaterThan(0));
      expect(location.type, isNotNull);
    });

    test('get non-existing location', () async {
      final Location? location = await OpenPricesAPIClient.getLocation(-1);
      expect(location, isNull);
    });

    test('get existing product', () async {
      const int productId = 1;
      final PriceProduct? priceProduct =
          await OpenPricesAPIClient.getPriceProduct(productId);
      expect(priceProduct, isNotNull);
      expect(priceProduct!.productId, productId);
      expect(priceProduct.code.length, greaterThanOrEqualTo(1));
      expect(priceProduct.created, isNotNull);
    });

    test('get non-existing product', () async {
      final PriceProduct? priceProduct =
          await OpenPricesAPIClient.getPriceProduct(-1);
      expect(priceProduct, isNull);
    });

    test('get status', () async {
      final String? status = await OpenPricesAPIClient.getStatus();
      expect(status, isNotNull);
      expect(status, 'running');
    });
  });
}
