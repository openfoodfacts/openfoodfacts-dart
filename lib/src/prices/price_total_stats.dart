import 'package:json_annotation/json_annotation.dart';

import '../interface/json_object.dart';
import '../utils/json_helper.dart';

part 'price_total_stats.g.dart';

/// Total stats for Prices.
///
/// cf. `TotalStats` in https://prices.openfoodfacts.org/api/docs
@JsonSerializable(
  createToJson: true,
  createFactory: true,
  includeIfNull: true,
  explicitToJson: true,
  anyMap: true,
)
class PriceTotalStats extends JsonObject {
  @JsonKey(includeFromJson: false, includeToJson: false)
  late Map<String, dynamic> _rawData;

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

  @JsonKey(name: PRICE_COUNT)
  int? priceCount;

  @JsonKey(name: PRICE_TYPE_PRODUCT_CODE_COUNT)
  int? priceTypeProductCodeCount;

  @JsonKey(name: PRICE_TYPE_CATEGORY_TAG_COUNT)
  int? priceTypeCategoryTagCount;

  @JsonKey(name: PRICE_WITH_DISCOUNT_COUNT)
  int? priceWithDiscountCount;

  @JsonKey(name: PRICE_CURRENCY_COUNT)
  int? priceCurrencyCount;

  @JsonKey(name: PRICE_YEAR_COUNT)
  int? priceYearCount;

  @JsonKey(name: PRICE_LOCATION_COUNTRY_COUNT)
  int? priceLocationCountryCount;

  @JsonKey(name: PRICE_KIND_COMMUNITY_COUNT)
  int? priceKindCommunityCount;

  @JsonKey(name: PRICE_KIND_CONSUMPTION_COUNT)
  int? priceKindConsumptionCount;

  @JsonKey(name: PRICE_SOURCE_WEB_COUNT)
  int? priceSourceWebCount;

  @JsonKey(name: PRICE_SOURCE_MOBILE_COUNT)
  int? priceSourceMobileCount;

  @JsonKey(name: PRICE_SOURCE_API_COUNT)
  int? priceSourceApiCount;

  @JsonKey(name: PRICE_SOURCE_OTHER_COUNT)
  int? priceSourceOtherCount;

  @JsonKey(name: PRODUCT_COUNT)
  int? productCount;

  @JsonKey(name: PRODUCT_SOURCE_OFF_COUNT)
  int? productSourceOffCount;

  @JsonKey(name: PRODUCT_SOURCE_OBF_COUNT)
  int? productSourceObfCount;

  @JsonKey(name: PRODUCT_SOURCE_OPFF_COUNT)
  int? productSourceOpffCount;

  @JsonKey(name: PRODUCT_SOURCE_OPF_COUNT)
  int? productSourceOpfCount;

  @JsonKey(name: PRODUCT_WITH_PRICE_COUNT)
  int? productWithPriceCount;

  @JsonKey(name: PRODUCT_SOURCE_OFF_WITH_PRICE_COUNT)
  int? productSourceOffWithPriceCount;

  @JsonKey(name: PRODUCT_SOURCE_OBF_WITH_PRICE_COUNT)
  int? productSourceObfWithPriceCount;

  @JsonKey(name: PRODUCT_SOURCE_OPFF_WITH_PRICE_COUNT)
  int? productSourceOpffWithPriceCount;

  @JsonKey(name: PRODUCT_SOURCE_OPF_WITH_PRICE_COUNT)
  int? productSourceOpfWithPriceCount;

  @JsonKey(name: LOCATION_COUNT)
  int? locationCount;

  @JsonKey(name: LOCATION_WITH_PRICE_COUNT)
  int? locationWithPriceCount;

  @JsonKey(name: LOCATION_TYPE_OSM_COUNT)
  int? locationTypeOsmCount;

  @JsonKey(name: LOCATION_TYPE_ONLINE_COUNT)
  int? locationTypeOnlineCount;

  @JsonKey(name: LOCATION_TYPE_OSM_COUNTRY_COUNT)
  int? locationTypeOsmCountryCount;

  @JsonKey(name: PROOF_COUNT)
  int? proofCount;

  @JsonKey(name: PROOF_WITH_PRICE_COUNT)
  int? proofWithPriceCount;

  @JsonKey(name: PROOF_TYPE_PRICE_TAG_COUNT)
  int? proofTypePriceTagCount;

  @JsonKey(name: PROOF_TYPE_RECEIPT_COUNT)
  int? proofTypeReceiptCount;

  @JsonKey(name: PROOF_TYPE_GDPR_REQUEST_COUNT)
  int? proofTypeGdprRequestCount;

  @JsonKey(name: PROOF_TYPE_SHOP_IMPORT_COUNT)
  int? proofTypeShopImportCount;

  @JsonKey(name: PROOF_KIND_COMMUNITY_COUNT)
  int? proofKindCommunityCount;

  @JsonKey(name: PROOF_KIND_CONSUMPTION_COUNT)
  int? proofKindConsumptionCount;

  @JsonKey(name: PROOF_SOURCE_WEB_COUNT)
  int? proofSourceWebCount;

  @JsonKey(name: PROOF_SOURCE_MOBILE_COUNT)
  int? proofSourceMobileCount;

  @JsonKey(name: PROOF_SOURCE_API_COUNT)
  int? proofSourceApiCount;

  @JsonKey(name: PROOF_SOURCE_OTHER_COUNT)
  int? proofSourceOtherCount;

  @JsonKey(name: PRICE_TAG_COUNT)
  int? priceTagCount;

  @JsonKey(name: PRICE_TAG_STATUS_UNKNOWN_COUNT)
  int? priceTagStatusUnknownCount;

  @JsonKey(name: PRICE_TAG_STATUS_LINKED_TO_PRICE_COUNT)
  int? priceTagStatusLinkedToPriceCount;

  @JsonKey(name: USER_COUNT)
  int? userCount;

  @JsonKey(name: USER_WITH_PRICE_COUNT)
  int? userWithPriceCount;

  @JsonKey(name: UPDATED, fromJson: JsonHelper.nullableStringTimestampToDate)
  DateTime? updated;

  int? getInt(String key) {
    if (!_rawData.containsKey(key)) return null;
    final value = _rawData[key];
    if (value is int) return value;
    return int.tryParse(value?.toString() ?? '');
  }

  String? getString(String key) =>
      _rawData.containsKey(key) ? _rawData[key]?.toString() : null;

  double? getDouble(String key) {
    if (!_rawData.containsKey(key)) return null;
    final value = _rawData[key];
    if (value is double) return value;
    return double.tryParse(value?.toString() ?? '');
  }

  bool? getBool(String key) =>
      _rawData.containsKey(key) && _rawData[key] is bool
          ? _rawData[key] as bool
          : null;

  DateTime? getDateTime(String key) => _rawData.containsKey(key)
      ? JsonHelper.nullableStringTimestampToDate(_rawData[key])
      : null;

  bool containsKey(String key) => _rawData.containsKey(key);

  Set<String> get availableKeys => _rawData.keys.toSet();

  PriceTotalStats();

  factory PriceTotalStats.fromJson(Map<String, dynamic> json) {
    final result = _$PriceTotalStatsFromJson(json);
    result._rawData = Map<String, dynamic>.from(json);
    return result;
  }

  @override
  Map<String, dynamic> toJson() {
    final json = _$PriceTotalStatsToJson(this);

    for (final entry in _rawData.entries) {
      if (!json.containsKey(entry.key)) {
        json[entry.key] = entry.value;
      }
    }
    return json;
  }
}
