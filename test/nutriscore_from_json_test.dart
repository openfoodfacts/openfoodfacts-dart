import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

void main() {
  final computed = {
    '2023': {
      'grade': 'b',
      'score': 2,
      'category_available': 1,
      'nutrients_available': 1,
      'data': {
        'is_beverage': 1,
        'is_cheese': 0,
        'is_fat_oil_nuts_seeds': 0,
        'is_red_meat_product': 0,
        'is_water': 0,
      }
    }
  };

  final unknown = {
    '2023': {
      'grade': 'unknown',
      'category_available': 1,
      'nutrients_available': 0,
      'data': {
        'is_beverage': 0,
        'is_cheese': 0,
        'is_fat_oil_nuts_seeds': 0,
        'is_red_meat_product': 0,
        'is_water': 0,
      }
    }
  };

  final notApplicable = {
    '2023': {
      'grade': 'not-applicable',
      'category_available': 1,
      'nutrients_available': 1,
      'not_applicable_category': 'en:alcoholic-beverages',
      'data': {
        'is_beverage': 1,
        'is_cheese': 0,
        'is_fat_oil_nuts_seeds': 0,
        'is_red_meat_product': 0,
        'is_water': 0,
      }
    }
  };

  final mixedDataTypes = {
    // e.g. 2336152903783
    '2021': {
      'grade': 'd',
      'score': 15,
      'category_available': 1,
      'nutrients_available': 1,
      'data': {
        'is_beverage': 0,
        'is_cheese': "1",
        'is_fat': 0,
        'is_water': 0,
      }
    },
  };

  final inconsistent = {
    '2021': {
      'grade': 'not-applicable',
      'category_available': 1,
      'nutrients_available': 1,
      'not_applicable_category': 'en:alcoholic-beverages',
      'data': {
        'is_beverage': 1,
        'is_cheese': 0,
        'is_fat': 0,
        'is_red_meat_product': 0,
        'is_water': "1",
      }
    },
    '2023': {
      'grade': 'unknown',
      'category_available': 1,
      'nutrients_available': 0,
      'not_applicable_category': 'en:alcoholic-beverages',
      'data': {
        'is_red_meat_product': 1,
      }
    }
  };

  group('NutriScore.fromJson', () {
    test('returns no Nutri-Scores when input is empty', () {
      final result = NutriScoreDetails.fromJson({});
      expect(result, isNotNull);
      expect(result.v2021, isNull);
      expect(result.v2023, isNull);
    });

    test('ignores entries with unknown versions or null', () {
      final result = NutriScoreDetails.fromJson({
        'invalid_version': {'grade': 'a'},
        '2021': null,
      });
      expect(result, isNotNull);
      expect(result.v2021, isNull);
      expect(result.v2023, isNull);
    });

    test('throws Error on non-map input', () {
      expect(
        () => NutriScoreDetails.fromJson(
          {'2023': 'not a map'},
        ),
        throwsA(isA<TypeError>()),
      );
    });

    test('parses computed NutriScore for version 2023', () {
      final result = NutriScoreDetails.fromJson(computed);
      expect(result, isNotNull);
      expect(result.v2021, isNull);
      expect(result.v2023, isNotNull);

      final nutriScore2023 = result.v2023;
      expect(nutriScore2023, isNotNull);
      expect(nutriScore2023!.grade, 'b');
      expect(nutriScore2023.score, 2);
      expect(nutriScore2023.categoryAvailable, isTrue);
      expect(nutriScore2023.nutrientsAvailable, isTrue);
      expect(nutriScore2023.data?.isBeverage, isTrue);
      expect(nutriScore2023.data?.isWater, isFalse);
      expect(nutriScore2023.data?.isCheese, isFalse);
      expect(nutriScore2023.data?.isFatOilNutsSeeds, isFalse);
      expect(nutriScore2023.data?.isRedMeatProduct, isFalse);
    });

    test('parses unknown NutriScore for version 2023', () {
      final result = NutriScoreDetails.fromJson(unknown);
      expect(result, isNotNull);
      expect(result.v2021, isNull);
      expect(result.v2023, isNotNull);

      final nutriScore2023 = result.v2023;
      expect(nutriScore2023, isNotNull);
      expect(nutriScore2023!.grade, 'unknown');
      expect(nutriScore2023.score, isNull);
      expect(nutriScore2023.categoryAvailable, isTrue);
      expect(nutriScore2023.nutrientsAvailable, isFalse);
      expect(nutriScore2023.data?.isBeverage, isFalse);
      expect(nutriScore2023.data?.isWater, isFalse);
      expect(nutriScore2023.data?.isCheese, isFalse);
      expect(nutriScore2023.data?.isFatOilNutsSeeds, isFalse);
      expect(nutriScore2023.data?.isRedMeatProduct, isFalse);
    });

    test('parses not applicable NutriScore for version 2023', () {
      final result = NutriScoreDetails.fromJson(notApplicable);
      expect(result, isNotNull);
      expect(result.v2021, isNull);
      expect(result.v2023, isNotNull);

      final nutriScore2023 = result.v2023;
      expect(nutriScore2023, isNotNull);
      expect(nutriScore2023!.grade, 'not-applicable');
      expect(nutriScore2023.score, isNull);
      expect(nutriScore2023.categoryAvailable, isTrue);
      expect(nutriScore2023.nutrientsAvailable, isTrue);
      expect(nutriScore2023.data?.isBeverage, isTrue);
      expect(nutriScore2023.data?.isWater, isFalse);
      expect(nutriScore2023.data?.isCheese, isFalse);
      expect(nutriScore2023.data?.isFatOilNutsSeeds, isFalse);
      expect(nutriScore2023.data?.isRedMeatProduct, isFalse);
    });

    test('parses mixed data types in categories', () {
      final result = NutriScoreDetails.fromJson(mixedDataTypes);
      expect(result, isNotNull);
      expect(result.v2021, isNotNull);
      expect(result.v2023, isNull);

      final nutriScore2021 = result.v2021;
      expect(nutriScore2021, isNotNull);
      expect(nutriScore2021!.grade, 'd');
      expect(nutriScore2021.score, isNotNull);
      expect(nutriScore2021.categoryAvailable, isTrue);
      expect(nutriScore2021.nutrientsAvailable, isTrue);
      expect(nutriScore2021.data?.isBeverage, isFalse);
      expect(nutriScore2021.data?.isWater, isFalse);
      expect(nutriScore2021.data?.isCheese, isTrue);
      expect(nutriScore2021.data?.isFat, isFalse);
    });

    test('parses inconsistent NutriScore data', () {
      final result = NutriScoreDetails.fromJson(inconsistent);
      expect(result, isNotNull);
      expect(result.v2021, isNotNull);
      expect(result.v2023, isNotNull);

      final nutriScore2021 = result.v2021;
      expect(nutriScore2021, isNotNull);
      expect(nutriScore2021!.grade, 'not-applicable');
      expect(nutriScore2021.score, isNull);
      expect(nutriScore2021.categoryAvailable, isTrue);
      expect(nutriScore2021.nutrientsAvailable, isTrue);
      expect(nutriScore2021.data?.isBeverage, isTrue);
      expect(nutriScore2021.data?.isWater, isTrue);
      expect(nutriScore2021.data?.isCheese, isFalse);
      expect(nutriScore2021.data?.isFat, isFalse);
    });
  });

  test('round-trip toJson/fromJson', () {
    for (final json in [computed, unknown, notApplicable, inconsistent]) {
      final original = NutriScoreDetails.fromJson(json);
      expect(original, isNotNull);

      final copy = NutriScoreDetails.fromJson(original.toJson());
      expect(copy, isNotNull);

      final orig2021 = original.v2021;
      final copy2021 = copy.v2021;
      final orig2023 = original.v2023;
      final copy2023 = copy.v2023;

      expect(copy2021?.grade, equals(orig2021?.grade));
      expect(copy2021?.score, equals(orig2021?.score));
      expect(copy2021?.categoryAvailable, equals(orig2021?.categoryAvailable));
      expect(
        copy2021?.nutrientsAvailable,
        equals(orig2021?.nutrientsAvailable),
      );
      expect(copy2023?.grade, equals(orig2023?.grade));
      expect(copy2023?.score, equals(orig2023?.score));
      expect(copy2023?.categoryAvailable, equals(orig2023?.categoryAvailable));
      expect(
        copy2023?.nutrientsAvailable,
        equals(orig2023?.nutrientsAvailable),
      );
      expect(
        copy2023?.notApplicableCategory,
        equals(orig2023?.notApplicableCategory),
      );
    }
  });
}
