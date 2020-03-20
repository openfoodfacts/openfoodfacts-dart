import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

part 'RobotoffQuestion.g.dart';

enum InsightTypes {
  INGREDIENT_SPELLCHECK,
  PACKAGER_CODE,
  LABEL,
  CATEGORY,
  PRODUCT_WEIGHT,
  EXPIRATION_DATE,
  BRAND,
  STORE,
  NUTRIENT,
  UNDEFINED
}

extension InsightTypesExtension on InsightTypes {
  String get value {
    switch (this) {
      case InsightTypes.INGREDIENT_SPELLCHECK:
        return 'ingredient_spellcheck';
      case InsightTypes.PACKAGER_CODE:
        return 'packager_code';
      case InsightTypes.LABEL:
        return 'label';
      case InsightTypes.CATEGORY:
        return 'category';
      case InsightTypes.PRODUCT_WEIGHT:
        return 'product_weight';
      case InsightTypes.EXPIRATION_DATE:
        return 'expiration_date';
      case InsightTypes.BRAND:
        return 'brand';
      case InsightTypes.STORE:
        return 'store';
      case InsightTypes.NUTRIENT:
        return 'nutrient';
      case InsightTypes.UNDEFINED:
        return 'undefined';
      default:
        return null;
    }
  }

  static InsightTypes getType(String s) {
    switch(s) {
      case "ingredient_spellcheck":
        return InsightTypes.INGREDIENT_SPELLCHECK;
        break;
      case "packager_code":
        return InsightTypes.PACKAGER_CODE;
        break;
      case "label":
        return InsightTypes.LABEL;
        break;
      case "category":
        return InsightTypes.CATEGORY;
        break;
      case "product_weight":
        return InsightTypes.PRODUCT_WEIGHT;
        break;
      case "expiration_date":
        return InsightTypes.EXPIRATION_DATE;
        break;
      case "brand":
        return InsightTypes.BRAND;
        break;
      case "store":
        return InsightTypes.STORE;
        break;
      case "nutrient":
        return InsightTypes.NUTRIENT;
        break;
      default:
        return InsightTypes.UNDEFINED;
        break;
    }
  }
}

@JsonSerializable()
class RobotoffQuestionResult extends JsonObject {
  final String status;
  final List<RobotoffQuestion> questions;

  const RobotoffQuestionResult(
      {this.status, this.questions});

  factory RobotoffQuestionResult.fromJson(Map<String, dynamic> json) =>
      _$RobotoffQuestionResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RobotoffQuestionResultToJson(this);
}

@JsonSerializable()
class RobotoffQuestion extends JsonObject {
  final String barcode;
  final String type;
  final String value;
  final String question;
  @JsonKey(name: "insight_id")
  final String insightId;
  @JsonKey(name: "insight_type")
  final InsightTypes insightType;
  @JsonKey(name: "source_image_url")
  final String imageUrl;

  const RobotoffQuestion(
      {this.barcode, this.type, this.value, this.question, this.insightId, this.insightType, this.imageUrl});

  factory RobotoffQuestion.fromJson(Map<String, dynamic> json) {

    InsightTypes insightType = InsightTypesExtension.getType(json["insight_type"]);

    return RobotoffQuestion(
      barcode: json["barcode"],
      type: json["type"],
      value: json["value"],
      question: json["question"],
      insightId: json["insight_id"],
      insightType: insightType,
      imageUrl: json["source_image_url"]
    );
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, String> result = Map<String, String>();

    result["barcode"] = this.barcode;
    result["type"] = this.type;
    result["value"] = this.value;
    result["question"] = this.question;
    result["insight_id"] = this.insightId;
    result["insight_type"] = this.insightType.value;
    result["insight_url"] = this.imageUrl;

    return result;
  }
}