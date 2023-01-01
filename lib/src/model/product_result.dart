import 'package:json_annotation/json_annotation.dart';
import '../interface/json_object.dart';
import 'product.dart';

part 'product_result.g.dart';

// TODO: deprecated from 2022-12-01; remove when old enough
@Deprecated('Use ProductResultV3 instead')
@JsonSerializable()
class ProductResult extends JsonObject {
  final int? status;
  @JsonKey(name: 'code')
  final String? barcode;
  @JsonKey(name: 'status_verbose')
  final String? statusVerbose;
  final Product? product;

  const ProductResult(
      {this.status, this.barcode, this.statusVerbose, this.product});

  factory ProductResult.fromJson(Map<String, dynamic> json) =>
      _$ProductResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductResultToJson(this);
}
