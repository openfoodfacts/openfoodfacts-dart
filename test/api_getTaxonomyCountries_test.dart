import 'package:openfoodfacts/model/TaxonomyCountry.dart';
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

  const String knownTag = 'en:gambia';
  const String expectedCountryCode2 = 'GM';
  const String expectedCountryCode3 = 'GMB';
  const List<OpenFoodFactsLanguage> expectedLanguages =
      <OpenFoodFactsLanguage>[OpenFoodFactsLanguage.ENGLISH];
  const String expectedNameFrench = 'Gambie';
  const String expectedNameEnglish = 'Gambia';
  const String unknownTag = 'en:some_nonexistent_country';

  final Map<String, dynamic> expectedResponse = <String, dynamic>{
    knownTag: {
      "name": {
        "en": expectedNameEnglish,
        "fr": expectedNameFrench,
      },
      "synonyms": {
        "en": ["Gambia", "Republic of the Gambia", "the Gambia", "GM", "GMB"],
        "fr": ["Gambie"]
      },
      "country_code_3": {"en": expectedCountryCode3},
      "language_codes": {"en": expectedLanguages[0].code},
      "country_code_2": {"en": expectedCountryCode2}
    },
  };

  setUp(() {
    httpHelper = FakeHttpHelper();
    HttpHelper.instance = httpHelper;
  });

  group('OpenFoodAPIClient getTaxonomyCountries', () {
    void _checkGambia(final TaxonomyCountry country, final String tag) {
      expect(
          country.name![OpenFoodFactsLanguage.ENGLISH], expectedNameEnglish);
      expect(country.name![OpenFoodFactsLanguage.FRENCH], expectedNameFrench);
      expect(country.languages, expectedLanguages);
      expect(country.countryCode2, expectedCountryCode2);
      expect(country.countryCode3, expectedCountryCode3);
    }

    test('get a country', () async {
      final String tag = knownTag;
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
      final TaxonomyCountry country = countries[tag]!;
      _checkGambia(country, tag);
    });
    test("get a country that doesn't exist", () async {
      final String tag = unknownTag;
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
      final String tag = knownTag;
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
        tags: <String>[unknownTag, tag],
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
      final TaxonomyCountry country = countries[tag]!;
      _checkGambia(country, tag);
    });
  });
}
