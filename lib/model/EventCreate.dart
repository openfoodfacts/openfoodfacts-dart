import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/utils/JsonHelper.dart';
import '../interface/JsonObject.dart';

part 'EventCreate.g.dart';

/// Events API: event create.
@JsonSerializable()
class EventCreate extends JsonObject {
  @JsonKey(name: 'event_type')
  final String eventType;

  @JsonKey(fromJson: JsonHelper.nullableStringTimestampToDate)
  final DateTime? timestamp;

  @JsonKey(name: 'user_id')
  final String? userId;

  @JsonKey()
  final String? barcode;

  @JsonKey()
  final int? points;

  @JsonKey(name: 'device_id')
  final String? deviceId;

  EventCreate({
    required this.eventType,
    this.timestamp,
    this.userId,
    this.barcode,
    this.points,
    this.deviceId,
  });

  factory EventCreate.fromJson(Map<String, dynamic> json) =>
      _$EventCreateFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EventCreateToJson(this);

  @override
  String toString() => 'EventCreate(eventType: $eventType'
      '${timestamp == null ? '' : ', timestamp: $timestamp'}'
      '${userId == null ? '' : ', userId: $userId'}'
      '${barcode == null ? '' : ', barcode: $barcode'}'
      '${points == null ? '' : ', points: $points'}'
      '${deviceId == null ? '' : ', deviceId: $deviceId'}'
      ')';
}
