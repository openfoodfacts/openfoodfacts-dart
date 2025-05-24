import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

void main() {
  group('NutriScore.fromJson', () {
    test('returns no Nutri-Scores when input is empty', () {
      final result = NutriScoreDetails.fromJson({});
      expect(result, isNotNull);
      expect(result.rawNutriScore2021, isNull);
      expect(result.rawNutriScore2023, isNull);
    });

    test('ignores entries with unknown versions or null', () {
      final result = NutriScoreDetails.fromJson({
        'invalid_version': {'grade': 'a'},
        '2021': null,
      });
      expect(result, isNotNull);
      expect(result.rawNutriScore2021, isNull);
      expect(result.rawNutriScore2023, isNull);
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
      expect(result.rawNutriScore2021, isNull);
      expect(result.rawNutriScore2023, isNotNull);

      final NutriScore2023 nutriScore = result.nutriScore2023!;
      expect(nutriScore.isComputed, isTrue);
      expect(nutriScore.hasMissingData, isFalse);
      expect(nutriScore.grade, NutriScoreGrade.b);
      expect(nutriScore.score, 2);
      expect(nutriScore.category, NutriScoreCategory2023.beverage);
    });

    test('parses unknown NutriScore for version 2023', () {
      final result = NutriScoreDetails.fromJson(unknown);
      expect(result, isNotNull);
      expect(result.rawNutriScore2021, isNull);
      expect(result.rawNutriScore2023, isNotNull);

      final NutriScore2023 nutriScore = result.nutriScore2023!;
      expect(nutriScore.hasMissingData, isTrue);
      expect(nutriScore.nutrientsAvailable, isFalse);
      expect(nutriScore.grade, isNull);
      expect(nutriScore.score, isNull);
      expect(nutriScore.category, NutriScoreCategory2023.general);
    });

    test('parses not applicable NutriScore for version 2023', () {
      final result = NutriScoreDetails.fromJson(notApplicable);
      expect(result, isNotNull);
      expect(result.rawNutriScore2021, isNull);
      expect(result.rawNutriScore2023, isNotNull);

      final NutriScore2023 nutriScore = result.nutriScore2023!;
      expect(nutriScore.isNotApplicable, isTrue);
      expect(nutriScore.grade, isNull);
      expect(nutriScore.score, isNull);
      expect(nutriScore.category, NutriScoreCategory2023.beverage);
      expect(nutriScore.hasMissingData, isFalse);
    });

    test('parses mixed data types in categories', () {
      final result = NutriScoreDetails.fromJson(mixedDataTypes);
      expect(result, isNotNull);
      expect(result.rawNutriScore2021, isNotNull);
      expect(result.rawNutriScore2023, isNull);

      final NutriScore2021 nutriScore = result.nutriScore2021!;
      expect(nutriScore.isComputed, isTrue);
      expect(nutriScore.grade, NutriScoreGrade.d);
      expect(nutriScore.score, isNotNull);
      expect(nutriScore.category, NutriScoreCategory2021.cheese);
      expect(nutriScore.hasMissingData, isFalse);
    });

    test('parses inconsistent NutriScore data', () {
      final result = NutriScoreDetails.fromJson(inconsistent);
      expect(result, isNotNull);
      expect(result.rawNutriScore2021, isNotNull);
      expect(result.rawNutriScore2023, isNotNull);

      final NutriScore2021 nutriScore = result.nutriScore2021!;
      expect(nutriScore.isNotApplicable, isTrue);
      expect(nutriScore.grade, isNull);
      expect(nutriScore.score, isNull);
      expect(nutriScore.category, NutriScoreCategory2021.water);
      expect(nutriScore.hasMissingData, isFalse);
    });
  });

  test('round-trip toJson/fromJson', () {
    for (final json in [computed, unknown, notApplicable, inconsistent]) {
      final original = NutriScoreDetails.fromJson(json);
      expect(original, isNotNull);

      final copy = NutriScoreDetails.fromJson(original.toJson());
      expect(copy, isNotNull);

      final orig2021 = original.nutriScore2021;
      final copy2021 = copy.nutriScore2021;
      final orig2023 = original.nutriScore2023;
      final copy2023 = copy.nutriScore2023;

      expect(copy2021?.category, equals(orig2021?.category));
      expect(copy2021?.grade, equals(orig2021?.grade));
      expect(copy2021?.score, equals(orig2021?.score));
      expect(copy2021?.hasMissingData, equals(orig2021?.hasMissingData));
      expect(copy2023?.category, equals(orig2023?.category));
      expect(copy2023?.grade, equals(orig2023?.grade));
      expect(copy2023?.score, equals(orig2023?.score));
      expect(copy2023?.hasMissingData, equals(orig2023?.hasMissingData));
      expect(copy2023?.notApplicableCategory,
          equals(orig2023?.notApplicableCategory));
    }
  });
}

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
