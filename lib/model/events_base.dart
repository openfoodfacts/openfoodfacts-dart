import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/utils/json_helper.dart';
import '../interface/json_object.dart';

part 'events_base.g.dart';

/// Events API: event.
@JsonSerializable()
class EventsBase extends JsonObject {
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

  EventsBase({
    required this.eventType,
    this.timestamp,
    this.userId,
    this.barcode,
    this.points,
  });

  factory EventsBase.fromJson(Map<String, dynamic> json) =>
      _$EventsBaseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$EventsBaseToJson(this);

  @override
  String toString() => 'EventsBase(eventType: $eventType'
      '${timestamp == null ? '' : ', timestamp: $timestamp'}'
      '${userId == null ? '' : ', userId: $userId'}'
      '${barcode == null ? '' : ', barcode: $barcode'}'
      '${points == null ? '' : ', points: $points'}'
      ')';
}
