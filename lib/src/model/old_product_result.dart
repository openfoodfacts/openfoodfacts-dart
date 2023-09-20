import 'package:json_annotation/json_annotation.dart';
import '../interface/json_object.dart';
import 'product.dart';

part 'old_product_result.g.dart';

/// Product Result (old style).
// TODO(monsieurtanuki): get rid of it when OBF OPF OPFF support api v3
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
