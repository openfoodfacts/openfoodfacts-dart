import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration test about countries.
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
  OpenFoodAPIConfiguration.globalLanguages = [
    OpenFoodFactsLanguage.ENGLISH,
    OpenFoodFactsLanguage.FRENCH,
  ];

  const String knownTag = 'en:gambia';
  const String expectedCountryCode2 = 'GM';
  const String expectedCountryCode3 = 'GMB';
  const List<OpenFoodFactsLanguage> expectedLanguages = <OpenFoodFactsLanguage>[
    OpenFoodFactsLanguage.ENGLISH
  ];
  const String expectedNameFrench = 'Gambie';
  const String expectedNameEnglish = 'Gambia';
  const String unknownTag = 'en:some_nonexistent_country';

  group('OpenFoodAPIClient getTaxonomyCountries SERVER', () {
    void checkKnown(final TaxonomyCountry country) {
      expect(
          country.name![OpenFoodFactsLanguage.ENGLISH]!, expectedNameEnglish);
      expect(country.name![OpenFoodFactsLanguage.FRENCH]!, expectedNameFrench);
      expect(country.languages, expectedLanguages);
      expect(country.countryCode2, expectedCountryCode2);
      expect(country.countryCode3, expectedCountryCode3);
    }

    test(
      'get all countries',
      () async {
        final Map<String, TaxonomyCountry>? countries =
            await OpenFoodAPIClient.getTaxonomyCountries(
          TaxonomyCountryQueryConfiguration.all(),
        );
        expect(countries, isNotNull);
        expect(countries!.length, greaterThan(250)); // was 268 on 2022-03-13
        int countWikidata = 0;
        int countCode2 = 0;
        int countCode3 = 0;
        int countOfficialCode2 = 0;
        int countWithLanguages = 0;
        int countUnknownLanguages = 0;
        for (final String key in countries.keys) {
          final TaxonomyCountry country = countries[key]!;
          if (key == knownTag) {
            checkKnown(country);
          }
          expect(country.name, isNotNull);
          expect(country.synonyms, isNotNull);
          if (country.wikidata != null) {
            countWikidata++;
          }
          if (country.countryCode2 != null) {
            countCode2++;
          }
          if (country.countryCode3 != null) {
            countCode3++;
          }
          if (country.officialCountryCode2 != null) {
            countOfficialCode2++;
          }
          if (country.languages != null && country.languages!.isNotEmpty) {
            countWithLanguages++;
            for (final OpenFoodFactsLanguage language in country.languages!) {
              if (language == OpenFoodFactsLanguage.UNDEFINED) {
                countUnknownLanguages++;
              }
            }
          }
        }
        expect(countWikidata, greaterThan(30)); // was 40 on 2022-03-14
        expect(countCode2, greaterThan(240)); // was 253 on 2022-03-14
        expect(countCode3, greaterThan(240)); // was 250 on 2022-03-14
        expect(countOfficialCode2, lessThan(10)); // was 1 on 2022-03-14
        expect(countWithLanguages, greaterThan(200)); // was 235 on 2022-03-14
        expect(countUnknownLanguages, lessThan(10)); // was 4 on 2022-03-14
      },
    );

    test('get a country', () async {
      final Map<String, TaxonomyCountry>? countries =
          await OpenFoodAPIClient.getTaxonomyCountries(
        TaxonomyCountryQueryConfiguration(tags: <String>[knownTag]),
      );
      expect(countries, isNotNull);
      expect(countries!.length, equals(1));
      final TaxonomyCountry country = countries[knownTag]!;
      checkKnown(country);
    });

    test("get a country that doesn't exist", () async {
      final Map<String, TaxonomyCountry>? countries =
          await OpenFoodAPIClient.getTaxonomyCountries(
        TaxonomyCountryQueryConfiguration(tags: <String>[unknownTag]),
      );
      expect(countries, isNull);
    });

    test("get a country that doesn't exist with one that does", () async {
      final Map<String, TaxonomyCountry>? countries =
          await OpenFoodAPIClient.getTaxonomyCountries(
        TaxonomyCountryQueryConfiguration(
          tags: <String>[unknownTag, knownTag],
        ),
      );
      expect(countries, isNotNull);
      expect(countries!.length, equals(1));
      final TaxonomyCountry country = countries[knownTag]!;
      checkKnown(country);
    });
  });
}
