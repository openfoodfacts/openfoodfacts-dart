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
      'id': ?instance.id,
      'value': ?instance.value,
      'default_value': ?instance.defaultValue,
      'valued_converted': ?instance.valuedConverted,
    };
