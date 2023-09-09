import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration tests related to the "to-be-completed" products
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;

  group('$OpenFoodAPIClient get all to-be-completed products', () {
    Future<int?> getCount(
      final OpenFoodFactsCountry country,
      final OpenFoodFactsLanguage language,
      final String store,
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
          TagFilter.fromType(
            tagFilterType: TagFilterType.STORES,
            tagName: store,
          ),
        ],
        version: ProductQueryVersion.v3,
      );

      final SearchResult result;
      try {
        result = await OpenFoodAPIClient.searchProducts(
          OpenFoodAPIConfiguration.globalUser,
          configuration,
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
      final String store,
    ) async {
      final List<OpenFoodFactsLanguage> languages = <OpenFoodFactsLanguage>[
        OpenFoodFactsLanguage.ENGLISH,
        OpenFoodFactsLanguage.FRENCH,
        OpenFoodFactsLanguage.ITALIAN,
      ];
      int? result;
      for (final OpenFoodFactsLanguage language in languages) {
        final int? count = await getCount(country, language, store);
        if (result != null) {
          expect(count, result, reason: language.toString());
        }
        result = count;
      }
      return result!;
    }

    Future<void> checkTypeCount(
      final OpenFoodFactsCountry country,
      final String store,
      final int minimalExpectedCount,
    ) async {
      final int count = await getCountForAllLanguages(country, store);
      expect(count, greaterThanOrEqualTo(minimalExpectedCount));
    }

    test(
        'in France',
        () async => checkTypeCount(
              OpenFoodFactsCountry.FRANCE,
              'Carrefour',
              // 2023-08-12: was 14778
              10000,
            ));

    test(
        'in Italy',
        () async => checkTypeCount(
              OpenFoodFactsCountry.ITALY,
              'Carrefour',
              // 2023-07-09: was 2394
              1500,
            ));

    test(
        'in Spain',
        () async => checkTypeCount(
              OpenFoodFactsCountry.SPAIN,
              'El Corte Inglès',
              // 2023-07-09: was 608
              500,
            ));
  },
      timeout: Timeout(
        // some tests can be slow here
        Duration(seconds: 180),
      ));
}
