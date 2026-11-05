// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceTag _$PriceTagFromJson(Map<String, dynamic> json) => PriceTag()
  ..id = (json['id'] as num?)?.toInt()
  ..priceId = (json['price_id'] as num?)?.toInt()
  ..predictions = (json['predictions'] as List<dynamic>?)
      ?.map((e) => PriceTagPrediction.fromJson(e as Map<String, dynamic>))
      .toList()
  ..proof = json['proof'] == null
      ? null
      : ProofHalf.fromJson(json['proof'] as Map<String, dynamic>)
  ..imagePath = json['image_path'] as String?
  ..boundingBox = (json['bounding_box'] as List<dynamic>?)
      ?.map((e) => (e as num).toDouble())
      .toList()
  ..status = $enumDecodeNullable(_$PriceTagStatusEnumMap, json['status'])
  ..predictionCount = (json['prediction_count'] as num?)?.toInt()
  ..createdBy = json['created_by'] as String?
  ..updatedBy = json['updated_by'] as String?
  ..tags = (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..created = JsonHelper.nullableStringTimestampToDate(json['created'])
  ..updated = JsonHelper.nullableStringTimestampToDate(json['updated'])
  ..proofPrediction = (json['proof_prediction'] as num?)?.toInt();

Map<String, dynamic> _$PriceTagToJson(PriceTag instance) => <String, dynamic>{
  'id': instance.id,
  'price_id': instance.priceId,
  'predictions': instance.predictions,
  'proof': instance.proof,
  'image_path': instance.imagePath,
  'bounding_box': instance.boundingBox,
  'status': _$PriceTagStatusEnumMap[instance.status],
  'prediction_count': instance.predictionCount,
  'created_by': instance.createdBy,
  'updated_by': instance.updatedBy,
  'tags': instance.tags,
  'created': instance.created?.toIso8601String(),
  'updated': instance.updated?.toIso8601String(),
  'proof_prediction': instance.proofPrediction,
};

const _$PriceTagStatusEnumMap = {
  PriceTagStatus.deleted: 0,
  PriceTagStatus.linkedToPrice: 1,
  PriceTagStatus.notReadable: 2,
  PriceTagStatus.truncated: 3,
  PriceTagStatus.notPriceTag: 4,
  PriceTagStatus.noBarcode: 5,
  PriceTagStatus.other: 10,
};
