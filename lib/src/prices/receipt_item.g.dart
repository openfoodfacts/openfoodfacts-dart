// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiptItem _$ReceiptItemFromJson(Map<String, dynamic> json) => ReceiptItem()
  ..id = (json['id'] as num?)?.toInt()
  ..proofId = (json['proof_id'] as num?)?.toInt()
  ..priceId = (json['price_id'] as num?)?.toInt()
  ..order = (json['order'] as num?)?.toInt()
  ..predictedData = json['predicted_data'] as Map<String, dynamic>?
  ..status = $enumDecodeNullable(_$ReceiptItemStatusEnumMap, json['status'])
  ..schemaVersion = json['schema_version'] as String?
  ..created = JsonHelper.nullableStringTimestampToDate(json['created'])
  ..updated = JsonHelper.nullableStringTimestampToDate(json['updated'])
  ..proofPrediction = (json['proof_prediction'] as num?)?.toInt();

Map<String, dynamic> _$ReceiptItemToJson(ReceiptItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'proof_id': instance.proofId,
      'price_id': instance.priceId,
      'order': instance.order,
      'predicted_data': instance.predictedData,
      'status': _$ReceiptItemStatusEnumMap[instance.status],
      'schema_version': instance.schemaVersion,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'proof_prediction': instance.proofPrediction,
    };

const _$ReceiptItemStatusEnumMap = {
  ReceiptItemStatus.deleted: 0,
  ReceiptItemStatus.linkedToPrice: 1,
};
