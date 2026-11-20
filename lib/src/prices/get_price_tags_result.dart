import 'package:json_annotation/json_annotation.dart';

import '../interface/json_object.dart';
import 'price_tag.dart';

part 'get_price_tags_result.g.dart';

/// List of price tag objects returned by the "get price tags" method.
@JsonSerializable()
class GetPriceTagsResult extends JsonObject {
  @JsonKey()
  List<PriceTag>? items;

  @JsonKey()
  int? total;

  @JsonKey(name: 'page')
  int? pageNumber;

  @JsonKey(name: 'size')
  int? pageSize;

  @JsonKey(name: 'pages')
  int? numberOfPages;

  GetPriceTagsResult();

  factory GetPriceTagsResult.fromJson(Map<String, dynamic> json) =>
      _$GetPriceTagsResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetPriceTagsResultToJson(this);
}
