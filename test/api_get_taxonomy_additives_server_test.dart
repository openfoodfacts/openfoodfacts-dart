import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration test about additives.
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
  OpenFoodAPIConfiguration.globalLanguages = [
    OpenFoodFactsLanguage.ENGLISH,
    OpenFoodFactsLanguage.FRENCH,
  ];

  const String knownTag = 'en:e436';
  const String unknownTag = 'en:some_nonexistent_additive';

  void checkKnown(final TaxonomyAdditive additive) {
    expect(additive.name![OpenFoodFactsLanguage.ENGLISH]!, isNotEmpty);
    expect(additive.name![OpenFoodFactsLanguage.FRENCH]!, isNotEmpty);
    expect(additive.vegan![OpenFoodFactsLanguage.ENGLISH]!, isNotEmpty);
  }

  group('OpenFoodAPIClient getTaxonomyAdditives', () {
    test('get root additives', () async {
      final Map<String, TaxonomyAdditive>? additives =
          await OpenFoodAPIClient.getTaxonomyAdditives(
        TaxonomyAdditiveQueryConfiguration.roots(),
      );
      expect(additives, isNotNull);
      expect(additives!.length, greaterThan(500)); // was 540 on 2022-02-25
    });

    test('get an additive', () async {
      final Map<String, TaxonomyAdditive>? additives =
          await OpenFoodAPIClient.getTaxonomyAdditives(
        TaxonomyAdditiveQueryConfiguration(
          tags: <String>[knownTag],
        ),
      );
      expect(additives, isNotNull);
      expect(additives!.length, equals(1));
      final TaxonomyAdditive additive = additives[knownTag]!;
      checkKnown(additive);
    });

    test("get an additive that doesn't exist", () async {
      final Map<String, TaxonomyAdditive>? categories =
          await OpenFoodAPIClient.getTaxonomyAdditives(
        TaxonomyAdditiveQueryConfiguration(
          tags: <String>[unknownTag],
        ),
      );
      expect(categories, isNull);
    });

    test("get an additive that doesn't exist with one that does", () async {
      final Map<String, TaxonomyAdditive>? additives =
          await OpenFoodAPIClient.getTaxonomyAdditives(
        TaxonomyAdditiveQueryConfiguration(
          tags: <String>[unknownTag, knownTag],
        ),
      );
      expect(additives, isNotNull);
      expect(additives!.length, equals(1));
      final TaxonomyAdditive additive = additives[knownTag]!;
      checkKnown(additive);
    });
  });
}
