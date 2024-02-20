import 'package:json_annotation/json_annotation.dart';

import 'location_osm_type.dart';
import '../interface/json_object.dart';
import '../utils/json_helper.dart';

part 'location.g.dart';

/// Location object in the Prices API.
///
/// cf. `LocationBase` in https://prices.openfoodfacts.net/docs
@JsonSerializable()
class Location extends JsonObject {
  /// ID of the location in OpenStreetMap: the store where the product was bought.
  @JsonKey(name: 'osm_id')
  late int osmId;

  /// Type of the OpenStreetMap location object.
  ///
  /// Stores can be represented as nodes, ways or relations in OpenStreetMap.
  /// It is necessary to be able to fetch the correct information about the
  /// store using the ID.
  @JsonKey(name: 'osm_type')
  late LocationOSMType type;

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

  @JsonKey(name: 'osm_lat')
  double? latitude;

  @JsonKey(name: 'osm_lon')
  double? longitude;

  /// Date when the product was bought.
  @JsonKey(fromJson: JsonHelper.stringTimestampToDate)
  late DateTime created;

  /// Date when the product was bought.
  @JsonKey(fromJson: JsonHelper.nullableStringTimestampToDate)
  DateTime? updated;

  Location();

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
