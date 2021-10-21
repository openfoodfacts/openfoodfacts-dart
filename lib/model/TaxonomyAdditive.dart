import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/interface/JsonObject.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/TaxonomyQueryConfiguration.dart';
import 'package:openfoodfacts/utils/TagType.dart';

part 'TaxonomyAdditive.g.dart';

/// Fields of an [TaxonomyAdditive]
enum TaxonomyAdditiveField {
  ALL,
  ADDITIVES_CLASSES,
  CARBON_FOOTPRINT_FR_FOODGES_INGREDIENT,
  CARBON_FOOTPRINT_FR_FOODGES_VALUE,
  COLOUR_INDEX,
  COMMENT,
  DEFAULT_ADDITIVE_CLASS,
  DESCRIPTION,
  E_NUMBER,
  EFSA,
  EFSA_EVALUATION,
  EFSA_EVALUATION_ADI,
  EFSA_EVALUATION_ADI_ESTABLISHED,
  EFSA_EVALUATION_DATE,
  EFSA_EVALUATION_EXPOSURE_95TH_GREATER_THAN_ADI,
  EFSA_EVALUATION_EXPOSURE_95TH_GREATER_THAN_NOAEL,
  EFSA_EVALUATION_EXPOSURE_MEAN_GREATER_THAN_ADI,
  EFSA_EVALUATION_EXPOSURE_MEAN_GREATER_THAN_NOAEL,
  EFSA_EVALUATION_OVEREXPOSURE_RISK,
  EFSA_EVALUATION_SAFETY_ASSESSED,
  EFSA_EVALUATION_URL,
  FROM_PALM_OIL,
  MANDATORY_ADDITIVE_CLASS,
  NAME,
  ORGANIC_EU,
  VEGAN,
  VEGETARIAN,
  WIKIDATA,
}

extension TaxonomyAdditiveFieldExtension on TaxonomyAdditiveField {
  static const Map<TaxonomyAdditiveField, String> _KEYS = {
    TaxonomyAdditiveField.ALL: 'all',
    TaxonomyAdditiveField.ADDITIVES_CLASSES: 'additives_classes',
    TaxonomyAdditiveField.CARBON_FOOTPRINT_FR_FOODGES_INGREDIENT:
        'carbon_footprint_fr_foodges_ingredient',
    TaxonomyAdditiveField.CARBON_FOOTPRINT_FR_FOODGES_VALUE:
        'carbon_footprint_fr_foodges_value',
    TaxonomyAdditiveField.COLOUR_INDEX: 'colour_index',
    TaxonomyAdditiveField.COMMENT: 'comment',
    TaxonomyAdditiveField.DEFAULT_ADDITIVE_CLASS: 'default_additive_class',
    TaxonomyAdditiveField.DESCRIPTION: 'description',
    TaxonomyAdditiveField.E_NUMBER: 'e_number',
    TaxonomyAdditiveField.EFSA: 'efsa',
    TaxonomyAdditiveField.EFSA_EVALUATION: 'efsa_evaluation',
    TaxonomyAdditiveField.EFSA_EVALUATION_ADI: 'efsa_evaluation_adi',
    TaxonomyAdditiveField.EFSA_EVALUATION_ADI_ESTABLISHED:
        'efsa_evaluation_adi_established',
    TaxonomyAdditiveField.EFSA_EVALUATION_DATE: 'efsa_evaluation_date',
    TaxonomyAdditiveField.EFSA_EVALUATION_EXPOSURE_95TH_GREATER_THAN_ADI:
        'efsa_evaluation_exposure_95th_greater_than_adi',
    TaxonomyAdditiveField.EFSA_EVALUATION_EXPOSURE_95TH_GREATER_THAN_NOAEL:
        'efsa_evaluation_exposure_95th_greater_than_noael',
    TaxonomyAdditiveField.EFSA_EVALUATION_EXPOSURE_MEAN_GREATER_THAN_ADI:
        'efsa_evaluation_exposure_mean_greater_than_adi',
    TaxonomyAdditiveField.EFSA_EVALUATION_EXPOSURE_MEAN_GREATER_THAN_NOAEL:
        'efsa_evaluation_exposure_mean_greater_than_noael',
    TaxonomyAdditiveField.EFSA_EVALUATION_OVEREXPOSURE_RISK:
        'efsa_evaluation_overexposure_risk',
    TaxonomyAdditiveField.EFSA_EVALUATION_SAFETY_ASSESSED:
        'efsa_evaluation_safety_assessed',
    TaxonomyAdditiveField.EFSA_EVALUATION_URL: 'efsa_evaluation_url',
    TaxonomyAdditiveField.FROM_PALM_OIL: 'from_palm_oil',
    TaxonomyAdditiveField.MANDATORY_ADDITIVE_CLASS: 'mandatory_additive_class',
    TaxonomyAdditiveField.NAME: 'name',
    TaxonomyAdditiveField.ORGANIC_EU: 'organic_eu',
    TaxonomyAdditiveField.VEGAN: 'vegan',
    TaxonomyAdditiveField.VEGETARIAN: 'vegetarian',
    TaxonomyAdditiveField.WIKIDATA: 'wikidata',
  };

  /// Returns the key of the Additive field
  String get key => _KEYS[this] ?? '';
}

