// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_total_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceTotalStats _$PriceTotalStatsFromJson(Map<String, dynamic> json) =>
    PriceTotalStats()
      ..priceCount = (json['price_count'] as num?)?.toInt()
      ..priceTypeProductCodeCount =
          (json['price_type_product_code_count'] as num?)?.toInt()
      ..priceTypeCategoryTagCount =
          (json['price_type_category_tag_count'] as num?)?.toInt()
      ..productCount = (json['product_count'] as num?)?.toInt()
      ..productWithPriceCount =
          (json['product_with_price_count'] as num?)?.toInt()
      ..locationCount = (json['location_count'] as num?)?.toInt()
      ..locationWithPriceCount =
          (json['location_with_price_count'] as num?)?.toInt()
      ..locationTypeOsmCount =
          (json['location_type_osm_count'] as num?)?.toInt()
      ..locationTypeOnlineCount =
          (json['location_type_online_count'] as num?)?.toInt()
      ..proofCount = (json['proof_count'] as num?)?.toInt()
      ..proofWithPriceCount = (json['proof_with_price_count'] as num?)?.toInt()
      ..proofTypePriceTagCount =
          (json['proof_type_price_tag_count'] as num?)?.toInt()
      ..proofTypeReceiptCount =
          (json['proof_type_receipt_count'] as num?)?.toInt()
      ..proofTypeGdprRequestCount =
          (json['proof_type_gdpr_request_count'] as num?)?.toInt()
      ..proofTypeShopImportCount =
          (json['proof_type_shop_import_count'] as num?)?.toInt()
      ..userCount = (json['user_count'] as num?)?.toInt()
      ..userWithPriceCount = (json['user_with_price_count'] as num?)?.toInt()
      ..updated = JsonHelper.nullableStringTimestampToDate(json['updated']);

Map<String, dynamic> _$PriceTotalStatsToJson(PriceTotalStats instance) =>
    <String, dynamic>{
      'price_count': instance.priceCount,
      'price_type_product_code_count': instance.priceTypeProductCodeCount,
      'price_type_category_tag_count': instance.priceTypeCategoryTagCount,
      'product_count': instance.productCount,
      'product_with_price_count': instance.productWithPriceCount,
      'location_count': instance.locationCount,
      'location_with_price_count': instance.locationWithPriceCount,
      'location_type_osm_count': instance.locationTypeOsmCount,
      'location_type_online_count': instance.locationTypeOnlineCount,
      'proof_count': instance.proofCount,
      'proof_with_price_count': instance.proofWithPriceCount,
      'proof_type_price_tag_count': instance.proofTypePriceTagCount,
      'proof_type_receipt_count': instance.proofTypeReceiptCount,
      'proof_type_gdpr_request_count': instance.proofTypeGdprRequestCount,
      'proof_type_shop_import_count': instance.proofTypeShopImportCount,
      'user_count': instance.userCount,
      'user_with_price_count': instance.userWithPriceCount,
      'updated': instance.updated?.toIso8601String(),
    };
