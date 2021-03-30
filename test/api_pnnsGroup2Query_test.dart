import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/model/SearchResult.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/PnnsGroupQueryConfiguration.dart';
import 'package:openfoodfacts/utils/PnnsGroups.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  group('$OpenFoodAPIClient search products', () {
    test('query potatoes products', () async {
      PnnsGroupQueryConfiguration configuration = PnnsGroupQueryConfiguration(
        PnnsGroup2.POTATOES,
        page: 3,
        language: OpenFoodFactsLanguage.ENGLISH,
        fields: [ProductField.ALL],
      );

      SearchResult result = await OpenFoodAPIClient.queryPnnsGroup(
        TestConstants.TEST_USER,
        configuration,
        queryType: QueryType.TEST,
      );

      expect(result.page, 3);
      expect(result.pageSize, 24);
      expect(result.products != null, true);
      expect(result.products!.length, 24);
      expect(result.products![0].runtimeType, Product);
      expect(result.count! > 1500, true);
    });
  }, skip: 'This Group of tests is unstable');
}
