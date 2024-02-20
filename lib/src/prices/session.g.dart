// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) => Session()
  ..userId = json['user_id'] as String
  ..created = JsonHelper.stringTimestampToDate(json['created'])
  ..lastUsed = JsonHelper.nullableStringTimestampToDate(json['last_used']);

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'user_id': instance.userId,
      'created': instance.created.toIso8601String(),
      'last_used': instance.lastUsed?.toIso8601String(),
    };
