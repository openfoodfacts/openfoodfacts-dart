// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_result_v3.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResultV3 _$ProductResultV3FromJson(Map<String, dynamic> json) =>
    ProductResultV3()
      ..barcode = json['code'] as String?
      ..result = json['result'] == null
          ? null
          : LocalizedTag.fromJson(json['result'] as Map<String, dynamic>)
      ..status = json['status'] as String?
      ..errors = ProductResultV3._fromJsonListAnswerForField(json['errors'])
      ..warnings = ProductResultV3._fromJsonListAnswerForField(json['warnings'])
      ..product = json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>);

Map<String, dynamic> _$ProductResultV3ToJson(ProductResultV3 instance) =>
    <String, dynamic>{
      if (instance.barcode case final value?) 'code': value,
      if (instance.result case final value?) 'result': value,
      if (instance.status case final value?) 'status': value,
      if (instance.errors case final value?) 'errors': value,
      if (instance.warnings case final value?) 'warnings': value,
      if (instance.product case final value?) 'product': value,
    };
