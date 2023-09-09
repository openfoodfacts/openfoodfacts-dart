import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration test about packagings.
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
  OpenFoodAPIConfiguration.globalLanguages = [
    OpenFoodFactsLanguage.ENGLISH,
    OpenFoodFactsLanguage.FRENCH,
  ];

  const String knownRootTag = 'en:brick';
  const String unknownTag = 'en:some_nonexistent_packaging';

  void checkKnownPackaging(final TaxonomyPackaging packaging) {
    expect(packaging.name, isNotNull);
    expect(packaging.name, isNotEmpty);
    expect(packaging.synonyms, isNotNull);
    expect(packaging.synonyms, isNotEmpty);
    for (final OpenFoodFactsLanguage language
        in OpenFoodAPIConfiguration.globalLanguages!) {
      expect(packaging.name![language], isNotEmpty);
      expect(packaging.synonyms![language], isNotEmpty);
    }
  }

  group('OpenFoodAPIClient getTaxonomyPackagings (server)', () {
    test("get root packagings", () async {
      final Map<String, TaxonomyPackaging>? packagings =
          await OpenFoodAPIClient.getTaxonomyPackagings(
        TaxonomyPackagingQueryConfiguration.roots(),
      );
      expect(packagings, isNotNull);
      expect(packagings, isNotEmpty);
      expect(packagings!.length, greaterThan(100)); // was 122 on 2022-03-03
      expect(packagings[knownRootTag], isNotNull);
      checkKnownPackaging(packagings[knownRootTag]!);
      for (final TaxonomyPackaging packaging in packagings.values) {
        // we expect no parents for the roots packaging
        expect(packaging.parents, isNull);
      }
    });

    test('get a packaging', () async {
      final Map<String, TaxonomyPackaging>? packagings =
          await OpenFoodAPIClient.getTaxonomyPackagings(
        TaxonomyPackagingQueryConfiguration(tags: <String>[knownRootTag]),
      );
      expect(packagings, isNotNull);
      expect(packagings!.length, equals(1));
      expect(packagings[knownRootTag], isNotNull);
      checkKnownPackaging(packagings[knownRootTag]!);
    });

    test("get a packaging that doesn't exist", () async {
      final Map<String, TaxonomyPackaging>? packagings =
          await OpenFoodAPIClient.getTaxonomyPackagings(
        TaxonomyPackagingQueryConfiguration(tags: <String>[unknownTag]),
      );
      expect(packagings, isNull);
    });

    test("get a packaging that doesn't exist with one that does", () async {
      final Map<String, TaxonomyPackaging>? packagings =
          await OpenFoodAPIClient.getTaxonomyPackagings(
        TaxonomyPackagingQueryConfiguration(
          tags: <String>[unknownTag, knownRootTag],
        ),
      );
      expect(packagings, isNotNull);
      expect(packagings!.length, equals(1));
      expect(packagings[knownRootTag], isNotNull);
      checkKnownPackaging(packagings[knownRootTag]!);
    });

    /// Recursively gets all the tree.
    ///
    /// At the end, [knowItems] will contain everything.
    Future<int> recursiveGet(
      final Map<String, TaxonomyPackaging> soFar,
      final List<String> children,
    ) async {
      final Map<String, TaxonomyPackaging>? sublevel =
          await OpenFoodAPIClient.getTaxonomyPackagings(
        TaxonomyPackagingQueryConfiguration(tags: children),
      );
      expect(sublevel, isNotNull);
      expect(sublevel, isNotEmpty);
      soFar.addAll(sublevel!);
      final List<String> grandChildren = <String>[];
      for (final TaxonomyPackaging packaging in sublevel.values) {
        if (packaging.children != null && packaging.children!.isNotEmpty) {
          for (final String grandChild in packaging.children!) {
            if (!soFar.containsKey(grandChild)) {
              grandChildren.addAll(packaging.children!);
            }
          }
        }
      }
      if (grandChildren.isEmpty) {
        return 1;
      }
      return 1 + await recursiveGet(soFar, grandChildren);
    }

    test("get recursive packagings", () async {
      final Map<String, TaxonomyPackaging>? roots =
          await OpenFoodAPIClient.getTaxonomyPackagings(
        TaxonomyPackagingQueryConfiguration.roots(),
      );
      expect(roots, isNotNull);
      expect(roots, isNotEmpty);
      final List<String> children = <String>[];
      for (final TaxonomyPackaging packaging in roots!.values) {
        if (packaging.children != null && packaging.children!.isNotEmpty) {
          children.addAll(packaging.children!);
        }
      }

      final int maxLevel = await recursiveGet(roots, children);
      expect(maxLevel, lessThanOrEqualTo(5)); // was 3 on 2022-03-03
      expect(roots.length, greaterThan(150)); // was 187 on 2022-03-03
    });
  });
}
