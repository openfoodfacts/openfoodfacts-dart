// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecoscore_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcoscoreData _$EcoscoreDataFromJson(Map<String, dynamic> json) => EcoscoreData(
  grade: json['grade'] as String?,
  score: JsonObject.parseDouble(json['score']),
  status: $enumDecodeNullable(_$EcoscoreStatusEnumMap, json['status']),
  agribalyse: json['agribalyse'] == null
      ? null
      : Agribalyse.fromJson(json['agribalyse'] as Map<String, dynamic>),
  adjustments: json['adjustments'] == null
      ? null
      : EcoscoreAdjustments.fromJson(
          json['adjustments'] as Map<String, dynamic>,
        ),
  missingDataWarning: json['missing_data_warning'] == null
      ? false
      : JsonObject.parseBool(json['missing_data_warning']),
);

Map<String, dynamic> _$EcoscoreDataToJson(EcoscoreData instance) =>
    <String, dynamic>{
      'grade': ?instance.grade,
      'score': ?instance.score,
      'status': ?_$EcoscoreStatusEnumMap[instance.status],
      'agribalyse': ?instance.agribalyse?.toJson(),
      'adjustments': ?instance.adjustments?.toJson(),
      'missing_data_warning': instance.missingDataWarning,
    };

const _$EcoscoreStatusEnumMap = {
  EcoscoreStatus.KNOWN: 'known',
  EcoscoreStatus.UNKNOWN: 'unknown',
};
