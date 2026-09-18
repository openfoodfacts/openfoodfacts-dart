import '../product.dart';
import 'nutrition_set.dart';
import 'nutrition_set_key.dart';

/// Helper for extracting nutrition values from API 3.5.
class NutritionHelper {
  // TODO(monsieurtanuki): extract other sets, like 'aggregated_set'
  /// Returns the "input sets", which is the most relevant nutrition sets.
  List<NutritionSet>? getInputSets(final Product product) =>
      getNutritionSets(product, 'input_sets');

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
