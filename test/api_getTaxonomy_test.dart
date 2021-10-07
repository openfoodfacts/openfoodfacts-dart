import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;
  OpenFoodAPIConfiguration.globalCC = 'fr';

  group('OpenFoodAPIClient getTaxonomy', () {
    test('get a taxonomy', () async {
      Map<CategoryField, dynamic> fields = {
        CategoryField.NAME: {
          'fr': 'Cr\u00eape nature',
          'en': 'Plain crepes',
        },
        CategoryField.CHILDREN: [
          'en:refrigerated-plain-crepes',
        ],
        CategoryField.PARENTS: [
          'en:crepes',
        ],
        CategoryField.AGRIBALYSE_FOOD_CODE: {
          'en': '23800',
        },
      };
      CategoryQueryConfiguration configuration = CategoryQueryConfiguration(
        fields: fields.keys.toList(),
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>['en:plain-crepes'],
      );

      Map<String, Category>? categories =
          await OpenFoodAPIClient.getTaxonomy<Category, CategoryField>(
        configuration,
        user: TestConstants.TEST_USER,
      );

      expect(categories, isNotNull);
      expect(categories!.length, equals(1));
      Category crepes = categories['en:plain-crepes']!;
      for (final CategoryField field in fields.keys) {
        expect(crepes.toJson()[field.key], equals(fields[field]));
      }
    });
    test('get a taxonomy and children', () async {
      Map<CategoryField, dynamic> fields = {
        CategoryField.NAME: {
          'fr': 'Cr\u00eape nature',
          'en': 'Plain crepes',
        },
        CategoryField.CHILDREN: [
          'en:refrigerated-plain-crepes',
        ],
        CategoryField.PARENTS: [
          'en:crepes',
        ],
        CategoryField.AGRIBALYSE_FOOD_CODE: {
          'en': '23800',
        },
      };
      CategoryQueryConfiguration configuration = CategoryQueryConfiguration(
        fields: fields.keys.toList(),
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>['en:crepes', 'en:plain-crepes'],
        includeChildren: true,
      );

      Map<String, Category>? categories =
          await OpenFoodAPIClient.getTaxonomy<Category, CategoryField>(
        configuration,
        user: TestConstants.TEST_USER,
      );

      expect(categories, isNotNull);
      expect(categories!.length, equals(7));
      Category crepes = categories['en:plain-crepes']!;
      for (final CategoryField field in fields.keys) {
        expect(crepes.toJson()[field.key], equals(fields[field]));
      }
      expect(
        categories.keys,
        equals([
          'en:crepes',
          'en:crepes-filled-with-sugar',
          'en:filled-crepes',
          'en:plain-crepes',
          'en:refrigerated-plain-crepes',
          'en:sugared-crepes',
          'fr:crepes-de-froment',
        ]),
      );
    });
  });
}
