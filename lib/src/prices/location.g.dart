// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location()
  ..osmId = (json['osm_id'] as num).toInt()
  ..locationType = $enumDecode(_$LocationTypeEnumMap, json['type'])
  ..type = $enumDecode(_$LocationOSMTypeEnumMap, json['osm_type'])
  ..priceCount = (json['price_count'] as num?)?.toInt()
  ..userCount = (json['user_count'] as num?)?.toInt()
  ..productCount = (json['product_count'] as num?)?.toInt()
  ..proofCount = (json['proof_count'] as num?)?.toInt()
  ..locationId = (json['id'] as num).toInt()
  ..name = json['osm_name'] as String?
  ..displayName = json['osm_display_name'] as String?
  ..postcode = json['osm_address_postcode'] as String?
  ..city = json['osm_address_city'] as String?
  ..country = json['osm_address_country'] as String?
  ..countryCode = json['osm_address_country_code'] as String?
  ..osmKey = json['osm_tag_key'] as String?
  ..osmValue = json['osm_tag_value'] as String?
  ..latitude = (json['osm_lat'] as num?)?.toDouble()
  ..longitude = (json['osm_lon'] as num?)?.toDouble()
  ..websiteUrl = json['website_url'] as String?
  ..created = JsonHelper.stringTimestampToDate(json['created'])
  ..updated = JsonHelper.nullableStringTimestampToDate(json['updated']);

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'osm_id': instance.osmId,
      'type': _$LocationTypeEnumMap[instance.locationType]!,
      'osm_type': _$LocationOSMTypeEnumMap[instance.type]!,
      'price_count': instance.priceCount,
      'user_count': instance.userCount,
      'product_count': instance.productCount,
      'proof_count': instance.proofCount,
      'id': instance.locationId,
      'osm_name': instance.name,
      'osm_display_name': instance.displayName,
      'osm_address_postcode': instance.postcode,
      'osm_address_city': instance.city,
      'osm_address_country': instance.country,
      'osm_address_country_code': instance.countryCode,
      'osm_tag_key': instance.osmKey,
      'osm_tag_value': instance.osmValue,
      'osm_lat': instance.latitude,
      'osm_lon': instance.longitude,
      'website_url': instance.websiteUrl,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
    };

const _$LocationTypeEnumMap = {
  LocationType.osm: 'OSM',
  LocationType.online: 'ONLINE',
};

const _$LocationOSMTypeEnumMap = {
  LocationOSMType.node: 'NODE',
  LocationOSMType.way: 'WAY',
  LocationOSMType.relation: 'RELATION',
};
