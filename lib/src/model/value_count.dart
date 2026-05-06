import 'package:json_annotation/json_annotation.dart';
import '../interface/json_object.dart';

part 'value_count.g.dart';

/// Folksonomy: statistics around a value.
@JsonSerializable()
class ValueCount extends JsonObject {
  @JsonKey(name: 'v')
  final String value;

  @JsonKey(name: 'product_count')
  final int productCount;

  ValueCount({required this.value, required this.productCount});

  factory ValueCount.fromJson(Map<String, dynamic> json) =>
      _$ValueCountFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ValueCountToJson(this);

  @override
  String toString() => toJson().toString();
}
