// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_tag_prediction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceTagPrediction _$PriceTagPredictionFromJson(Map<String, dynamic> json) =>
    PriceTagPrediction()
      ..type = json['type'] as String?
      ..modelName = json['model_name'] as String?
      ..modelVersion = json['model_version'] as String?
      ..schemaVersion = json['schema_version'] as String?
      ..data = json['data'] as Map<String, dynamic>?
      ..created = JsonHelper.nullableStringTimestampToDate(json['created']);

Map<String, dynamic> _$PriceTagPredictionToJson(PriceTagPrediction instance) =>
    <String, dynamic>{
      'type': instance.type,
      'model_name': instance.modelName,
      'model_version': instance.modelVersion,
      'schema_version': instance.schemaVersion,
      'data': instance.data,
      'created': instance.created?.toIso8601String(),
    };
