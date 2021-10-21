import 'package:openfoodfacts/model/TaxonomyLanguage.dart';
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
  final Map<String, dynamic> expectedResponse = <String, dynamic>{
    'en:afrikaans': {
      'name': {
        "af": "Afrikaans",
        'en': 'Afrikaans',
        'fr': 'Afrikaans',
      },
      'language_code_2': {'en': 'af'},
      'wikidata': {'en': 'Q14196'},
      'language_code_3': {'en': 'afr'}
    },
  };

  setUp(() {
    httpHelper = FakeHttpHelper();
    HttpHelper.instance = httpHelper;
  });

  group('OpenFoodAPIClient getTaxonomyLanguages', () {
    test('get a language', () async {
      final String tag = 'en:afrikaans';
      TaxonomyLanguageQueryConfiguration configuration =
          TaxonomyLanguageQueryConfiguration(
        fields: [
          TaxonomyLanguageField.NAME,
          TaxonomyLanguageField.WIKIDATA,
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>[tag],
      );
      httpHelper.setResponse(configuration.getUri(),
          response: expectedResponse);

      Map<String, TaxonomyLanguage>? languages =
          await OpenFoodAPIClient.getTaxonomyLanguages(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(languages, isNotNull);
      expect(languages!.length, equals(1));
      TaxonomyLanguage language = languages[tag]!;
      expect(
          language.name![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyLanguageField.NAME.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          language.name![OpenFoodFactsLanguage.FRENCH]!,
          equals(expectedResponse[tag][TaxonomyLanguageField.NAME.key]
              [OpenFoodFactsLanguage.FRENCH.code]));
      expect(
          language.wikidata![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyLanguageField.WIKIDATA.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
    });
    test("get a language that doesn't exist", () async {
      final String tag = 'en:some_nonexistent_language';
      Map<String, dynamic> expectedResponse = <String, dynamic>{
        tag: {},
      };
      TaxonomyLanguageQueryConfiguration configuration =
          TaxonomyLanguageQueryConfiguration(
        fields: [
          TaxonomyLanguageField.NAME,
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>[tag],
      );
      httpHelper.setResponse(configuration.getUri(),
          response: expectedResponse);

      Map<String, TaxonomyLanguage>? categories =
          await OpenFoodAPIClient.getTaxonomyLanguages(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(categories, isNull);
    });
    test("get a language that doesn't exist with one that does", () async {
      final String tag = 'en:afrikaans';
      TaxonomyLanguageQueryConfiguration configuration =
          TaxonomyLanguageQueryConfiguration(
        fields: [
          TaxonomyLanguageField.NAME,
          TaxonomyLanguageField.WIKIDATA,
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>['en:some_nonexistent_language', tag],
      );
      httpHelper.setResponse(configuration.getUri(),
          response: expectedResponse);

      Map<String, TaxonomyLanguage>? languages =
          await OpenFoodAPIClient.getTaxonomyLanguages(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(languages, isNotNull);

      expect(languages!.length, equals(1));
      TaxonomyLanguage language = languages[tag]!;
      expect(
          language.name![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyLanguageField.NAME.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          language.name![OpenFoodFactsLanguage.FRENCH]!,
          equals(expectedResponse[tag][TaxonomyLanguageField.NAME.key]
              [OpenFoodFactsLanguage.FRENCH.code]));
      expect(
          language.wikidata![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyLanguageField.WIKIDATA.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
    });
  });
}
