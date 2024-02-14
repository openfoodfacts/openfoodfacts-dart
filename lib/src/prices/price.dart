import 'package:json_annotation/json_annotation.dart';

import 'currency.dart';
import 'location_osm_type.dart';
import 'price_per.dart';
import '../interface/json_object.dart';
import '../utils/json_helper.dart';

part 'price.g.dart';

/// Price object.
///
/// cf. PriceFull in https://prices.openfoodfacts.org/api/docs
@JsonSerializable()
class Price extends JsonObject {
  /// Barcode (EAN) of the product.
  @JsonKey(name: 'product_code')
  String? productCode;

  /// Name of the product, as displayed on the receipt or the price tag.
  @JsonKey(name: 'product_name')
  String? productName;

  /// ID of the OFF category of the product for products without barcode.
  ///
  /// This is mostly for raw products such as vegetables or fruits. This field
  /// is exclusive with `product_code`: if this field is set, it means that the
  /// product does not have a barcode.
  /// This ID must be a canonical category ID in the Open Food Facts taxonomy.
  /// If the ID is not valid, the price will be rejected.
  @JsonKey(name: 'category_tag')
  String? categoryTag;

  /// Labels of the product, only for products without barcode.
  ///
  /// The labels must be valid labels in the Open Food Facts taxonomy.
  /// If one of the labels is not valid, the price will be rejected.
  /// The most common labels are:
  /// - `en:organic`: the product is organic
  /// - `fr:ab-agriculture-biologique`: the product is organic, in France
  /// - `en:fair-trade`: the product is fair-trade
  /// Other labels can be provided if relevant.
  @JsonKey(name: 'labels_tags')
  List<String>? labelsTags;

  /// Origins of the product, only for products without barcode.
  ///
  /// This field is a list as some products may be a mix of several origins, but
  /// most products have only one origin.
  /// The origins must be valid origins in the Open Food Facts taxonomy.
  /// If one of the origins is not valid, the price will be rejected.
  @JsonKey(name: 'origins_tags')
  List<String>? originsTags;

  /// Price of the product, without its currency, taxes included.
  @JsonKey()
  late num price;

  /// True if the price is discounted.
  @JsonKey(name: 'price_is_discounted')
  bool? priceIsDiscounted;

  /// Price of the product, without discount, taxes included.
  ///
  /// If the product is not discounted, this field must be null.
  @JsonKey(name: 'price_without_discount')
  num? priceWithoutDiscount;

  /// Price per unit, kilogram, ..?
  ///
  /// if the price is about a barcode-less product (if category_tag is
  /// provided), this field must be set to KILOGRAM or UNIT (KILOGRAM by
  /// default). This field is set to null and ignored if product_code is
  /// provided.
  @JsonKey(name: 'price_per')
  PricePer? pricePer;

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

  @JsonKey()
  late int id;

  @JsonKey(name: 'product_id')
  int? productId;

  @JsonKey(name: 'location_id')
  int? locationId;

  /// Owner.
  @JsonKey()
  late String owner;

  @JsonKey(fromJson: JsonHelper.stringTimestampToDate)
  late DateTime created;

  Price();

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
