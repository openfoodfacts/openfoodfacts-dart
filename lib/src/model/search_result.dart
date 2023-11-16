import 'package:json_annotation/json_annotation.dart';
import '../interface/json_object.dart';
import 'product.dart';

part 'search_result.g.dart';

@JsonSerializable()
class SearchResult extends JsonObject {
  @JsonKey(name: 'page', fromJson: JsonObject.parseInt)
  final int? page;

  @JsonKey(name: 'page_size', fromJson: JsonObject.parseInt)
  final int? pageSize;

  @JsonKey(name: 'count', fromJson: JsonObject.parseInt)
  final int? count;

  @JsonKey(name: 'page_count', fromJson: JsonObject.parseInt)
  final int? pageCount;

  @JsonKey(name: 'skip', fromJson: JsonObject.parseInt)
  final int? skip;

  @JsonKey(name: 'products', includeIfNull: false)
  final List<Product>? products;

  const SearchResult({
    this.page,
    this.pageSize,
    this.count,
    this.pageCount,
    this.skip,
    this.products,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}
