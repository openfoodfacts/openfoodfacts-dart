import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/model/Insight.dart';
import '../interface/JsonObject.dart';

part 'RobotoffQuestion.g.dart';

@JsonSerializable()
class RobotoffQuestionResult extends JsonObject {
  final String? status;
  @JsonKey(
      name: 'questions',
      includeIfNull: false,
      fromJson: RobotoffQuestion.fromJson,
      toJson: RobotoffQuestion.toJson)
  final List<RobotoffQuestion>? questions;

  const RobotoffQuestionResult({this.status, this.questions});

  factory RobotoffQuestionResult.fromJson(Map<String, dynamic> json) =>
      _$RobotoffQuestionResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RobotoffQuestionResultToJson(this);
}

class RobotoffQuestion {
  final String? barcode;
  final String? type;
  final String? value;
  final String? question;
  @JsonKey(name: 'insight_id')
  final String? insightId;
  @JsonKey(name: 'insight_type')
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

  static List<RobotoffQuestion> fromJson(List<dynamic> json) {
    List<RobotoffQuestion> result = [];
    for (Map<String, dynamic> jsonQuestion
        in json as Iterable<Map<String, dynamic>>) {
      InsightType insightType =
          InsightTypesExtension.getType(jsonQuestion['insight_type']);

      result.add(RobotoffQuestion(
          barcode: jsonQuestion['barcode'],
          type: jsonQuestion['type'],
          value: jsonQuestion['value'],
          question: jsonQuestion['question'],
          insightId: jsonQuestion['insight_id'],
          insightType: insightType,
          imageUrl: jsonQuestion['source_image_url']));
    }
    return result;
  }

  static List<Map<String, dynamic>> toJson(List<RobotoffQuestion>? questions) {
    if (questions == null) {
      return [];
    }
    List<Map<String, dynamic>> result = [];

    for (RobotoffQuestion question in questions) {
      Map<String, String?> jsonQuestion = {};

      jsonQuestion['barcode'] = question.barcode;
      jsonQuestion['type'] = question.type;
      jsonQuestion['value'] = question.value;
      jsonQuestion['question'] = question.question;
      jsonQuestion['insight_id'] = question.insightId;
      jsonQuestion['insight_type'] = question.insightType.value;
      jsonQuestion['insight_url'] = question.imageUrl;

      result.add(jsonQuestion);
    }
    return result;
  }
}
