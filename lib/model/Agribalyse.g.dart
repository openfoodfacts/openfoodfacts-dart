// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Agribalyse.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AgribalyseCWProxy {
  Agribalyse score(double? score);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Agribalyse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Agribalyse(...).copyWith(id: 12, name: "My name")
  /// ````
  Agribalyse call({
    double? score,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAgribalyse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAgribalyse.copyWith.fieldName(...)`
class _$AgribalyseCWProxyImpl implements _$AgribalyseCWProxy {
  final Agribalyse _value;

  const _$AgribalyseCWProxyImpl(this._value);

  @override
  Agribalyse score(double? score) => this(score: score);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Agribalyse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Agribalyse(...).copyWith(id: 12, name: "My name")
  /// ````
  Agribalyse call({
    Object? score = const $CopyWithPlaceholder(),
  }) {
    return Agribalyse(
      score: score == const $CopyWithPlaceholder()
          ? _value.score
          // ignore: cast_nullable_to_non_nullable
          : score as double?,
    );
  }
}

extension $AgribalyseCopyWith on Agribalyse {
  /// Returns a callable class that can be used as follows: `instanceOfAgribalyse.copyWith(...)` or like so:`instanceOfAgribalyse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AgribalyseCWProxy get copyWith => _$AgribalyseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Agribalyse _$AgribalyseFromJson(Map<String, dynamic> json) => Agribalyse(
      score: JsonObject.parseDouble(json['score']),
    );

Map<String, dynamic> _$AgribalyseToJson(Agribalyse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('score', instance.score);
  return val;
}
