// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proof_prediction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProofPrediction _$ProofPredictionFromJson(Map<String, dynamic> json) =>
    ProofPrediction()
      ..type = json['type'] as String?
      ..modelName = json['model_name'] as String?
      ..modelVersion = json['model_version'] as String?
      ..data = json['data'] as Map<String, dynamic>?
      ..value = json['value']
      ..maxConfidence = json['max_confidence'] as num?
      ..created = JsonHelper.nullableStringTimestampToDate(json['created']);

Map<String, dynamic> _$ProofPredictionToJson(ProofPrediction instance) =>
    <String, dynamic>{
      'type': instance.type,
      'model_name': instance.modelName,
      'model_version': instance.modelVersion,
      'data': instance.data,
      'value': instance.value,
      'max_confidence': instance.maxConfidence,
      'created': instance.created?.toIso8601String(),
    };
