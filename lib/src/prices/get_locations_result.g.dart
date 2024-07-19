// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_locations_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLocationsResult _$GetLocationsResultFromJson(Map<String, dynamic> json) =>
    GetLocationsResult()
      ..items = (json['items'] as List<dynamic>?)
          ?.map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList()
      ..total = (json['total'] as num?)?.toInt()
      ..pageNumber = (json['page'] as num?)?.toInt()
      ..pageSize = (json['size'] as num?)?.toInt()
      ..numberOfPages = (json['pages'] as num?)?.toInt();

Map<String, dynamic> _$GetLocationsResultToJson(GetLocationsResult instance) =>
    <String, dynamic>{
      'items': instance.items,
      'total': instance.total,
      'page': instance.pageNumber,
      'size': instance.pageSize,
      'pages': instance.numberOfPages,
    };
