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
      ..errors = ProductResultV3.fromJsonListAnswerForField(json['errors'])
      ..warnings = ProductResultV3.fromJsonListAnswerForField(json['warnings'])
      ..product = json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>);

Map<String, dynamic> _$ProductResultV3ToJson(ProductResultV3 instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.barcode);
  writeNotNull('result', instance.result);
  writeNotNull('status', instance.status);
  writeNotNull('errors', instance.errors);
  writeNotNull('warnings', instance.warnings);
  writeNotNull('product', instance.product);
  return val;
}
