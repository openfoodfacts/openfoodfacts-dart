import 'package:json_annotation/json_annotation.dart';
import 'per_size.dart';
import 'robotoff_nutrient_extraction_annotation.dart';
import '../interface/json_object.dart';
import 'nutrient.dart';
import 'robotoff_nutrient_extraction_insight.dart';

part 'robotoff_nutrient_extraction.g.dart';

@JsonSerializable()
class RobotoffNutrientExtractionResult extends JsonObject {
  final String? status;
  final int? count;
  final List<RobotoffNutrientExtractionInsight>? insights;
  RobotoffNutrientExtractionInsight? _latestInsight;

  RobotoffNutrientExtractionResult({
    this.status,
    this.count,
    this.insights,
  });

  RobotoffNutrientExtractionInsight? getLatestInsights({
    bool recompute = false,
  }) {
    if (_latestInsight != null && !recompute) {
      return _latestInsight;
    }

    insights?.sort((a, b) {
      if (a.completedAt == null && b.completedAt == null) {
        return 0;
      } else if (a.completedAt == null) {
        return 1;
      } else if (b.completedAt == null) {
        return -1;
      }

      return a.completedAt!.compareTo(b.completedAt!);
    });

    _latestInsight = insights?.last;

    return _latestInsight;
  }

  RobotoffNutrientEntity? getNutrientEntity(
    Nutrient nutrient,
    PerSize perSize, {
    bool recomputeLatest = false,
  }) {
    return getLatestInsights(recompute: recomputeLatest)
        ?.data
        ?.nutrients?[nutrient.getOffTagPerSize(perSize)];
  }

  RobotoffNutrientAnnotationData? getNutrientAnnotation(
    Nutrient nutrient, {
    bool recomputeLatest = false,
  }) {
    return getLatestInsights(recompute: recomputeLatest)
        ?.data
        ?.annotation
        ?.nutrients?[nutrient.offTag];
  }

  factory RobotoffNutrientExtractionResult.fromJson(
          Map<String, dynamic> json) =>
      _$RobotoffNutrientExtractionResultFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$RobotoffNutrientExtractionResultToJson(this);
}

@JsonSerializable()
class RobotoffNutrientEntity {
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

  const RobotoffNutrientEntity({
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

  factory RobotoffNutrientEntity.fromJson(Map<String, dynamic> json) =>
      _$RobotoffNutrientEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RobotoffNutrientEntityToJson(this);
}
