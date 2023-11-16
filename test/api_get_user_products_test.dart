import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;

  group('$OpenFoodAPIClient get user products', () {
    const String userId = 'monsieurtanuki';
    // should be big enough to get everything on page1
    const int pageSize = 1000;
    final String toBeCompletedTag = ProductState.COMPLETED.toBeCompletedTag;

    Future<int> getCount(
      final TagFilterType type,
      final OpenFoodFactsLanguage language,
      final bool toBeCompleted, {
      final void Function(Product)? additionalCheck,
    }) async {
      final String reason = '($language, $type)';
      final ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
        parametersList: [
          TagFilter.fromType(tagFilterType: type, tagName: userId),
          PageSize(size: pageSize),
          if (toBeCompleted)
            TagFilter.fromType(
              tagFilterType: TagFilterType.STATES,
              tagName: toBeCompletedTag,
            ),
        ],
        language: language,
        fields: [
          ProductField.BARCODE,
          ProductField.STATES_TAGS,
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
      expect(result.pageSize, pageSize, reason: reason);
      expect(result.products, isNotNull, reason: reason);
      expect(result.products!.length, result.pageCount, reason: reason);
      if (additionalCheck != null) {
        for (final Product product in result.products!) {
          additionalCheck(product);
        }
      }
      return result.pageCount!;
    }

    Future<int> getCountForAllLanguages(
      final TagFilterType type,
      final bool toBeCompleted, {
      final void Function(Product)? additionalCheck,
    }) async {
      final List<OpenFoodFactsLanguage> languages = <OpenFoodFactsLanguage>[
        OpenFoodFactsLanguage.ENGLISH,
        OpenFoodFactsLanguage.FRENCH,
        OpenFoodFactsLanguage.ITALIAN,
      ];
      int? result;
      for (final OpenFoodFactsLanguage language in languages) {
        final int count = await getCount(
          type,
          language,
          toBeCompleted,
          additionalCheck: additionalCheck,
        );
        if (result != null) {
          expect(count, result, reason: language.toString());
        }
        result = count;
      }
      return result!;
    }

    Future<void> checkTypeCount(
      final TagFilterType type,
      final int minimalExpectedCount, {
      final void Function(Product)? additionalCheck,
      final bool toBeCompleted = false,
    }) async {
      final int count = await getCountForAllLanguages(
        type,
        toBeCompleted,
        additionalCheck: additionalCheck,
      );
      expect(count, greaterThanOrEqualTo(minimalExpectedCount));
    }

    test(
      'contributor',
      () async => checkTypeCount(TagFilterType.CREATOR, 2) // as of 20221229
      ,
    );

    test(
      'informer',
      () async =>
          await checkTypeCount(TagFilterType.INFORMERS, 73) // as of 20221229
      ,
    );

    test(
      'photographer',
      () async =>
          checkTypeCount(TagFilterType.PHOTOGRAPHERS, 48) // as of 20221229
      ,
    );

    test(
      'to be completed',
      () async => checkTypeCount(
        TagFilterType.INFORMERS, 0, // you never know...
        toBeCompleted: true,
        additionalCheck: (final Product product) {
          expect(product.statesTags, isNotNull);
          expect(product.statesTags, contains(toBeCompletedTag));
        },
      ),
    );
  });
}
