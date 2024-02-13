// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceProduct _$PriceProductFromJson(Map<String, dynamic> json) => PriceProduct()
  ..code = json['code'] as String
  ..productId = json['id'] as int
  ..source = json['source'] as String?
  ..name = json['product_name'] as String?
  ..quantity = json['product_quantity'] as int?
  ..imageURL = json['image_url'] as String?
  ..created = JsonHelper.stringTimestampToDate(json['created'])
  ..updated = JsonHelper.nullableStringTimestampToDate(json['updated']);

Map<String, dynamic> _$PriceProductToJson(PriceProduct instance) =>
    <String, dynamic>{
      'code': instance.code,
      'id': instance.productId,
      'source': instance.source,
      'product_name': instance.name,
      'product_quantity': instance.quantity,
      'image_url': instance.imageURL,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
    };