/// A JSON-serializable version of a Additive taxonomy result.
///
/// See [OpenFoodAPIClient.getTaxonomy] for more details on how to retrieve one
/// of these.
@JsonSerializable()
class TaxonomyAdditive extends JsonObject {
  TaxonomyAdditive(
    this.additivesClasses,
    this.carbonFootprintFrFoodgesIngredient,
    this.carbonFootprintFrFoodgesValue,
    this.children,
    this.colourIndex,
    this.comment,
    this.defaultAdditiveClass,
    this.description,
    this.eNumber,
    this.efsa,
    this.efsaEvaluation,
    this.efsaEvaluationAdi,
    this.efsaEvaluationAdiEstablished,
    this.efsaEvaluationDate,
    this.efsaEvaluationExposure95thGreaterThanAdi,
    this.efsaEvaluationExposure95thGreaterThanNoael,
    this.efsaEvaluationExposureMeanGreaterThanAdi,
    this.efsaEvaluationExposureMeanGreaterThanNoael,
    this.efsaEvaluationOverexposureRisk,
    this.efsaEvaluationSafetyAssessed,
    this.efsaEvaluationUrl,
    this.fromPalmOil,
    this.mandatoryAdditiveClass,
    this.name,
    this.organicEu,
    this.parents,
    this.vegan,
    this.vegetarian,
    this.wikidata,
  );

  factory TaxonomyAdditive.fromJson(Map<String, dynamic> json) {
    return _$TaxonomyAdditiveFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TaxonomyAdditiveToJson(this);
  }

  @JsonKey(
    name: 'additives_classes',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? additivesClasses;
  @JsonKey(
    name: 'carbon_footprint_fr_foodges_ingredient',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? carbonFootprintFrFoodgesIngredient;
  @JsonKey(
    name: 'carbon_footprint_fr_foodges_value',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? carbonFootprintFrFoodgesValue;
  @JsonKey(name: 'children', includeIfNull: false)
  List<String>? children;
  @JsonKey(
    name: 'colour_index',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? colourIndex;
  @JsonKey(
    name: 'comment',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? comment;
  @JsonKey(
    name: 'default_additive_class',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? defaultAdditiveClass;
  @JsonKey(
    name: 'description',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? description;
  @JsonKey(
    name: 'e_number',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? eNumber;
  @JsonKey(
    name: 'efsa',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? efsa;
  @JsonKey(
    name: 'efsa_evaluation',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? efsaEvaluation;
  @JsonKey(
    name: 'efsa_evaluation_adi',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? efsaEvaluationAdi;
  @JsonKey(
    name: 'efsa_evaluation_adi_established',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? efsaEvaluationAdiEstablished;
  @JsonKey(
    name: 'efsa_evaluation_date',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? efsaEvaluationDate;
  @JsonKey(
    name: 'efsa_evaluation_exposure_95th_greater_than_adi',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? efsaEvaluationExposure95thGreaterThanAdi;
  @JsonKey(
    name: 'efsa_evaluation_exposure_95th_greater_than_noael',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>?
      efsaEvaluationExposure95thGreaterThanNoael;
  @JsonKey(
    name: 'efsa_evaluation_exposure_mean_greater_than_adi',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? efsaEvaluationExposureMeanGreaterThanAdi;
  @JsonKey(
    name: 'efsa_evaluation_exposure_mean_greater_than_noael',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>?
      efsaEvaluationExposureMeanGreaterThanNoael;
  @JsonKey(
    name: 'efsa_evaluation_overexposure_risk',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? efsaEvaluationOverexposureRisk;
  @JsonKey(
    name: 'efsa_evaluation_safety_assessed',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? efsaEvaluationSafetyAssessed;
  @JsonKey(
    name: 'efsa_evaluation_url',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? efsaEvaluationUrl;
  @JsonKey(
    name: 'from_palm_oil',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? fromPalmOil;
  @JsonKey(
    name: 'mandatory_additive_class',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? mandatoryAdditiveClass;
  @JsonKey(
    name: 'name',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? name;
  @JsonKey(
    name: 'organic_eu',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? organicEu;
  @JsonKey(name: 'parents', includeIfNull: false)
  List<String>? parents;
  @JsonKey(
    name: 'vegan',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? vegan;
  @JsonKey(
    name: 'vegetarian',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? vegetarian;
  @JsonKey(
    name: 'wikidata',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? wikidata;

  @override
  String toString() => toJson().toString();
}

class TaxonomyAdditiveQueryConfiguration extends TaxonomyQueryConfiguration<
    TaxonomyAdditive, TaxonomyAdditiveField> {
  TaxonomyAdditiveQueryConfiguration({
    required List<String> tags,
    List<OpenFoodFactsLanguage>? languages = const [],
    String? cc,
    List<TaxonomyAdditiveField> fields = const [],
    List<Parameter> additionalParameters = const [],
  }) : super(
          TagType.LABELS,
          tags,
          languages: languages,
          cc: cc,
          includeChildren: false,
          fields: fields,
          additionalParameters: additionalParameters,
        );

  @override
  Map<String, TaxonomyAdditive> convertResults(dynamic jsonData) {
    if (jsonData is! Map<String, dynamic>) {
      return const {};
    }
    return jsonData
        .map<String, TaxonomyAdditive>((String key, dynamic taxonomy) {
      if (taxonomy is! Map<String, dynamic>) {
        assert(false, 'Received JSON Additive is not a Map');
        return MapEntry(key, TaxonomyAdditive.fromJson({}));
      }
      return MapEntry(key, TaxonomyAdditive.fromJson(taxonomy));
    });
  }

  @override
  Set<TaxonomyAdditiveField> get ignoredFields =>
      const {TaxonomyAdditiveField.ALL};

  @override
  Iterable<String> convertFieldsToStrings(
      Iterable<TaxonomyAdditiveField> fields) {
    return fields
        .where((TaxonomyAdditiveField field) => !ignoredFields.contains(field))
        .map<String>((TaxonomyAdditiveField field) => field.key);
  }
}
