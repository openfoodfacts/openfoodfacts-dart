import 'package:openfoodfacts/model/TaxonomyCountry.dart';
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
    "en:gambia": {
      "name": {
        "en": "Gambia",
        "fr": "Gambie",
      },
      "country_code_3": {"en": "GMB"},
      "languages": {"en": "en"},
      "country_code_2": {"en": "GM"}
    },
  };

  setUp(() {
    httpHelper = FakeHttpHelper();
    HttpHelper.instance = httpHelper;
  });

  group('OpenFoodAPIClient getTaxonomyCountries', () {
    test('get a country', () async {
      final String tag = 'en:gambia';
      TaxonomyCountryQueryConfiguration configuration =
          TaxonomyCountryQueryConfiguration(
        fields: [
          TaxonomyCountryField.NAME,
          TaxonomyCountryField.LANGUAGES,
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>[tag],
      );
      httpHelper.setResponse(configuration.getUri(),
          response: expectedResponse);

      Map<String, TaxonomyCountry>? countries =
          await OpenFoodAPIClient.getTaxonomyCountries(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(countries, isNotNull);
      expect(countries!.length, equals(1));
      TaxonomyCountry country = countries[tag]!;
      expect(
          country.name![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyCountryField.NAME.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          country.name![OpenFoodFactsLanguage.FRENCH]!,
          equals(expectedResponse[tag][TaxonomyCountryField.NAME.key]
              [OpenFoodFactsLanguage.FRENCH.code]));
      expect(
          country.languages![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyCountryField.LANGUAGES.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
    });
    test("get a country that doesn't exist", () async {
      final String tag = 'en:some_nonexistent_country';
      Map<String, dynamic> expectedResponse = <String, dynamic>{
        tag: {},
      };
      TaxonomyCountryQueryConfiguration configuration =
          TaxonomyCountryQueryConfiguration(
        fields: [
          TaxonomyCountryField.NAME,
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>[tag],
      );
      httpHelper.setResponse(configuration.getUri(),
          response: expectedResponse);

      Map<String, TaxonomyCountry>? categories =
          await OpenFoodAPIClient.getTaxonomyCountries(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(categories, isNull);
    });
    test("get a country that doesn't exist with one that does", () async {
      final String tag = 'en:gambia';
      TaxonomyCountryQueryConfiguration configuration =
          TaxonomyCountryQueryConfiguration(
        fields: [
          TaxonomyCountryField.NAME,
          TaxonomyCountryField.LANGUAGES,
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>['en:some_nonexistent_country', tag],
      );
      httpHelper.setResponse(configuration.getUri(),
          response: expectedResponse);

      Map<String, TaxonomyCountry>? countries =
          await OpenFoodAPIClient.getTaxonomyCountries(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(countries, isNotNull);

      expect(countries!.length, equals(1));
      TaxonomyCountry country = countries[tag]!;
      expect(
          country.name![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyCountryField.NAME.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          country.name![OpenFoodFactsLanguage.FRENCH]!,
          equals(expectedResponse[tag][TaxonomyCountryField.NAME.key]
              [OpenFoodFactsLanguage.FRENCH.code]));
      expect(
          country.languages![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyCountryField.LANGUAGES.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
    });
  });
}
