import 'package:json_annotation/json_annotation.dart';
import 'insight.dart';
import '../interface/json_object.dart';

part 'robotoff_question.g.dart';

@JsonSerializable()
class RobotoffQuestionResult extends JsonObject {
  final String? status;

  final List<RobotoffQuestion>? questions;

  const RobotoffQuestionResult({this.status, this.questions});

  factory RobotoffQuestionResult.fromJson(Map<String, dynamic> json) =>
      _$RobotoffQuestionResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RobotoffQuestionResultToJson(this);

  RobotoffQuestionResult copyWith({
    String? status,
    List<RobotoffQuestion>? questions,
  }) {
    return RobotoffQuestionResult(
      status: status ?? this.status,
      questions: questions ?? this.questions,
    );
  }
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

  @override
  Map<String, dynamic> toJson() => _$RobotoffQuestionToJson(this);

  RobotoffQuestion copyWith({
    String? barcode,
    String? type,
    String? value,
    String? question,
    String? insightId,
    InsightType? insightType,
    String? imageUrl,
  }) {
    return RobotoffQuestion(
      barcode: barcode ?? this.barcode,
      type: type ?? this.type,
      value: value ?? this.value,
      question: question ?? this.question,
      insightId: insightId ?? this.insightId,
      insightType: insightType ?? this.insightType,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
