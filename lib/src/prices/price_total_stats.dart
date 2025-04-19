import '../utils/json_helper.dart';

/// Total stats for Prices.
///
/// cf. `TotalStats` in https://prices.openfoodfacts.org/api/docs
class PriceTotalStats {
  final Map<String, dynamic> json;

  PriceTotalStats(this.json);

  factory PriceTotalStats.fromJson(Map<String, dynamic> json) {
    return PriceTotalStats(json);
  }

  int? get priceCount => getInt('price_count');
  int? get priceTypeProductCodeCount => getInt('price_type_product_code_count');
  int? get priceTypeCategoryTagCount => getInt('price_type_category_tag_count');
  int? get priceWithDiscountCount => getInt('price_with_discount_count');
  int? get priceCurrencyCount => getInt('price_currency_count');
  int? get priceYearCount => getInt('price_year_count');
  int? get priceLocationCountryCount => getInt('price_location_country_count');
  int? get priceKindCommunityCount => getInt('price_kind_community_count');
  int? get priceKindConsumptionCount => getInt('price_kind_consumption_count');
  int? get priceSourceWebCount => getInt('price_source_web_count');
  int? get priceSourceMobileCount => getInt('price_source_mobile_count');
  int? get priceSourceApiCount => getInt('price_source_api_count');
  int? get priceSourceOtherCount => getInt('price_source_other_count');
  int? get productCount => getInt('product_count');
  int? get productSourceOffCount => getInt('product_source_off_count');
  int? get productSourceObfCount => getInt('product_source_obf_count');
  int? get productSourceOpffCount => getInt('product_source_opff_count');
  int? get productSourceOpfCount => getInt('product_source_opf_count');
  int? get productWithPriceCount => getInt('product_with_price_count');
  int? get productSourceOffWithPriceCount =>
      getInt('product_source_off_with_price_count');
  int? get productSourceObfWithPriceCount =>
      getInt('product_source_obf_with_price_count');
  int? get productSourceOpffWithPriceCount =>
      getInt('product_source_opff_with_price_count');
  int? get productSourceOpfWithPriceCount =>
      getInt('product_source_opf_with_price_count');
  int? get locationCount => getInt('location_count');
  int? get locationWithPriceCount => getInt('location_with_price_count');
  int? get locationTypeOsmCount => getInt('location_type_osm_count');
  int? get locationTypeOnlineCount => getInt('location_type_online_count');
  int? get locationTypeOsmCountryCount =>
      getInt('location_type_osm_country_count');
  int? get proofCount => getInt('proof_count');
  int? get proofWithPriceCount => getInt('proof_with_price_count');
  int? get proofTypePriceTagCount => getInt('proof_type_price_tag_count');
  int? get proofTypeReceiptCount => getInt('proof_type_receipt_count');
  int? get proofTypeGdprRequestCount => getInt('proof_type_gdpr_request_count');
  int? get proofTypeShopImportCount => getInt('proof_type_shop_import_count');
  int? get proofKindCommunityCount => getInt('proof_kind_community_count');
  int? get proofKindConsumptionCount => getInt('proof_kind_consumption_count');
  int? get proofSourceWebCount => getInt('proof_source_web_count');
  int? get proofSourceMobileCount => getInt('proof_source_mobile_count');
  int? get proofSourceApiCount => getInt('proof_source_api_count');
  int? get proofSourceOtherCount => getInt('proof_source_other_count');
  int? get priceTagCount => getInt('price_tag_count');
  int? get priceTagStatusUnknownCount =>
      getInt('price_tag_status_unknown_count');
  int? get priceTagStatusLinkedToPriceCount =>
      getInt('price_tag_status_linked_to_price_count');
  int? get userCount => getInt('user_count');
  int? get userWithPriceCount => getInt('user_with_price_count');
  DateTime? get updated => getDateTime('updated');

  int? getInt(String key) => json.containsKey(key) ? json[key] as int? : null;

  DateTime? getDateTime(String key) =>
      JsonHelper.nullableStringTimestampToDate(json[key]);

  Map<String, dynamic> toJson() => json;
}
