import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration test about localize / canonicalize operations on taxonomy.
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
  OpenFoodAPIConfiguration.globalLanguages = [
    OpenFoodFactsLanguage.ENGLISH,
    OpenFoodFactsLanguage.FRENCH,
  ];

  group('OpenFoodAPIClient taxonomy getCanonicalTags', () {
    test("relevant values", () async {
      const Map<String, String> expected = <String, String>{
        'banane': 'en:banana',
        'framboise': 'en:raspberry',
        'unrecognized ingredient': 'fr:unrecognized ingredient',
      };
      final List<String> expectedKeys = expected.keys.toList(growable: false);
      final MaybeError<Map<String, String>> result =
          await OpenFoodAPIClient.getCanonicalTags(
            TagType.INGREDIENTS,
            localizedNames: expectedKeys,
            language: OpenFoodFactsLanguage.FRENCH,
            uriHelper: uriHelperFoodProd,
          );
      expect(result.isError, isFalse);
      for (final String key in expectedKeys) {
        expect(result.value[key], expected[key]);
      }
    });

    test("empty list", () async {
      final MaybeError<Map<String, String>> result =
          await OpenFoodAPIClient.getCanonicalTags(
            TagType.INGREDIENTS,
            localizedNames: <String>['', '    ', ''],
            language: OpenFoodFactsLanguage.FRENCH,
            uriHelper: uriHelperFoodProd,
          );
      expect(result.isError, isFalse);
      expect(result.value, isEmpty);
    });

    test("random values", () async {
      const List<String> input = <String>[
        'banne',
        'frambise',
        'unrecognizedredient',
      ];
      final MaybeError<Map<String, String>> result =
          await OpenFoodAPIClient.getCanonicalTags(
            TagType.INGREDIENTS,
            localizedNames: input,
            language: OpenFoodFactsLanguage.FRENCH,
            uriHelper: uriHelperFoodProd,
          );
      expect(result.isError, isFalse);
      expect(result.value.entries, hasLength(input.length));
    });
  });

  group('OpenFoodAPIClient taxonomy getLocalizedNames', () {
    test("relevant values", () async {
      const Map<String, String> expected = <String, String>{
        'en:banana': 'Banane',
        'en:raspberry': 'Framboise',
        'fr:unrecognized ingredient': 'Unrecognized ingredient',
      };
      final List<String> expectedKeys = expected.keys.toList(growable: false);
      final MaybeError<Map<String, String>> result =
          await OpenFoodAPIClient.getLocalizedNames(
            TagType.INGREDIENTS,
            canonicalTags: expectedKeys,
            language: OpenFoodFactsLanguage.FRENCH,
            uriHelper: uriHelperFoodProd,
          );
      expect(result.isError, isFalse);
      for (final String key in expectedKeys) {
        expect(result.value[key], expected[key]);
      }
    });

    test("empty list", () async {
      final MaybeError<Map<String, String>> result =
          await OpenFoodAPIClient.getLocalizedNames(
            TagType.INGREDIENTS,
            canonicalTags: <String>['', '    ', ''],
            language: OpenFoodFactsLanguage.FRENCH,
            uriHelper: uriHelperFoodProd,
          );
      expect(result.isError, isFalse);
      expect(result.value, isEmpty);
    });

    test("random values", () async {
      const List<String> input = <String>[
        'en:banan',
        'en:raspberri',
        'unrecognizedingredient',
      ];
      final MaybeError<Map<String, String>> result =
          await OpenFoodAPIClient.getLocalizedNames(
            TagType.INGREDIENTS,
            canonicalTags: input,
            language: OpenFoodFactsLanguage.FRENCH,
            uriHelper: uriHelperFoodProd,
          );
      expect(result.isError, isFalse);
      expect(result.value.entries, hasLength(input.length));
    });
  });
}
