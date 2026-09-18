import 'nutrition_set_key.dart';
import 'nutrition_value.dart';
import '../nutrient.dart';

/// Nutrition set.
///
/// Typical meaning: in that nutrition set, we're dealing with
/// * packaging nutrition facts, for the product as sold, per 100g (cf [key]).
/// * we have a map of nutrients with their [NutritionValue].
/// * we may have explicitly unspecified nutrients.
class NutritionSet {
  NutritionSet({
    required this.key,
    required this.nutritionValues,
    this.unspecifiedNutrients,
  });

  final NutritionSetKey key;
  final Map<Nutrient, NutritionValue>? nutritionValues;
  final List<Nutrient>? unspecifiedNutrients;

  static NutritionSet? fromJson(final dynamic json) {
    final NutritionSetKey? nutritionSetKey = NutritionSetKey.fromJson(json);
    if (nutritionSetKey == null) {
      return null;
    }

    List<Nutrient>? unspecifiedNutrients;
    var values = json['unspecified_nutrients'];
    if (values != null) {
      for (final String nutrientString in values) {
        final Nutrient? nutrient = Nutrient.fromOffTag(nutrientString);
        if (nutrient == null) {
          continue;
        }
        unspecifiedNutrients ??= [];
        unspecifiedNutrients.add(nutrient);
      }
    }

    Map<Nutrient, NutritionValue>? nutritionValues;
    values = json['nutrients'];
    if (values != null) {
      nutritionValues = <Nutrient, NutritionValue>{};
      for (MapEntry<String, dynamic> entry in values.entries) {
        final Nutrient? nutrient = Nutrient.fromOffTag(entry.key);
        if (nutrient == null) {
          continue;
        }
        final NutritionValue? nutritionValue = NutritionValue.fromJson(
          entry.value,
        );
        if (nutritionValue != null) {
          nutritionValues[nutrient] = nutritionValue;
        }
      }
    }

    return NutritionSet(
      nutritionValues: nutritionValues,
      unspecifiedNutrients: unspecifiedNutrients,
      key: nutritionSetKey,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = key.toJson();
    if (unspecifiedNutrients != null) {
      result['unspecified_nutrients'] = unspecifiedNutrients!
          .map<String>((nutrient) => nutrient.offTag)
          .toList();
    }
    if (nutritionValues != null) {
      result['nutrients'] = {};
      for (final MapEntry<Nutrient, NutritionValue> entry
          in nutritionValues!.entries) {
        result['nutrients'][entry.key.offTag] = entry.value.toJson();
      }
    }
    return result;
  }

  @override
  String toString() =>
      'NutritionSet'
      '($key'
      ',$nutritionValues'
      ',$unspecifiedNutrients'
      ')';
}
