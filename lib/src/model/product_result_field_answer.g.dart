// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_result_field_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResultFieldAnswer _$ProductResultFieldAnswerFromJson(
  Map<String, dynamic> json,
) => ProductResultFieldAnswer()
  ..field = json['field'] == null
      ? null
      : ProductResultField.fromJson(json['field'] as Map<String, dynamic>)
  ..impact = json['impact'] == null
      ? null
      : LocalizedTag.fromJson(json['impact'] as Map<String, dynamic>)
  ..message = json['message'] == null
      ? null
      : LocalizedTag.fromJson(json['message'] as Map<String, dynamic>);

Map<String, dynamic> _$ProductResultFieldAnswerToJson(
  ProductResultFieldAnswer instance,
) => <String, dynamic>{
  'field': ?instance.field,
  'impact': ?instance.impact,
  'message': ?instance.message,
};
