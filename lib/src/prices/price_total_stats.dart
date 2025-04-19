import 'package:json_annotation/json_annotation.dart';

import '../interface/json_object.dart';
import '../utils/json_helper.dart';

/// Total stats for Prices.
///
/// cf. `TotalStats` in https://prices.openfoodfacts.org/api/docs
class PriceTotalStats extends JsonObject {
  final Map<String, dynamic> _rawData;

  static const String PRICE_COUNT = 'price_count';
  static const String PRICE_TYPE_PRODUCT_CODE_COUNT =
      'price_type_product_code_count';
  static const String PRICE_TYPE_CATEGORY_TAG_COUNT =
      'price_type_category_tag_count';
  static const String PRICE_WITH_DISCOUNT_COUNT = 'price_with_discount_count';
  static const String PRICE_CURRENCY_COUNT = 'price_currency_count';
  static const String PRICE_YEAR_COUNT = 'price_year_count';
  static const String PRICE_LOCATION_COUNTRY_COUNT =
      'price_location_country_count';
  static const String PRICE_KIND_COMMUNITY_COUNT = 'price_kind_community_count';
  static const String PRICE_KIND_CONSUMPTION_COUNT =
      'price_kind_consumption_count';
  static const String PRICE_SOURCE_WEB_COUNT = 'price_source_web_count';
  static const String PRICE_SOURCE_MOBILE_COUNT = 'price_source_mobile_count';
  static const String PRICE_SOURCE_API_COUNT = 'price_source_api_count';
  static const String PRICE_SOURCE_OTHER_COUNT = 'price_source_other_count';
  static const String PRODUCT_COUNT = 'product_count';
  static const String PRODUCT_SOURCE_OFF_COUNT = 'product_source_off_count';
  static const String PRODUCT_SOURCE_OBF_COUNT = 'product_source_obf_count';
  static const String PRODUCT_SOURCE_OPFF_COUNT = 'product_source_opff_count';
  static const String PRODUCT_SOURCE_OPF_COUNT = 'product_source_opf_count';
  static const String PRODUCT_WITH_PRICE_COUNT = 'product_with_price_count';
  static const String PRODUCT_SOURCE_OFF_WITH_PRICE_COUNT =
      'product_source_off_with_price_count';
  static const String PRODUCT_SOURCE_OBF_WITH_PRICE_COUNT =
      'product_source_obf_with_price_count';
  static const String PRODUCT_SOURCE_OPFF_WITH_PRICE_COUNT =
      'product_source_opff_with_price_count';
  static const String PRODUCT_SOURCE_OPF_WITH_PRICE_COUNT =
      'product_source_opf_with_price_count';
  static const String LOCATION_COUNT = 'location_count';
  static const String LOCATION_WITH_PRICE_COUNT = 'location_with_price_count';
  static const String LOCATION_TYPE_OSM_COUNT = 'location_type_osm_count';
  static const String LOCATION_TYPE_ONLINE_COUNT = 'location_type_online_count';
  static const String LOCATION_TYPE_OSM_COUNTRY_COUNT =
      'location_type_osm_country_count';
  static const String PROOF_COUNT = 'proof_count';
  static const String PROOF_WITH_PRICE_COUNT = 'proof_with_price_count';
  static const String PROOF_TYPE_PRICE_TAG_COUNT = 'proof_type_price_tag_count';
  static const String PROOF_TYPE_RECEIPT_COUNT = 'proof_type_receipt_count';
  static const String PROOF_TYPE_GDPR_REQUEST_COUNT =
      'proof_type_gdpr_request_count';
  static const String PROOF_TYPE_SHOP_IMPORT_COUNT =
      'proof_type_shop_import_count';
  static const String PROOF_KIND_COMMUNITY_COUNT = 'proof_kind_community_count';
  static const String PROOF_KIND_CONSUMPTION_COUNT =
      'proof_kind_consumption_count';
  static const String PROOF_SOURCE_WEB_COUNT = 'proof_source_web_count';
  static const String PROOF_SOURCE_MOBILE_COUNT = 'proof_source_mobile_count';
  static const String PROOF_SOURCE_API_COUNT = 'proof_source_api_count';
  static const String PROOF_SOURCE_OTHER_COUNT = 'proof_source_other_count';
  static const String PRICE_TAG_COUNT = 'price_tag_count';
  static const String PRICE_TAG_STATUS_UNKNOWN_COUNT =
      'price_tag_status_unknown_count';
  static const String PRICE_TAG_STATUS_LINKED_TO_PRICE_COUNT =
      'price_tag_status_linked_to_price_count';
  static const String USER_COUNT = 'user_count';
  static const String USER_WITH_PRICE_COUNT = 'user_with_price_count';
  static const String UPDATED = 'updated';

