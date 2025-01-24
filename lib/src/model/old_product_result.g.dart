// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'old_product_result.dart';

// ignore_for_file: deprecated_member_use_from_same_package

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OldProductResult _$OldProductResultFromJson(Map<String, dynamic> json) =>
    OldProductResult(
      status: (json['status'] as num?)?.toInt(),
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
