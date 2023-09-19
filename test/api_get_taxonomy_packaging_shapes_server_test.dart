import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration test about packaging shapes.
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
  OpenFoodAPIConfiguration.globalLanguages = [
    OpenFoodFactsLanguage.ENGLISH,
    OpenFoodFactsLanguage.FRENCH,
  ];

  const String knownTag = 'en:spoon';
  const String expectedNameFrench = 'Cuillère';
  const String expectedNameEnglish = 'Spoon';
  const Set<String> expectedChildren = <String>{
    'en:tablespoon',
    'en:teaspoon',
  };
  const Set<String> expectedParents = <String>{
    'en:cutlery',
  };
  const String knownRootTag = 'en:box';
  const String unknownTag = 'en:some_nonexistent_thing';

  group('OpenFoodAPIClient getTaxonomyPackagingShapes SERVER', () {
    void checkKnown(final TaxonomyPackagingShape value) {
      expect(value.name![OpenFoodFactsLanguage.ENGLISH]!, expectedNameEnglish);
      expect(value.name![OpenFoodFactsLanguage.FRENCH]!, expectedNameFrench);
      expect(value.synonyms![OpenFoodFactsLanguage.ENGLISH]!,
          contains(expectedNameEnglish));
      expect(value.synonyms![OpenFoodFactsLanguage.FRENCH]!,
          contains(expectedNameFrench));
      expect(value.parents, unorderedEquals(expectedParents));
      expect(value.children, unorderedEquals(expectedChildren));
    }

    test('get a packaging shape', () async {
      final Map<String, TaxonomyPackagingShape>? values =
          await OpenFoodAPIClient.getTaxonomyPackagingShapes(
        TaxonomyPackagingShapeQueryConfiguration(tags: <String>[knownTag]),
      );
      expect(values, isNotNull);
      expect(values!.length, equals(1));
      checkKnown(values[knownTag]!);
    });

    test("get a packaging shape that doesn't exist", () async {
      final Map<String, TaxonomyPackagingShape>? values =
          await OpenFoodAPIClient.getTaxonomyPackagingShapes(
        TaxonomyPackagingShapeQueryConfiguration(tags: <String>[unknownTag]),
      );
      expect(values, isNull);
    });

    test("get a packaging shape that doesn't exist with one that does",
        () async {
      final Map<String, TaxonomyPackagingShape>? values =
          await OpenFoodAPIClient.getTaxonomyPackagingShapes(
        TaxonomyPackagingShapeQueryConfiguration(
          tags: <String>[unknownTag, knownTag],
        ),
      );
      expect(values, isNotNull);
      expect(values!.length, equals(1));
      checkKnown(values[knownTag]!);
    });

    test('get all root packaging shapes', () async {
      final Map<String, TaxonomyPackagingShape>? values =
          await OpenFoodAPIClient.getTaxonomyPackagingShapes(
        TaxonomyPackagingShapeQueryConfiguration.roots(),
      );
      expect(values, isNotNull);
      expect(values!.length, greaterThan(70)); // was 80 on 2022-11-07
      expect(values[unknownTag], isNull);
      expect(values[knownRootTag], isNotNull);
    });
  });
}
