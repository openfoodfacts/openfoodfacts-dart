import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration test about allergens.
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
  OpenFoodAPIConfiguration.globalLanguages = [
    OpenFoodFactsLanguage.ENGLISH,
    OpenFoodFactsLanguage.FRENCH,
  ];

  const String knownTag = 'en:gluten';
  const String unknownTag = 'en:some_nonexistent_label';

  void checkKnown(final TaxonomyAllergen allergen) {
    expect(allergen.name![OpenFoodFactsLanguage.ENGLISH]!, isNotEmpty);
    expect(allergen.name![OpenFoodFactsLanguage.FRENCH]!, isNotEmpty);
    expect(allergen.wikidata![OpenFoodFactsLanguage.ENGLISH]!, isNotEmpty);
  }

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

    test('get an allergen', () async {
      final Map<String, TaxonomyAllergen>? allergens =
          await OpenFoodAPIClient.getTaxonomyAllergens(
        TaxonomyAllergenQueryConfiguration(tags: <String>[knownTag]),
      );
      expect(allergens, isNotNull);
      expect(allergens!.length, 1);
      final TaxonomyAllergen allergen = allergens[knownTag]!;
      checkKnown(allergen);
    });

    test("get an allergen that doesn't exist", () async {
      final Map<String, TaxonomyAllergen>? allergens =
          await OpenFoodAPIClient.getTaxonomyAllergens(
        TaxonomyAllergenQueryConfiguration(tags: <String>[unknownTag]),
      );
      expect(allergens, isNull);
    });

    test("get an allergen that doesn't exist with one that does", () async {
      final Map<String, TaxonomyAllergen>? allergens =
          await OpenFoodAPIClient.getTaxonomyAllergens(
        TaxonomyAllergenQueryConfiguration(
          tags: <String>[unknownTag, knownTag],
        ),
      );
      expect(allergens, isNotNull);
      expect(allergens!.length, 1);
      final TaxonomyAllergen allergen = allergens[knownTag]!;
      checkKnown(allergen);
    });
  });
}
