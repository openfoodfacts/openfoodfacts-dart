// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'robotoff_nutrient_extraction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RobotoffNutrientExtractionResult _$RobotoffNutrientExtractionResultFromJson(
        Map<String, dynamic> json) =>
    RobotoffNutrientExtractionResult(
      status: json['status'] as String?,
      count: (json['count'] as num?)?.toInt(),
      insights: (json['insights'] as List<dynamic>?)
          ?.map((e) =>
              NutrientExtractionInsight.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RobotoffNutrientExtractionResultToJson(
        RobotoffNutrientExtractionResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'count': instance.count,
      'insights': instance.insights,
    };

NutrientEntity _$NutrientEntityFromJson(Map<String, dynamic> json) =>
    NutrientEntity(
      start: (json['start'] as num?)?.toInt(),
      end: (json['end'] as num?)?.toInt(),
      text: json['text'] as String?,
      unit: json['unit'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      valid: json['valid'] as bool?,
      value: json['value'] as String?,
      entity: json['entity'] as String?,
      charStart: (json['char_start'] as num?)?.toInt(),
      charEnd: (json['char_end'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NutrientEntityToJson(NutrientEntity instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
      'text': instance.text,
      'unit': instance.unit,
      'score': instance.score,
      'valid': instance.valid,
      'value': instance.value,
      'entity': instance.entity,
      'char_start': instance.charStart,
      'char_end': instance.charEnd,
    };

NutrientAnnotationData _$NutrientAnnotationDataFromJson(
        Map<String, dynamic> json) =>
    NutrientAnnotationData(
      unit: json['unit'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$NutrientAnnotationDataToJson(
        NutrientAnnotationData instance) =>
    <String, dynamic>{
      'unit': instance.unit,
      'value': instance.value,
    };

NutrientAnnotation _$NutrientAnnotationFromJson(Map<String, dynamic> json) =>
    NutrientAnnotation(
      nutrients: (json['nutrients'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k, NutrientAnnotationData.fromJson(e as Map<String, dynamic>)),
      ),
      servingSize: json['serving_size'] as String?,
      nutritionDataPer: json['nutrition_data_per'] as String?,
    );

Map<String, dynamic> _$NutrientAnnotationToJson(NutrientAnnotation instance) =>
    <String, dynamic>{
      'nutrients': instance.nutrients,
      'serving_size': instance.servingSize,
      'nutrition_data_per': instance.nutritionDataPer,
    };

NutrientDataWrapper _$NutrientDataWrapperFromJson(Map<String, dynamic> json) =>
    NutrientDataWrapper(
      entities: (json['entities'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => NutrientEntity.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      nutrients: (json['nutrients'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, NutrientEntity.fromJson(e as Map<String, dynamic>)),
      ),
      annotation: json['annotation'] == null
          ? null
          : NutrientAnnotation.fromJson(
              json['annotation'] as Map<String, dynamic>),
      wasUpdated: json['was_updated'] as bool?,
    );

Map<String, dynamic> _$NutrientDataWrapperToJson(
        NutrientDataWrapper instance) =>
    <String, dynamic>{
      'entities': instance.entities,
      'nutrients': instance.nutrients,
      'annotation': instance.annotation,
      'was_updated': instance.wasUpdated,
    };

NutrientExtractionInsight _$NutrientExtractionInsightFromJson(
        Map<String, dynamic> json) =>
    NutrientExtractionInsight(
      insightId: json['id'] as String?,
      barcode: json['barcode'] as String?,
      type: json['type'] as String?,
      data: json['data'] == null
          ? null
          : NutrientDataWrapper.fromJson(json['data'] as Map<String, dynamic>),
      timestamp: json['timestamp'] as String?,
      completedAt: json['completed_at'] as String?,
      annotation: (json['annotation'] as num?)?.toInt(),
      annotatedResult: (json['annotated_result'] as num?)?.toInt(),
      nVotes: (json['n_votes'] as num?)?.toInt(),
      username: json['username'] as String?,
      countries: (json['countries'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      brands:
          (json['brands'] as List<dynamic>?)?.map((e) => e as String).toList(),
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
      boundingBox: json['bounding_box'],
    );

Map<String, dynamic> _$NutrientExtractionInsightToJson(
        NutrientExtractionInsight instance) =>
    <String, dynamic>{
      'id': instance.insightId,
      'barcode': instance.barcode,
      'type': instance.type,
      'data': instance.data,
      'timestamp': instance.timestamp,
      'completed_at': instance.completedAt,
      'annotation': instance.annotation,
      'annotated_result': instance.annotatedResult,
      'n_votes': instance.nVotes,
      'username': instance.username,
      'countries': instance.countries,
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
      'bounding_box': instance.boundingBox,
    };
