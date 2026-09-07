import '../nutrient_modifier.dart';
import '../../utils/unit_helper.dart';

/// Nutrition value for a nutrient.
class NutritionValue {
  NutritionValue({
    this.unit,
    this.valueString,
    this.value,
    this.valueComputed,
    this.modifier,
  });

  /// Unit. Important in write mode - would be defaulted if not set.
  final Unit? unit;

  /// Value as a String. To be used in write mode.
  final String? valueString;

  /// Numeric value.
  final num? value;

  /// Computed value. Read-only.
  final num? valueComputed;

  final NutrientModifier? modifier;

  String? getCleanString() {
    if (valueString == null) {
      return value?.toString();
    }
    // exponential notation: to be avoided!
    if (valueString!.contains('e')) {
      return value?.toString();
    }
    return valueString;
  }

  @override
  String toString() =>
      'NutritionValue($unit,$value,$valueString,$valueComputed,$modifier)';

  static NutritionValue? fromJson(final Map<String, dynamic> json) {
    final Unit? unit = UnitHelper.stringToUnit(json['unit']);
    if (unit == null) {
      return null;
    }
    final num? value = json['value'];
    final String? valueString = json['value_string'];
    final num? valueComputed = json['value_computed'];
    final NutrientModifier? modifier = NutrientModifier.fromOffTag(
      json['modifier'],
    );
    return NutritionValue(
      unit: unit,
      value: value,
      valueString: valueString,
      valueComputed: valueComputed,
      modifier: modifier,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'unit': ?unit?.offTag,
    'value': ?value,
    'value_string': ?valueString,
    'value_computed': ?valueComputed,
    'modifier': ?modifier?.offTag,
  };
}
