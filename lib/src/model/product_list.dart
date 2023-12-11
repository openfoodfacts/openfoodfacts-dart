import 'package:json_annotation/json_annotation.dart';
import '../interface/json_object.dart';

part 'product_list.g.dart';

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

  ProductList copyWith({
    String? barcode,
    String? key,
    String? value,
  }) {
    return ProductList(
      barcode: barcode ?? this.barcode,
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }
}
