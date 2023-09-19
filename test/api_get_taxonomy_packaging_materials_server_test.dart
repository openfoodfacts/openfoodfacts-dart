import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration test about packaging materials.
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
  OpenFoodAPIConfiguration.globalLanguages = [
    OpenFoodFactsLanguage.ENGLISH,
    OpenFoodFactsLanguage.FRENCH,
  ];

  const String knownTag = 'en:steel';
  const String expectedNameFrench = 'Acier';
  const String expectedNameEnglish = 'Steel';
  const Set<String> expectedChildren = <String>{
    'en:tin-plated-steel',
  };
  const Set<String> expectedParents = <String>{
    'en:metal',
  };
  const String knownRootTag = 'en:metal';
  const String unknownTag = 'en:some_nonexistent_thing';

  group('OpenFoodAPIClient getTaxonomyPackagingMaterials SERVER', () {
    void checkKnown(final TaxonomyPackagingMaterial value) {
      expect(value.name![OpenFoodFactsLanguage.ENGLISH]!, expectedNameEnglish);
      expect(value.name![OpenFoodFactsLanguage.FRENCH]!, expectedNameFrench);
      expect(value.synonyms![OpenFoodFactsLanguage.ENGLISH]!,
          contains(expectedNameEnglish));
      expect(value.synonyms![OpenFoodFactsLanguage.FRENCH]!,
          contains(expectedNameFrench));
      expect(value.parents, unorderedEquals(expectedParents));
      expect(value.children, unorderedEquals(expectedChildren));
    }

    test('get a packaging material', () async {
      final Map<String, TaxonomyPackagingMaterial>? values =
          await OpenFoodAPIClient.getTaxonomyPackagingMaterials(
        TaxonomyPackagingMaterialQueryConfiguration(tags: <String>[knownTag]),
      );
      expect(values, isNotNull);
      expect(values!.length, equals(1));
      checkKnown(values[knownTag]!);
    });

    test("get a packaging material that doesn't exist", () async {
      final Map<String, TaxonomyPackagingMaterial>? values =
          await OpenFoodAPIClient.getTaxonomyPackagingMaterials(
        TaxonomyPackagingMaterialQueryConfiguration(tags: <String>[unknownTag]),
      );
      expect(values, isNull);
    });

    test("get a packaging material that doesn't exist with one that does",
        () async {
      final Map<String, TaxonomyPackagingMaterial>? values =
          await OpenFoodAPIClient.getTaxonomyPackagingMaterials(
        TaxonomyPackagingMaterialQueryConfiguration(
          tags: <String>[unknownTag, knownTag],
        ),
      );
      expect(values, isNotNull);
      expect(values!.length, equals(1));
      checkKnown(values[knownTag]!);
    });

    test('get all root packaging materials', () async {
      final Map<String, TaxonomyPackagingMaterial>? values =
          await OpenFoodAPIClient.getTaxonomyPackagingMaterials(
        TaxonomyPackagingMaterialQueryConfiguration.roots(),
      );
      expect(values, isNotNull);
      expect(values!.length, greaterThan(20)); // was 27 on 2022-11-07
      expect(values[unknownTag], isNull);
      expect(values[knownRootTag], isNotNull);
    });
  });
}
