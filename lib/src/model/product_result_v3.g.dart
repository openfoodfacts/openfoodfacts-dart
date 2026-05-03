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
      'code': ?instance.barcode,
      'result': ?instance.result,
      'status': ?instance.status,
      'errors': ?instance.errors,
      'warnings': ?instance.warnings,
      'product': ?instance.product,
    };
