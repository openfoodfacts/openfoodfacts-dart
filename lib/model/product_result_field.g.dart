// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_result_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResultField _$ProductResultFieldFromJson(Map<String, dynamic> json) =>
    ProductResultField()
      ..id = json['id'] as String?
      ..value = json['value'] as String?
      ..defaultValue = json['default_value'] as String?;

Map<String, dynamic> _$ProductResultFieldToJson(ProductResultField instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('value', instance.value);
  writeNotNull('default_value', instance.defaultValue);
  return val;
}
