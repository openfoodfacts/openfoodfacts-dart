import 'package:json_annotation/json_annotation.dart';

import '../interface/json_object.dart';
import '../utils/nutriments_helper.dart';
import 'nutrient.dart';
import 'per_size.dart';

/// Values in nutrients.
class Nutriments extends JsonObject {
  /// Empty nutrient map.
  Nutriments.empty();

  /// Nutrient map with start values from [map].
  Nutriments._fromMap(final Map<String, dynamic> map) {
    for (final Nutrient nutrient in Nutrient.values) {
      for (final PerSize perSize in PerSize.values) {
        final String tag = _getTag(nutrient, perSize);
        try {
          final double? value = JsonObject.parseDouble(map[tag]);

          if (value != null) {
            _map[tag] = NutrimentValue._fromMap(map, tag);
            continue;
          }

          final NutrimentModifier? modifier = NutrimentModifier.fromValue(
            _getModifierFromTag(tag),
          );

          if (modifier == NutrimentModifier.noValue) {
            // Ignore the value, even if it's provided
            // (it's an error that we must override)
            _map[tag] = NutrimentValue.noValueProvided();
          } else if (map.containsKey(tag)) {
            // typical case when null means something: to erase a value
            _map[tag] = null;
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
  final Map<String, NutrimentValue?> _map = <String, NutrimentValue?>{};

  /// Returns the map key for that [nutrient] and that [perSize].
  String _getTag(
    final Nutrient nutrient,
    final PerSize perSize,
  ) =>
      '${nutrient.offTag}_${perSize.offTag}';

  /// Returns the map modifier key for that [nutrient] and that [perSize].
  /// Eg: 'fat_modifier' for fat.
  String _getModifierFromTag(final String tag) => '${tag}_modifier';

  /// Returns the value in grams of that [nutrient] for that [perSize].
  ///
  /// It won't be grams for very specific nutrients, like [Nutrient.alcohol].
  /// TODO: deprecated from 2024-04-18, remove when old enough
  @Deprecated('Use getNutrimentValue instead')
  double? getValue(final Nutrient nutrient, final PerSize perSize) =>
      _map[_getTag(nutrient, perSize)]?.value;

  NutrimentValue? getNutrimentValue(
    final Nutrient nutrient,
    final PerSize perSize,
  ) {
    final String tag = _getTag(nutrient, perSize);
    final String modifierTag = _getModifierFromTag(tag);
    if (!_map.containsKey(tag) && !_map.containsKey(modifierTag)) {
      return null;
    }
    return NutrimentValue._fromMap(_map, tag);
  }

  /// Sets the value in grams of that [nutrient] for that [perSize].
  ///
  /// It won't be grams for very specific nutrients, like [Nutrient.alcohol].
  /// TODO: deprecated from 2024-04-18, remove when old enough
  @Deprecated('Use setNutrimentValue instead')
  Nutriments setValue(
    final Nutrient nutrient,
    final PerSize perSize,
    final double? value,
  ) {
    _map[_getTag(nutrient, perSize)] = NutrimentValue(value: value);
    return this;
  }

  /// Sets the value in grams of that [nutrient] for that [perSize].
  ///
  /// It won't be grams for very specific nutrients, like [Nutrient.alcohol].
  Nutriments setNutrimentValue(
    final Nutrient nutrient,
    final PerSize perSize,
    final NutrimentValue? value,
  ) {
    _map[_getTag(nutrient, perSize)] = value;
    return this;
  }

  /// Returns true if there are no populated nutrients at all.
  ///
  /// Default case: a nutrient with a null value is considered "populated".
  /// If [isNullEmpty] is true, a null value is a non populated value, and a
  /// [Nutriments] with only null values would be considered empty.
  bool isEmpty({final bool isNullEmpty = false}) {
    if (_map.isEmpty) {
      return true;
    }
    if (!isNullEmpty) {
      return false;
    }
    for (final NutrimentValue? value in _map.values) {
      if (value != null) {
        return false;
      }
    }
    return true;
  }

  /// Returns the energy in kJ for that [perSize], direct or computed from kcal.
  /// TODO: deprecated from 2024-04-18, remove when old enough
  @Deprecated('Use getNutrimentComputedKJ instead')
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

  /// Returns the energy in kJ for that [perSize], direct or computed from kcal.
  NutrimentValue? getNutrimentComputedKJ(final PerSize perSize) {
    NutrimentValue? result;
    result = getNutrimentValue(Nutrient.energyKJ, perSize);
    if (result != null) {
      return result;
    }
    result = getNutrimentValue(Nutrient.energyKCal, perSize);
    if (result != null) {
      if (result.value != null) {
        return NutrimentValue(
          value: NutrimentsHelper.fromKCalToKJ(result.value!),
          modifier: result.modifier,
        );
      } else {
        return NutrimentValue(modifier: result.modifier);
      }
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
      for (final PerSize perSize in PerSize.values) {
        final String tag = _getTag(nutrient, perSize);
        final String modifierTag = _getModifierFromTag(tag);
        final NutrimentValue? value = _map[tag];
        if (value != null) {
          result[tag] = value.value;
          result[modifierTag] = value.modifier?.value ?? '';
        } else if (_map.containsKey(tag)) {
          result[tag] = '';
          result[modifierTag] = '';
        }
      }
    }
    return result;
  }

  static Map<String, dynamic> toJsonHelper(Nutriments? n) => n?.toJson() ?? {};
}

class NutrimentValue {
  final double? value;
  final NutrimentModifier? modifier;

  NutrimentValue({this.value, this.modifier})
      : assert(
          modifier == NutrimentModifier.noValue ? value == null : true,
          'Value should be null when modifier is noValue',
        ),
        assert(
          [
            NutrimentModifier.moreThan,
            NutrimentModifier.lessThan,
            NutrimentModifier.approximately
          ].contains(modifier)
              ? value != null
              : true,
          'Value should not be null when modifier is moreThan, lessThan or approximately',
        );

  /// No value provided means no value on the packaging.
  /// And it's not the same as the user doesn't know the value.
  NutrimentValue.noValueProvided()
      : value = null,
        modifier = NutrimentModifier.noValue;

  NutrimentValue._fromMap(Map<String, dynamic> map, String tag)
      : this(
          value: map[tag],
          modifier: NutrimentModifier.fromValue(map['${tag}_modifier']),
        );

  /// You can format the data yourself, or use this method
  String? get formattedValue {
    if (modifier == NutrimentModifier.noValue) {
      return modifier!.value;
    } else if (modifier != null) {
      return '${modifier!.value} $value';
    } else {
      return value?.toString();
    }
  }
}

enum NutrimentModifier {
  @JsonValue('-')
  noValue('-'),
  @JsonValue('>')
  moreThan('>'),
  @JsonValue('<')
  lessThan('<'),
  @JsonValue('~')
  approximately('~');

  final String value;

  const NutrimentModifier(this.value);

  static NutrimentModifier? fromValue(String? value) {
    try {
      return NutrimentModifier.values
          .firstWhere((NutrimentModifier item) => item.value == value);
    } catch (_) {
      return null;
    }
  }
}
