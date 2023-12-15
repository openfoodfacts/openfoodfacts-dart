import 'package:json_annotation/json_annotation.dart';

import '../interface/json_object.dart';
import '../utils/json_helper.dart';

part 'price_product.g.dart';

/// Product object in the Prices API.
///
/// cf. `ProductBase` in https://prices.openfoodfacts.net/docs
@JsonSerializable()
class PriceProduct extends JsonObject {
  @JsonKey()
  late String code;

  @JsonKey(name: 'id')
  late int productId;

  @JsonKey()
  String? source;

  @JsonKey(name: 'product_name')
  String? name;

  @JsonKey(name: 'product_quantity')
  int? quantity;

  @JsonKey(name: 'image_url')
  String? imageURL;

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
