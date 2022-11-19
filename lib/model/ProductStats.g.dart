// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductStats.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProductStatsCWProxy {
  ProductStats barcode(String barcode);

  ProductStats lastEdit(DateTime lastEdit);

  ProductStats numberOfEditors(int numberOfEditors);

  ProductStats numberOfKeys(int numberOfKeys);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductStats(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductStats(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductStats call({
    String? barcode,
    DateTime? lastEdit,
    int? numberOfEditors,
    int? numberOfKeys,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProductStats.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProductStats.copyWith.fieldName(...)`
class _$ProductStatsCWProxyImpl implements _$ProductStatsCWProxy {
  final ProductStats _value;

  const _$ProductStatsCWProxyImpl(this._value);

  @override
  ProductStats barcode(String barcode) => this(barcode: barcode);

  @override
  ProductStats lastEdit(DateTime lastEdit) => this(lastEdit: lastEdit);

  @override
  ProductStats numberOfEditors(int numberOfEditors) =>
      this(numberOfEditors: numberOfEditors);

  @override
  ProductStats numberOfKeys(int numberOfKeys) =>
      this(numberOfKeys: numberOfKeys);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductStats(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductStats(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductStats call({
    Object? barcode = const $CopyWithPlaceholder(),
    Object? lastEdit = const $CopyWithPlaceholder(),
    Object? numberOfEditors = const $CopyWithPlaceholder(),
    Object? numberOfKeys = const $CopyWithPlaceholder(),
  }) {
    return ProductStats(
      barcode: barcode == const $CopyWithPlaceholder() || barcode == null
          ? _value.barcode
          // ignore: cast_nullable_to_non_nullable
          : barcode as String,
      lastEdit: lastEdit == const $CopyWithPlaceholder() || lastEdit == null
          ? _value.lastEdit
          // ignore: cast_nullable_to_non_nullable
          : lastEdit as DateTime,
      numberOfEditors: numberOfEditors == const $CopyWithPlaceholder() ||
              numberOfEditors == null
          ? _value.numberOfEditors
          // ignore: cast_nullable_to_non_nullable
          : numberOfEditors as int,
      numberOfKeys:
          numberOfKeys == const $CopyWithPlaceholder() || numberOfKeys == null
              ? _value.numberOfKeys
              // ignore: cast_nullable_to_non_nullable
              : numberOfKeys as int,
    );
  }
}

extension $ProductStatsCopyWith on ProductStats {
  /// Returns a callable class that can be used as follows: `instanceOfProductStats.copyWith(...)` or like so:`instanceOfProductStats.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProductStatsCWProxy get copyWith => _$ProductStatsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductStats _$ProductStatsFromJson(Map<String, dynamic> json) => ProductStats(
      barcode: json['product'] as String,
      numberOfKeys: json['keys'] as int,
      numberOfEditors: json['editors'] as int,
      lastEdit: JsonHelper.stringTimestampToDate(json['last_edit']),
    );

Map<String, dynamic> _$ProductStatsToJson(ProductStats instance) =>
    <String, dynamic>{
      'product': instance.barcode,
      'keys': instance.numberOfKeys,
      'editors': instance.numberOfEditors,
      'last_edit': instance.lastEdit.toIso8601String(),
    };
