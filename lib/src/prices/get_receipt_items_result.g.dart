// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_receipt_items_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReceiptItemsResult _$GetReceiptItemsResultFromJson(
  Map<String, dynamic> json,
) => GetReceiptItemsResult()
  ..items = (json['items'] as List<dynamic>?)
      ?.map((e) => ReceiptItem.fromJson(e as Map<String, dynamic>))
      .toList()
  ..total = (json['total'] as num?)?.toInt()
  ..pageNumber = (json['page'] as num?)?.toInt()
  ..pageSize = (json['size'] as num?)?.toInt()
  ..numberOfPages = (json['pages'] as num?)?.toInt();

Map<String, dynamic> _$GetReceiptItemsResultToJson(
  GetReceiptItemsResult instance,
) => <String, dynamic>{
  'items': instance.items,
  'total': instance.total,
  'page': instance.pageNumber,
  'size': instance.pageSize,
  'pages': instance.numberOfPages,
};
