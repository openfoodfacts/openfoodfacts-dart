// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NutripatrolTicket _$NutripatrolTicketFromJson(Map<String, dynamic> json) =>
    NutripatrolTicket()
      ..id = (json['id'] as num).toInt()
      ..barcode = json['barcode'] as String?
      ..type = $enumDecode(_$NutripatrolTypeEnumMap, json['type'])
      ..url = json['url'] as String
      ..status = $enumDecode(_$NutripatrolTicketStatusEnumMap, json['status'])
      ..imageId = json['image_id'] as String?
      ..flavor = $enumDecode(_$FlavorEnumMap, json['flavor']);

Map<String, dynamic> _$NutripatrolTicketToJson(NutripatrolTicket instance) =>
    <String, dynamic>{
      'id': instance.id,
      'barcode': instance.barcode,
      'type': _$NutripatrolTypeEnumMap[instance.type]!,
      'url': instance.url,
      'status': _$NutripatrolTicketStatusEnumMap[instance.status]!,
      'image_id': instance.imageId,
      'flavor': _$FlavorEnumMap[instance.flavor]!,
    };

const _$NutripatrolTypeEnumMap = {
  NutripatrolType.image: 'image',
  NutripatrolType.product: 'product',
  NutripatrolType.search: 'search',
};

const _$NutripatrolTicketStatusEnumMap = {
  NutripatrolTicketStatus.open: 'open',
  NutripatrolTicketStatus.closed: 'closed',
};

const _$FlavorEnumMap = {
  Flavor.openFoodFacts: 'off',
  Flavor.openBeautyFacts: 'obf',
  Flavor.openPetFoodFacts: 'opff',
  Flavor.openProductFacts: 'opf',
  Flavor.openFoodProductFactsPro: 'off-pro',
};
