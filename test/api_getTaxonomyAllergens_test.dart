import 'package:openfoodfacts/model/TaxonomyAllergen.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/CountryHelper.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

import 'fake_http_helper.dart';
import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;
  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
  late FakeHttpHelper httpHelper;

  setUp(() {
    httpHelper = FakeHttpHelper();
    HttpHelper.instance = httpHelper;
  });

  group('OpenFoodAPIClient getTaxonomyAllergens', () {
    test('get an allergen', () async {
      final String tag = 'en:gluten';
      Map<String, dynamic> expectedResponse = <String, dynamic>{
        tag: {
          'name': {'en': 'Gluten', 'fr': 'Gluten'},
          'synonyms': {
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
              "malt d'orge",
              'malt',
              'froment',
              'farine de blé',
              'farine de froment',
              'boulgour',
              'petit épeautre',
              'céréales contenant du gluten',
              'blé dur',
              'grand épeautre',
              "farine d'épeautre"
            ]
          }
        }
      };
      TaxonomyAllergenQueryConfiguration configuration =
          TaxonomyAllergenQueryConfiguration(
        fields: [
          TaxonomyAllergenField.NAME,
          TaxonomyAllergenField.SYNONYMS,
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>[tag],
      );
      httpHelper.setResponse(configuration.getUri(),
          response: expectedResponse);

      Map<String, TaxonomyAllergen>? allergens =
          await OpenFoodAPIClient.getTaxonomyAllergens(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(allergens, isNotNull);
      expect(allergens!.length, equals(1));
      TaxonomyAllergen gluten = allergens[tag]!;
      expect(
          gluten.name![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyAllergenField.NAME.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          gluten.name![OpenFoodFactsLanguage.FRENCH]!,
          equals(expectedResponse[tag][TaxonomyAllergenField.NAME.key]
              [OpenFoodFactsLanguage.FRENCH.code]));
      expect(
          gluten.synonyms![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyAllergenField.SYNONYMS.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          gluten.synonyms![OpenFoodFactsLanguage.FRENCH]!,
          equals(expectedResponse[tag][TaxonomyAllergenField.SYNONYMS.key]
              [OpenFoodFactsLanguage.FRENCH.code]));
    });
    test("get an allergen that doesn't exist", () async {
      final String tag = 'en:some_nonexistent_allergen';
      Map<String, dynamic> expectedResponse = <String, dynamic>{
        tag: {},
      };
      TaxonomyAllergenQueryConfiguration configuration =
          TaxonomyAllergenQueryConfiguration(
        fields: [
          TaxonomyAllergenField.NAME,
          TaxonomyAllergenField.SYNONYMS,
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>[tag],
      );
      httpHelper.setResponse(configuration.getUri(),
          response: expectedResponse);

      Map<String, TaxonomyAllergen>? categories =
          await OpenFoodAPIClient.getTaxonomyAllergens(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(categories, isNull);
    });
    test("get an allergen that doesn't exist with one that does", () async {
      final String tag = 'en:gluten';
      Map<String, dynamic> expectedResponse = <String, dynamic>{
        tag: {
          'name': {'en': 'Gluten', 'fr': 'Gluten'},
          'synonyms': {
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
              "malt d'orge",
              'malt',
              'froment',
              'farine de blé',
              'farine de froment',
              'boulgour',
              'petit épeautre',
              'céréales contenant du gluten',
              'blé dur',
              'grand épeautre',
              "farine d'épeautre"
            ]
          }
        }
      };
      TaxonomyAllergenQueryConfiguration configuration =
          TaxonomyAllergenQueryConfiguration(
        fields: [
          TaxonomyAllergenField.NAME,
          TaxonomyAllergenField.SYNONYMS,
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>['en:some_nonexistent_allergen', tag],
      );
      httpHelper.setResponse(configuration.getUri(),
          response: expectedResponse);

      Map<String, TaxonomyAllergen>? allergens =
          await OpenFoodAPIClient.getTaxonomyAllergens(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(allergens, isNotNull);
      expect(allergens!.length, equals(1));
      TaxonomyAllergen gluten = allergens[tag]!;
      expect(
          gluten.name![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyAllergenField.NAME.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          gluten.name![OpenFoodFactsLanguage.FRENCH]!,
          equals(expectedResponse[tag][TaxonomyAllergenField.NAME.key]
              [OpenFoodFactsLanguage.FRENCH.code]));
      expect(
          gluten.synonyms![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyAllergenField.SYNONYMS.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          gluten.synonyms![OpenFoodFactsLanguage.FRENCH]!,
          equals(expectedResponse[tag][TaxonomyAllergenField.SYNONYMS.key]
              [OpenFoodFactsLanguage.FRENCH.code]));
    });
  });
}
