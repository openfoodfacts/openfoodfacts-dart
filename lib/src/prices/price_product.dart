import 'package:json_annotation/json_annotation.dart';

import 'flavor.dart';
import '../interface/json_object.dart';
import '../utils/json_helper.dart';

part 'price_product.g.dart';

/// Product object in the Prices API.
///
/// cf. `ProductFull` in https://prices.openfoodfacts.net/docs
@JsonSerializable()
class PriceProduct extends JsonObject {
  /// Barcode (EAN) of the product, as a string.
  @JsonKey()
  late String code;

  /// Number of prices for this product.
  @JsonKey(name: 'price_count')
  late int priceCount;

  @JsonKey(name: 'id')
  late int productId;

  /// Source of data.
  @JsonKey()
  Flavor? source;

  @JsonKey(name: 'product_name')
  String? name;

  @JsonKey(name: 'product_quantity')
  int? quantity;

  @JsonKey(name: 'product_quantity_unit')
  String? quantityUnit;

  @JsonKey(name: 'categories_tags')
  late List<String> categoriesTags;

  @JsonKey()
  String? brands;

  @JsonKey(name: 'brands_tags')
  late List<String> brandsTags;

  @JsonKey(name: 'labels_tags')
  late List<String> labelsTags;

  @JsonKey(name: 'image_url')
  String? imageURL;

  @JsonKey(name: 'nutriscore_grade')
  String? nutriscoreGrade;

  @JsonKey(name: 'ecoscore_grade')
  String? ecoscoreGrade;

  @JsonKey(name: 'nova_group')
  int? novaGroup;

  @JsonKey(name: 'unique_scans_n')
  late int uniqueScansNumber;

  @JsonKey(fromJson: JsonHelper.stringTimestampToDate)
  late DateTime created;

  @JsonKey(fromJson: JsonHelper.nullableStringTimestampToDate)
  DateTime? updated;

  PriceProduct();

  factory PriceProduct.fromJson(Map<String, dynamic> json) =>
      _$PriceProductFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PriceProductToJson(this);
}
