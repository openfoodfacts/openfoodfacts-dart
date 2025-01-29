// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_flag_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateNutripatrolFlagRequest _$CreateNutripatrolFlagRequestFromJson(
        Map<String, dynamic> json) =>
    CreateNutripatrolFlagRequest()
      ..barcode = json['barcode'] as String?
      ..type = $enumDecode(_$NutripatrolTypeEnumMap, json['type'])
      ..url = json['url'] as String
      ..userId = json['user_id'] as String
      ..deviceId = json['device_id'] as String
      ..source = $enumDecode(_$NutripatrolSourceEnumMap, json['source'])
      ..confidence = (json['confidence'] as num?)?.toDouble()
      ..imageId = json['image_id'] as String?
      ..flavor = $enumDecode(_$FlavorEnumMap, json['flavor'])
      ..reason = (json['reason'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$NutripatrolFlagReasonEnumMap, e))
          .toList()
      ..comment = json['comment'] as String?
      ..createdAt = DateTime.parse(json['created_at'] as String);

Map<String, dynamic> _$CreateNutripatrolFlagRequestToJson(
        CreateNutripatrolFlagRequest instance) =>
    <String, dynamic>{
      'barcode': instance.barcode,
      'type': _$NutripatrolTypeEnumMap[instance.type]!,
      'url': instance.url,
      'user_id': instance.userId,
      'device_id': instance.deviceId,
      'source': _$NutripatrolSourceEnumMap[instance.source]!,
      'confidence': instance.confidence,
      'image_id': instance.imageId,
      'flavor': _$FlavorEnumMap[instance.flavor]!,
      'reason': instance.reason
          ?.map((e) => _$NutripatrolFlagReasonEnumMap[e]!)
          .toList(),
      'comment': instance.comment,
      'created_at': instance.createdAt.toIso8601String(),
    };

const _$NutripatrolTypeEnumMap = {
  NutripatrolType.image: 'image',
  NutripatrolType.product: 'product',
  NutripatrolType.search: 'search',
};

const _$NutripatrolSourceEnumMap = {
  NutripatrolSource.mobile: 'mobile',
  NutripatrolSource.web: 'web',
  NutripatrolSource.robotoff: 'robotoff',
};

const _$FlavorEnumMap = {
  Flavor.openFoodFacts: 'off',
  Flavor.openBeautyFacts: 'obf',
  Flavor.openPetFoodFacts: 'opff',
  Flavor.openProductFacts: 'opf',
  Flavor.openFoodProductFactsPro: 'off-pro',
};

const _$NutripatrolFlagReasonEnumMap = {
  NutripatrolFlagReason.inappropriate: 'inappropriate',
  NutripatrolFlagReason.human: 'human',
  NutripatrolFlagReason.beauty: 'beauty',
  NutripatrolFlagReason.other: 'other',
};
