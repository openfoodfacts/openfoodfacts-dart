import 'package:openfoodfacts/interface/Parameter.dart';
import 'package:openfoodfacts/utils/HttpHelper.dart';
import 'package:test/test.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/model/SearchResult.dart';
import 'package:openfoodfacts/model/User.dart';

import 'test_constants.dart';

void main() {

  setUpAll(() async {
    new HttpHelper().isTestMode = true;
    new HttpHelper().userAgent = TestConstants.USER_AGENT;
  });

  group('$OpenFoodAPIClient search products', ()  {
    test('search favorite products', () async {

      var parameterList = <Parameter>[
        const OutputFormat(format: Format.JSON),
        const Page(page: 1),
        const PageSize(size: 10),
        const SearchSimple(active: true),
        const SortBy(option: SortOption.POPULARITY)
      ];

      SearchResult result = await OpenFoodAPIClient.searchProducts(
          parameterList, lang: User.LANGUAGE_DE);

      expect(result != null, true);
      expect(result.page, "1");
      expect(result.pageSize, "10");
      expect(result.products != null, true);
      expect(result.products.length, 10);
      expect(result.products[0].runtimeType, Product);
      expect(result.count > 30000, true);

      print(result.products[0].toData().toString());
    });
  });
}