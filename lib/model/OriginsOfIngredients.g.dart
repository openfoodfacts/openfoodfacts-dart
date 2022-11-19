// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OriginsOfIngredients.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OriginsOfIngredientsCWProxy {
  OriginsOfIngredients epiScore(double? epiScore);

  OriginsOfIngredients epiValue(double? epiValue);

  OriginsOfIngredients transportationScore(double? transportationScore);

  OriginsOfIngredients transportationValue(double? transportationValue);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OriginsOfIngredients(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OriginsOfIngredients(...).copyWith(id: 12, name: "My name")
  /// ````
  OriginsOfIngredients call({
    double? epiScore,
    double? epiValue,
    double? transportationScore,
    double? transportationValue,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOriginsOfIngredients.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOriginsOfIngredients.copyWith.fieldName(...)`
class _$OriginsOfIngredientsCWProxyImpl
    implements _$OriginsOfIngredientsCWProxy {
  final OriginsOfIngredients _value;

  const _$OriginsOfIngredientsCWProxyImpl(this._value);

  @override
  OriginsOfIngredients epiScore(double? epiScore) => this(epiScore: epiScore);

  @override
  OriginsOfIngredients epiValue(double? epiValue) => this(epiValue: epiValue);

  @override
  OriginsOfIngredients transportationScore(double? transportationScore) =>
      this(transportationScore: transportationScore);

  @override
  OriginsOfIngredients transportationValue(double? transportationValue) =>
      this(transportationValue: transportationValue);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OriginsOfIngredients(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OriginsOfIngredients(...).copyWith(id: 12, name: "My name")
  /// ````
  OriginsOfIngredients call({
    Object? epiScore = const $CopyWithPlaceholder(),
    Object? epiValue = const $CopyWithPlaceholder(),
    Object? transportationScore = const $CopyWithPlaceholder(),
    Object? transportationValue = const $CopyWithPlaceholder(),
  }) {
    return OriginsOfIngredients(
      epiScore: epiScore == const $CopyWithPlaceholder()
          ? _value.epiScore
          // ignore: cast_nullable_to_non_nullable
          : epiScore as double?,
      epiValue: epiValue == const $CopyWithPlaceholder()
          ? _value.epiValue
          // ignore: cast_nullable_to_non_nullable
          : epiValue as double?,
      transportationScore: transportationScore == const $CopyWithPlaceholder()
          ? _value.transportationScore
          // ignore: cast_nullable_to_non_nullable
          : transportationScore as double?,
      transportationValue: transportationValue == const $CopyWithPlaceholder()
          ? _value.transportationValue
          // ignore: cast_nullable_to_non_nullable
          : transportationValue as double?,
    );
  }
}

extension $OriginsOfIngredientsCopyWith on OriginsOfIngredients {
  /// Returns a callable class that can be used as follows: `instanceOfOriginsOfIngredients.copyWith(...)` or like so:`instanceOfOriginsOfIngredients.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OriginsOfIngredientsCWProxy get copyWith =>
      _$OriginsOfIngredientsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OriginsOfIngredients _$OriginsOfIngredientsFromJson(
        Map<String, dynamic> json) =>
    OriginsOfIngredients(
      epiScore: JsonObject.parseDouble(json['epi_score']),
      epiValue: JsonObject.parseDouble(json['epi_value']),
      transportationScore: JsonObject.parseDouble(json['transportation_score']),
      transportationValue: JsonObject.parseDouble(json['transportation_value']),
    );

Map<String, dynamic> _$OriginsOfIngredientsToJson(
    OriginsOfIngredients instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('epi_score', instance.epiScore);
  writeNotNull('epi_value', instance.epiValue);
  writeNotNull('transportation_score', instance.transportationScore);
  writeNotNull('transportation_value', instance.transportationValue);
  return val;
}
