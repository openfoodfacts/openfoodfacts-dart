import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration test about categories.
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
  OpenFoodAPIConfiguration.globalLanguages = [
    OpenFoodFactsLanguage.ENGLISH,
    OpenFoodFactsLanguage.FRENCH,
  ];

  const String knownTag = 'en:plain-crepes';
  const String unknownTag = 'en:some_nonexistent_label';

  group('OpenFoodAPIClient getTaxonomyCategories (server)', () {
    test('get all categories', () async {
      final Map<String, TaxonomyCategory>? categories =
          await OpenFoodAPIClient.getTaxonomyCategories(
        TaxonomyCategoryQueryConfiguration.roots(),
      );
      expect(categories, isNotNull);
      expect(categories!.length, greaterThan(50)); // was 60 on 2022-09-23
      for (final TaxonomyCategory category in categories.values) {
        // we expect no parents for the roots categories
        expect(category.parents, isNull);
      }
    });

    test('get a category', () async {
      final Map<String, TaxonomyCategory>? categories =
          await OpenFoodAPIClient.getTaxonomyCategories(
        TaxonomyCategoryQueryConfiguration(tags: <String>[knownTag]),
      );
      expect(categories, isNotNull);
      expect(categories!.length, 1);
      final TaxonomyCategory category = categories[knownTag]!;
      expect(category.name![OpenFoodFactsLanguage.ENGLISH]!, isNotEmpty);
      expect(category.name![OpenFoodFactsLanguage.FRENCH]!, isNotEmpty);
    });

    test("get a category that doesn't exist", () async {
      final Map<String, TaxonomyCategory>? categories =
          await OpenFoodAPIClient.getTaxonomyCategories(
        TaxonomyCategoryQueryConfiguration(tags: <String>[unknownTag]),
      );
      expect(categories, isNull);
    });

    test("get a category that doesn't exist with one that does", () async {
      final Map<String, TaxonomyCategory>? categories =
          await OpenFoodAPIClient.getTaxonomyCategories(
        TaxonomyCategoryQueryConfiguration(
          tags: <String>[unknownTag, knownTag],
        ),
      );
      expect(categories, isNotNull);
      expect(categories!.length, 1);
      final TaxonomyCategory category = categories[knownTag]!;
      expect(category.name![OpenFoodFactsLanguage.ENGLISH]!, isNotEmpty);
      expect(category.name![OpenFoodFactsLanguage.FRENCH]!, isNotEmpty);
    });
  });
}
