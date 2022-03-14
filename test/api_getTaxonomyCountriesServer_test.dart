import 'package:openfoodfacts/model/TaxonomyCountry.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/CountryHelper.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration test about countries.
void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.PROD;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
  OpenFoodAPIConfiguration.globalLanguages = [
    OpenFoodFactsLanguage.ENGLISH,
    OpenFoodFactsLanguage.FRENCH,
  ];

  const String _knownTag = 'en:gambia';
  const String _expectedCountryCode2 = 'GM';
  const String _expectedCountryCode3 = 'GMB';
  const List<OpenFoodFactsLanguage> _expectedLanguages =
      <OpenFoodFactsLanguage>[OpenFoodFactsLanguage.ENGLISH];
  const String _expectedNameFrench = 'Gambie';
  const String _expectedNameEnglish = 'Gambia';
  const String _unknownTag = 'en:some_nonexistent_country';

  group('OpenFoodAPIClient getTaxonomyCountries SERVER', () {
    void _checkKnown(final TaxonomyCountry country) {
      expect(
          country.name![OpenFoodFactsLanguage.ENGLISH]!, _expectedNameEnglish);
      expect(country.name![OpenFoodFactsLanguage.FRENCH]!, _expectedNameFrench);
      expect(country.languages, _expectedLanguages);
      expect(country.countryCode2, _expectedCountryCode2);
      expect(country.countryCode3, _expectedCountryCode3);
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
          if (key == _knownTag) {
            _checkKnown(country);
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
        TaxonomyCountryQueryConfiguration(tags: <String>[_knownTag]),
      );
      expect(countries, isNotNull);
      expect(countries!.length, equals(1));
      final TaxonomyCountry country = countries[_knownTag]!;
      _checkKnown(country);
    });

    test("get a country that doesn't exist", () async {
      final Map<String, TaxonomyCountry>? countries =
          await OpenFoodAPIClient.getTaxonomyCountries(
        TaxonomyCountryQueryConfiguration(tags: <String>[_unknownTag]),
      );
      expect(countries, isNull);
    });

    test("get a country that doesn't exist with one that does", () async {
      final Map<String, TaxonomyCountry>? countries =
          await OpenFoodAPIClient.getTaxonomyCountries(
        TaxonomyCountryQueryConfiguration(
          tags: <String>[_unknownTag, _knownTag],
        ),
      );
      expect(countries, isNotNull);
      expect(countries!.length, equals(1));
      final TaxonomyCountry country = countries[_knownTag]!;
      _checkKnown(country);
    });
  });
}
