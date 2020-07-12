import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/interface/JsonObject.dart';

part 'Insight.g.dart';

enum InsightAnnotation { YES, NO, MAYBE }

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
    switch (s) {
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
class InsightsResult extends JsonObject {
  final String status;
  @JsonKey(
      name: 'insights',
      includeIfNull: false,
      fromJson: Insight.fromJson,
      toJson: Insight.toJson)
  final List<Insight> insights;

  const InsightsResult({this.status, this.insights});

  factory InsightsResult.fromJson(Map<String, dynamic> json) =>
      _$InsightsResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InsightsResultToJson(this);
}

class Insight {
  final String id;
  final InsightType type;
  final String barcode;
  final List<dynamic> countries;
  final String lang;
  final String model;
  final double confidence;

  const Insight(
      {this.id,
      this.type,
      this.barcode,
      this.countries,
      this.lang,
      this.model,
      this.confidence});

  static List<Insight> fromJson(List<dynamic> json) {
    List<Insight> result = List<Insight>();
    for (Map<String, dynamic> jsonInsight in json) {
      InsightType insightType =
          InsightTypesExtension.getType(jsonInsight["type"]);

      result.add(Insight(
          id: jsonInsight["id"],
          type: insightType,
          barcode: jsonInsight["barcode"],
          countries: jsonInsight["countries"],
          lang: jsonInsight["lang"],
          model: jsonInsight["model"],
          confidence: jsonInsight["confidence"]));
    }
    return result;
  }

  static List<Map<String, dynamic>> toJson(List<Insight> insights) {
    List<Map<String, dynamic>> result = List<Map<String, dynamic>>();
    for (Insight insight in insights) {
      Map<String, dynamic> jsonInsight = Map<String, dynamic>();

      jsonInsight["id"] = insight.id;
      jsonInsight["type"] = insight.type.value;
      jsonInsight["barcode"] = insight.barcode;
      jsonInsight["countries"] = insight.countries;
      jsonInsight["lang"] = insight.lang;
      jsonInsight["model"] = insight.model;
      jsonInsight["confidence"] = insight.confidence;

      result.add(jsonInsight);
    }

    return result;
  }
}
