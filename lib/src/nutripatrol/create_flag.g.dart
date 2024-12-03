// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_flag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Flag _$FlagFromJson(Map<String, dynamic> json) => Flag()
  ..id = json['id'] as String
  ..barcode = json['barcode'] as String?
  ..type = $enumDecode(_$TypeEnumMap, json['type'])
  ..url = json['url'] as String?
  ..userId = json['user_id'] as String
  ..source = $enumDecode(_$SourceEnumMap, json['source'])
  ..confidence = (json['confidence'] as num?)?.toDouble()
  ..imageId = json['image_id'] as String?
  ..flavor = $enumDecode(_$FlavorEnumMap, json['flavor'])
  ..reason = json['reason'] as String?
  ..comment = json['comment'] as String?
  ..CreatedAt = DateTime.parse(json['created_at'] as String)
  ..ticketId = (json['ticket_id'] as num).toInt()
  ..deviceId = json['device_id'] as String;

Map<String, dynamic> _$FlagToJson(Flag instance) => <String, dynamic>{
      'id': instance.id,
      'barcode': instance.barcode,
      'type': _$TypeEnumMap[instance.type]!,
      'url': instance.url,
      'user_id': instance.userId,
      'source': _$SourceEnumMap[instance.source]!,
      'confidence': instance.confidence,
      'image_id': instance.imageId,
      'flavor': _$FlavorEnumMap[instance.flavor]!,
      'reason': instance.reason,
      'comment': instance.comment,
      'created_at': instance.CreatedAt.toIso8601String(),
      'ticket_id': instance.ticketId,
      'device_id': instance.deviceId,
    };

const _$TypeEnumMap = {
  Type.image: 'image',
  Type.product: 'product',
  Type.search: 'search',
};

const _$SourceEnumMap = {
  Source.mobile: 'mobile',
  Source.web: 'web',
  Source.robotoff: 'robotoff',
};

const _$FlavorEnumMap = {
  Flavor.off: 'off',
  Flavor.obf: 'obf',
  Flavor.opff: 'opff',
  Flavor.opf: 'opf',
  Flavor.offPro: 'off-pro',
};
