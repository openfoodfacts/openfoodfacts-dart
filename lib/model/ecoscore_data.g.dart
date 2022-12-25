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
              json['adjustments'] as Map<String, dynamic>),
      missingDataWarning: json['missing_data_warning'] == null
          ? false
          : JsonObject.parseBool(json['missing_data_warning']),
    );

Map<String, dynamic> _$EcoscoreDataToJson(EcoscoreData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('grade', instance.grade);
  writeNotNull('score', instance.score);
  writeNotNull('status', _$EcoscoreStatusEnumMap[instance.status]);
  writeNotNull('agribalyse', instance.agribalyse?.toJson());
  writeNotNull('adjustments', instance.adjustments?.toJson());
  val['missing_data_warning'] = instance.missingDataWarning;
  return val;
}

const _$EcoscoreStatusEnumMap = {
  EcoscoreStatus.KNOWN: 'known',
  EcoscoreStatus.UNKNOWN: 'unknown',
};
