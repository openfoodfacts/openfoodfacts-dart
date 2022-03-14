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
  const String _unknownTag = 'en:some_nonexistent_country';

  group('OpenFoodAPIClient getTaxonomyCountries', () {
    test(
      'get all countries',
      () async {
        final Map<String, TaxonomyCountry>? countries =
            await OpenFoodAPIClient.getTaxonomyCountries(
          TaxonomyCountryQueryConfiguration.all(),
        );
        expect(countries, isNotNull);
        expect(countries!.length, greaterThan(250)); // was 268 on 2022-03-13
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
      expect(country.name![OpenFoodFactsLanguage.ENGLISH]!, isNotEmpty);
      expect(country.name![OpenFoodFactsLanguage.FRENCH]!, isNotEmpty);
    });

    test("get a country that doesn't exist", () async {
      final Map<String, TaxonomyCountry>? categories =
          await OpenFoodAPIClient.getTaxonomyCountries(
        TaxonomyCountryQueryConfiguration(tags: <String>[_unknownTag]),
      );
      expect(categories, isNull);
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
      expect(country.name![OpenFoodFactsLanguage.ENGLISH]!, isNotEmpty);
      expect(country.name![OpenFoodFactsLanguage.FRENCH]!, isNotEmpty);
    });
  });
}
