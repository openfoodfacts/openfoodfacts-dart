// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KeyStats _$KeyStatsFromJson(Map<String, dynamic> json) => KeyStats(
      key: json['k'] as String,
      count: (json['count'] as num).toInt(),
      values: (json['values'] as num).toInt(),
    );

Map<String, dynamic> _$KeyStatsToJson(KeyStats instance) => <String, dynamic>{
      'k': instance.key,
      'count': instance.count,
      'values': instance.values,
    };
