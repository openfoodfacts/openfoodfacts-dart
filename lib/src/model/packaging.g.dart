// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packaging.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Packaging _$PackagingFromJson(Map<String, dynamic> json) => Packaging(
  score: JsonObject.parseDouble(json['score']),
  value: JsonObject.parseDouble(json['value']),
);

Map<String, dynamic> _$PackagingToJson(Packaging instance) => <String, dynamic>{
  'value': ?instance.value,
  'score': ?instance.score,
};
