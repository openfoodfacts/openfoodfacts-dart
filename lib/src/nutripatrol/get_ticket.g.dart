// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticket _$TicketFromJson(Map<String, dynamic> json) => Ticket()
  ..id = (json['id'] as num).toInt()
  ..barcode = json['barcode'] as String
  ..type = json['type'] as String
  ..url = json['url'] as String?
  ..status = json['status'] as String
  ..imageId = json['image_id'] as String?
  ..flavor = json['flavor'] as String
  ..createdAt = json['created_at'] as String;

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'id': instance.id,
      'barcode': instance.barcode,
      'type': instance.type,
      'url': instance.url,
      'status': instance.status,
      'image_id': instance.imageId,
      'flavor': instance.flavor,
      'created_at': instance.createdAt,
    };
