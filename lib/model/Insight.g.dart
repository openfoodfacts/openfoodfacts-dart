// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Insight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsightResult _$InsightResultFromJson(Map<String, dynamic> json) {
  return InsightResult(
    status: json['status'] as String,
    insight: json['insight'] == null
        ? null
        : Insight.fromJson(json['insight'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InsightResultToJson(InsightResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'insight': instance.insight,
    };

MultipleInsightResult _$MultipleInsightResultFromJson(
    Map<String, dynamic> json) {
  return MultipleInsightResult(
    status: json['status'] as String,
    insights: (json['insights'] as List)
        ?.map((e) =>
            e == null ? null : Insight.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MultipleInsightResultToJson(
        MultipleInsightResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'insights': instance.insights,
    };

Insight _$InsightFromJson(Map<String, dynamic> json) {
  return Insight(
    id: json['id'] as String,
    type: _$enumDecodeNullable(_$InsightTypeEnumMap, json['type']),
    barcode: json['barcode'] as String,
    countries: json['countries'] as List,
    lang: json['lang'] as String,
    model: json['model'] as String,
    confidence: (json['confidence'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$InsightToJson(Insight instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$InsightTypeEnumMap[instance.type],
      'barcode': instance.barcode,
      'countries': instance.countries,
      'lang': instance.lang,
      'model': instance.model,
      'confidence': instance.confidence,
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

const _$InsightTypeEnumMap = {
  InsightType.INGREDIENT_SPELLCHECK: 'INGREDIENT_SPELLCHECK',
  InsightType.PACKAGER_CODE: 'PACKAGER_CODE',
  InsightType.LABEL: 'LABEL',
  InsightType.CATEGORY: 'CATEGORY',
  InsightType.PRODUCT_WEIGHT: 'PRODUCT_WEIGHT',
  InsightType.EXPIRATION_DATE: 'EXPIRATION_DATE',
  InsightType.BRAND: 'BRAND',
  InsightType.STORE: 'STORE',
  InsightType.NUTRIENT: 'NUTRIENT',
  InsightType.UNDEFINED: 'UNDEFINED',
};
