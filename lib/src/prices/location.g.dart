// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location()
  ..osmId = json['osm_id'] as int
  ..type = $enumDecode(_$LocationOSMTypeEnumMap, json['osm_type'])
  ..locationId = json['id'] as int
  ..name = json['osm_name'] as String?
  ..displayName = json['osm_display_name'] as String?
  ..postcode = json['osm_address_postcode'] as String?
  ..city = json['osm_address_city'] as String?
  ..country = json['osm_address_country'] as String?
  ..latitude = (json['osm_lat'] as num?)?.toDouble()
  ..longitude = (json['osm_lon'] as num?)?.toDouble()
  ..created = JsonHelper.stringTimestampToDate(json['created'])
  ..updated = JsonHelper.nullableStringTimestampToDate(json['updated']);

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'osm_id': instance.osmId,
      'osm_type': _$LocationOSMTypeEnumMap[instance.type]!,
      'id': instance.locationId,
      'osm_name': instance.name,
      'osm_display_name': instance.displayName,
      'osm_address_postcode': instance.postcode,
      'osm_address_city': instance.city,
      'osm_address_country': instance.country,
      'osm_lat': instance.latitude,
      'osm_lon': instance.longitude,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
    };

const _$LocationOSMTypeEnumMap = {
  LocationOSMType.node: 'NODE',
  LocationOSMType.way: 'WAY',
  LocationOSMType.relation: 'RELATION',
};
