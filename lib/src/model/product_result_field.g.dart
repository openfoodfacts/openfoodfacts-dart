// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_result_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResultField _$ProductResultFieldFromJson(Map<String, dynamic> json) =>
    ProductResultField()
      ..id = json['id'] as String?
      ..value = JsonHelper.stringFromJSON(json['value'])
      ..defaultValue = JsonHelper.stringFromJSON(json['default_value'])
      ..valuedConverted = JsonHelper.stringFromJSON(json['valued_converted']);

Map<String, dynamic> _$ProductResultFieldToJson(ProductResultField instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.value case final value?) 'value': value,
      if (instance.defaultValue case final value?) 'default_value': value,
      if (instance.valuedConverted case final value?) 'valued_converted': value,
    };
