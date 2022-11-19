import 'package:json_annotation/json_annotation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import '../interface/JsonObject.dart';
import 'Product.dart';

part 'ProductResult.g.dart';

@CopyWith()
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
