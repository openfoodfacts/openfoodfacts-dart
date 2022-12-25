// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_result_field_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResultFieldAnswer _$ProductResultFieldAnswerFromJson(
        Map<String, dynamic> json) =>
    ProductResultFieldAnswer()
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
    ProductResultFieldAnswer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('field', instance.field);
  writeNotNull('impact', instance.impact);
  writeNotNull('message', instance.message);
  return val;
}
