import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/interface/JsonObject.dart';

part 'Insight.g.dart';

enum InsightAnnotation { YES, NO, MAYBE }

extension InsightAnnotationExtension on InsightAnnotation {
  static const Map<InsightAnnotation, int> _VALUES = {
    InsightAnnotation.YES: 1,
    InsightAnnotation.NO: 0,
    InsightAnnotation.MAYBE: -1,
  };
  int get value => _VALUES[this] ?? -1;
}

enum InsightType {
  @JsonValue('ingredient_spellcheck')
  INGREDIENT_SPELLCHECK,
  @JsonValue('packager_code')
  PACKAGER_CODE,
  @JsonValue('label')
  LABEL,
  @JsonValue('category')
  CATEGORY,
  @JsonValue('product_weight')
  PRODUCT_WEIGHT,
  @JsonValue('expiration_date')
  EXPIRATION_DATE,
  @JsonValue('brand')
  BRAND,
  @JsonValue('store')
  STORE,
  @JsonValue('nutrient')
  NUTRIENT,
  @JsonValue('undefined')
  UNDEFINED,
  UNKNOWN
}

extension InsightTypesExtension on InsightType? {
  static const Map<InsightType, String> _VALUES = {
    InsightType.INGREDIENT_SPELLCHECK: 'ingredient_spellcheck',
    InsightType.PACKAGER_CODE: 'packager_code',
    InsightType.LABEL: 'label',
    InsightType.CATEGORY: 'category',
    InsightType.PRODUCT_WEIGHT: 'product_weight',
    InsightType.EXPIRATION_DATE: 'expiration_date',
    InsightType.BRAND: 'brand',
    InsightType.STORE: 'store',
    InsightType.NUTRIENT: 'nutrient',
    InsightType.UNDEFINED: 'undefined',
  };

  String? get value => _VALUES[this];

  static InsightType getType(String? s) => InsightType.values.firstWhere(
        (final InsightType key) => _VALUES[key] == s,
        orElse: () => InsightType.UNDEFINED,
      );
}

@JsonSerializable()
class InsightsResult extends JsonObject {
  final String? status;
  @JsonKey(
      name: 'insights',
      includeIfNull: false,
      fromJson: Insight.fromJson,
      toJson: Insight.toJson)
  final List<Insight>? insights;

  const InsightsResult({this.status, this.insights});

  factory InsightsResult.fromJson(dynamic json) =>
      _$InsightsResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InsightsResultToJson(this);
}

class Insight {
  final String? id;
  final InsightType? type;
  final String? barcode;
  final List<dynamic>? countries;
  final String? lang;
  final String? model;
  final double? confidence;

  const Insight(
      {this.id,
      this.type,
      this.barcode,
      this.countries,
      this.lang,
      this.model,
      this.confidence});

  static List<Insight>? fromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    List<Insight> result = [];
    for (dynamic jsonInsight in json) {
      InsightType insightType =
          InsightTypesExtension.getType(jsonInsight['type']);

      result.add(Insight(
          id: jsonInsight['id'],
          type: insightType,
          barcode: jsonInsight['barcode'],
          countries: jsonInsight['countries'],
          lang: jsonInsight['lang'],
          model: jsonInsight['model'],
          confidence: jsonInsight['confidence']));
    }
    return result;
  }

  static List<Map<String, dynamic>> toJson(List<Insight>? insights) {
    if (insights == null) {
      return [];
    }
    List<Map<String, dynamic>> result = [];
    for (Insight insight in insights) {
      Map<String, dynamic> jsonInsight = {};

      jsonInsight['id'] = insight.id;
      jsonInsight['type'] = insight.type.value;
      jsonInsight['barcode'] = insight.barcode;
      jsonInsight['countries'] = insight.countries;
      jsonInsight['lang'] = insight.lang;
      jsonInsight['model'] = insight.model;
      jsonInsight['confidence'] = insight.confidence;

      result.add(jsonInsight);
    }

    return result;
  }
}
