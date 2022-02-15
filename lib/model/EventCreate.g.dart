// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EventCreate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventCreate _$EventCreateFromJson(Map<String, dynamic> json) => EventCreate(
      eventType: json['event_type'] as String,
      timestamp: JsonHelper.nullableStringTimestampToDate(json['timestamp']),
      userId: json['user_id'] as String?,
      barcode: json['barcode'] as String?,
      points: json['points'] as int?,
      deviceId: json['device_id'] as String?,
    );

Map<String, dynamic> _$EventCreateToJson(EventCreate instance) =>
    <String, dynamic>{
      'event_type': instance.eventType,
      'timestamp': instance.timestamp?.toIso8601String(),
      'user_id': instance.userId,
      'barcode': instance.barcode,
      'points': instance.points,
      'device_id': instance.deviceId,
    };
