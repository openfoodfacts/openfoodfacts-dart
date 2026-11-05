// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_tag_prediction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceTagPrediction _$PriceTagPredictionFromJson(Map<String, dynamic> json) =>
    PriceTagPrediction()
      ..type = $enumDecodeNullable(
        _$PriceTagPredictionTypeEnumMap,
        json['type'],
      )
      ..modelName = json['model_name'] as String?
      ..modelVersion = json['model_version'] as String?
      ..schemaVersion = json['schema_version'] as String?
      ..data = json['data'] as Map<String, dynamic>?
      ..created = JsonHelper.nullableStringTimestampToDate(json['created']);

Map<String, dynamic> _$PriceTagPredictionToJson(PriceTagPrediction instance) =>
    <String, dynamic>{
      'type': _$PriceTagPredictionTypeEnumMap[instance.type],
      'model_name': instance.modelName,
      'model_version': instance.modelVersion,
      'schema_version': instance.schemaVersion,
      'data': instance.data,
      'created': instance.created?.toIso8601String(),
    };

const _$PriceTagPredictionTypeEnumMap = {
  PriceTagPredictionType.priceTagExtraction: 'PRICE_TAG_EXTRACTION',
  PriceTagPredictionType.priceTagClf: 'PRICE_TAG_CLF',
};
