import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration test about languages.
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
  OpenFoodAPIConfiguration.globalLanguages = [
    OpenFoodFactsLanguage.ENGLISH,
    OpenFoodFactsLanguage.FRENCH,
  ];

  const String knownTag = 'en:afrikaans';
  const String unknownTag = 'en:some_nonexistent_language';

  group('OpenFoodAPIClient getTaxonomyLanguages (server)', () {
    test("get all languages", () async {
      final Map<String, TaxonomyLanguage>? languages =
          await OpenFoodAPIClient.getTaxonomyLanguages(
        TaxonomyLanguageQueryConfiguration.all(),
      );
      expect(languages, isNotNull);
      expect(languages!.length, greaterThan(150)); // was 186 on 2022-02-25
      expect(languages[knownTag], isNotNull);
    });

    test('get a language', () async {
      final Map<String, TaxonomyLanguage>? languages =
          await OpenFoodAPIClient.getTaxonomyLanguages(
        TaxonomyLanguageQueryConfiguration(tags: <String>[knownTag]),
      );
      expect(languages, isNotNull);
      expect(languages!.length, equals(1));
      final TaxonomyLanguage language = languages[knownTag]!;
      expect(language.name![OpenFoodFactsLanguage.ENGLISH]!, isNotEmpty);
      expect(language.name![OpenFoodFactsLanguage.FRENCH]!, isNotEmpty);
      expect(language.wikidata![OpenFoodFactsLanguage.ENGLISH]!, isNotEmpty);
    });

    test("get a language that doesn't exist", () async {
      final Map<String, TaxonomyLanguage>? categories =
          await OpenFoodAPIClient.getTaxonomyLanguages(
        TaxonomyLanguageQueryConfiguration(tags: <String>[unknownTag]),
      );
      expect(categories, isNull);
    });

    test("get a language that doesn't exist with one that does", () async {
      final Map<String, TaxonomyLanguage>? languages =
          await OpenFoodAPIClient.getTaxonomyLanguages(
        TaxonomyLanguageQueryConfiguration(
          tags: <String>[unknownTag, knownTag],
        ),
      );
      expect(languages, isNotNull);
      expect(languages!.length, equals(1));
      final TaxonomyLanguage language = languages[knownTag]!;
      expect(language.name![OpenFoodFactsLanguage.ENGLISH]!, isNotEmpty);
      expect(language.name![OpenFoodFactsLanguage.FRENCH]!, isNotEmpty);
      expect(language.wikidata![OpenFoodFactsLanguage.ENGLISH]!, isNotEmpty);
    });
  });
}
