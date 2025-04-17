// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_total_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceTotalStats _$PriceTotalStatsFromJson(Map json) => PriceTotalStats()
  ..priceCount = (json['price_count'] as num?)?.toInt()
  ..priceTypeProductCodeCount =
      (json['price_type_product_code_count'] as num?)?.toInt()
  ..priceTypeCategoryTagCount =
      (json['price_type_category_tag_count'] as num?)?.toInt()
  ..priceWithDiscountCount =
      (json['price_with_discount_count'] as num?)?.toInt()
  ..priceCurrencyCount = (json['price_currency_count'] as num?)?.toInt()
  ..priceYearCount = (json['price_year_count'] as num?)?.toInt()
  ..priceLocationCountryCount =
      (json['price_location_country_count'] as num?)?.toInt()
  ..priceKindCommunityCount =
      (json['price_kind_community_count'] as num?)?.toInt()
  ..priceKindConsumptionCount =
      (json['price_kind_consumption_count'] as num?)?.toInt()
  ..priceSourceWebCount = (json['price_source_web_count'] as num?)?.toInt()
  ..priceSourceMobileCount =
      (json['price_source_mobile_count'] as num?)?.toInt()
  ..priceSourceApiCount = (json['price_source_api_count'] as num?)?.toInt()
  ..priceSourceOtherCount = (json['price_source_other_count'] as num?)?.toInt()
  ..productCount = (json['product_count'] as num?)?.toInt()
  ..productSourceOffCount = (json['product_source_off_count'] as num?)?.toInt()
  ..productSourceObfCount = (json['product_source_obf_count'] as num?)?.toInt()
  ..productSourceOpffCount =
      (json['product_source_opff_count'] as num?)?.toInt()
  ..productSourceOpfCount = (json['product_source_opf_count'] as num?)?.toInt()
  ..productWithPriceCount = (json['product_with_price_count'] as num?)?.toInt()
  ..productSourceOffWithPriceCount =
      (json['product_source_off_with_price_count'] as num?)?.toInt()
  ..productSourceObfWithPriceCount =
      (json['product_source_obf_with_price_count'] as num?)?.toInt()
  ..productSourceOpffWithPriceCount =
      (json['product_source_opff_with_price_count'] as num?)?.toInt()
  ..productSourceOpfWithPriceCount =
      (json['product_source_opf_with_price_count'] as num?)?.toInt()
  ..locationCount = (json['location_count'] as num?)?.toInt()
  ..locationWithPriceCount =
      (json['location_with_price_count'] as num?)?.toInt()
  ..locationTypeOsmCount = (json['location_type_osm_count'] as num?)?.toInt()
  ..locationTypeOnlineCount =
      (json['location_type_online_count'] as num?)?.toInt()
  ..locationTypeOsmCountryCount =
      (json['location_type_osm_country_count'] as num?)?.toInt()
  ..proofCount = (json['proof_count'] as num?)?.toInt()
  ..proofWithPriceCount = (json['proof_with_price_count'] as num?)?.toInt()
  ..proofTypePriceTagCount =
      (json['proof_type_price_tag_count'] as num?)?.toInt()
  ..proofTypeReceiptCount = (json['proof_type_receipt_count'] as num?)?.toInt()
  ..proofTypeGdprRequestCount =
      (json['proof_type_gdpr_request_count'] as num?)?.toInt()
  ..proofTypeShopImportCount =
      (json['proof_type_shop_import_count'] as num?)?.toInt()
  ..proofKindCommunityCount =
      (json['proof_kind_community_count'] as num?)?.toInt()
  ..proofKindConsumptionCount =
      (json['proof_kind_consumption_count'] as num?)?.toInt()
  ..proofSourceWebCount = (json['proof_source_web_count'] as num?)?.toInt()
  ..proofSourceMobileCount =
      (json['proof_source_mobile_count'] as num?)?.toInt()
  ..proofSourceApiCount = (json['proof_source_api_count'] as num?)?.toInt()
  ..proofSourceOtherCount = (json['proof_source_other_count'] as num?)?.toInt()
  ..priceTagCount = (json['price_tag_count'] as num?)?.toInt()
  ..priceTagStatusUnknownCount =
      (json['price_tag_status_unknown_count'] as num?)?.toInt()
  ..priceTagStatusLinkedToPriceCount =
      (json['price_tag_status_linked_to_price_count'] as num?)?.toInt()
  ..userCount = (json['user_count'] as num?)?.toInt()
  ..userWithPriceCount = (json['user_with_price_count'] as num?)?.toInt()
  ..updated = JsonHelper.nullableStringTimestampToDate(json['updated']);

