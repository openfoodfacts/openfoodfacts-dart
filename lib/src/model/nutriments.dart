import 'nutrient.dart';
import 'nutrient_modifier.dart';
import 'per_size.dart';
import '../external/json_map.dart';
import '../interface/json_object.dart';
import '../utils/nutriments_helper.dart';

/// Values in nutrients.
///
/// Most interesting methods are:
/// * [setValue]
/// * [getValue]
/// * [getModifier]
class Nutriments extends JsonMap {
  /// Empty nutrient map.
  Nutriments.empty() : super(<String, dynamic>{});

  /// Nutrient map with start values from [map].
  Nutriments._fromMap(super.jsonMap);

  /// Returns the value map key for that [nutrient] and that [perSize].
  String _getTag(final Nutrient nutrient, final PerSize perSize) =>
      '${nutrient.offTag}_${perSize.offTag}';

  /// Returns the modifier map key for that [nutrient].
  String _getModifierTag(final Nutrient nutrient) =>
      '${nutrient.offTag}_modifier';

  /// Returns the value of that [nutrient] for that [perSize].
  ///
  /// It won't be in grams for very specific nutrients, like [Nutrient.alcohol].
  double? getValue(final Nutrient nutrient, final PerSize perSize) =>
      JsonObject.parseDouble(jsonMap[_getTag(nutrient, perSize)]);

  /// Returns the modifier of that [nutrient].
  NutrientModifier? getModifier(final Nutrient nutrient) =>
      NutrientModifier.fromOffTag(jsonMap[_getModifierTag(nutrient)]);

  /// Sets the value in grams of that [nutrient] for that [perSize].
  ///
  /// It won't be grams for very specific nutrients, like [Nutrient.alcohol].
  Nutriments setValue(
    final Nutrient nutrient,
    final PerSize perSize,
    final double? value, {
    final NutrientModifier? modifier,
  }) => _set(nutrient, perSize, value: value, modifier: modifier);

  /// Deletes the value in grams of that [nutrient] for that [perSize].
  Nutriments deleteValue(final Nutrient nutrient, final PerSize perSize) =>
      _set(nutrient, perSize, value: null);

  Nutriments _set(
    final Nutrient nutrient,
    final PerSize perSize, {
    final double? value,
    final NutrientModifier? modifier,
  }) {
    jsonMap[_getTag(nutrient, perSize)] = value;
    jsonMap[_getModifierTag(nutrient)] = modifier?.offTag;
    return this;
  }

  /// Returns true if there are no populated nutrients at all.
  ///
  /// Default case: a nutrient with a null value is considered "populated".
  /// If [isNullEmpty] is true, a null value is a non populated value, and a
  /// [Nutriments] with only null values would be considered empty.
  bool isEmpty({final bool isNullEmpty = false}) {
    if (jsonMap.isEmpty) {
      return true;
    }
    if (!isNullEmpty) {
      return false;
    }
    for (final dynamic value in jsonMap.values) {
      if (value != null) {
        return false;
      }
    }
    return true;
  }

  /// Returns the energy in kJ for that [perSize], direct or computed from kcal.
  double? getComputedKJ(final PerSize perSize) {
    double? result;
    result = getValue(Nutrient.energyKJ, perSize);
    if (result != null) {
      return result;
    }
    result = getValue(Nutrient.energyKCal, perSize);
    if (result != null) {
      return NutrimentsHelper.fromKCalToKJ(result);
    }
    return null;
  }

  factory Nutriments.fromJson(Map<String, dynamic> json) =>
      Nutriments._fromMap(json);

  static Map<String, dynamic> toJsonHelper(Nutriments? n) => n?.toJson() ?? {};

  // TODO(monsieurtanuki): needs refactoring with the new nutrition system
  /// Transform the nutriments into a useful map for saving a product.
  Map<String, String> asSaveProductMap() {
    final Map<String, String> result = {};
    for (final Nutrient nutrient in Nutrient.values) {
      final String modifier = getModifier(nutrient)?.offTag ?? '';
      for (final PerSize perSize in PerSize.values) {
        final double? value = getValue(nutrient, perSize);
        if (value != null) {
          result['nutriment_${nutrient.offTag}'] = '$modifier$value';
        } else if (jsonMap.containsKey(_getTag(nutrient, perSize))) {
          result['nutriment_${nutrient.offTag}'] = '';
        }
      }
    }
    return result;
  }
}
