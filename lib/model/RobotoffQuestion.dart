import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/model/Insight.dart';
import '../interface/JsonObject.dart';

part 'RobotoffQuestion.g.dart';

@JsonSerializable()
class RobotoffQuestionResult extends JsonObject {
  final String? status;

  final List<RobotoffQuestion>? questions;

  const RobotoffQuestionResult({this.status, this.questions});

  factory RobotoffQuestionResult.fromJson(Map<String, dynamic> json) =>
      _$RobotoffQuestionResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RobotoffQuestionResultToJson(this);
}

@JsonSerializable()
class RobotoffQuestion extends JsonObject {
  final String? barcode;
  final String? type;
  final String? value;
  final String? question;
  @JsonKey(name: 'insight_id')
  final String? insightId;
  @JsonKey(name: 'insight_type', unknownEnumValue: InsightType.UNKNOWN)
  final InsightType? insightType;
  @JsonKey(name: 'source_image_url')
  final String? imageUrl;

  const RobotoffQuestion(
      {this.barcode,
      this.type,
      this.value,
      this.question,
      this.insightId,
      this.insightType,
      this.imageUrl});

  factory RobotoffQuestion.fromJson(Map<String, dynamic> json) =>
      _$RobotoffQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$RobotoffQuestionToJson(this);
}
