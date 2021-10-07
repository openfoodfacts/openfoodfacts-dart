import 'package:openfoodfacts/model/Ingredient.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;
  OpenFoodAPIConfiguration.globalCC = 'fr';

  group('OpenFoodAPIClient getIngredients', () {
    test('get an ingredient', () async {
      Map<IngredientField, dynamic> fields = {
        IngredientField.WIKIDATA: {'en': 'Q1377879'},
        IngredientField.NAME: {
          'fr': 'Edamame',
          'en': 'Edamame',
        },
        IngredientField.PARENTS: [
          'en:soya-bean',
        ],
        IngredientField.CHILDREN: [
          'en:mukimame',
        ]
      };
      IngredientQueryConfiguration configuration = IngredientQueryConfiguration(
        fields: fields.keys.toList(),
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>['en:edamame'],
      );

      Map<String, Ingredient>? ingredients =
          await OpenFoodAPIClient.getIngredients(
        configuration,
        user: TestConstants.TEST_USER,
      );

      expect(ingredients, isNotNull);
      expect(ingredients!.length, equals(1));
      Ingredient edamame = ingredients['en:edamame']!;
      for (final IngredientField field in fields.keys) {
        expect(edamame.toJson()[field.key], equals(fields[field]));
      }
    });
    test('get an ingredient and children', () async {
      Map<IngredientField, dynamic> fields = {
        IngredientField.WIKIDATA: {'en': 'Q1377879'},
        IngredientField.NAME: {
          'fr': 'Edamame',
          'en': 'Edamame',
        },
        IngredientField.PARENTS: [
          'en:soya-bean',
        ],
        IngredientField.CHILDREN: [
          'en:mukimame',
        ]
      };
      IngredientQueryConfiguration configuration = IngredientQueryConfiguration(
        fields: fields.keys.toList(),
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>['en:edamame', 'en:mukimame'],
        includeChildren: true,
      );

      Map<String, Ingredient>? ingredients =
          await OpenFoodAPIClient.getIngredients(
        configuration,
        user: TestConstants.TEST_USER,
      );

      expect(ingredients, isNotNull);
      expect(ingredients!.length, equals(2));
      Ingredient edamame = ingredients['en:edamame']!;
      for (final IngredientField field in fields.keys) {
        expect(edamame.toJson()[field.key], equals(fields[field]));
      }
      expect(ingredients.keys, equals(['en:edamame', 'en:mukimame']));
    });
    test("get an ingredient that doesn't exist", () async {
      IngredientQueryConfiguration configuration = IngredientQueryConfiguration(
        fields: [IngredientField.NAME],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>['en:some_nonexistent_ingredient'],
      );

      Map<String, Ingredient>? ingredients =
          await OpenFoodAPIClient.getIngredients(
        configuration,
        user: TestConstants.TEST_USER,
      );

      expect(ingredients, isNull);
    });
    test("get an ingredient that doesn't exist with one that does.", () async {
      IngredientQueryConfiguration configuration = IngredientQueryConfiguration(
        fields: [IngredientField.NAME],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>['en:some_nonexistent_ingredient', 'en:edamame'],
      );

      Map<String, Ingredient>? ingredients =
          await OpenFoodAPIClient.getIngredients(
        configuration,
        user: TestConstants.TEST_USER,
      );

      expect(ingredients, isNotNull);
      expect(ingredients!.length, equals(1));
      expect(ingredients.keys, equals(['en:edamame']));
    });
  });
}
