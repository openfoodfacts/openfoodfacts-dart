import '../product.dart';
import 'nutrition_set.dart';
import 'nutrition_set_key.dart';

/// Helper for extracting nutrition values from API 3.5.
class NutritionHelper {
  void setInputSets(
    final Product product,
    final List<NutritionSet> nutritionSets,
  ) => setNutritionSets(product, nutritionSets, 'input_sets');

  void setNutritionSets(
    final Product product,
    final List<NutritionSet> nutritionSets,
    final String tag,
  ) => product.nutrition = <String, dynamic>{
    tag: [...nutritionSets.map((item) => item.toJson())],
  };

  /// Returns the "input sets", which is the most relevant nutrition sets.
  List<NutritionSet>? getInputSets(final Product product) =>
      getNutritionSets(product, 'input_sets');

  /// Returns the "aggregated set": for each nutrient, the most relevant value.
  ///
  /// Read-only. The [NutritionValue.source] of each value tells where it
  /// comes from.
  NutritionSet? getAggregatedSet(final Product product) {
    final dynamic json = product.nutrition?['aggregated_set'];
    return json == null ? null : NutritionSet.fromJson(json);
  }

  /// Returns true if the product explicitly has no nutrition data on packaging,
  /// null when unknown.
  bool? getNoNutritionDataOnPackaging(final Product product) =>
      product.nutrition?['no_nutrition_data_on_packaging'];

  /// Returns the nutrition sets that match a [tag].
  List<NutritionSet>? getNutritionSets(
    final Product product,
    final String tag,
  ) {
    if (product.nutrition == null) {
      return null;
    }
    final json = product.nutrition![tag];
    if (json == null) {
      return null;
    }
    final List<NutritionSet> result = <NutritionSet>[];
    for (final item in json) {
      final NutritionSet? nutritionSet = NutritionSet.fromJson(item);
      if (nutritionSet != null) {
        result.add(nutritionSet);
      }
    }
    return result;
  }

  /// Returns the nutrition set that match a [filterKey].
  NutritionSet? getNutritionSet(
    final List<NutritionSet> nutritionSets,
    final NutritionSetKey filterKey,
  ) {
    for (final NutritionSet nutritionSet in nutritionSets) {
      if (filterKey.perSize != nutritionSet.key.perSize) {
        continue;
      }
      if (filterKey.source != nutritionSet.key.source) {
        continue;
      }
      if (filterKey.preparation != nutritionSet.key.preparation) {
        continue;
      }
      return nutritionSet;
    }
    return null;
  }

  /// Returns all the keys of the nutrition sets.
  List<NutritionSetKey>? getNutritionSetKeys(
    final List<NutritionSet> nutritionSets,
  ) {
    final List<NutritionSetKey> result = <NutritionSetKey>[];
    for (final NutritionSet nutritionSet in nutritionSets) {
      result.add(nutritionSet.key);
    }
    return result;
  }
}
