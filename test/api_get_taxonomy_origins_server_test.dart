import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration test about origins.
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
  OpenFoodAPIConfiguration.globalLanguages = [
    OpenFoodFactsLanguage.ENGLISH,
    OpenFoodFactsLanguage.FRENCH,
  ];

  const String knownTag = 'en:great-britain';
  const String expectedNameFrench = 'Grande Bretagne';
  const String expectedNameEnglish = 'Great Britain';
  const Set<String> expectedChildren = <String>{
    'en:england',
    'en:scotland',
    'en:wales',
  };
  const Set<String> expectedParents = <String>{
    'en:united-kingdom',
  };
  const String knownRootTag = 'en:france';
  const String unknownTag = 'en:some_nonexistent_thing';

  group('OpenFoodAPIClient getTaxonomyOrigins SERVER', () {
    void checkKnown(final TaxonomyOrigin value) {
      expect(value.name![OpenFoodFactsLanguage.ENGLISH]!, expectedNameEnglish);
      expect(value.name![OpenFoodFactsLanguage.FRENCH]!, expectedNameFrench);
      expect(value.synonyms![OpenFoodFactsLanguage.ENGLISH]!,
          contains(expectedNameEnglish));
      expect(value.synonyms![OpenFoodFactsLanguage.FRENCH]!,
          contains(expectedNameFrench));
      expect(value.parents, unorderedEquals(expectedParents));
      expect(value.children, unorderedEquals(expectedChildren));
    }

    test('get an origin', () async {
      final Map<String, TaxonomyOrigin>? values =
          await OpenFoodAPIClient.getTaxonomyOrigins(
        TaxonomyOriginQueryConfiguration(tags: <String>[knownTag]),
      );
      expect(values, isNotNull);
      expect(values!.length, equals(1));
      checkKnown(values[knownTag]!);
    });

    test("get an origin that doesn't exist", () async {
      final Map<String, TaxonomyOrigin>? values =
          await OpenFoodAPIClient.getTaxonomyOrigins(
        TaxonomyOriginQueryConfiguration(tags: <String>[unknownTag]),
      );
      expect(values, isNull);
    });

    test("get an origin that doesn't exist with one that does", () async {
      final Map<String, TaxonomyOrigin>? values =
          await OpenFoodAPIClient.getTaxonomyOrigins(
        TaxonomyOriginQueryConfiguration(
          tags: <String>[unknownTag, knownTag],
        ),
      );
      expect(values, isNotNull);
      expect(values!.length, equals(1));
      checkKnown(values[knownTag]!);
    });

    test('get all root origins', () async {
      final Map<String, TaxonomyOrigin>? values =
          await OpenFoodAPIClient.getTaxonomyOrigins(
        TaxonomyOriginQueryConfiguration.roots(),
      );
      expect(values, isNotNull);
      expect(values!.length, greaterThan(250)); // was 288 on 2022-11-06
      expect(values[unknownTag], isNull);
      expect(values[knownRootTag], isNotNull);
    });
  });
}
