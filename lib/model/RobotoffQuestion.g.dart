// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RobotoffQuestion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RobotoffQuestionResult _$RobotoffQuestionResultFromJson(
    Map<String, dynamic> json) {
  return RobotoffQuestionResult(
    status: json['status'] as String,
    questions: (json['questions'] as List)
        ?.map((e) => e == null
            ? null
            : RobotoffQuestion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RobotoffQuestionResultToJson(
        RobotoffQuestionResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'questions': instance.questions,
    };

RobotoffQuestion _$RobotoffQuestionFromJson(Map<String, dynamic> json) {
  return RobotoffQuestion(
    barcode: json['barcode'] as String,
    type: json['type'] as String,
    value: json['value'] as String,
    question: json['question'] as String,
    insightId: json['insight_id'] as String,
    insightType:
        _$enumDecodeNullable(_$InsightTypesEnumMap, json['insight_type']),
    imageUrl: json['source_image_url'] as String,
  );
}

Map<String, dynamic> _$RobotoffQuestionToJson(RobotoffQuestion instance) =>
    <String, dynamic>{
      'barcode': instance.barcode,
      'type': instance.type,
      'value': instance.value,
      'question': instance.question,
      'insight_id': instance.insightId,
      'insight_type': _$InsightTypesEnumMap[instance.insightType],
      'source_image_url': instance.imageUrl,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$InsightTypesEnumMap = {
  InsightTypes.INGREDIENT_SPELLCHECK: 'INGREDIENT_SPELLCHECK',
  InsightTypes.PACKAGER_CODE: 'PACKAGER_CODE',
  InsightTypes.LABEL: 'LABEL',
  InsightTypes.CATEGORY: 'CATEGORY',
  InsightTypes.PRODUCT_WEIGHT: 'PRODUCT_WEIGHT',
  InsightTypes.EXPIRATION_DATE: 'EXPIRATION_DATE',
  InsightTypes.BRAND: 'BRAND',
  InsightTypes.STORE: 'STORE',
  InsightTypes.NUTRIENT: 'NUTRIENT',
  InsightTypes.UNDEFINED: 'UNDEFINED',
};
