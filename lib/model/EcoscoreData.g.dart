// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EcoscoreData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcoscoreData _$EcoscoreDataFromJson(Map<String, dynamic> json) {
  return EcoscoreData(
    grade: json['grade'] as String?,
    score: JsonObject.parseDouble(json['score']),
    status: _$enumDecodeNullable(_$EcoscoreStatusEnumMap, json['status']),
    agribalyse: json['agribalyse'] == null
        ? null
        : Agribalyse.fromJson(json['agribalyse'] as Map<String, dynamic>),
    adjustments: json['adjustments'] == null
        ? null
        : EcoscoreAdjustments.fromJson(
            json['adjustments'] as Map<String, dynamic>),
    missingDataWarning: JsonObject.parseBool(json['missing_data_warning']),
  );
}

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

const _$EcoscoreStatusEnumMap = {
  EcoscoreStatus.KNOWN: 'known',
  EcoscoreStatus.UNKNOWN: 'unknown',
};
