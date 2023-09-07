import 'package:json_annotation/json_annotation.dart';
import 'off_tagged.dart';
import '../interface/json_object.dart';

part 'insight.g.dart';

enum InsightAnnotation {
  YES(1),
  NO(0),
  MAYBE(-1);

  const InsightAnnotation(this.value);

  final int value;

  static InsightAnnotation? fromInt(final int annotation) {
    for (final InsightAnnotation insightAnnotation in values) {
      if (insightAnnotation.value == annotation) {
        return insightAnnotation;
      }
    }
    return null;
  }
}

enum InsightType implements OffTagged {
  @JsonValue('ingredient_spellcheck')
  INGREDIENT_SPELLCHECK(offTag: 'ingredient_spellcheck'),
  @JsonValue('packager_code')
  PACKAGER_CODE(offTag: 'packager_code'),
  @JsonValue('label')
  LABEL(offTag: 'label'),
  @JsonValue('category')
  CATEGORY(offTag: 'category'),
  @JsonValue('product_weight')
  PRODUCT_WEIGHT(offTag: 'product_weight'),
  @JsonValue('expiration_date')
  EXPIRATION_DATE(offTag: 'expiration_date'),
  @JsonValue('brand')
  BRAND(offTag: 'brand'),
  @JsonValue('store')
  STORE(offTag: 'store'),
  @JsonValue('nutrient')
  NUTRIENT(offTag: 'nutrient'),
  @JsonValue('undefined')
  UNDEFINED(offTag: 'undefined'),
  UNKNOWN(offTag: 'UNKNOWN');

  const InsightType({
    required this.offTag,
  });

  @override
  final String offTag;

  /// Returns the first [InsightType] that matches the [offTag].
  static InsightType? fromOffTag(final String? offTag) =>
      OffTagged.fromOffTag(offTag, InsightType.values) as InsightType?;
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
      final InsightType insightType =
          InsightType.fromOffTag(jsonInsight['type']) ?? InsightType.UNDEFINED;

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
      jsonInsight['type'] = insight.type?.offTag;
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
