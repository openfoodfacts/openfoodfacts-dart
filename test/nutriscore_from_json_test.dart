import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

void main() {
  group('NutriScore.fromJson', () {
    test('returns null when input is null', () {
      final result = NutriScore.fromJson(null);
      expect(result, isNull);
    });

    test('throws FormatException on non-map input', () {
      expect(
        () => NutriScore.fromJson(['not', 'a', 'map']),
        throwsA(isA<FormatException>()),
      );
    });

    test('ignores entries with unknown versions', () {
      final result = NutriScore.fromJson({
        'invalid_version': {'grade': 'a'}
      });
      expect(result, isNull);
    });

    test('ignores entries with invalid structure', () {
      final result = NutriScore.fromJson({
        '2023': 'not a map',
        '2021': null,
      });
      expect(result, isNull);
    });

    test('parses valid NutriScore for version 2023', () {
      final json = {
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

      final result = NutriScore.fromJson(json);
      expect(result, isNotNull);
      expect(result!.length, 1);
      expect(result, contains(NutriScoreVersion.v2023));

      final nutriScore = result[NutriScoreVersion.v2023]!;
      expect(nutriScore.version, NutriScoreVersion.v2023);
      expect(nutriScore.status, NutriScoreStatus.computed);
      expect(nutriScore.grade, NutriScoreGrade.B);
      expect(nutriScore.score, 2);
      expect(nutriScore.category?.version, NutriScoreVersion.v2023);
      expect(nutriScore.category?.as2023, NutriScoreCategory2023.beverage);
    });

    test('parses unknown NutriScore for version 2023', () {
      final json = {
        '2023': {
          'grade': 'unknown',
          'category_available': 1,
          'data': {
            'is_beverage': 0,
            'is_cheese': 0,
            'is_fat_oil_nuts_seeds': 0,
            'is_red_meat_product': 0,
            'is_water': 0,
          }
        }
      };

      final result = NutriScore.fromJson(json);
      expect(result, isNotNull);
      expect(result!.length, 1);
      expect(result, contains(NutriScoreVersion.v2023));

      final nutriScore = result[NutriScoreVersion.v2023]!;
      expect(nutriScore.version, NutriScoreVersion.v2023);
      expect(nutriScore.status, NutriScoreStatus.unknown);
      expect(nutriScore.grade, isNull);
      expect(nutriScore.score, isNull);
      expect(nutriScore.category?.version, NutriScoreVersion.v2023);
      expect(nutriScore.category?.as2023, NutriScoreCategory2023.general);
      expect(nutriScore.missingData, contains(NutriScoreInput.nutrients));
    });

    test('parses not applicable NutriScore for version 2023', () {
      final json = {
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

      final result = NutriScore.fromJson(json);
      expect(result, isNotNull);
      expect(result!.length, 1);
      expect(result, contains(NutriScoreVersion.v2023));

      final nutriScore = result[NutriScoreVersion.v2023]!;
      expect(nutriScore.version, NutriScoreVersion.v2023);
      expect(nutriScore.status, NutriScoreStatus.notApplicable);
      expect(nutriScore.grade, isNull);
      expect(nutriScore.score, isNull);
      expect(nutriScore.category?.as2023, NutriScoreCategory2023.beverage);
      expect(nutriScore.missingData, isEmpty);
    });

    test('parses inconsistently formatted NutriScore data for version 2021',
        () {
      final json = {
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
        }
      };

      final result = NutriScore.fromJson(json);
      expect(result, isNotNull);
      expect(result!.length, 1);
      expect(result, contains(NutriScoreVersion.v2021));

      final nutriScore = result[NutriScoreVersion.v2021]!;
      expect(nutriScore.version, NutriScoreVersion.v2021);
      expect(nutriScore.status, NutriScoreStatus.notApplicable);
      expect(nutriScore.grade, isNull);
      expect(nutriScore.score, isNull);
      expect(nutriScore.category?.as2021, NutriScoreCategory2021.water);
      expect(nutriScore.missingData, isEmpty);
    });
  });
}
