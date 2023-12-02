import 'package:json_annotation/json_annotation.dart';

import 'price.dart';
import '../interface/json_object.dart';

part 'get_prices_result.g.dart';

/// List of price objects returned by the "get prices" method.
@JsonSerializable()
class GetPricesResult extends JsonObject {
  @JsonKey()
  List<Price>? items;

  @JsonKey()
  int? total;

  @JsonKey(name: 'page')
  int? pageNumber;

  @JsonKey(name: 'size')
  int? pageSize;

  @JsonKey(name: 'pages')
  int? numberOfPages;

  GetPricesResult();

  factory GetPricesResult.fromJson(Map<String, dynamic> json) =>
      _$GetPricesResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetPricesResultToJson(this);
}
