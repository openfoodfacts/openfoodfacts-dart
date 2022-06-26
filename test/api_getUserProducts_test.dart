import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:openfoodfacts/utils/UserProductSearchQueryConfiguration.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  OpenFoodAPIConfiguration.globalQueryType = QueryType.PROD;

  group('$OpenFoodAPIClient get user products', () {
    const String userId = 'monsieurtanuki';

    test('all types', () async {
      const int pageSize = 100;
      final Map<UserProductSearchType, int> minimumResultLength =
          <UserProductSearchType, int>{
        UserProductSearchType.CONTRIBUTOR: 2, // as of 20220626
        UserProductSearchType.INFORMER: 56, // as of 20220626
        UserProductSearchType.PHOTOGRAPHER: 44, // as of 20220626
        UserProductSearchType.TO_BE_COMPLETED: 0, // you never know...
      };
      for (final MapEntry<UserProductSearchType, int> entry
          in minimumResultLength.entries) {
        final UserProductSearchQueryConfiguration configuration =
            UserProductSearchQueryConfiguration(
          type: entry.key,
          userId: userId,
          pageSize: pageSize,
        );

        final SearchResult result = await OpenFoodAPIClient.getProducts(
          OpenFoodAPIConfiguration.globalUser,
          configuration,
          queryType: OpenFoodAPIConfiguration.globalQueryType,
        );

        expect(result.page, 1); // default
        expect(result.pageSize, pageSize);
        expect(result.products, isNotNull);
        expect(result.products!.length, greaterThanOrEqualTo(entry.value));
      }
    });
  });
}
