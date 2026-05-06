// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_price_products_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPriceProductsResult _$GetPriceProductsResultFromJson(
  Map<String, dynamic> json,
) => GetPriceProductsResult()
  ..items = (json['items'] as List<dynamic>?)
      ?.map((e) => PriceProduct.fromJson(e as Map<String, dynamic>))
      .toList()
  ..total = (json['total'] as num?)?.toInt()
  ..pageNumber = (json['page'] as num?)?.toInt()
  ..pageSize = (json['size'] as num?)?.toInt()
  ..numberOfPages = (json['pages'] as num?)?.toInt();

Map<String, dynamic> _$GetPriceProductsResultToJson(
  GetPriceProductsResult instance,
) => <String, dynamic>{
  'items': instance.items,
  'total': instance.total,
  'page': instance.pageNumber,
  'size': instance.pageSize,
  'pages': instance.numberOfPages,
};
