

import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/interface/JsonObject.dart';
import 'RobotoffQuestion.dart';

part 'Insight.g.dart';

@JsonSerializable()
class InsightResult extends JsonObject {

  final String status;
  final Insight insight;

  const InsightResult(
      {this.status, this.insight});

  factory InsightResult.fromJson(Map<String, dynamic> json) =>
      _$InsightResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InsightResultToJson(this);
}

@JsonSerializable()
class Insight extends JsonObject {

  final String id;
  final InsightTypes type;
  final String barcode;
  final List<dynamic> countries;
  final String lang;
  final String model;
  final double confidence;

  const Insight(
      {this.id, this.type, this.barcode, this.countries, this.lang, this.model, this.confidence});

  factory Insight.fromJson(Map<String, dynamic> json) {

    InsightTypes insightType = InsightTypesExtension.getType(json["type"]);

    return Insight(
        id: json["id"],
        type: insightType,
        barcode: json["barcode"],
        countries: json["countries"],
        lang: json["lang"],
        model: json["model"],
        confidence: json["confidence"]
    );
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = Map<String, dynamic>();

    result["id"] = this.id;
    result["type"] = this.type.value;
    result["barcode"] = this.barcode;
    result["countries"] = this.countries;
    result["lang"] = this.lang;
    result["model"] = this.model;
    result["confidence"] = this.confidence;

    return result;
  }
}