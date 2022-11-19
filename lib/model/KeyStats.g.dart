// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'KeyStats.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$KeyStatsCWProxy {
  KeyStats count(int count);

  KeyStats key(String key);

  KeyStats values(int values);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `KeyStats(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// KeyStats(...).copyWith(id: 12, name: "My name")
  /// ````
  KeyStats call({
    int? count,
    String? key,
    int? values,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfKeyStats.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfKeyStats.copyWith.fieldName(...)`
class _$KeyStatsCWProxyImpl implements _$KeyStatsCWProxy {
  final KeyStats _value;

  const _$KeyStatsCWProxyImpl(this._value);

  @override
  KeyStats count(int count) => this(count: count);

  @override
  KeyStats key(String key) => this(key: key);

  @override
  KeyStats values(int values) => this(values: values);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `KeyStats(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// KeyStats(...).copyWith(id: 12, name: "My name")
  /// ````
  KeyStats call({
    Object? count = const $CopyWithPlaceholder(),
    Object? key = const $CopyWithPlaceholder(),
    Object? values = const $CopyWithPlaceholder(),
  }) {
    return KeyStats(
      count: count == const $CopyWithPlaceholder() || count == null
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int,
      key: key == const $CopyWithPlaceholder() || key == null
          ? _value.key
          // ignore: cast_nullable_to_non_nullable
          : key as String,
      values: values == const $CopyWithPlaceholder() || values == null
          ? _value.values
          // ignore: cast_nullable_to_non_nullable
          : values as int,
    );
  }
}

extension $KeyStatsCopyWith on KeyStats {
  /// Returns a callable class that can be used as follows: `instanceOfKeyStats.copyWith(...)` or like so:`instanceOfKeyStats.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$KeyStatsCWProxy get copyWith => _$KeyStatsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KeyStats _$KeyStatsFromJson(Map<String, dynamic> json) => KeyStats(
      key: json['k'] as String,
      count: json['count'] as int,
      values: json['values'] as int,
    );

Map<String, dynamic> _$KeyStatsToJson(KeyStats instance) => <String, dynamic>{
      'k': instance.key,
      'count': instance.count,
      'values': instance.values,
    };
