import 'package:openfoodfacts/model/taxonomy_nova.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/country_helper.dart';
import 'package:openfoodfacts/utils/open_food_api_configuration.dart';
import 'package:openfoodfacts/utils/query_type.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration test about nova.
void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.PROD;
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
      expect(values!.keys, unorderedEquals(knownRootTags));
      for (final TaxonomyNova value in values.values) {
        expect(value.name, isNotNull);
        expect(value.synonyms, isNotNull);
        for (final OpenFoodFactsLanguage language
            in OpenFoodAPIConfiguration.globalLanguages!) {
          expect(value.name![language], isNotNull);
          expect(value.synonyms![language], isNotNull);
          expect(value.synonyms![language], isNotEmpty);
        }
      }
    });
  });
}
