import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';
import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  const UriProductHelper uriHelper = uriHelperFoodTest;

  group('$OpenPricesAPIClient get prices', () {
    test('get first prices', () async {
      const int pageNumber = 1;
      const int pageSize = 20;
      final GetPricesResults results = await OpenPricesAPIClient.getPrices(
        pageSize: pageSize,
        pageNumber: pageNumber,
        uriHelper: uriHelper,
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
        expect(price.price, isNotNull);
        expect(price.currency, isNotNull);
        expect(price.locationOSMId, isNotNull);
        expect(price.locationOSMType, isNotNull);
        expect(price.date, isNotNull);
        // TODO(monsieurtanuki): isn't productId supposed to be not null?
        //expect(price.productId, isNotNull);
        expect(price.locationId, isNotNull);
        expect(price.created, isNotNull);
      }
    });
  });
}
