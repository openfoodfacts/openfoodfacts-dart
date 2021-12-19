import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

part 'ProductList.g.dart';

/// Folksonomy: current value for a product and a tag key.
@JsonSerializable()
class ProductList extends JsonObject {
  @JsonKey(name: 'product')
  final String barcode;
  @JsonKey(name: 'k')
  final String key;
  @JsonKey(name: 'v')
  final String value;

  ProductList({
    required this.barcode,
    required this.key,
    required this.value,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) =>
      _$ProductListFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductListToJson(this);

  @override
  String toString() => toJson().toString();
}
