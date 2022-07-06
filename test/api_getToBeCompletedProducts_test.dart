import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/CountryHelper.dart';
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
    Future<int> _getCount(
      final OpenFoodFactsCountry country,
      final OpenFoodFactsLanguage language,
    ) async {
      final String reason = '($country, $language)';
      final ToBeCompletedQueryConfiguration configuration =
          ToBeCompletedQueryConfiguration(
        country: country,
        language: language,
      );

      final SearchResult result;
      try {
        result = await OpenFoodAPIClient.getProducts(
          OpenFoodAPIConfiguration.globalUser,
          configuration,
          queryType: OpenFoodAPIConfiguration.globalQueryType,
        );
      } catch (e) {
        fail('Could not retrieve data for $reason: $e');
      }
      expect(result.page, 1, reason: reason); // default
      expect(result.products, isNotNull, reason: reason);
      return result.count!;
    }

    Future<int> _getCountForAllLanguages(
      final OpenFoodFactsCountry country,
    ) async {
      final List<OpenFoodFactsLanguage> languages = <OpenFoodFactsLanguage>[
        OpenFoodFactsLanguage.ENGLISH,
        OpenFoodFactsLanguage.FRENCH,
        OpenFoodFactsLanguage.ITALIAN,
      ];
      int? result;
      for (final OpenFoodFactsLanguage language in languages) {
        final int count = await _getCount(country, language);
        if (result != null) {
          expect(count, result, reason: language.toString());
        }
        result = count;
      }
      return result!;
    }

    Future<void> _checkTypeCount(
      final OpenFoodFactsCountry country,
      final int minimalExpectedCount,
    ) async {
      final int count = await _getCountForAllLanguages(country);
      expect(count, greaterThanOrEqualTo(minimalExpectedCount));
    }

    test(
        'in France',
        () async => _checkTypeCount(
            OpenFoodFactsCountry.FRANCE, 800000) // 20220706: was 910148
        );

    test(
        'in Italy',
        () async => _checkTypeCount(
            OpenFoodFactsCountry.ITALY, 100000) // 20220706: was 171488
        );

    test(
        'in Spain',
        () async => _checkTypeCount(
            OpenFoodFactsCountry.SPAIN, 200000) // 20220706: was 272194
        );
  });
}
