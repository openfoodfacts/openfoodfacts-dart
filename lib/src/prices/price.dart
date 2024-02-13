import 'package:json_annotation/json_annotation.dart';

import 'currency.dart';
import 'location_osm_type.dart';
import '../interface/json_object.dart';
import '../utils/json_helper.dart';

part 'price.g.dart';

/// Price object.
///
/// cf. `PriceBase` in https://prices.openfoodfacts.net/docs
@JsonSerializable()
class Price extends JsonObject {
  /// Barcode (EAN) of the product.
  @JsonKey(name: 'product_code')
  String? productCode;

  /// ID of the OFF category of the product for products without barcode.
  ///
  /// This is mostly for raw products such as vegetables or fruits. This field
  /// is exclusive with `product_code`: if this field is set, it means that the
  /// product does not have a barcode.
  @JsonKey(name: 'category_tag')
  String? categoryTag;

  /// Labels of the product, only for products without barcode.
  ///
  /// The labels must be valid labels in the Open Food Facts taxonomy.
  /// If one of the labels is not valid, the price will be rejected.
  /// The most common labels are:
  /// - `en:organic`: the product is organic
  /// - `en:fair-trade`: the product is fair-trade
  /// Other labels can be provided if relevant.
  @JsonKey(name: 'labels_tags')
  List<String>? labelsTags;

  /// Price of the product, without its currency, taxes included.
  ///
  /// If the price is about a barcode-less product, it must be the price per
  /// kilogram or per liter.
  @JsonKey()
  late num price;

  /// Currency of the price.
  @JsonKey()
  late Currency currency;

  /// ID of the location in OpenStreetMap: the store where the product was bought.
  @JsonKey(name: 'location_osm_id')
  late int locationOSMId;

  /// Type of the OpenStreetMap location object.
  ///
  /// Stores can be represented as nodes, ways or relations in OpenStreetMap.
  /// It is necessary to be able to fetch the correct information about the
  /// store using the ID.
  @JsonKey(name: 'location_osm_type')
  late LocationOSMType locationOSMType;

  /// Date when the product was bought.
  @JsonKey(fromJson: JsonHelper.stringTimestampToDate)
  late DateTime date;

  /// ID of the proof, if any.
  ///
  /// The proof is a file (receipt or price tag image) uploaded by the user to
  /// prove the price of the product. The proof must be uploaded before the
  /// price, and the authenticated user must be the owner of the proof.
  @JsonKey(name: 'proof_id')
  int? proofId;

  @JsonKey(name: 'product_id')
  int? productId;

  @JsonKey(name: 'location_id')
  int? locationId;

  @JsonKey(fromJson: JsonHelper.stringTimestampToDate)
  late DateTime created;

  Price();

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
