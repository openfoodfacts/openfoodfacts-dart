import 'package:json_annotation/json_annotation.dart';
import '../interface/json_object.dart';

part 'robotoff_nutrient_extraction.g.dart';

@JsonSerializable()
class RobotoffNutrientExtractionResult extends JsonObject {
  final String? status;
  final int? count;
  final List<NutrientExtractionInsight>? insights;

  const RobotoffNutrientExtractionResult({
    this.status,
    this.count,
    this.insights,
  });

  NutrientExtractionInsight? get getLatestInsights {
    insights?.sort((a, b) => a.completedAt!.compareTo(b.completedAt!));
    return insights?.last;
  }

  NutrientEntity? getNutrientEntity(String nutrientKey) {
    return getLatestInsights?.data?.nutrients?[nutrientKey];
  }

  factory RobotoffNutrientExtractionResult.fromJson(
          Map<String, dynamic> json) =>
      _$RobotoffNutrientExtractionResultFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$RobotoffNutrientExtractionResultToJson(this);
}

@JsonSerializable()
class NutrientEntity {
  final int? start;
  final int? end;
  final String? text;
  final String? unit;
  final double? score;
  final bool? valid;
  final String? value;
  final String? entity;
  @JsonKey(name: 'char_start')
  final int? charStart;
  @JsonKey(name: 'char_end')
  final int? charEnd;

  const NutrientEntity({
    this.start,
    this.end,
    this.text,
    this.unit,
    this.score,
    this.valid,
    this.value,
    this.entity,
    this.charStart,
    this.charEnd,
  });

  factory NutrientEntity.fromJson(Map<String, dynamic> json) =>
      _$NutrientEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NutrientEntityToJson(this);
}

@JsonSerializable()
class NutrientAnnotationData {
  final String? unit;
  final String? value;

  const NutrientAnnotationData({
    this.unit,
    this.value,
  });

  factory NutrientAnnotationData.fromJson(Map<String, dynamic> json) =>
      _$NutrientAnnotationDataFromJson(json);

  Map<String, dynamic> toJson() => _$NutrientAnnotationDataToJson(this);
}

@JsonSerializable()
class NutrientAnnotation {
  final Map<String, NutrientAnnotationData>? nutrients;
  @JsonKey(name: 'serving_size')
  final String? servingSize;
  @JsonKey(name: 'nutrition_data_per')
  final String? nutritionDataPer;

  const NutrientAnnotation({
    this.nutrients,
    this.servingSize,
    this.nutritionDataPer,
  });

  factory NutrientAnnotation.fromJson(Map<String, dynamic> json) =>
      _$NutrientAnnotationFromJson(json);

  Map<String, dynamic> toJson() => _$NutrientAnnotationToJson(this);
}

@JsonSerializable()
class NutrientDataWrapper {
  final Map<String, List<NutrientEntity>>? entities;
  final Map<String, NutrientEntity>? nutrients;
  final NutrientAnnotation? annotation;
  @JsonKey(name: 'was_updated')
  final bool? wasUpdated;

  const NutrientDataWrapper({
    this.entities,
    this.nutrients,
    this.annotation,
    this.wasUpdated,
  });

  factory NutrientDataWrapper.fromJson(Map<String, dynamic> json) =>
      _$NutrientDataWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$NutrientDataWrapperToJson(this);
}

@JsonSerializable()
class NutrientExtractionInsight extends JsonObject {
  @JsonKey(name: 'id')
  final String? insightId;
  final String? barcode;
  final String? type;
  final NutrientDataWrapper? data;
  final String? timestamp;
  @JsonKey(name: 'completed_at')
  final String? completedAt;
  final int? annotation;
  @JsonKey(name: 'annotated_result')
  final int? annotatedResult;
  @JsonKey(name: 'n_votes')
  final int? nVotes;
  final String? username;
  final List<String>? countries;
  final List<String>? brands;
  @JsonKey(name: 'process_after')
  final String? processAfter;
  @JsonKey(name: 'value_tag')
  final String? valueTag;
  final String? value;
  @JsonKey(name: 'source_image')
  final String? sourceImage;
  @JsonKey(name: 'automatic_processing')
  final bool? automaticProcessing;
  @JsonKey(name: 'server_type')
  final String? serverType;
  @JsonKey(name: 'unique_scans_n')
  final int? uniqueScansN;
  @JsonKey(name: 'reserved_barcode')
  final bool? reservedBarcode;
  final String? predictor;
  @JsonKey(name: 'predictor_version')
  final String? predictorVersion;
  final List<String>? campaign;
  final double? confidence;
  @JsonKey(name: 'bounding_box')
  final dynamic boundingBox;

  const NutrientExtractionInsight({
    this.insightId,
    this.barcode,
    this.type,
    this.data,
    this.timestamp,
    this.completedAt,
    this.annotation,
    this.annotatedResult,
    this.nVotes,
    this.username,
    this.countries,
    this.brands,
    this.processAfter,
    this.valueTag,
    this.value,
    this.sourceImage,
    this.automaticProcessing,
    this.serverType,
    this.uniqueScansN,
    this.reservedBarcode,
    this.predictor,
    this.predictorVersion,
    this.campaign,
    this.confidence,
    this.boundingBox,
  });

  factory NutrientExtractionInsight.fromJson(Map<String, dynamic> json) =>
      _$NutrientExtractionInsightFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NutrientExtractionInsightToJson(this);
}
