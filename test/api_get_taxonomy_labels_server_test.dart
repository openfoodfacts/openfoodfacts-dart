import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration test about labels.
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.TEST_USER;
  const uriHelper = uriHelperFoodTest;
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
            uriHelper: uriHelper,
          );
      expect(labels, isNotNull);
      expect(labels!.length, greaterThan(450)); // was 475 on 2022-09-23
      expect(labels[knownTag], isNotNull);
    });

    test('get a label', () async {
      final Map<String, TaxonomyLabel>? labels =
          await OpenFoodAPIClient.getTaxonomyLabels(
            TaxonomyLabelQueryConfiguration(tags: <String>[knownTag]),
            uriHelper: uriHelper,
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
            uriHelper: uriHelper,
          );
      expect(labels, isNull);
    });

    test("get a label that doesn't exist with one that does", () async {
      final Map<String, TaxonomyLabel>? labels =
          await OpenFoodAPIClient.getTaxonomyLabels(
            TaxonomyLabelQueryConfiguration(
              tags: <String>[unknownTag, knownTag],
            ),
            uriHelper: uriHelper,
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
