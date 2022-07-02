import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:openfoodfacts/utils/ToBeCompletedConfiguration.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration tests related to [ToBeCompletedQueryConfiguration]
void main() {
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  OpenFoodAPIConfiguration.globalQueryType = QueryType.PROD;

  group('$OpenFoodAPIClient get all to-be-completed products', () {
    test('all types', () async {
      final SearchResult result = await OpenFoodAPIClient.getProducts(
        OpenFoodAPIConfiguration.globalUser,
        ToBeCompletedQueryConfiguration(),
        queryType: OpenFoodAPIConfiguration.globalQueryType,
      );

      expect(result.page, 1); // default
      expect(result.products, isNotNull);
      expect(result.count, greaterThan(1000000)); // 20220630: was 2403413
    });
  });
}
