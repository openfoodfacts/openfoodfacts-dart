import 'package:openfoodfacts/model/TaxonomyAllergen.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/CountryHelper.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration test about allergens.
void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.PROD;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
  OpenFoodAPIConfiguration.globalLanguages = [
    OpenFoodFactsLanguage.ENGLISH,
    OpenFoodFactsLanguage.FRENCH,
  ];

  group('OpenFoodAPIClient getTaxonomyAllergens', () {
    test('get all allergens', () async {
      final Map<String, TaxonomyAllergen>? allergens =
          await OpenFoodAPIClient.getTaxonomyAllergens(
        TaxonomyAllergenQueryConfiguration.all(),
      );
      expect(allergens, isNotNull);
      expect(allergens!.length, greaterThan(10)); // was 15 on 2022-02-25
      for (final TaxonomyAllergen allergen in allergens.values) {
        expect(allergen.name, isNotEmpty);
        expect(allergen.synonyms, isNotEmpty);
      }
    });
  });
}
