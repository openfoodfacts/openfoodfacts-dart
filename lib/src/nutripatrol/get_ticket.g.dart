// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticket _$TicketFromJson(Map<String, dynamic> json) => Ticket()
  ..id = (json['id'] as num).toInt()
  ..barcode = json['barcode'] as String
  ..type = $enumDecode(_$TypeEnumMap, json['type'])
  ..url = json['url'] as String?
  ..status = $enumDecode(_$StatusEnumMap, json['status'])
  ..imageId = json['image_id'] as String?
  ..flavor = $enumDecode(_$FlavorEnumMap, json['flavor'])
  ..CreatedAt = json['created_at'] as String;

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'id': instance.id,
      'barcode': instance.barcode,
      'type': _$TypeEnumMap[instance.type]!,
      'url': instance.url,
      'status': _$StatusEnumMap[instance.status]!,
      'image_id': instance.imageId,
      'flavor': _$FlavorEnumMap[instance.flavor]!,
      'created_at': instance.CreatedAt,
    };

const _$TypeEnumMap = {
  Type.image: 'image',
  Type.product: 'product',
  Type.search: 'search',
};

const _$StatusEnumMap = {
  Status.open: 'open',
  Status.closed: 'closed',
};

const _$FlavorEnumMap = {
  Flavor.off: 'off',
  Flavor.obf: 'obf',
  Flavor.opff: 'opff',
  Flavor.opf: 'opf',
  Flavor.offPro: 'off-pro',
};
