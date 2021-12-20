import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/utils/JsonHelper.dart';
import '../interface/JsonObject.dart';

part 'ProductStats.g.dart';

/// Folksonomy: statistics about the tag keys on a product.
@JsonSerializable()
class ProductStats extends JsonObject {
  @JsonKey(name: 'product')
  final String barcode;
  @JsonKey(name: 'keys')
  final int numberOfKeys;
  @JsonKey(name: 'editors')
  final int numberOfEditors;
  @JsonKey(
    name: 'last_edit',
    fromJson: JsonHelper.stringTimestampToDate,
  )
  final DateTime lastEdit;

  ProductStats({
    required this.barcode,
    required this.numberOfKeys,
    required this.numberOfEditors,
    required this.lastEdit,
  });

  factory ProductStats.fromJson(Map<String, dynamic> json) =>
      _$ProductStatsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductStatsToJson(this);

  @override
  String toString() => toJson().toString();
}
