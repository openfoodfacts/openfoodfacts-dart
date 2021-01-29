// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EcoscoreData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcoscoreData _$EcoscoreDataFromJson(Map<String, dynamic> json) {
  return EcoscoreData(
    grade: json['grade'] as String,
    score: JsonObject.parseDouble(json['score']),
    status: _$enumDecodeNullable(_$EcoscoreStatusEnumMap, json['status']),
    adjustments: json['adjustments'] == null
        ? null
        : EcoscoreAdjustments.fromJson(
            json['adjustments'] as Map<String, dynamic>),
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
  writeNotNull('adjustments', instance.adjustments);
  return val;
}

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

const _$EcoscoreStatusEnumMap = {
  EcoscoreStatus.KNOWN: 'known',
  EcoscoreStatus.UNKNOWN: 'unknown',
};
