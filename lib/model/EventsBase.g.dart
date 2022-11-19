// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EventsBase.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EventsBaseCWProxy {
  EventsBase barcode(String? barcode);

  EventsBase eventType(String eventType);

  EventsBase points(int? points);

  EventsBase timestamp(DateTime? timestamp);

  EventsBase userId(String? userId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EventsBase(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EventsBase(...).copyWith(id: 12, name: "My name")
  /// ````
  EventsBase call({
    String? barcode,
    String? eventType,
    int? points,
    DateTime? timestamp,
    String? userId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEventsBase.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEventsBase.copyWith.fieldName(...)`
class _$EventsBaseCWProxyImpl implements _$EventsBaseCWProxy {
  final EventsBase _value;

  const _$EventsBaseCWProxyImpl(this._value);

  @override
  EventsBase barcode(String? barcode) => this(barcode: barcode);

  @override
  EventsBase eventType(String eventType) => this(eventType: eventType);

  @override
  EventsBase points(int? points) => this(points: points);

  @override
  EventsBase timestamp(DateTime? timestamp) => this(timestamp: timestamp);

  @override
  EventsBase userId(String? userId) => this(userId: userId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EventsBase(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EventsBase(...).copyWith(id: 12, name: "My name")
  /// ````
  EventsBase call({
    Object? barcode = const $CopyWithPlaceholder(),
    Object? eventType = const $CopyWithPlaceholder(),
    Object? points = const $CopyWithPlaceholder(),
    Object? timestamp = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
  }) {
    return EventsBase(
      barcode: barcode == const $CopyWithPlaceholder()
          ? _value.barcode
          // ignore: cast_nullable_to_non_nullable
          : barcode as String?,
      eventType: eventType == const $CopyWithPlaceholder() || eventType == null
          ? _value.eventType
          // ignore: cast_nullable_to_non_nullable
          : eventType as String,
      points: points == const $CopyWithPlaceholder()
          ? _value.points
          // ignore: cast_nullable_to_non_nullable
          : points as int?,
      timestamp: timestamp == const $CopyWithPlaceholder()
          ? _value.timestamp
          // ignore: cast_nullable_to_non_nullable
          : timestamp as DateTime?,
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String?,
    );
  }
}

extension $EventsBaseCopyWith on EventsBase {
  /// Returns a callable class that can be used as follows: `instanceOfEventsBase.copyWith(...)` or like so:`instanceOfEventsBase.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EventsBaseCWProxy get copyWith => _$EventsBaseCWProxyImpl(this);
}

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
