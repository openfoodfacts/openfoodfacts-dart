import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';
import 'Product.dart';

part 'SearchResult.g.dart';

@JsonSerializable()
class SearchResult extends JsonObject {
  @JsonKey(name: "page", nullable: false, fromJson: JsonObject.parseInt)
  final int page;

  @JsonKey(name: "page_size", nullable: false, fromJson: JsonObject.parseInt)
  final int pageSize;

  @JsonKey(name: "count", nullable: false, fromJson: JsonObject.parseInt)
  final int count;

  @JsonKey(name: "skip", nullable: false, fromJson: JsonObject.parseInt)
  final int skip;

  @JsonKey(name: "products_json", includeIfNull: false)
  final List<dynamic> jsonProducts;

  @JsonKey(includeIfNull: false)
  final List<Product> products;

  const SearchResult(
      {this.page, this.pageSize, this.count, this.skip, this.jsonProducts, this.products});

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      page: JsonObject.parseInt(json['page']),
      pageSize: JsonObject.parseInt(json['page_size']),
      count: JsonObject.parseInt(json['count']),
      skip: JsonObject.parseInt(json['skip']),
      jsonProducts: json['products'],
      products: (json['products'] as List)
          ?.map((e) =>
      e == null ? null : Product.fromJson(e as Map<String, dynamic>))
          ?.toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}
