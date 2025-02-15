import '../interface/json_object.dart';
import '../utils/nutriments_helper.dart';
import 'nutrient.dart';
import 'nutrient_modifier.dart';
import 'per_size.dart';

/// Values in nutrients.
class Nutriments extends JsonObject {
  /// Empty nutrient map.
  Nutriments.empty();

  /// Nutrient map with start values from [map].
  Nutriments._fromMap(final Map<String, dynamic> map) {
    for (final Nutrient nutrient in Nutrient.values) {
      final NutrientModifier? modifier = NutrientModifier.fromValue(
        map[_getModifierTag(nutrient)],
      );

      _modifierMap[nutrient.offTag] = modifier;

      if (modifier == NutrientModifier.notProvided) {
        // Even if values are provided by the server, they should be ignored
        // (= it's an error)
        continue;
      }

      for (final PerSize perSize in PerSize.values) {
        final String tag = _getTag(nutrient, perSize);
        try {
          final double? value = JsonObject.parseDouble(map[tag]);
          if (value != null) {
            _valueMap[tag] = value;
          } else if (map.containsKey(tag)) {
            // typical case when null means something: to erase a value
            _valueMap[tag] = null;
          }
        } catch (e) {
          throw Exception(
            'Could not parse the value for $nutrient and $perSize: ${map[tag]}',
          );
        }
      }
    }
  }

  /// Nutrient values.
  ///
  /// It is useful to store null values: this way we can make the difference
  /// between totally unknown values and values that have been erased.
  final Map<String, double?> _valueMap = <String, double?>{};
  final Map<String, NutrientModifier?> _modifierMap =
      <String, NutrientModifier?>{};

  /// Returns the map key for that [nutrient] and that [perSize].
  String _getTag(
    final Nutrient nutrient,
    final PerSize perSize,
  ) =>
      '${nutrient.offTag}_${perSize.offTag}';

  /// Returns the modifier key for a [nutrient]
  String _getModifierTag(final Nutrient nutrient) =>
      '${nutrient.offTag}_modifier';

  /// Returns the value in grams of that [nutrient] for that [perSize].
  ///
  /// It won't be grams for very specific nutrients, like [Nutrient.alcohol].
  double? getValue(final Nutrient nutrient, final PerSize perSize) =>
      _valueMap[_getTag(nutrient, perSize)];

  /// Returns the modifier for a [nutrient].
  NutrientModifier? getModifier(final Nutrient nutrient) =>
      _modifierMap[nutrient.offTag];

  /// Sets the value in grams of that [nutrient] for that [perSize].
  ///
  /// It won't be grams for very specific nutrients, like [Nutrient.alcohol].
  Nutriments setValue(
    final Nutrient nutrient,
    final PerSize perSize,
    final double? value, {
    final NutrientModifier? modifier,
  }) {
    if (modifier == NutrientModifier.notProvided) {
      if (value != null) {
        throw Exception(
          'When the modifier is set to "NutrientModifier.notProvided", the value must be null.',
        );
      }

      /// Reset all values
      for (final PerSize perSize in PerSize.values) {
        _valueMap.remove(_getTag(nutrient, perSize));
        _valueMap.remove(_getTag(nutrient, perSize));
      }
      _modifierMap[nutrient.offTag] = modifier;
      return this;
    }

    if (modifier != null && value == null) {
      throw Exception(
        'When the modifier is set, the value must not be null.',
      );
    }

    _valueMap[_getTag(nutrient, perSize)] = value;
    _modifierMap[nutrient.offTag] = modifier;
    return this;
  }

  /// Returns true if there are no populated nutrients at all.
  ///
  /// Default case: a nutrient with a null value is considered "populated".
  /// If [isNullEmpty] is true, a null value is a non populated value, and a
  /// [Nutriments] with only null values would be considered empty.
  bool isEmpty({final bool isNullEmpty = false}) {
    if (_valueMap.isEmpty) {
      return true;
    }
    if (!isNullEmpty) {
      return false;
    }
    for (final double? value in _valueMap.values) {
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

  /// Returns a JSON version of the [Nutriments].
  ///
  /// When we want to erase a value, we need to set the value to `''`.
  /// If we put `null` instead the server will interpret it as `0`.
  /// If we don't set a value the server will keep the previous value.
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};
    for (final Nutrient nutrient in Nutrient.values) {
      String modifierChar = _modifierMap[nutrient.offTag]?.offTag ?? '';

      for (final PerSize perSize in PerSize.values) {
        final String tag = _getTag(nutrient, perSize);
        final double? value = _valueMap[tag];
        if (value != null) {
          result[tag] = '$modifierChar$value';
        } else if (_valueMap.containsKey(tag)) {
          result[tag] = '';
        }
      }
    }

    return result;
  }

  static Map<String, dynamic> toJsonHelper(Nutriments? n) => n?.toJson() ?? {};
}
