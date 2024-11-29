import 'package:json_annotation/json_annotation.dart';
import '../interface/json_object.dart';
import 'product.dart';

part 'old_product_result.g.dart';

/// Product Result (old style).
// TODO: deprecated from 2024-11-28; remove when old enough
@Deprecated('Use getProductV3 and ProductResultV3 instead')
@JsonSerializable()
class OldProductResult extends JsonObject {
  final int? status;
  @JsonKey(name: 'code')
  final String? barcode;
  @JsonKey(name: 'status_verbose')
  final String? statusVerbose;
  final Product? product;

  const OldProductResult(
      {this.status, this.barcode, this.statusVerbose, this.product});

  factory OldProductResult.fromJson(Map<String, dynamic> json) =>
      _$OldProductResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OldProductResultToJson(this);
}
