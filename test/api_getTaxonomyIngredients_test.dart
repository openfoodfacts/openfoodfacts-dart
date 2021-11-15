import 'package:openfoodfacts/model/TaxonomyIngredient.dart';
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

  group('OpenFoodAPIClient getTaxonomyIngredients', () {
    test('get an ingredient roots', () async {
      final String tag = 'en:edamame';
      Map<String, dynamic> expectedResponse = <String, dynamic>{
        tag: {
          'children': ['en:mukimame'],
          'name': {'en': 'Edamame', 'fr': 'Edamame'},
          'wikidata': {'en': 'Q1377879'}
        }
      };
      TaxonomyIngredientQueryConfiguration configuration =
          TaxonomyIngredientQueryConfiguration.roots(
        fields: [
          TaxonomyIngredientField.NAME,
          TaxonomyIngredientField.CHILDREN,
          TaxonomyIngredientField.PARENTS,
          TaxonomyIngredientField.WIKIDATA,
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
      );
      httpHelper.setResponse(configuration.getUri(),
          response: expectedResponse);

      Map<String, TaxonomyIngredient>? ingredients =
          await OpenFoodAPIClient.getTaxonomyIngredients(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(ingredients, isNotNull);
      expect(ingredients!.length, equals(1));
      TaxonomyIngredient edamame = ingredients[tag]!;
      expect(
          edamame.wikidata![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyIngredientField.WIKIDATA.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          edamame.children!.length,
          equals(expectedResponse[tag][TaxonomyIngredientField.CHILDREN.key]
              .length));
      expect(
          edamame.children!.first,
          equals(expectedResponse[tag][TaxonomyIngredientField.CHILDREN.key]
              .first));
      expect(edamame.parents, isNull);
      expect(
          edamame.name![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyIngredientField.NAME.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          edamame.name![OpenFoodFactsLanguage.FRENCH]!,
          equals(expectedResponse[tag][TaxonomyIngredientField.NAME.key]
              [OpenFoodFactsLanguage.FRENCH.code]));
    });
    test('get an ingredient', () async {
      final String tag = 'en:edamame';
      Map<String, dynamic> expectedResponse = <String, dynamic>{
        tag: {
          'children': ['en:mukimame'],
          'name': {'en': 'Edamame', 'fr': 'Edamame'},
          'parents': ['en:soya-bean'],
          'wikidata': {'en': 'Q1377879'}
        }
      };
      TaxonomyIngredientQueryConfiguration configuration =
          TaxonomyIngredientQueryConfiguration(
        fields: [
          TaxonomyIngredientField.NAME,
          TaxonomyIngredientField.CHILDREN,
          TaxonomyIngredientField.PARENTS,
          TaxonomyIngredientField.WIKIDATA,
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>[tag],
      );
      httpHelper.setResponse(configuration.getUri(),
          response: expectedResponse);

      Map<String, TaxonomyIngredient>? ingredients =
          await OpenFoodAPIClient.getTaxonomyIngredients(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(ingredients, isNotNull);
      expect(ingredients!.length, equals(1));
      TaxonomyIngredient edamame = ingredients[tag]!;
      expect(
          edamame.wikidata![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyIngredientField.WIKIDATA.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          edamame.children!.length,
          equals(expectedResponse[tag][TaxonomyIngredientField.CHILDREN.key]
              .length));
      expect(
          edamame.children!.first,
          equals(expectedResponse[tag][TaxonomyIngredientField.CHILDREN.key]
              .first));
      expect(
          edamame.parents!.length,
          equals(expectedResponse[tag][TaxonomyIngredientField.PARENTS.key]
              .length));
      expect(
          edamame.parents!.first,
          equals(expectedResponse[tag][TaxonomyIngredientField.PARENTS.key]
              .first));
      expect(
          edamame.name![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyIngredientField.NAME.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          edamame.name![OpenFoodFactsLanguage.FRENCH]!,
          equals(expectedResponse[tag][TaxonomyIngredientField.NAME.key]
              [OpenFoodFactsLanguage.FRENCH.code]));
    });
    test('get an ingredient and children', () async {
      final String tag = 'en:edamame';
      Map<String, dynamic> expectedResponse = <String, dynamic>{
        tag: {
          'children': ['en:mukimame'],
          'name': {'en': 'Edamame', 'fr': 'Edamame'},
          'parents': ['en:soya-bean'],
          'wikidata': {'en': 'Q1377879'}
        },
        'en:mukimame': {
          'name': {'en': 'Mukimame'},
          'parents': ['en:edamame']
        }
      };
      TaxonomyIngredientQueryConfiguration configuration =
          TaxonomyIngredientQueryConfiguration(
        fields: [
          TaxonomyIngredientField.NAME,
          TaxonomyIngredientField.CHILDREN,
          TaxonomyIngredientField.PARENTS,
          TaxonomyIngredientField.WIKIDATA
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        includeChildren: true,
        tags: <String>[tag],
      );
      httpHelper.setResponse(configuration.getUri(),
          response: expectedResponse);

      Map<String, TaxonomyIngredient>? categories =
          await OpenFoodAPIClient.getTaxonomyIngredients(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(categories, isNotNull);
      expect(categories!.length, equals(2));
      TaxonomyIngredient crepes = categories[tag]!;
      expect(
          crepes.wikidata![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyIngredientField.WIKIDATA.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          crepes.children!.length,
          equals(expectedResponse[tag][TaxonomyIngredientField.CHILDREN.key]
              .length));
      expect(
          crepes.children!.first,
          equals(expectedResponse[tag][TaxonomyIngredientField.CHILDREN.key]
              .first));
      expect(
          crepes.parents!.length,
          equals(expectedResponse[tag][TaxonomyIngredientField.PARENTS.key]
              .length));
      expect(
          crepes.parents!.first,
          equals(expectedResponse[tag][TaxonomyIngredientField.PARENTS.key]
              .first));
      expect(
          crepes.name![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyIngredientField.NAME.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          crepes.name![OpenFoodFactsLanguage.FRENCH]!,
          equals(expectedResponse[tag][TaxonomyIngredientField.NAME.key]
              [OpenFoodFactsLanguage.FRENCH.code]));
      expect(
        categories.keys,
        equals(['en:edamame', 'en:mukimame']),
      );
    });

    test("get an ingredient that doesn't exist", () async {
      final String tag = 'en:some_nonexistent_ingredient';
      Map<String, dynamic> expectedResponse = <String, dynamic>{
        tag: {},
      };
      TaxonomyIngredientQueryConfiguration configuration =
          TaxonomyIngredientQueryConfiguration(
        fields: [
          TaxonomyIngredientField.NAME,
          TaxonomyIngredientField.CHILDREN,
          TaxonomyIngredientField.PARENTS,
          TaxonomyIngredientField.WIKIDATA,
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>[tag],
      );
      httpHelper.setResponse(configuration.getUri(),
          response: expectedResponse);

      Map<String, TaxonomyIngredient>? ingredients =
          await OpenFoodAPIClient.getTaxonomyIngredients(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(ingredients, isNull);
    });
    test("get an ingredient that doesn't exist with one that does", () async {
      final String tag = 'en:edamame';
      Map<String, dynamic> expectedResponse = <String, dynamic>{
        tag: {
          'children': ['en:mukimame'],
          'name': {'en': 'Edamame', 'fr': 'Edamame'},
          'parents': ['en:soya-bean'],
          'wikidata': {'en': 'Q1377879'}
        }
      };
      TaxonomyIngredientQueryConfiguration configuration =
          TaxonomyIngredientQueryConfiguration(
        fields: [
          TaxonomyIngredientField.NAME,
          TaxonomyIngredientField.CHILDREN,
          TaxonomyIngredientField.PARENTS,
          TaxonomyIngredientField.WIKIDATA,
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>['en:some_nonexistent_ingredient', tag],
      );
      httpHelper.setResponse(configuration.getUri(),
          response: expectedResponse);

      Map<String, TaxonomyIngredient>? ingredients =
          await OpenFoodAPIClient.getTaxonomyIngredients(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(ingredients, isNotNull);
      expect(ingredients!.length, equals(1));
      TaxonomyIngredient edamame = ingredients[tag]!;
      expect(
          edamame.wikidata![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyIngredientField.WIKIDATA.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          edamame.children!.length,
          equals(expectedResponse[tag][TaxonomyIngredientField.CHILDREN.key]
              .length));
      expect(
          edamame.children!.first,
          equals(expectedResponse[tag][TaxonomyIngredientField.CHILDREN.key]
              .first));
      expect(
          edamame.parents!.length,
          equals(expectedResponse[tag][TaxonomyIngredientField.PARENTS.key]
              .length));
      expect(
          edamame.parents!.first,
          equals(expectedResponse[tag][TaxonomyIngredientField.PARENTS.key]
              .first));
      expect(
          edamame.name![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyIngredientField.NAME.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          edamame.name![OpenFoodFactsLanguage.FRENCH]!,
          equals(expectedResponse[tag][TaxonomyIngredientField.NAME.key]
              [OpenFoodFactsLanguage.FRENCH.code]));
    });
  });
}
