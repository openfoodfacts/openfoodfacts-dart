import 'package:json_annotation/json_annotation.dart';
import '../utils/json_helper.dart';
import '../interface/json_object.dart';

part 'product_tag.g.dart';

/// Folksonomy product tag: for this barcode, that value is set for that key.
@JsonSerializable()
class ProductTag extends JsonObject {
  @JsonKey(name: 'product')
  final String barcode;
  @JsonKey(name: 'k')
  final String key;
  @JsonKey(name: 'v')
  final String value;
  final String owner;
  final int version;
  final String editor;
  @JsonKey(name: 'last_edit', fromJson: JsonHelper.stringTimestampToDate)
  final DateTime lastEdit;
  final String comment;

  ProductTag({
    required this.barcode,
    required this.key,
    required this.value,
    required this.owner,
    required this.version,
    required this.editor,
    required this.lastEdit,
    required this.comment,
  });

  factory ProductTag.fromJson(Map<String, dynamic> json) =>
      _$ProductTagFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductTagToJson(this);

  @override
  String toString() => toJson().toString();
}
