// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_prices_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPricesResult _$GetPricesResultFromJson(Map<String, dynamic> json) =>
    GetPricesResult()
      ..items = (json['items'] as List<dynamic>?)
          ?.map((e) => Price.fromJson(e as Map<String, dynamic>))
          .toList()
      ..total = json['total'] as int?
      ..pageNumber = json['page'] as int?
      ..pageSize = json['size'] as int?
      ..numberOfPages = json['pages'] as int?;

Map<String, dynamic> _$GetPricesResultToJson(GetPricesResult instance) =>
    <String, dynamic>{
      'items': instance.items,
      'total': instance.total,
      'page': instance.pageNumber,
      'size': instance.pageSize,
      'pages': instance.numberOfPages,
    };
