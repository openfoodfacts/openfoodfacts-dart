// ignore_for_file: deprecated_member_use_from_same_package
// That's a bit ugly, but we need the previous line in order to pass the pub.dev
// tests, so put that line back after code generation.
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_result.dart';

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
