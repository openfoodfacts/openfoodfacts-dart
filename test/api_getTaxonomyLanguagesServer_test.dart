import 'package:openfoodfacts/model/TaxonomyLanguage.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/CountryHelper.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration test about languages.
void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.PROD;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
  OpenFoodAPIConfiguration.globalLanguages = [
    OpenFoodFactsLanguage.ENGLISH,
    OpenFoodFactsLanguage.FRENCH,
  ];

  const String _knownTag = 'en:afrikaans';
  const String _unknownTag = 'en:some_nonexistent_language';

  group('OpenFoodAPIClient getTaxonomyLanguages (server)', () {
    test("get all languages", () async {
      final Map<String, TaxonomyLanguage>? languages =
          await OpenFoodAPIClient.getTaxonomyLanguages(
        TaxonomyLanguageQueryConfiguration.all(),
      );
      expect(languages, isNotNull);
      expect(languages!.length, greaterThan(150)); // was 186 on 2022-02-25
      expect(languages[_knownTag], isNotNull);
    });

    test('get a language', () async {
      final Map<String, TaxonomyLanguage>? languages =
          await OpenFoodAPIClient.getTaxonomyLanguages(
        TaxonomyLanguageQueryConfiguration(tags: <String>[_knownTag]),
      );
      expect(languages, isNotNull);
      expect(languages!.length, equals(1));
      final TaxonomyLanguage language = languages[_knownTag]!;
      expect(language.name![OpenFoodFactsLanguage.ENGLISH]!, isNotEmpty);
      expect(language.name![OpenFoodFactsLanguage.FRENCH]!, isNotEmpty);
      expect(language.wikidata![OpenFoodFactsLanguage.ENGLISH]!, isNotEmpty);
    });

    test("get a language that doesn't exist", () async {
      final Map<String, TaxonomyLanguage>? categories =
          await OpenFoodAPIClient.getTaxonomyLanguages(
        TaxonomyLanguageQueryConfiguration(tags: <String>[_unknownTag]),
      );
      expect(categories, isNull);
    });

    test("get a language that doesn't exist with one that does", () async {
      final Map<String, TaxonomyLanguage>? languages =
          await OpenFoodAPIClient.getTaxonomyLanguages(
        TaxonomyLanguageQueryConfiguration(
          tags: <String>[_unknownTag, _knownTag],
        ),
      );
      expect(languages, isNotNull);
      expect(languages!.length, equals(1));
      final TaxonomyLanguage language = languages[_knownTag]!;
      expect(language.name![OpenFoodFactsLanguage.ENGLISH]!, isNotEmpty);
      expect(language.name![OpenFoodFactsLanguage.FRENCH]!, isNotEmpty);
      expect(language.wikidata![OpenFoodFactsLanguage.ENGLISH]!, isNotEmpty);
    });
  });
}
