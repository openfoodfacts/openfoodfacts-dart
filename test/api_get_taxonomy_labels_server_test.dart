import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration test about labels.
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
  OpenFoodAPIConfiguration.globalLanguages = [
    OpenFoodFactsLanguage.ENGLISH,
    OpenFoodFactsLanguage.FRENCH,
  ];

  const String knownTag = 'en:vegetarian';
  const String unknownTag = 'en:some_nonexistent_label';

  group('OpenFoodAPIClient getTaxonomyLabels (server)', () {
    test("get label roots", () async {
      final Map<String, TaxonomyLabel>? labels =
          await OpenFoodAPIClient.getTaxonomyLabels(
        TaxonomyLabelQueryConfiguration.roots(),
      );
      expect(labels, isNotNull);
      expect(labels!.length, greaterThan(450)); // was 475 on 2022-09-23
      expect(labels[knownTag], isNotNull);
    });

    test('get a label', () async {
      final Map<String, TaxonomyLabel>? labels =
          await OpenFoodAPIClient.getTaxonomyLabels(
        TaxonomyLabelQueryConfiguration(tags: <String>[knownTag]),
      );
      expect(labels, isNotNull);
      expect(labels!.length, 1);
      final TaxonomyLabel label = labels[knownTag]!;
      expect(label.name![OpenFoodFactsLanguage.ENGLISH]!, isNotEmpty);
      expect(label.name![OpenFoodFactsLanguage.FRENCH]!, isNotEmpty);
      expect(label.wikidata![OpenFoodFactsLanguage.ENGLISH]!, isNotEmpty);
    });

    test("get a label that doesn't exist", () async {
      final Map<String, TaxonomyLabel>? labels =
          await OpenFoodAPIClient.getTaxonomyLabels(
        TaxonomyLabelQueryConfiguration(tags: <String>[unknownTag]),
      );
      expect(labels, isNull);
    });

    test("get a label that doesn't exist with one that does", () async {
      final Map<String, TaxonomyLabel>? labels =
          await OpenFoodAPIClient.getTaxonomyLabels(
        TaxonomyLabelQueryConfiguration(
          tags: <String>[unknownTag, knownTag],
        ),
      );
      expect(labels, isNotNull);
      expect(labels!.length, 1);
      final TaxonomyLabel label = labels[knownTag]!;
      expect(label.name![OpenFoodFactsLanguage.ENGLISH]!, isNotEmpty);
      expect(label.name![OpenFoodFactsLanguage.FRENCH]!, isNotEmpty);
      expect(label.wikidata![OpenFoodFactsLanguage.ENGLISH]!, isNotEmpty);
    });
  });
}
