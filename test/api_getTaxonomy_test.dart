import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/CountryHelper.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

import 'fake_http_helper.dart';
import 'test_constants.dart';

void main() {
  group('OpenFoodAPIClient getTaxonomy using Test Server', () {
    OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;
    OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;

    // To verify that the basic taxonomy API hasn't changed on the server.
    test('actually fetch a taxonomy from the test server', () async {
      final String tag = 'en:plain-crepes';
      TaxonomyCategoryQueryConfiguration configuration =
          TaxonomyCategoryQueryConfiguration(
        fields: [
          TaxonomyCategoryField.NAME,
          TaxonomyCategoryField.CHILDREN,
          TaxonomyCategoryField.PARENTS,
          TaxonomyCategoryField.AGRIBALYSE_FOOD_CODE
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>[tag],
      );
      Map<String, TaxonomyCategory>? categories = await OpenFoodAPIClient
          .getTaxonomy<TaxonomyCategory, TaxonomyCategoryField>(
        configuration,
        user: TestConstants.TEST_USER,
      );
      TaxonomyCategory expectedResponse =
          TaxonomyCategory.fromJson(<String, dynamic>{
        'agribalyse_food_code': {'en': '23800'},
        'children': ['en:refrigerated-plain-crepes'],
        'name': {'en': 'Plain crepes', 'fr': 'Crêpe nature'},
        'parents': ['en:crepes'],
      });
      expect(categories, isNotNull);
      expect(categories![tag], isNotNull);
      expect(categories[tag]!.agribalyseFoodCode,
          equals(expectedResponse.agribalyseFoodCode));
      expect(categories[tag]!.children, equals(expectedResponse.children));
      expect(categories[tag]!.name, equals(expectedResponse.name));
      expect(categories[tag]!.parents, equals(expectedResponse.parents));
    });
  });
  group('OpenFoodAPIClient getTaxonomy', () {
    // These tests are all unit tests that don't actually fetch from anything
    // from the test server.
    OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;
    OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
    late FakeHttpHelper httpHelper;

    setUp(() {
      httpHelper = FakeHttpHelper();
      HttpHelper.instance = httpHelper;
    });

    test('get a category', () async {
      final String tag = 'en:plain-crepes';
      Map<String, dynamic> expectedResponse = <String, dynamic>{
        tag: {
          'agribalyse_food_code': {'en': '23800'},
          'children': ['en:refrigerated-plain-crepes'],
          'name': {'en': 'Plain crepes', 'fr': 'Crêpe nature'},
          'parents': ['en:crepes']
        }
      };
      TaxonomyCategoryQueryConfiguration configuration =
          TaxonomyCategoryQueryConfiguration(
        fields: [
          TaxonomyCategoryField.NAME,
          TaxonomyCategoryField.CHILDREN,
          TaxonomyCategoryField.PARENTS,
          TaxonomyCategoryField.AGRIBALYSE_FOOD_CODE
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>[tag],
      );
      httpHelper.setResponse(configuration.getUri(),
          response: expectedResponse);

      Map<String, TaxonomyCategory>? categories = await OpenFoodAPIClient
          .getTaxonomy<TaxonomyCategory, TaxonomyCategoryField>(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(categories, isNotNull);
      expect(categories!.length, equals(1));
      TaxonomyCategory crepes = categories[tag]!;
      expect(
          crepes.agribalyseFoodCode![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag]
                  [TaxonomyCategoryField.AGRIBALYSE_FOOD_CODE.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          crepes.children!.length,
          equals(expectedResponse[tag][TaxonomyCategoryField.CHILDREN.key]
              .length));
      expect(
          crepes.children!.first,
          equals(
              expectedResponse[tag][TaxonomyCategoryField.CHILDREN.key].first));
      expect(
          crepes.parents!.length,
          equals(
              expectedResponse[tag][TaxonomyCategoryField.PARENTS.key].length));
      expect(
          crepes.parents!.first,
          equals(
              expectedResponse[tag][TaxonomyCategoryField.PARENTS.key].first));
      expect(
          crepes.name![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyCategoryField.NAME.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          crepes.name![OpenFoodFactsLanguage.FRENCH]!,
          equals(expectedResponse[tag][TaxonomyCategoryField.NAME.key]
              [OpenFoodFactsLanguage.FRENCH.code]));
    });
    test('get a category and children', () async {
      final String tag = 'en:plain-crepes';
      Map<String, dynamic> expectedResponse = <String, dynamic>{
        'en:crepes': {
          'children': [
            'en:crepes-filled-with-sugar',
            'en:filled-crepes',
            'en:plain-crepes',
            'en:sugared-crepes',
            'fr:crepes-de-froment'
          ],
          'name': {'en': 'Crêpes', 'fr': 'Crêpes'},
          'parents': ['en:crepes-and-galettes']
        },
        'en:crepes-filled-with-sugar': {
          'agribalyse_food_code': {'en': '23815'},
          'name': {
            'en': 'Crepes filled with sugar',
            'fr': 'Crêpes fourrées au sucre'
          },
          'parents': ['en:crepes']
        },
        'en:filled-crepes': {
          'name': {'en': 'Filled crêpes', 'fr': 'Crêpes fourrées'},
          'parents': ['en:crepes']
        },
        'en:plain-crepes': {
          'agribalyse_food_code': {'en': '23800'},
          'children': ['en:refrigerated-plain-crepes'],
          'name': {'en': 'Plain crepes', 'fr': 'Crêpe nature'},
          'parents': ['en:crepes']
        },
        'en:refrigerated-plain-crepes': {
          'agribalyse_food_code': {'en': '23799'},
          'name': {
            'en': 'Refrigerated plain crepes',
            'fr': 'Crêpes nature rayon frais'
          },
          'parents': ['en:plain-crepes']
        },
        'en:sugared-crepes': {
          'name': {'en': 'Sugared crêpes', 'fr': 'Crêpes sucrées'},
          'parents': ['en:crepes']
        },
        'fr:crepes-de-froment': {
          'name': {'fr': 'Crêpes de froment'},
          'parents': ['en:crepes']
        }
      };
      TaxonomyCategoryQueryConfiguration configuration =
          TaxonomyCategoryQueryConfiguration(
        fields: [
          TaxonomyCategoryField.NAME,
          TaxonomyCategoryField.CHILDREN,
          TaxonomyCategoryField.PARENTS,
          TaxonomyCategoryField.AGRIBALYSE_FOOD_CODE
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>[tag],
      );
      httpHelper.setResponse(configuration.getUri(),
          response: expectedResponse);

      Map<String, TaxonomyCategory>? categories = await OpenFoodAPIClient
          .getTaxonomy<TaxonomyCategory, TaxonomyCategoryField>(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(categories, isNotNull);
      expect(categories!.length, equals(7));
      TaxonomyCategory crepes = categories[tag]!;
      expect(
          crepes.agribalyseFoodCode![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag]
                  [TaxonomyCategoryField.AGRIBALYSE_FOOD_CODE.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          crepes.children!.length,
          equals(expectedResponse[tag][TaxonomyCategoryField.CHILDREN.key]
              .length));
      expect(
          crepes.children!.first,
          equals(
              expectedResponse[tag][TaxonomyCategoryField.CHILDREN.key].first));
      expect(
          crepes.parents!.length,
          equals(
              expectedResponse[tag][TaxonomyCategoryField.PARENTS.key].length));
      expect(
          crepes.parents!.first,
          equals(
              expectedResponse[tag][TaxonomyCategoryField.PARENTS.key].first));
      expect(
          crepes.name![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyCategoryField.NAME.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          crepes.name![OpenFoodFactsLanguage.FRENCH]!,
          equals(expectedResponse[tag][TaxonomyCategoryField.NAME.key]
              [OpenFoodFactsLanguage.FRENCH.code]));
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
    test("get a category that doesn't exist", () async {
      final String tag = 'en:some_nonexistent_category';
      Map<String, dynamic> expectedResponse = <String, dynamic>{
        tag: {},
      };
      TaxonomyCategoryQueryConfiguration configuration =
          TaxonomyCategoryQueryConfiguration(
        fields: [
          TaxonomyCategoryField.NAME,
          TaxonomyCategoryField.CHILDREN,
          TaxonomyCategoryField.PARENTS,
          TaxonomyCategoryField.AGRIBALYSE_FOOD_CODE
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>[tag],
      );
      httpHelper.setResponse(configuration.getUri(),
          response: expectedResponse);

      Map<String, TaxonomyCategory>? categories = await OpenFoodAPIClient
          .getTaxonomy<TaxonomyCategory, TaxonomyCategoryField>(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(categories, isNull);
    });
    test("get a category that doesn't exist with one that does.", () async {
      final String tag = 'en:plain-crepes';
      Map<String, dynamic> expectedResponse = <String, dynamic>{
        tag: {
          'agribalyse_food_code': {'en': '23800'},
          'children': ['en:refrigerated-plain-crepes'],
          'name': {'en': 'Plain crepes', 'fr': 'Crêpe nature'},
          'parents': ['en:crepes']
        }
      };
      TaxonomyCategoryQueryConfiguration configuration =
          TaxonomyCategoryQueryConfiguration(
        fields: [
          TaxonomyCategoryField.NAME,
          TaxonomyCategoryField.CHILDREN,
          TaxonomyCategoryField.PARENTS,
          TaxonomyCategoryField.AGRIBALYSE_FOOD_CODE
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>['en:some_nonexistent_category', tag],
      );
      httpHelper.setResponse(configuration.getUri(),
          response: expectedResponse);

      Map<String, TaxonomyCategory>? categories = await OpenFoodAPIClient
          .getTaxonomy<TaxonomyCategory, TaxonomyCategoryField>(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(categories, isNotNull);
      expect(categories!.length, equals(1));
      expect(categories.keys, equals([tag]));
      TaxonomyCategory crepes = categories[tag]!;
      expect(
          crepes.agribalyseFoodCode![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag]
                  [TaxonomyCategoryField.AGRIBALYSE_FOOD_CODE.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          crepes.children!.length,
          equals(expectedResponse[tag][TaxonomyCategoryField.CHILDREN.key]
              .length));
      expect(
          crepes.children!.first,
          equals(
              expectedResponse[tag][TaxonomyCategoryField.CHILDREN.key].first));
      expect(
          crepes.parents!.length,
          equals(
              expectedResponse[tag][TaxonomyCategoryField.PARENTS.key].length));
      expect(
          crepes.parents!.first,
          equals(
              expectedResponse[tag][TaxonomyCategoryField.PARENTS.key].first));
      expect(
          crepes.name![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyCategoryField.NAME.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          crepes.name![OpenFoodFactsLanguage.FRENCH]!,
          equals(expectedResponse[tag][TaxonomyCategoryField.NAME.key]
              [OpenFoodFactsLanguage.FRENCH.code]));
    });
  });
}
