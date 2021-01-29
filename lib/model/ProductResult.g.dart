// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResult _$ProductResultFromJson(Map<String, dynamic> json) {
  return ProductResult(
    status: json['status'] as int,
    barcode: json['code'] as String,
    statusVerbose: json['status_verbose'] as String,
    product: json['product'] == null
        ? null
        : Product.fromJson(json['product'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProductResultToJson(ProductResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.barcode,
      'status_verbose': instance.statusVerbose,
      'product': instance.product,
    };
