// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_price_tags_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPriceTagsResult _$GetPriceTagsResultFromJson(Map<String, dynamic> json) =>
    GetPriceTagsResult()
      ..items = (json['items'] as List<dynamic>?)
          ?.map((e) => PriceTag.fromJson(e as Map<String, dynamic>))
          .toList()
      ..total = (json['total'] as num?)?.toInt()
      ..pageNumber = (json['page'] as num?)?.toInt()
      ..pageSize = (json['size'] as num?)?.toInt()
      ..numberOfPages = (json['pages'] as num?)?.toInt();

Map<String, dynamic> _$GetPriceTagsResultToJson(GetPriceTagsResult instance) =>
    <String, dynamic>{
      'items': instance.items,
      'total': instance.total,
      'page': instance.pageNumber,
      'size': instance.pageSize,
      'pages': instance.numberOfPages,
    };
