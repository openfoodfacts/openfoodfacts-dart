// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_ticket_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateTicketStatus _$UpdateTicketStatusFromJson(Map<String, dynamic> json) =>
    UpdateTicketStatus()
      ..barcode = json['barcode'] as String?
      ..type = json['type'] as String
      ..url = json['url'] as String
      ..status = json['status'] as String
      ..imageId = json['image_id'] as String?
      ..flavor = json['flavor'] as String
      ..createdAt = DateTime.parse(json['created_at'] as String);

Map<String, dynamic> _$UpdateTicketStatusToJson(UpdateTicketStatus instance) =>
    <String, dynamic>{
      'barcode': instance.barcode,
      'type': instance.type,
      'url': instance.url,
      'status': instance.status,
      'image_id': instance.imageId,
      'flavor': instance.flavor,
      'created_at': instance.createdAt.toIso8601String(),
    };
