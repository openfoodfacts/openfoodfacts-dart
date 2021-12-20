// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'KeyStats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KeyStats _$KeyStatsFromJson(Map<String, dynamic> json) => KeyStats(
      key: json['k'] as String,
      count: json['count'] as int,
      values: json['values'] as int,
    );

Map<String, dynamic> _$KeyStatsToJson(KeyStats instance) => <String, dynamic>{
      'k': instance.key,
      'count': instance.count,
      'values': instance.values,
    };
