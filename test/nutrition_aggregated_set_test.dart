import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

void main() {
  group('NutritionHelper aggregated set', () {
    final Product product = Product()
      ..nutrition = <String, dynamic>{
        'no_nutrition_data_on_packaging': true,
        'aggregated_set': <String, dynamic>{
          'per': '100g',
          'preparation': 'as_sold',
          'nutrients': <String, dynamic>{
            'iron': <String, dynamic>{
              'source': 'manufacturer',
              'source_index': 0,
              'source_per': '100g',
              'unit': 'mg',
              'value': 5,
            },
            'fat': <String, dynamic>{
              'modifier': '~',
              'source': 'estimate',
              'source_index': 1,
              'source_per': '100g',
              'unit': 'g',
              'value': 1.5,
            },
          },
        },
      };

    test('is parsed without a set-level source', () {
      final NutritionSet? set = NutritionHelper().getAggregatedSet(product);
      expect(set, isNotNull);
      expect(set!.key.source, NutritionSetKey.sourceAggregated);
      expect(set.key.preparation, NutritionSetKey.preparationAsSold);
      expect(set.key.perSize, PerSize.oneHundredGrams);
    });

    test('keeps the source of each value', () {
      final Map<Nutrient, NutritionValue> values = NutritionHelper()
          .getAggregatedSet(product)!
          .nutritionValues!;
      expect(values[Nutrient.iron]!.source, NutritionSetKey.sourceManufacturer);
      expect(values[Nutrient.iron]!.unit, Unit.MILLI_G);
      expect(values[Nutrient.iron]!.value, 5);
      expect(values[Nutrient.fat]!.source, NutritionSetKey.sourceEstimate);
      expect(values[Nutrient.fat]!.modifier, NutrientModifier.approximately);
    });

    test('source is never written', () {
      final NutritionValue value = NutritionHelper()
          .getAggregatedSet(product)!
          .nutritionValues![Nutrient.iron]!;
      expect(value.toJson().containsKey('source'), isFalse);
    });

    test('is null when missing', () {
      expect(NutritionHelper().getAggregatedSet(Product()), isNull);
      expect(
        NutritionHelper().getAggregatedSet(Product()..nutrition = {}),
        isNull,
      );
    });

    test('no nutrition data on packaging', () {
      expect(NutritionHelper().getNoNutritionDataOnPackaging(product), isTrue);
      expect(
        NutritionHelper().getNoNutritionDataOnPackaging(Product()),
        isNull,
      );
    });
  });
}
