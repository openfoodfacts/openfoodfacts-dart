import 'package:json_annotation/json_annotation.dart';

import '../interface/json_object.dart';
import 'receipt_item.dart';

part 'get_receipt_items_result.g.dart';

/// List of receipt item objects returned by the "get receipt items" method.
@JsonSerializable()
class GetReceiptItemsResult extends JsonObject {
  @JsonKey()
  List<ReceiptItem>? items;

  @JsonKey()
  int? total;

  @JsonKey(name: 'page')
  int? pageNumber;

  @JsonKey(name: 'size')
  int? pageSize;

  @JsonKey(name: 'pages')
  int? numberOfPages;

  GetReceiptItemsResult();

  factory GetReceiptItemsResult.fromJson(Map<String, dynamic> json) =>
      _$GetReceiptItemsResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetReceiptItemsResultToJson(this);
}
