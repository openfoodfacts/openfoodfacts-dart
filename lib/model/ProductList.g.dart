// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductList.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProductListCWProxy {
  ProductList barcode(String barcode);

  ProductList key(String key);

  ProductList value(String value);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductList(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductList call({
    String? barcode,
    String? key,
    String? value,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProductList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProductList.copyWith.fieldName(...)`
class _$ProductListCWProxyImpl implements _$ProductListCWProxy {
  final ProductList _value;

  const _$ProductListCWProxyImpl(this._value);

  @override
  ProductList barcode(String barcode) => this(barcode: barcode);

  @override
  ProductList key(String key) => this(key: key);

  @override
  ProductList value(String value) => this(value: value);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductList(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductList call({
    Object? barcode = const $CopyWithPlaceholder(),
    Object? key = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
  }) {
    return ProductList(
      barcode: barcode == const $CopyWithPlaceholder() || barcode == null
          ? _value.barcode
          // ignore: cast_nullable_to_non_nullable
          : barcode as String,
      key: key == const $CopyWithPlaceholder() || key == null
          ? _value.key
          // ignore: cast_nullable_to_non_nullable
          : key as String,
      value: value == const $CopyWithPlaceholder() || value == null
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as String,
    );
  }
}

extension $ProductListCopyWith on ProductList {
  /// Returns a callable class that can be used as follows: `instanceOfProductList.copyWith(...)` or like so:`instanceOfProductList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProductListCWProxy get copyWith => _$ProductListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductList _$ProductListFromJson(Map<String, dynamic> json) => ProductList(
      barcode: json['product'] as String,
      key: json['k'] as String,
      value: json['v'] as String,
    );

Map<String, dynamic> _$ProductListToJson(ProductList instance) =>
    <String, dynamic>{
      'product': instance.barcode,
      'k': instance.key,
      'v': instance.value,
    };