  int? get priceCount => getInt(PRICE_COUNT);
  int? get priceTypeProductCodeCount => getInt(PRICE_TYPE_PRODUCT_CODE_COUNT);
  int? get priceTypeCategoryTagCount => getInt(PRICE_TYPE_CATEGORY_TAG_COUNT);
  int? get priceWithDiscountCount => getInt(PRICE_WITH_DISCOUNT_COUNT);
  int? get priceCurrencyCount => getInt(PRICE_CURRENCY_COUNT);
  int? get priceYearCount => getInt(PRICE_YEAR_COUNT);
  int? get priceLocationCountryCount => getInt(PRICE_LOCATION_COUNTRY_COUNT);
  int? get priceKindCommunityCount => getInt(PRICE_KIND_COMMUNITY_COUNT);
  int? get priceKindConsumptionCount => getInt(PRICE_KIND_CONSUMPTION_COUNT);
  int? get priceSourceWebCount => getInt(PRICE_SOURCE_WEB_COUNT);
  int? get priceSourceMobileCount => getInt(PRICE_SOURCE_MOBILE_COUNT);
  int? get priceSourceApiCount => getInt(PRICE_SOURCE_API_COUNT);
  int? get priceSourceOtherCount => getInt(PRICE_SOURCE_OTHER_COUNT);
  int? get productCount => getInt(PRODUCT_COUNT);
  int? get productSourceOffCount => getInt(PRODUCT_SOURCE_OFF_COUNT);
  int? get productSourceObfCount => getInt(PRODUCT_SOURCE_OBF_COUNT);
  int? get productSourceOpffCount => getInt(PRODUCT_SOURCE_OPFF_COUNT);
  int? get productSourceOpfCount => getInt(PRODUCT_SOURCE_OPF_COUNT);
  int? get productWithPriceCount => getInt(PRODUCT_WITH_PRICE_COUNT);
  int? get productSourceOffWithPriceCount =>
      getInt(PRODUCT_SOURCE_OFF_WITH_PRICE_COUNT);
  int? get productSourceObfWithPriceCount =>
      getInt(PRODUCT_SOURCE_OBF_WITH_PRICE_COUNT);
  int? get productSourceOpffWithPriceCount =>
      getInt(PRODUCT_SOURCE_OPFF_WITH_PRICE_COUNT);
  int? get productSourceOpfWithPriceCount =>
      getInt(PRODUCT_SOURCE_OPF_WITH_PRICE_COUNT);
  int? get locationCount => getInt(LOCATION_COUNT);
  int? get locationWithPriceCount => getInt(LOCATION_WITH_PRICE_COUNT);
  int? get locationTypeOsmCount => getInt(LOCATION_TYPE_OSM_COUNT);
  int? get locationTypeOnlineCount => getInt(LOCATION_TYPE_ONLINE_COUNT);
  int? get locationTypeOsmCountryCount =>
      getInt(LOCATION_TYPE_OSM_COUNTRY_COUNT);
  int? get proofCount => getInt(PROOF_COUNT);
  int? get proofWithPriceCount => getInt(PROOF_WITH_PRICE_COUNT);
  int? get proofTypePriceTagCount => getInt(PROOF_TYPE_PRICE_TAG_COUNT);
  int? get proofTypeReceiptCount => getInt(PROOF_TYPE_RECEIPT_COUNT);
  int? get proofTypeGdprRequestCount => getInt(PROOF_TYPE_GDPR_REQUEST_COUNT);
  int? get proofTypeShopImportCount => getInt(PROOF_TYPE_SHOP_IMPORT_COUNT);
  int? get proofKindCommunityCount => getInt(PROOF_KIND_COMMUNITY_COUNT);
  int? get proofKindConsumptionCount => getInt(PROOF_KIND_CONSUMPTION_COUNT);
  int? get proofSourceWebCount => getInt(PROOF_SOURCE_WEB_COUNT);
  int? get proofSourceMobileCount => getInt(PROOF_SOURCE_MOBILE_COUNT);
  int? get proofSourceApiCount => getInt(PROOF_SOURCE_API_COUNT);
  int? get proofSourceOtherCount => getInt(PROOF_SOURCE_OTHER_COUNT);
  int? get priceTagCount => getInt(PRICE_TAG_COUNT);
  int? get priceTagStatusUnknownCount => getInt(PRICE_TAG_STATUS_UNKNOWN_COUNT);
  int? get priceTagStatusLinkedToPriceCount =>
      getInt(PRICE_TAG_STATUS_LINKED_TO_PRICE_COUNT);
  int? get userCount => getInt(USER_COUNT);
  int? get userWithPriceCount => getInt(USER_WITH_PRICE_COUNT);

  DateTime? get updated => _rawData.containsKey(UPDATED)
      ? JsonHelper.nullableStringTimestampToDate(_rawData[UPDATED])
      : null;

  int? getInt(String key) => _rawData.containsKey(key)
      ? (_rawData[key] is int
          ? _rawData[key]
          : int.tryParse(_rawData[key]?.toString() ?? ''))
      : null;

  String? getString(String key) =>
      _rawData.containsKey(key) ? _rawData[key]?.toString() : null;

  double? getDouble(String key) => _rawData.containsKey(key)
      ? (_rawData[key] is double
          ? _rawData[key]
          : double.tryParse(_rawData[key]?.toString() ?? ''))
      : null;

  bool? getBool(String key) => _rawData.containsKey(key)
      ? (_rawData[key] is bool ? _rawData[key] : null)
      : null;

  DateTime? getDateTime(String key) => _rawData.containsKey(key)
      ? JsonHelper.nullableStringTimestampToDate(_rawData[key])
      : null;

  bool containsKey(String key) => _rawData.containsKey(key);

  Set<String> get availableKeys => _rawData.keys.toSet();

  PriceTotalStats(this._rawData);

  PriceTotalStats.empty() : _rawData = {};

  factory PriceTotalStats.fromJson(Map<String, dynamic> json) {
    return PriceTotalStats(json);
  }

  @override
  Map<String, dynamic> toJson() => _rawData;
}
