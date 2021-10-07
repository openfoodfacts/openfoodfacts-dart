import 'package:openfoodfacts/model/Allergen.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;
  OpenFoodAPIConfiguration.globalCC = 'fr';

  group('OpenFoodAPIClient getAllergens', () {
    test('get an allergen', () async {
      Map<AllergenField, dynamic> fields = {
        AllergenField.NAME: {
          'en': 'Gluten',
          'fr': 'Gluten',
        },
        AllergenField.SYNONYMS: {
          'en': [
            'gluten',
            'cereals containing gluten',
            'barley',
            'barley malt flour',
            'malted barley',
            'malted barley extract',
            'malted barley flour',
            'kamut',
            'rye',
            'rye flour',
            'spelt',
            'speltflour',
            'wheat',
            'wheat flour',
            'wheatflour',
            'wheat semolina',
            'oats',
            'oat fiber'
          ],
          'fr': [
            'gluten',
            'blé',
            'seigle',
            'orge',
            'épeautre',
            'kamut',
            'son de blé',
            'blé complet',
            'gluten de blé',
            'fibre de blé',
            'malt d\'orge',
            'malt',
            'froment',
            'farine de blé',
            'farine de froment',
            'boulgour',
            'petit épeautre',
            'céréales contenant du gluten',
            'blé dur',
            'grand épeautre',
            'farine d\'épeautre'
          ],
        },
      };
      AllergenQueryConfiguration configuration = AllergenQueryConfiguration(
        fields: fields.keys.toList(),
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>['en:gluten'],
      );

      Map<String, Allergen>? allergens = await OpenFoodAPIClient.getAllergens(
        configuration,
        user: TestConstants.TEST_USER,
      );

      expect(allergens, isNotNull);
      expect(allergens!.length, equals(1));
      Allergen gluten = allergens['en:gluten']!;
      for (final AllergenField field in fields.keys) {
        expect(gluten.toJson()[field.key], equals(fields[field]));
      }
    });
    test("get an allergen that doesn't exist", () async {
      AllergenQueryConfiguration configuration = AllergenQueryConfiguration(
        fields: [AllergenField.NAME],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>['en:some_nonexistent_allergen'],
      );

      Map<String, Allergen>? allergens = await OpenFoodAPIClient.getAllergens(
        configuration,
        user: TestConstants.TEST_USER,
      );

      expect(allergens, isNull);
    });
    test("get an allergen that doesn't exist with one that does.", () async {
      AllergenQueryConfiguration configuration = AllergenQueryConfiguration(
        fields: [AllergenField.NAME],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>['en:some_nonexistent_allergen', 'en:gluten'],
      );

      Map<String, Allergen>? allergens = await OpenFoodAPIClient.getAllergens(
        configuration,
        user: TestConstants.TEST_USER,
      );

      expect(allergens, isNotNull);
      expect(allergens!.length, equals(1));
      expect(allergens.keys, equals(['en:gluten']));
    });
  });
}
