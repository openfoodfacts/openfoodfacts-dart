import 'package:json_annotation/json_annotation.dart';
import '../utils/json_helper.dart';
import '../interface/json_object.dart';

part 'product_stats.g.dart';

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

  ProductStats copyWith({
    String? barcode,
    int? numberOfKeys,
    int? numberOfEditors,
    DateTime? lastEdit,
  }) {
    return ProductStats(
      barcode: barcode ?? this.barcode,
      numberOfKeys: numberOfKeys ?? this.numberOfKeys,
      numberOfEditors: numberOfEditors ?? this.numberOfEditors,
      lastEdit: lastEdit ?? this.lastEdit,
    );
  }
}
