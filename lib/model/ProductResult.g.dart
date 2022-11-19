// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductResult.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProductResultCWProxy {
  ProductResult barcode(String? barcode);

  ProductResult product(Product? product);

  ProductResult status(int? status);

  ProductResult statusVerbose(String? statusVerbose);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductResult(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductResult call({
    String? barcode,
    Product? product,
    int? status,
    String? statusVerbose,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProductResult.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProductResult.copyWith.fieldName(...)`
class _$ProductResultCWProxyImpl implements _$ProductResultCWProxy {
  final ProductResult _value;

  const _$ProductResultCWProxyImpl(this._value);

  @override
  ProductResult barcode(String? barcode) => this(barcode: barcode);

  @override
  ProductResult product(Product? product) => this(product: product);

  @override
  ProductResult status(int? status) => this(status: status);

  @override
  ProductResult statusVerbose(String? statusVerbose) =>
      this(statusVerbose: statusVerbose);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductResult(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductResult call({
    Object? barcode = const $CopyWithPlaceholder(),
    Object? product = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? statusVerbose = const $CopyWithPlaceholder(),
  }) {
    return ProductResult(
      barcode: barcode == const $CopyWithPlaceholder()
          ? _value.barcode
          // ignore: cast_nullable_to_non_nullable
          : barcode as String?,
      product: product == const $CopyWithPlaceholder()
          ? _value.product
          // ignore: cast_nullable_to_non_nullable
          : product as Product?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as int?,
      statusVerbose: statusVerbose == const $CopyWithPlaceholder()
          ? _value.statusVerbose
          // ignore: cast_nullable_to_non_nullable
          : statusVerbose as String?,
    );
  }
}

extension $ProductResultCopyWith on ProductResult {
  /// Returns a callable class that can be used as follows: `instanceOfProductResult.copyWith(...)` or like so:`instanceOfProductResult.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProductResultCWProxy get copyWith => _$ProductResultCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResult _$ProductResultFromJson(Map<String, dynamic> json) =>
    ProductResult(
      status: json['status'] as int?,
      barcode: json['code'] as String?,
      statusVerbose: json['status_verbose'] as String?,
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductResultToJson(ProductResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.barcode,
      'status_verbose': instance.statusVerbose,
      'product': instance.product,
    };
