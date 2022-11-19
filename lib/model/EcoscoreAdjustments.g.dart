// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EcoscoreAdjustments.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EcoscoreAdjustmentsCWProxy {
  EcoscoreAdjustments originsOfIngredients(
      OriginsOfIngredients? originsOfIngredients);

  EcoscoreAdjustments packaging(Packaging? packaging);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EcoscoreAdjustments(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EcoscoreAdjustments(...).copyWith(id: 12, name: "My name")
  /// ````
  EcoscoreAdjustments call({
    OriginsOfIngredients? originsOfIngredients,
    Packaging? packaging,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEcoscoreAdjustments.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEcoscoreAdjustments.copyWith.fieldName(...)`
class _$EcoscoreAdjustmentsCWProxyImpl implements _$EcoscoreAdjustmentsCWProxy {
  final EcoscoreAdjustments _value;

  const _$EcoscoreAdjustmentsCWProxyImpl(this._value);

  @override
  EcoscoreAdjustments originsOfIngredients(
          OriginsOfIngredients? originsOfIngredients) =>
      this(originsOfIngredients: originsOfIngredients);

  @override
  EcoscoreAdjustments packaging(Packaging? packaging) =>
      this(packaging: packaging);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EcoscoreAdjustments(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EcoscoreAdjustments(...).copyWith(id: 12, name: "My name")
  /// ````
  EcoscoreAdjustments call({
    Object? originsOfIngredients = const $CopyWithPlaceholder(),
    Object? packaging = const $CopyWithPlaceholder(),
  }) {
    return EcoscoreAdjustments(
      originsOfIngredients: originsOfIngredients == const $CopyWithPlaceholder()
          ? _value.originsOfIngredients
          // ignore: cast_nullable_to_non_nullable
          : originsOfIngredients as OriginsOfIngredients?,
      packaging: packaging == const $CopyWithPlaceholder()
          ? _value.packaging
          // ignore: cast_nullable_to_non_nullable
          : packaging as Packaging?,
    );
  }
}

extension $EcoscoreAdjustmentsCopyWith on EcoscoreAdjustments {
  /// Returns a callable class that can be used as follows: `instanceOfEcoscoreAdjustments.copyWith(...)` or like so:`instanceOfEcoscoreAdjustments.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EcoscoreAdjustmentsCWProxy get copyWith =>
      _$EcoscoreAdjustmentsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcoscoreAdjustments _$EcoscoreAdjustmentsFromJson(Map<String, dynamic> json) =>
    EcoscoreAdjustments(
      packaging: json['packaging'] == null
          ? null
          : Packaging.fromJson(json['packaging'] as Map<String, dynamic>),
      originsOfIngredients: json['origins_of_ingredients'] == null
          ? null
          : OriginsOfIngredients.fromJson(
              json['origins_of_ingredients'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EcoscoreAdjustmentsToJson(EcoscoreAdjustments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('packaging', instance.packaging?.toJson());
  writeNotNull(
      'origins_of_ingredients', instance.originsOfIngredients?.toJson());
  return val;
}
