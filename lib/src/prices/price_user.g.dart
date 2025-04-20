// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceUser _$PriceUserFromJson(Map<String, dynamic> json) => PriceUser()
  ..userId = json['user_id'] as String
  ..priceCount = (json['price_count'] as num?)?.toInt()
  ..locationCount = (json['location_count'] as num?)?.toInt()
  ..productCount = (json['product_count'] as num?)?.toInt()
  ..proofCount = (json['proof_count'] as num?)?.toInt()
  ..priceTypeProductCount = (json['price_type_product_count'] as num?)?.toInt()
  ..priceTypeCategoryCount =
      (json['price_type_category_count'] as num?)?.toInt()
  ..priceKindCommunityCount =
      (json['price_kind_community_count'] as num?)?.toInt()
  ..priceKindConsumptionCount =
      (json['price_kind_consumption_count'] as num?)?.toInt()
  ..priceCurrencyCount = (json['price_currency_count'] as num?)?.toInt()
  ..priceInProofOwnedCount =
      (json['price_in_proof_owned_count'] as num?)?.toInt()
  ..priceInProofNotOwnedCount =
      (json['price_in_proof_not_owned_count'] as num?)?.toInt()
  ..priceNotOwnedInProofOwnedCount =
      (json['price_not_owned_in_proof_owned_count'] as num?)?.toInt()
  ..proofKindCommunityCount =
      (json['proof_kind_community_count'] as num?)?.toInt()
  ..proofKindConsumptionCount =
      (json['proof_kind_consumption_count'] as num?)?.toInt()
  ..locationTypeOsmCountryCount =
      (json['location_type_osm_country_count'] as num?)?.toInt();

Map<String, dynamic> _$PriceUserToJson(PriceUser instance) => <String, dynamic>{
      'user_id': instance.userId,
      'price_count': instance.priceCount,
      'location_count': instance.locationCount,
      'product_count': instance.productCount,
      'proof_count': instance.proofCount,
      'price_type_product_count': instance.priceTypeProductCount,
      'price_type_category_count': instance.priceTypeCategoryCount,
      'price_kind_community_count': instance.priceKindCommunityCount,
      'price_kind_consumption_count': instance.priceKindConsumptionCount,
      'price_currency_count': instance.priceCurrencyCount,
      'price_in_proof_owned_count': instance.priceInProofOwnedCount,
      'price_in_proof_not_owned_count': instance.priceInProofNotOwnedCount,
      'price_not_owned_in_proof_owned_count':
          instance.priceNotOwnedInProofOwnedCount,
      'proof_kind_community_count': instance.proofKindCommunityCount,
      'proof_kind_consumption_count': instance.proofKindConsumptionCount,
      'location_type_osm_country_count': instance.locationTypeOsmCountryCount,
    };
