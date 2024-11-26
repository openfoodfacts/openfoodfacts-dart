import 'package:json_annotation/json_annotation.dart';

import 'location_osm_type.dart';
import 'location_type.dart';
import '../interface/json_object.dart';
import '../utils/json_helper.dart';

part 'location.g.dart';

/// Location object in the Prices API.
///
/// cf. `Location` in https://prices.openfoodfacts.org/api/docs
@JsonSerializable()
class Location extends JsonObject {
  /// ID of the location in OpenStreetMap: the store where the product was bought.
  @JsonKey(name: 'osm_id')
  int? osmId;

  /// Type of the location object.
  @JsonKey(name: 'type')
  late LocationType locationType;

  /// Type of the OpenStreetMap location object.
  ///
  /// Stores can be represented as nodes, ways or relations in OpenStreetMap.
  /// It is necessary to be able to fetch the correct information about the
  /// store using the ID.
  @JsonKey(name: 'osm_type')
  LocationOSMType? type;

  /// Number of prices for this location.
  @JsonKey(name: 'price_count')
  int? priceCount;

  /// Number of users for this location.
  @JsonKey(name: 'user_count')
  int? userCount;

  /// Number of products for this location.
  @JsonKey(name: 'product_count')
  int? productCount;

  /// Number of proofs for this location.
  @JsonKey(name: 'proof_count')
  int? proofCount;

  /// ID in the Prices API.
  @JsonKey(name: 'id')
  late int locationId;

  @JsonKey(name: 'osm_name')
  String? name;

  @JsonKey(name: 'osm_display_name')
  String? displayName;

  @JsonKey(name: 'osm_address_postcode')
  String? postcode;

  @JsonKey(name: 'osm_address_city')
  String? city;

  @JsonKey(name: 'osm_address_country')
  String? country;

  @JsonKey(name: 'osm_address_country_code')
  String? countryCode;

  @JsonKey(name: 'osm_tag_key')
  String? osmKey;

  @JsonKey(name: 'osm_tag_value')
  String? osmValue;

  @JsonKey(name: 'osm_lat')
  double? latitude;

  @JsonKey(name: 'osm_lon')
  double? longitude;

  @JsonKey(name: 'website_url')
  String? websiteUrl;

  /// Date when the product was bought.
  @JsonKey(fromJson: JsonHelper.stringTimestampToDate)
  late DateTime created;

  /// Latest update timestamp.
  @JsonKey(fromJson: JsonHelper.nullableStringTimestampToDate)
  DateTime? updated;

  Location();

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
