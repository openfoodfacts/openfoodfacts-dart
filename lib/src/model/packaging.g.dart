// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packaging.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Packaging _$PackagingFromJson(Map<String, dynamic> json) => Packaging(
      score: JsonObject.parseDouble(json['score']),
      value: JsonObject.parseDouble(json['value']),
    );

Map<String, dynamic> _$PackagingToJson(Packaging instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('value', instance.value);
  writeNotNull('score', instance.score);
  return val;
}
