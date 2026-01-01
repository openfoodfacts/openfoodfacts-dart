// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'robotoff_nutrient_extraction_insight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RobotoffNutrientDataWrapper _$RobotoffNutrientDataWrapperFromJson(
  Map<String, dynamic> json,
) => RobotoffNutrientDataWrapper(
  entities: (json['entities'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(
      k,
      (e as List<dynamic>)
          .map(
            (e) => RobotoffNutrientEntity.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
  ),
  nutrients: (json['nutrients'] as Map<String, dynamic>?)?.map(
    (k, e) =>
        MapEntry(k, RobotoffNutrientEntity.fromJson(e as Map<String, dynamic>)),
  ),
  annotation: json['annotation'] == null
      ? null
      : RobotoffNutrientAnnotation.fromJson(
          json['annotation'] as Map<String, dynamic>,
        ),
  wasUpdated: json['was_updated'] as bool?,
);

Map<String, dynamic> _$RobotoffNutrientDataWrapperToJson(
  RobotoffNutrientDataWrapper instance,
) => <String, dynamic>{
  'entities': instance.entities,
  'nutrients': instance.nutrients,
  'annotation': instance.annotation,
  'was_updated': instance.wasUpdated,
};

RobotoffNutrientExtractionInsight _$RobotoffNutrientExtractionInsightFromJson(
  Map<String, dynamic> json,
) => RobotoffNutrientExtractionInsight(
  insightId: json['id'] as String?,
  barcode: json['barcode'] as String?,
  data: json['data'] == null
      ? null
      : RobotoffNutrientDataWrapper.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
  timestamp: JsonHelper.nullableStringTimestampToDate(json['timestamp']),
  completedAt: JsonHelper.nullableStringTimestampToDate(json['completed_at']),
  annotation: (json['annotation'] as num?)?.toInt(),
  annotatedResult: (json['annotated_result'] as num?)?.toInt(),
  nVotes: (json['n_votes'] as num?)?.toInt(),
  username: json['username'] as String?,
  brands: (json['brands'] as List<dynamic>?)?.map((e) => e as String).toList(),
  processAfter: json['process_after'] as String?,
  valueTag: json['value_tag'] as String?,
  value: json['value'] as String?,
  sourceImage: json['source_image'] as String?,
  automaticProcessing: json['automatic_processing'] as bool?,
  serverType: json['server_type'] as String?,
  uniqueScansN: (json['unique_scans_n'] as num?)?.toInt(),
  reservedBarcode: json['reserved_barcode'] as bool?,
  predictor: json['predictor'] as String?,
  predictorVersion: json['predictor_version'] as String?,
  campaign: (json['campaign'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  confidence: (json['confidence'] as num?)?.toDouble(),
);

Map<String, dynamic> _$RobotoffNutrientExtractionInsightToJson(
  RobotoffNutrientExtractionInsight instance,
) => <String, dynamic>{
  'id': instance.insightId,
  'barcode': instance.barcode,
  'data': instance.data,
  'timestamp': instance.timestamp?.toIso8601String(),
  'completed_at': instance.completedAt?.toIso8601String(),
  'annotation': instance.annotation,
  'annotated_result': instance.annotatedResult,
  'n_votes': instance.nVotes,
  'username': instance.username,
  'brands': instance.brands,
  'process_after': instance.processAfter,
  'value_tag': instance.valueTag,
  'value': instance.value,
  'source_image': instance.sourceImage,
  'automatic_processing': instance.automaticProcessing,
  'server_type': instance.serverType,
  'unique_scans_n': instance.uniqueScansN,
  'reserved_barcode': instance.reservedBarcode,
  'predictor': instance.predictor,
  'predictor_version': instance.predictorVersion,
  'campaign': instance.campaign,
  'confidence': instance.confidence,
};
