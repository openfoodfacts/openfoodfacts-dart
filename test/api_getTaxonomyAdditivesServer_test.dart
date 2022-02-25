import 'package:openfoodfacts/model/TaxonomyAdditive.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/CountryHelper.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration test about additives.
void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.PROD;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
  OpenFoodAPIConfiguration.globalLanguages = [
    OpenFoodFactsLanguage.ENGLISH,
    OpenFoodFactsLanguage.FRENCH,
  ];

  const String _knownTag = 'en:e436';
  const String _unknownTag = 'en:some_nonexistent_additive';

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
          tags: <String>[_knownTag],
        ),
      );
      expect(additives, isNotNull);
      expect(additives!.length, equals(1));
      final TaxonomyAdditive additive = additives[_knownTag]!;
      expect(additive.name![OpenFoodFactsLanguage.ENGLISH]!, isNotEmpty);
      expect(additive.name![OpenFoodFactsLanguage.FRENCH]!, isNotEmpty);
      expect(additive.vegan![OpenFoodFactsLanguage.ENGLISH]!, isNotEmpty);
    });

    test("get an additive that doesn't exist", () async {
      final Map<String, TaxonomyAdditive>? categories =
          await OpenFoodAPIClient.getTaxonomyAdditives(
        TaxonomyAdditiveQueryConfiguration(
          tags: <String>[_unknownTag],
        ),
      );
      expect(categories, isNull);
    });

    test("get an additive that doesn't exist with one that does", () async {
      final Map<String, TaxonomyAdditive>? additives =
          await OpenFoodAPIClient.getTaxonomyAdditives(
        TaxonomyAdditiveQueryConfiguration(
          tags: <String>[_unknownTag, _knownTag],
        ),
      );
      expect(additives, isNotNull);
      expect(additives!.length, equals(1));
      final TaxonomyAdditive additive = additives[_knownTag]!;
      expect(additive.name![OpenFoodFactsLanguage.ENGLISH]!, isNotEmpty);
      expect(additive.name![OpenFoodFactsLanguage.FRENCH]!, isNotEmpty);
      expect(additive.vegan![OpenFoodFactsLanguage.ENGLISH]!, isNotEmpty);
    });
  });
}
