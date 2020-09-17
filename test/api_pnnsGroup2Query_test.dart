import 'package:flutter_test/flutter_test.dart';
import 'package:openfoodfacts/utils/HttpHelper.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/model/SearchResult.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/PnnsGroupQueryConfiguration.dart';
import 'package:openfoodfacts/utils/PnnsGroups.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';

import 'test_constants.dart';

void main() {
  setUpAll(() async {
    new HttpHelper().isTestMode = true;
  });

  group('$OpenFoodAPIClient search products', () {
    test('query potatoes products', () async {

      PnnsGroupQueryConfiguration configuration = PnnsGroupQueryConfiguration(
        PnnsGroup2.POTATOES,
        page: 3,
        language: OpenFoodFactsLanguage.ENGLISH,
        fields: [ProductField.ALL],
      );

      SearchResult result = await OpenFoodAPIClient.queryPnnsGroup(
          TestConstants.TEST_USER, configuration);

      expect(result != null, true);
      expect(result.page, 3);
      expect(result.pageSize, 20);
      expect(result.products != null, true);
      expect(result.products.length, 20);
      expect(result.products[0].runtimeType, Product);
      expect(result.count > 1500, true);

      print(result.products[2].toData().toString());
    });
  });

}
