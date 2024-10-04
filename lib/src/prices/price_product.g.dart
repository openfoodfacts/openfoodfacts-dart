// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceProduct _$PriceProductFromJson(Map<String, dynamic> json) => PriceProduct()
  ..code = json['code'] as String
  ..priceCount = (json['price_count'] as num?)?.toInt()
  ..locationCount = (json['location_count'] as num?)?.toInt()
  ..userCount = (json['user_count'] as num?)?.toInt()
  ..proofCount = (json['proof_count'] as num?)?.toInt()
  ..productId = (json['id'] as num).toInt()
  ..source = $enumDecodeNullable(_$FlavorEnumMap, json['source'])
  ..name = json['product_name'] as String?
  ..quantity = (json['product_quantity'] as num?)?.toInt()
  ..quantityUnit = json['product_quantity_unit'] as String?
  ..categoriesTags = (json['categories_tags'] as List<dynamic>)
      .map((e) => e as String)
      .toList()
  ..brands = json['brands'] as String?
  ..brandsTags =
      (json['brands_tags'] as List<dynamic>).map((e) => e as String).toList()
  ..labelsTags =
      (json['labels_tags'] as List<dynamic>).map((e) => e as String).toList()
  ..imageURL = json['image_url'] as String?
  ..nutriscoreGrade = json['nutriscore_grade'] as String?
  ..ecoscoreGrade = json['ecoscore_grade'] as String?
  ..novaGroup = (json['nova_group'] as num?)?.toInt()
  ..uniqueScansNumber = (json['unique_scans_n'] as num).toInt()
  ..created = JsonHelper.stringTimestampToDate(json['created'])
  ..updated = JsonHelper.nullableStringTimestampToDate(json['updated']);

Map<String, dynamic> _$PriceProductToJson(PriceProduct instance) =>
    <String, dynamic>{
      'code': instance.code,
      'price_count': instance.priceCount,
      'location_count': instance.locationCount,
      'user_count': instance.userCount,
      'proof_count': instance.proofCount,
      'id': instance.productId,
      'source': _$FlavorEnumMap[instance.source],
      'product_name': instance.name,
      'product_quantity': instance.quantity,
      'product_quantity_unit': instance.quantityUnit,
      'categories_tags': instance.categoriesTags,
      'brands': instance.brands,
      'brands_tags': instance.brandsTags,
      'labels_tags': instance.labelsTags,
      'image_url': instance.imageURL,
      'nutriscore_grade': instance.nutriscoreGrade,
      'ecoscore_grade': instance.ecoscoreGrade,
      'nova_group': instance.novaGroup,
      'unique_scans_n': instance.uniqueScansNumber,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
    };

const _$FlavorEnumMap = {
  Flavor.openFoodFacts: 'off',
  Flavor.openBeautyFacts: 'obf',
  Flavor.openPetFoodFacts: 'opff',
  Flavor.openProductFacts: 'opf',
  Flavor.openFoodProductFactsPro: 'off-pro',
};
