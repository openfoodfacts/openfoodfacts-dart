// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EventsBase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventsBase _$EventsBaseFromJson(Map<String, dynamic> json) => EventsBase(
      eventType: json['event_type'] as String,
      timestamp: JsonHelper.nullableStringTimestampToDate(json['timestamp']),
      userId: json['user_id'] as String?,
      barcode: json['barcode'] as String?,
      points: json['points'] as int?,
    );

Map<String, dynamic> _$EventsBaseToJson(EventsBase instance) =>
    <String, dynamic>{
      'event_type': instance.eventType,
      'timestamp': instance.timestamp?.toIso8601String(),
      'user_id': instance.userId,
      'barcode': instance.barcode,
      'points': instance.points,
    };
