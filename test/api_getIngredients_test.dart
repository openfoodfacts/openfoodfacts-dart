import 'package:openfoodfacts/model/Ingredient.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

import 'fake_http_helper.dart';
import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;
  OpenFoodAPIConfiguration.globalCC = 'fr';
  late FakeHttpHelper httpHelper;

  setUp(() {
    httpHelper = FakeHttpHelper(verbose: true);
    HttpHelper.instance = httpHelper;
  });

  group('OpenFoodAPIClient getIngredients', () {
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
      IngredientQueryConfiguration configuration = IngredientQueryConfiguration(
        fields: [
          IngredientField.NAME,
          IngredientField.CHILDREN,
          IngredientField.PARENTS,
          IngredientField.WIKIDATA,
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>[tag],
      );
      httpHelper.setResponse(configuration.getUri(), response: expectedResponse);

      Map<String, Ingredient>? ingredients = await OpenFoodAPIClient.getIngredients(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(ingredients, isNotNull);
      expect(ingredients!.length, equals(1));
      Ingredient edamame = ingredients[tag]!;
      expect(
          edamame.wikidata![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][IngredientField.WIKIDATA.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(edamame.children!.length,
          equals(expectedResponse[tag][IngredientField.CHILDREN.key].length));
      expect(edamame.children!.first,
          equals(expectedResponse[tag][IngredientField.CHILDREN.key].first));
      expect(edamame.parents!.length,
          equals(expectedResponse[tag][IngredientField.PARENTS.key].length));
      expect(
          edamame.parents!.first, equals(expectedResponse[tag][IngredientField.PARENTS.key].first));
      expect(
          edamame.name![OpenFoodFactsLanguage.ENGLISH]!,
          equals(
              expectedResponse[tag][IngredientField.NAME.key][OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          edamame.name![OpenFoodFactsLanguage.FRENCH]!,
          equals(
              expectedResponse[tag][IngredientField.NAME.key][OpenFoodFactsLanguage.FRENCH.code]));
    });
    test('get a ingredient and children', () async {
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
      IngredientQueryConfiguration configuration = IngredientQueryConfiguration(
        fields: [
          IngredientField.NAME,
          IngredientField.CHILDREN,
          IngredientField.PARENTS,
          IngredientField.WIKIDATA
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        includeChildren: true,
        tags: <String>[tag],
      );
      httpHelper.setResponse(configuration.getUri(), response: expectedResponse);

      Map<String, Ingredient>? categories = await OpenFoodAPIClient.getIngredients(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(categories, isNotNull);
      expect(categories!.length, equals(2));
      Ingredient crepes = categories[tag]!;
      expect(
          crepes.wikidata![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][IngredientField.WIKIDATA.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(crepes.children!.length,
          equals(expectedResponse[tag][IngredientField.CHILDREN.key].length));
      expect(crepes.children!.first,
          equals(expectedResponse[tag][IngredientField.CHILDREN.key].first));
      expect(crepes.parents!.length,
          equals(expectedResponse[tag][IngredientField.PARENTS.key].length));
      expect(
          crepes.parents!.first, equals(expectedResponse[tag][IngredientField.PARENTS.key].first));
      expect(
          crepes.name![OpenFoodFactsLanguage.ENGLISH]!,
          equals(
              expectedResponse[tag][IngredientField.NAME.key][OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          crepes.name![OpenFoodFactsLanguage.FRENCH]!,
          equals(
              expectedResponse[tag][IngredientField.NAME.key][OpenFoodFactsLanguage.FRENCH.code]));
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
      IngredientQueryConfiguration configuration = IngredientQueryConfiguration(
        fields: [
          IngredientField.NAME,
          IngredientField.CHILDREN,
          IngredientField.PARENTS,
          IngredientField.WIKIDATA,
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>[tag],
      );
      httpHelper.setResponse(configuration.getUri(), response: expectedResponse);

      Map<String, Ingredient>? ingredients = await OpenFoodAPIClient.getIngredients(
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
      IngredientQueryConfiguration configuration = IngredientQueryConfiguration(
        fields: [
          IngredientField.NAME,
          IngredientField.CHILDREN,
          IngredientField.PARENTS,
          IngredientField.WIKIDATA,
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>['en:some_nonexistent_ingredient', tag],
      );
      httpHelper.setResponse(configuration.getUri(), response: expectedResponse);

      Map<String, Ingredient>? ingredients = await OpenFoodAPIClient.getIngredients(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(ingredients, isNotNull);
      expect(ingredients!.length, equals(1));
      Ingredient edamame = ingredients[tag]!;
      expect(
          edamame.wikidata![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][IngredientField.WIKIDATA.key]
          [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(edamame.children!.length,
          equals(expectedResponse[tag][IngredientField.CHILDREN.key].length));
      expect(edamame.children!.first,
          equals(expectedResponse[tag][IngredientField.CHILDREN.key].first));
      expect(edamame.parents!.length,
          equals(expectedResponse[tag][IngredientField.PARENTS.key].length));
      expect(
          edamame.parents!.first, equals(expectedResponse[tag][IngredientField.PARENTS.key].first));
      expect(
          edamame.name![OpenFoodFactsLanguage.ENGLISH]!,
          equals(
              expectedResponse[tag][IngredientField.NAME.key][OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          edamame.name![OpenFoodFactsLanguage.FRENCH]!,
          equals(
              expectedResponse[tag][IngredientField.NAME.key][OpenFoodFactsLanguage.FRENCH.code]));
    });
  });
}
