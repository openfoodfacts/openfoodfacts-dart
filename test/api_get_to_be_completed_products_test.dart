import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration tests related to the "to-be-completed" products
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  OpenFoodAPIConfiguration.globalQueryType = QueryType.PROD;

  group('$OpenFoodAPIClient get all to-be-completed products', () {
    Future<int?> getCount(
      final OpenFoodFactsCountry country,
      final OpenFoodFactsLanguage language,
    ) async {
      final String reason = '($country, $language)';
      final ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
        country: country,
        language: language,
        fields: [
          ProductField.BARCODE,
          ProductField.STATES_TAGS,
        ],
        parametersList: [
          StatesTagsParameter(map: {ProductState.COMPLETED: false}),
        ],
        version: ProductQueryVersion.v3,
      );

      final SearchResult result;
      try {
        result = await OpenFoodAPIClient.searchProducts(
          OpenFoodAPIConfiguration.globalUser,
          configuration,
          queryType: OpenFoodAPIConfiguration.globalQueryType,
        );
      } catch (e) {
        fail('Could not retrieve data for $reason: $e');
      }
      expect(result.page, 1, reason: reason); // default
      expect(result.products, isNotNull, reason: reason);
      for (final Product product in result.products!) {
        expect(product.statesTags, isNotNull);
        expect(product.statesTags!, contains('en:to-be-completed'));
      }
      return result.count;
    }

    Future<int> getCountForAllLanguages(
      final OpenFoodFactsCountry country,
    ) async {
      final List<OpenFoodFactsLanguage> languages = <OpenFoodFactsLanguage>[
        OpenFoodFactsLanguage.ENGLISH,
        OpenFoodFactsLanguage.FRENCH,
        OpenFoodFactsLanguage.ITALIAN,
      ];
      int? result;
      for (final OpenFoodFactsLanguage language in languages) {
        final int? count = await getCount(country, language);
        if (result != null) {
          expect(count, result, reason: language.toString());
        }
        result = count;
      }
      return result!;
    }

    Future<void> checkTypeCount(
      final OpenFoodFactsCountry country,
      final int minimalExpectedCount,
    ) async {
      final int count = await getCountForAllLanguages(country);
      expect(count, greaterThanOrEqualTo(minimalExpectedCount));
    }

    test(
        'in France',
        () async => checkTypeCount(
            OpenFoodFactsCountry.FRANCE, 800000) // 20220706: was 910148
        );

    test(
        'in Italy',
        () async => checkTypeCount(
            OpenFoodFactsCountry.ITALY, 100000) // 20220706: was 171488
        );

    test(
        'in Spain',
        () async => checkTypeCount(
            OpenFoodFactsCountry.SPAIN, 200000) // 20220706: was 272194
        );
  },
      timeout: Timeout(
        // some tests can be slow here
        Duration(seconds: 90),
      ));
}
