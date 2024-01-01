import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration test about packaging recycling.
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
  OpenFoodAPIConfiguration.globalLanguages = [
    OpenFoodFactsLanguage.ENGLISH,
    OpenFoodFactsLanguage.FRENCH,
  ];

  const String knownTag = 'en:return-to-store';
  const String expectedNameFrench = 'Consigné';
  const String expectedNameEnglish = 'Return to store';
  const Set<String> expectedChildren = <String>{
    'en:return-pet-bottle-to-store',
    'en:deposit-refunds',
  };
  const Set<String> expectedParents = <String>{
    'en:recycle',
  };
  const Set<String> knownRootTags = {
    'en:discard',
    'en:recycle',
    'en:reuse',
  };
  const String unknownTag = 'en:some_nonexistent_thing';

  group('OpenFoodAPIClient getTaxonomyPackagingRecycling SERVER', () {
    void checkKnown(final TaxonomyPackagingRecycling value) {
      expect(value.name![OpenFoodFactsLanguage.ENGLISH]!, expectedNameEnglish);
      expect(value.name![OpenFoodFactsLanguage.FRENCH]!, expectedNameFrench);
      expect(value.parents, unorderedEquals(expectedParents));
      expect(value.children, unorderedEquals(expectedChildren));
    }

    test('get a packaging recycling', () async {
      final Map<String, TaxonomyPackagingRecycling>? values =
          await OpenFoodAPIClient.getTaxonomyPackagingRecycling(
        TaxonomyPackagingRecyclingQueryConfiguration(tags: <String>[knownTag]),
      );
      expect(values, isNotNull);
      expect(values!.length, equals(1));
      checkKnown(values[knownTag]!);
    });

    test("get a packaging recycling that doesn't exist", () async {
      final Map<String, TaxonomyPackagingRecycling>? values =
          await OpenFoodAPIClient.getTaxonomyPackagingRecycling(
        TaxonomyPackagingRecyclingQueryConfiguration(
            tags: <String>[unknownTag]),
      );
      expect(values, isNull);
    });

    test("get a packaging recycling that doesn't exist with one that does",
        () async {
      final Map<String, TaxonomyPackagingRecycling>? values =
          await OpenFoodAPIClient.getTaxonomyPackagingRecycling(
        TaxonomyPackagingRecyclingQueryConfiguration(
          tags: <String>[unknownTag, knownTag],
        ),
      );
      expect(values, isNotNull);
      expect(values!.length, equals(1));
      checkKnown(values[knownTag]!);
    });

    test('get all root packaging recycling', () async {
      final Map<String, TaxonomyPackagingRecycling>? values =
          await OpenFoodAPIClient.getTaxonomyPackagingRecycling(
        TaxonomyPackagingRecyclingQueryConfiguration.roots(),
      );
      expect(values, isNotNull);
      expect(values!.keys, unorderedEquals(knownRootTags));
    });
  });
}
