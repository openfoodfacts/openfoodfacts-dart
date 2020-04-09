

import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/interface/JsonObject.dart';

part 'Insight.g.dart';

enum InsightAnnotation {
  YES,
  NO,
  MAYBE
}

extension InsightAnnotationExtension on InsightAnnotation {
  int get value {
    switch (this) {
      case InsightAnnotation.YES:
        return 1;
        break;
      case InsightAnnotation.NO:
        return 0;
        break;
      case InsightAnnotation.MAYBE:
        return -1;
        break;
      default:
        return -1;
        break;
    }
  }
}

enum InsightType {
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

extension InsightTypesExtension on InsightType {
  String get value {
    switch (this) {
      case InsightType.INGREDIENT_SPELLCHECK:
        return 'ingredient_spellcheck';
      case InsightType.PACKAGER_CODE:
        return 'packager_code';
      case InsightType.LABEL:
        return 'label';
      case InsightType.CATEGORY:
        return 'category';
      case InsightType.PRODUCT_WEIGHT:
        return 'product_weight';
      case InsightType.EXPIRATION_DATE:
        return 'expiration_date';
      case InsightType.BRAND:
        return 'brand';
      case InsightType.STORE:
        return 'store';
      case InsightType.NUTRIENT:
        return 'nutrient';
      case InsightType.UNDEFINED:
        return 'undefined';
      default:
        return null;
    }
  }

  static InsightType getType(String s) {
    switch(s) {
      case "ingredient_spellcheck":
        return InsightType.INGREDIENT_SPELLCHECK;
        break;
      case "packager_code":
        return InsightType.PACKAGER_CODE;
        break;
      case "label":
        return InsightType.LABEL;
        break;
      case "category":
        return InsightType.CATEGORY;
        break;
      case "product_weight":
        return InsightType.PRODUCT_WEIGHT;
        break;
      case "expiration_date":
        return InsightType.EXPIRATION_DATE;
        break;
      case "brand":
        return InsightType.BRAND;
        break;
      case "store":
        return InsightType.STORE;
        break;
      case "nutrient":
        return InsightType.NUTRIENT;
        break;
      default:
        return InsightType.UNDEFINED;
        break;
    }
  }
}

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
  final InsightType type;
  final String barcode;
  final List<dynamic> countries;
  final String lang;
  final String model;
  final double confidence;

  const Insight(
      {this.id, this.type, this.barcode, this.countries, this.lang, this.model, this.confidence});

  factory Insight.fromJson(Map<String, dynamic> json) {

    InsightType insightType = InsightTypesExtension.getType(json["type"]);

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