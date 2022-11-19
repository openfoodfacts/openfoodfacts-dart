// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Packaging.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PackagingCWProxy {
  Packaging score(double? score);

  Packaging value(double? value);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Packaging(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Packaging(...).copyWith(id: 12, name: "My name")
  /// ````
  Packaging call({
    double? score,
    double? value,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPackaging.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPackaging.copyWith.fieldName(...)`
class _$PackagingCWProxyImpl implements _$PackagingCWProxy {
  final Packaging _value;

  const _$PackagingCWProxyImpl(this._value);

  @override
  Packaging score(double? score) => this(score: score);

  @override
  Packaging value(double? value) => this(value: value);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Packaging(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Packaging(...).copyWith(id: 12, name: "My name")
  /// ````
  Packaging call({
    Object? score = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
  }) {
    return Packaging(
      score: score == const $CopyWithPlaceholder()
          ? _value.score
          // ignore: cast_nullable_to_non_nullable
          : score as double?,
      value: value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as double?,
    );
  }
}

extension $PackagingCopyWith on Packaging {
  /// Returns a callable class that can be used as follows: `instanceOfPackaging.copyWith(...)` or like so:`instanceOfPackaging.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PackagingCWProxy get copyWith => _$PackagingCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Packaging _$PackagingFromJson(Map<String, dynamic> json) => Packaging(
      score: JsonObject.parseDouble(json['score']),
      value: JsonObject.parseDouble(json['value']),
    );

Map<String, dynamic> _$PackagingToJson(Packaging instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('value', instance.value);
  writeNotNull('score', instance.score);
  return val;
}
