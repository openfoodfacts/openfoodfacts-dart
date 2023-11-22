import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Tests around the Elastic Search API.
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  // TODO(monsieurtanuki): test in PROD when available.
  const UriProductHelper uriHelper = uriHelperFoodTest;

  group(
    '$OpenFoodSearchAPIClient autocomplete',
    () {
      const int size = 5;
      const TaxonomyName taxonomyName = TaxonomyName.category;
      const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.FRENCH;

      test(
        'category with existing products',
        () async {
          final AutocompleteSearchResult result =
              await OpenFoodSearchAPIClient.autocomplete(
            query: 'pizza',
            taxonomyNames: <TaxonomyName>[taxonomyName],
            language: language,
            uriHelper: uriHelper,
            size: size,
          );
          expect(result.took, greaterThanOrEqualTo(0));
          expect(result.timedOut, false);
          expect(result.options, isNotNull);
          expect(result.options!.length, size);
          for (final AutocompleteSingleResult item in result.options!) {
            expect(item.id, contains(':'));
            expect(item.taxonomyName, taxonomyName);
          }
        },
      );

      test(
        'category with non existing products',
        () async {
          final AutocompleteSearchResult result =
              await OpenFoodSearchAPIClient.autocomplete(
            query: 'pifsehjfsjkvnskjvbehjszza',
            taxonomyNames: <TaxonomyName>[taxonomyName],
            language: language,
            uriHelper: uriHelper,
            size: size,
          );
          expect(result.took, greaterThanOrEqualTo(0));
          expect(result.timedOut, false);
          expect(result.options, isNotNull);
          expect(result.options, isEmpty);
        },
      );
    },
  );
}
