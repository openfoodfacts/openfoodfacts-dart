import 'package:json_annotation/json_annotation.dart';

import 'price_product.dart';
import '../interface/json_object.dart';

part 'get_price_products_result.g.dart';

/// List of price product objects returned by the "get price products" method.
@JsonSerializable()
class GetPriceProductsResult extends JsonObject {
  @JsonKey()
  List<PriceProduct>? items;

  @JsonKey()
  int? total;

  @JsonKey(name: 'page')
  int? pageNumber;

  @JsonKey(name: 'size')
  int? pageSize;

  @JsonKey(name: 'pages')
  int? numberOfPages;

  GetPriceProductsResult();

  factory GetPriceProductsResult.fromJson(Map<String, dynamic> json) =>
      _$GetPriceProductsResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetPriceProductsResultToJson(this);
}
