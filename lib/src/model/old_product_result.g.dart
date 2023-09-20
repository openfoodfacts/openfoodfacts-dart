// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'old_product_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OldProductResult _$OldProductResultFromJson(Map<String, dynamic> json) =>
    OldProductResult(
      status: json['status'] as int?,
      barcode: json['code'] as String?,
      statusVerbose: json['status_verbose'] as String?,
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OldProductResultToJson(OldProductResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.barcode,
      'status_verbose': instance.statusVerbose,
      'product': instance.product,
    };
