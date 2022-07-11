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
    const int pageSize = 100; // should be big enough to get everything on page1

    Future<int> _getCount(
      final UserProductSearchType type,
      final OpenFoodFactsLanguage language, {
      final void Function(Product)? additionalCheck,
    }) async {
      final String reason = '($language, $type)';
      final UserProductSearchQueryConfiguration configuration =
          UserProductSearchQueryConfiguration(
        type: type,
        userId: userId,
        pageSize: pageSize,
        language: language,
        fields: [
          ProductField.BARCODE,
          ProductField.STATES_TAGS,
        ],
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
      expect(result.pageSize, pageSize, reason: reason);
      expect(result.products, isNotNull, reason: reason);
      expect(result.products!.length, result.count, reason: reason);
      if (additionalCheck != null) {
        for (final Product product in result.products!) {
          additionalCheck(product);
        }
      }
      return result.count!;
    }

    Future<int> _getCountForAllLanguages(
      final UserProductSearchType type, {
      final void Function(Product)? additionalCheck,
    }) async {
      final List<OpenFoodFactsLanguage> languages = <OpenFoodFactsLanguage>[
        OpenFoodFactsLanguage.ENGLISH,
        OpenFoodFactsLanguage.FRENCH,
        OpenFoodFactsLanguage.ITALIAN,
      ];
      int? result;
      for (final OpenFoodFactsLanguage language in languages) {
        final int count = await _getCount(
          type,
          language,
          additionalCheck: additionalCheck,
        );
        if (result != null) {
          expect(count, result, reason: language.toString());
        }
        result = count;
      }
      return result!;
    }

    Future<void> _checkTypeCount(
      final UserProductSearchType type,
      final int minimalExpectedCount, {
      final void Function(Product)? additionalCheck,
    }) async {
      final int count = await _getCountForAllLanguages(
        type,
        additionalCheck: additionalCheck,
      );
      expect(count, greaterThanOrEqualTo(minimalExpectedCount));
    }

    test(
      'contributor',
      () async => _checkTypeCount(
          UserProductSearchType.CONTRIBUTOR, 2) // as of 20220706
      ,
    );

    test(
      'informer',
      () async =>
          _checkTypeCount(UserProductSearchType.INFORMER, 56) // as of 20220706
      ,
    );

    test(
      'photographer',
      () async => _checkTypeCount(
          UserProductSearchType.PHOTOGRAPHER, 44) // as of 20220706
      ,
    );

    test(
      'to be completed',
      () async => _checkTypeCount(
          UserProductSearchType.TO_BE_COMPLETED, 0, // you never know...
          additionalCheck: (final Product product) {
        expect(product.statesTags, isNotNull);
        expect(product.statesTags, contains('en:to-be-completed'));
      }),
    );
  });
}
