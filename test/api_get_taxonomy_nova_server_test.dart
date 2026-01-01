import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration test about nova.
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
  OpenFoodAPIConfiguration.globalLanguages = [
    OpenFoodFactsLanguage.ENGLISH,
    OpenFoodFactsLanguage.FRENCH,
  ];

  final Iterable<String> knownRootTags = TaxonomyNova.offTags.values;

  group('OpenFoodAPIClient getTaxonomyNova SERVER', () {
    test('get all nova', () async {
      final Map<String, TaxonomyNova>? values =
          await OpenFoodAPIClient.getTaxonomyNova(
            TaxonomyNovaQueryConfiguration.roots(),
          );
      expect(values, isNotNull);
      expect(values!.keys, containsAll(knownRootTags));
      for (final TaxonomyNova value in values.values) {
        expect(value.name, isNotNull);
      }
    });
  });
}
