import 'nutrient.dart';
import 'nutrient_modifier.dart';
import 'per_size.dart';
import '../external/json_map.dart';
import '../interface/json_object.dart';
import '../utils/nutriments_helper.dart';
import '../utils/unit_helper.dart';

/// Values in nutrients.
///
/// Most interesting methods are:
/// * [setValue]
/// * [getValue]
/// * [getUnit]
/// * [getModifier]
class Nutriments extends JsonMap {
  /// Empty nutrient map.
  Nutriments.empty() : super(<String, dynamic>{});

  /// Nutrient map with start values from [map].
  Nutriments._fromMap(super.map);

  /// Returns the value map key for that [nutrient] and that [perSize].
  String _getValuePerSizeTag(final Nutrient nutrient, final PerSize perSize) =>
      '${nutrient.offTag}_${perSize.offTag}';

  /// Returns the value map key for that [nutrient].
  String _getValueTag(final Nutrient nutrient) => '${nutrient.offTag}_value';

  /// Returns the unit map key for that [nutrient].
  String _getUnitTag(final Nutrient nutrient) => '${nutrient.offTag}_unit';

  /// Returns the modifier map key for that [nutrient].
  String _getModifierTag(final Nutrient nutrient) =>
      '${nutrient.offTag}_modifier';

  /// Returns the computed value of that [nutrient] for that [perSize].
  ///
  /// Typical use-case is when the "real" unit is "% DV" or "IU": with that
  /// method we get the computed value, in grams for weight.
  /// Rather use [getValue] and [getUnit] instead.
  double? getComputedValue(final Nutrient nutrient, final PerSize perSize) =>
      JsonObject.parseDouble(jsonMap[_getValuePerSizeTag(nutrient, perSize)]);

  /// Returns the value of that [nutrient].
  ///
  /// See also: [getUnit], [getModifier].
  double? getValue(final Nutrient nutrient) {
    final dynamic item = jsonMap[_getValueTag(nutrient)];
    if (item == '') {
      return null;
    }
    return JsonObject.parseDouble(item);
  }

  /// Returns the unit of that [nutrient].
  ///
  /// See also: [getValue], [getModifier].
  Unit? getUnit(final Nutrient nutrient) =>
      UnitHelper.stringToUnit(jsonMap[_getUnitTag(nutrient)]);

  /// Returns the unit of that [nutrient].
  ///
  /// See also: [getValue], [getUnit].
  NutrientModifier? getModifier(final Nutrient nutrient) =>
      NutrientModifier.fromOffTag(jsonMap[_getModifierTag(nutrient)]);

  /// Sets the value, unit and possibly modifier of that [nutrient].
  ///
  /// [modifier] is most of the time null, and in that case means "equals".
  Nutriments setValue(
    final Nutrient nutrient,
    final double value, {
    required final Unit unit,
    final NutrientModifier? modifier,
  }) => _set(nutrient, value: value, unit: unit, modifier: modifier);

  Nutriments deleteValue(final Nutrient nutrient) =>
      _set(nutrient, value: null);

  Nutriments setValueAsNotSpecified(final Nutrient nutrient) =>
      _set(nutrient, modifier: NutrientModifier.valueNotSpecified);

  Nutriments _set(
    final Nutrient nutrient, {
    final double? value,
    final Unit? unit,
    final NutrientModifier? modifier,
  }) {
    jsonMap[_getValueTag(nutrient)] = value ?? '';
    jsonMap[_getUnitTag(nutrient)] = unit?.offTag ?? '';
    jsonMap[_getModifierTag(nutrient)] = modifier?.offTag ?? '';
    return this;
  }

  /// Returns true if there are no populated nutrients at all.
  bool isEmpty() => jsonMap.isEmpty;

  /// Returns the energy in kJ for that [perSize], direct or computed from kcal.
  double? getComputedKJ(final PerSize perSize) {
    double? result;
    result = getComputedValue(Nutrient.energyKJ, perSize);
    if (result != null) {
      return result;
    }
    result = getComputedValue(Nutrient.energyKCal, perSize);
    if (result != null) {
      return NutrimentsHelper.fromKCalToKJ(result);
    }
    return null;
  }

  factory Nutriments.fromJson(Map<String, dynamic> json) =>
      Nutriments._fromMap(json);

  static Map<String, dynamic> toJsonHelper(Nutriments? n) => n?.toJson() ?? {};
}
