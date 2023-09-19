import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration test about ingredients.
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
  OpenFoodAPIConfiguration.globalLanguages = [
    OpenFoodFactsLanguage.ENGLISH,
    OpenFoodFactsLanguage.FRENCH,
  ];

  const String knownTag = 'en:edamame';
  const String unknownTag = 'en:some_nonexistent_label';
  const List<TaxonomyIngredientField> fields = [
    TaxonomyIngredientField.NAME,
    TaxonomyIngredientField.CHILDREN,
    TaxonomyIngredientField.PARENTS,
    TaxonomyIngredientField.WIKIDATA,
  ];
  void checkKnown(final TaxonomyIngredient ingredient) {
    // for knownTag
    expect(ingredient.children, isNotEmpty); // probably 'en:mukimame'
    expect(ingredient.name![OpenFoodFactsLanguage.ENGLISH],
        isNotEmpty); // probably 'Edamame'
    expect(ingredient.name![OpenFoodFactsLanguage.FRENCH],
        isNotEmpty); // probably 'Edamame'
    expect(ingredient.wikidata![OpenFoodFactsLanguage.ENGLISH],
        isNotEmpty); // probably 'Q1377879'
    expect(ingredient.parents, isNotEmpty); // probably 'en:soya-bean'
  }

  group('OpenFoodAPIClient getTaxonomyIngredients (server)', () {
    test('get root ingredients', () async {
      final Map<String, TaxonomyIngredient>? ingredients =
          await OpenFoodAPIClient.getTaxonomyIngredients(
        TaxonomyIngredientQueryConfiguration.roots(fields: fields),
      );
      expect(ingredients, isNotNull);
      expect(ingredients!.length, greaterThan(700)); // was 795 on 2023-08-12
      for (final TaxonomyIngredient ingredient in ingredients.values) {
        // no parents for roots
        expect(ingredient.parents, isNull);
      }
    });

    test('get an ingredient', () async {
      final Map<String, TaxonomyIngredient>? ingredients =
          await OpenFoodAPIClient.getTaxonomyIngredients(
        TaxonomyIngredientQueryConfiguration(
          tags: <String>[knownTag],
          fields: fields,
        ),
      );
      expect(ingredients, isNotNull);
      expect(ingredients!.length, 1);
      final TaxonomyIngredient ingredient = ingredients[knownTag]!;
      checkKnown(ingredient);
    });

    test("get an ingredient that doesn't exist", () async {
      final Map<String, TaxonomyIngredient>? ingredients =
          await OpenFoodAPIClient.getTaxonomyIngredients(
        TaxonomyIngredientQueryConfiguration(
          tags: <String>[unknownTag],
          fields: fields,
        ),
      );
      expect(ingredients, isNull);
    });

    test("get an ingredient that doesn't exist with one that does", () async {
      final Map<String, TaxonomyIngredient>? ingredients =
          await OpenFoodAPIClient.getTaxonomyIngredients(
        TaxonomyIngredientQueryConfiguration(
          tags: <String>[unknownTag, knownTag],
          fields: fields,
        ),
      );
      expect(ingredients, isNotNull);
      expect(ingredients!.length, 1);
      final TaxonomyIngredient ingredient = ingredients[knownTag]!;
      checkKnown(ingredient);
    });
  });
}
