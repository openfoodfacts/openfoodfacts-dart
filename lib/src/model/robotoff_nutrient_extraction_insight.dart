import 'package:json_annotation/json_annotation.dart';
import '../utils/json_helper.dart';
import 'nutrient.dart';
import 'per_size.dart';

import '../interface/json_object.dart';
import 'robotoff_nutrient_extraction.dart';
import 'robotoff_nutrient_extraction_annotation.dart';

part 'robotoff_nutrient_extraction_insight.g.dart';

@JsonSerializable()
class RobotoffNutrientDataWrapper {
  final Map<String, List<RobotoffNutrientEntity>>? entities;
  final Map<String, RobotoffNutrientEntity>? nutrients;
  final RobotoffNutrientAnnotation? annotation;
  @JsonKey(name: 'was_updated')
  final bool? wasUpdated;

  const RobotoffNutrientDataWrapper({
    this.entities,
    this.nutrients,
    this.annotation,
    this.wasUpdated,
  });

  RobotoffNutrientEntity? getNutrientEntity({
    required Nutrient nutrient,
    required PerSize perSize,
    String? entityKey,
  }) {
    String tag = nutrient.getOffTagPerSize(perSize);

    if (entityKey != null) {
      for (RobotoffNutrientEntity entity in entities?[entityKey] ?? []) {
        if (entity.entity == tag) {
          return entity;
        }
      }
      return null;
    }

    return nutrients?[tag];
  }

  factory RobotoffNutrientDataWrapper.fromJson(Map<String, dynamic> json) =>
      _$RobotoffNutrientDataWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$RobotoffNutrientDataWrapperToJson(this);
}

@JsonSerializable()
class RobotoffNutrientExtractionInsight extends JsonObject {
  @JsonKey(name: 'id')
  String? insightId;
  String? barcode;
  // TODO: Figure out what this field is and what type it should be
  // final String? type;
  final RobotoffNutrientDataWrapper? data;
  @JsonKey(
      fromJson: JsonHelper.nullableStringTimestampToDate,
      toJson: JsonHelper.nullableDateToStringTimestamp)
  final DateTime? timestamp;
  @JsonKey(
      name: 'completed_at',
      fromJson: JsonHelper.nullableStringTimestampToDate,
      toJson: JsonHelper.nullableDateToStringTimestamp)
  final DateTime? completedAt;
  final int? annotation;
  @JsonKey(name: 'annotated_result')
  final int? annotatedResult;
  @JsonKey(name: 'n_votes')
  final int? nVotes;
  final String? username;
  // TODO: ask server to send countries as ISO 3166-1 alpha-2 codes
  // Current format is "en:france"
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
  // TODO: Figure out what this field is and what type it should be
  // @JsonKey(name: 'bounding_box')
  // final dynamic boundingBox;

  RobotoffNutrientExtractionInsight({
    this.insightId,
    this.barcode,
    // this.type,
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
    // this.boundingBox,
  });

  factory RobotoffNutrientExtractionInsight.fromJson(
          Map<String, dynamic> json) =>
      _$RobotoffNutrientExtractionInsightFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$RobotoffNutrientExtractionInsightToJson(this);
}