Map<String, dynamic> _$PriceTotalStatsToJson(PriceTotalStats instance) =>
    <String, dynamic>{
      'price_count': instance.priceCount,
      'price_type_product_code_count': instance.priceTypeProductCodeCount,
      'price_type_category_tag_count': instance.priceTypeCategoryTagCount,
      'price_with_discount_count': instance.priceWithDiscountCount,
      'price_currency_count': instance.priceCurrencyCount,
      'price_year_count': instance.priceYearCount,
      'price_location_country_count': instance.priceLocationCountryCount,
      'price_kind_community_count': instance.priceKindCommunityCount,
      'price_kind_consumption_count': instance.priceKindConsumptionCount,
      'price_source_web_count': instance.priceSourceWebCount,
      'price_source_mobile_count': instance.priceSourceMobileCount,
      'price_source_api_count': instance.priceSourceApiCount,
      'price_source_other_count': instance.priceSourceOtherCount,
      'product_count': instance.productCount,
      'product_source_off_count': instance.productSourceOffCount,
      'product_source_obf_count': instance.productSourceObfCount,
      'product_source_opff_count': instance.productSourceOpffCount,
      'product_source_opf_count': instance.productSourceOpfCount,
      'product_with_price_count': instance.productWithPriceCount,
      'product_source_off_with_price_count':
          instance.productSourceOffWithPriceCount,
      'product_source_obf_with_price_count':
          instance.productSourceObfWithPriceCount,
      'product_source_opff_with_price_count':
          instance.productSourceOpffWithPriceCount,
      'product_source_opf_with_price_count':
          instance.productSourceOpfWithPriceCount,
      'location_count': instance.locationCount,
      'location_with_price_count': instance.locationWithPriceCount,
      'location_type_osm_count': instance.locationTypeOsmCount,
      'location_type_online_count': instance.locationTypeOnlineCount,
      'location_type_osm_country_count': instance.locationTypeOsmCountryCount,
      'proof_count': instance.proofCount,
      'proof_with_price_count': instance.proofWithPriceCount,
      'proof_type_price_tag_count': instance.proofTypePriceTagCount,
      'proof_type_receipt_count': instance.proofTypeReceiptCount,
      'proof_type_gdpr_request_count': instance.proofTypeGdprRequestCount,
      'proof_type_shop_import_count': instance.proofTypeShopImportCount,
      'proof_kind_community_count': instance.proofKindCommunityCount,
      'proof_kind_consumption_count': instance.proofKindConsumptionCount,
      'proof_source_web_count': instance.proofSourceWebCount,
      'proof_source_mobile_count': instance.proofSourceMobileCount,
      'proof_source_api_count': instance.proofSourceApiCount,
      'proof_source_other_count': instance.proofSourceOtherCount,
      'price_tag_count': instance.priceTagCount,
      'price_tag_status_unknown_count': instance.priceTagStatusUnknownCount,
      'price_tag_status_linked_to_price_count':
          instance.priceTagStatusLinkedToPriceCount,
      'user_count': instance.userCount,
      'user_with_price_count': instance.userWithPriceCount,
      'updated': instance.updated?.toIso8601String(),
    };
