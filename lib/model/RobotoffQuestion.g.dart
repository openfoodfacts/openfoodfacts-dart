// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RobotoffQuestion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RobotoffQuestionResult _$RobotoffQuestionResultFromJson(
        Map<String, dynamic> json) =>
    RobotoffQuestionResult(
      status: json['status'] as String?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => RobotoffQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RobotoffQuestionResultToJson(
        RobotoffQuestionResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'questions': instance.questions,
    };

RobotoffQuestion _$RobotoffQuestionFromJson(Map<String, dynamic> json) =>
    RobotoffQuestion(
      barcode: json['barcode'] as String?,
      type: json['type'] as String?,
      value: json['value'] as String?,
      question: json['question'] as String?,
      insightId: json['insight_id'] as String?,
      insightType: _$enumDecodeNullable(
          _$InsightTypeEnumMap, json['insight_type'],
          unknownValue: InsightType.UNKNOWN),
      imageUrl: json['source_image_url'] as String?,
    );

Map<String, dynamic> _$RobotoffQuestionToJson(RobotoffQuestion instance) =>
    <String, dynamic>{
      'barcode': instance.barcode,
      'type': instance.type,
      'value': instance.value,
      'question': instance.question,
      'insight_id': instance.insightId,
      'insight_type': _$InsightTypeEnumMap[instance.insightType],
      'source_image_url': instance.imageUrl,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$InsightTypeEnumMap = {
  InsightType.INGREDIENT_SPELLCHECK: 'ingredient_spellcheck',
  InsightType.PACKAGER_CODE: 'packager_code',
  InsightType.LABEL: 'label',
  InsightType.CATEGORY: 'category',
  InsightType.PRODUCT_WEIGHT: 'product_weight',
  InsightType.EXPIRATION_DATE: 'expiration_date',
  InsightType.BRAND: 'brand',
  InsightType.STORE: 'store',
  InsightType.NUTRIENT: 'nutrient',
  InsightType.UNDEFINED: 'undefined',
  InsightType.UNKNOWN: 'UNKNOWN',
};
