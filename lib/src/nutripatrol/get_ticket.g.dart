// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticket _$TicketFromJson(Map<String, dynamic> json) => Ticket()
  ..id = (json['id'] as num).toInt()
  ..barcode = json['barcode'] as String?
  ..type = $enumDecode(_$TicketTypeEnumMap, json['type'])
  ..url = json['url'] as String
  ..status = $enumDecode(_$TicketStatusEnumMap, json['status'])
  ..imageId = json['image_id'] as String?
  ..flavor = $enumDecode(_$FlavorEnumMap, json['flavor'])
  ..CreatedAt = json['created_at'] as String;

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'id': instance.id,
      'barcode': instance.barcode,
      'type': _$TicketTypeEnumMap[instance.type]!,
      'url': instance.url,
      'status': _$TicketStatusEnumMap[instance.status]!,
      'image_id': instance.imageId,
      'flavor': _$FlavorEnumMap[instance.flavor]!,
      'created_at': instance.CreatedAt,
    };

const _$TicketTypeEnumMap = {
  TicketType.image: 'image',
  TicketType.product: 'product',
  TicketType.search: 'search',
};

const _$TicketStatusEnumMap = {
  TicketStatus.open: 'open',
  TicketStatus.closed: 'closed',
};

const _$FlavorEnumMap = {
  Flavor.off: 'off',
  Flavor.obf: 'obf',
  Flavor.opff: 'opff',
  Flavor.opf: 'opf',
  Flavor.offPro: 'off-pro',
};
