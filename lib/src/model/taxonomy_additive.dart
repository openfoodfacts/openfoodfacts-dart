import 'package:json_annotation/json_annotation.dart';
import 'off_tagged.dart';
import '../interface/json_object.dart';
import '../interface/parameter.dart';
import '../utils/country_helper.dart';
import '../utils/language_helper.dart';
import '../utils/taxonomy_query_configuration.dart';
import '../utils/tag_type.dart';

part 'taxonomy_additive.g.dart';

/// Fields of an [TaxonomyAdditive]
enum TaxonomyAdditiveField implements OffTagged {
  ALL(offTag: 'all'),
  ADDITIVES_CLASSES(offTag: 'additives_classes'),
  CARBON_FOOTPRINT_FR_FOODGES_INGREDIENT(
      offTag: 'carbon_footprint_fr_foodges_ingredient'),
  CARBON_FOOTPRINT_FR_FOODGES_VALUE(
      offTag: 'carbon_footprint_fr_foodges_value'),
  COLOUR_INDEX(offTag: 'colour_index'),
  COMMENT(offTag: 'comment'),
  DEFAULT_ADDITIVE_CLASS(offTag: 'default_additive_class'),
  DESCRIPTION(offTag: 'description'),
  E_NUMBER(offTag: 'e_number'),
  EFSA(offTag: 'efsa'),
  EFSA_EVALUATION(offTag: 'efsa_evaluation'),
  EFSA_EVALUATION_ADI(offTag: 'efsa_evaluation_adi'),
  EFSA_EVALUATION_ADI_ESTABLISHED(offTag: 'efsa_evaluation_adi_established'),
  EFSA_EVALUATION_DATE(offTag: 'efsa_evaluation_date'),
  EFSA_EVALUATION_EXPOSURE_95TH_GREATER_THAN_ADI(
      offTag: 'efsa_evaluation_exposure_95th_greater_than_adi'),
  EFSA_EVALUATION_EXPOSURE_95TH_GREATER_THAN_NOAEL(
      offTag: 'efsa_evaluation_exposure_95th_greater_than_noael'),
  EFSA_EVALUATION_EXPOSURE_MEAN_GREATER_THAN_ADI(
      offTag: 'efsa_evaluation_exposure_mean_greater_than_adi'),
  EFSA_EVALUATION_EXPOSURE_MEAN_GREATER_THAN_NOAEL(
      offTag: 'efsa_evaluation_exposure_mean_greater_than_noael'),
  EFSA_EVALUATION_OVEREXPOSURE_RISK(
      offTag: 'efsa_evaluation_overexposure_risk'),
  EFSA_EVALUATION_SAFETY_ASSESSED(offTag: 'efsa_evaluation_safety_assessed'),
  EFSA_EVALUATION_URL(offTag: 'efsa_evaluation_url'),
  FROM_PALM_OIL(offTag: 'from_palm_oil'),
  MANDATORY_ADDITIVE_CLASS(offTag: 'mandatory_additive_class'),
  NAME(offTag: 'name'),
  ORGANIC_EU(offTag: 'organic_eu'),
  VEGAN(offTag: 'vegan'),
  VEGETARIAN(offTag: 'vegetarian'),
  WIKIDATA(offTag: 'wikidata');

  const TaxonomyAdditiveField({
    required this.offTag,
  });

  @override
  final String offTag;
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

/// Configuration to get additives
class TaxonomyAdditiveQueryConfiguration extends TaxonomyQueryConfiguration<
    TaxonomyAdditive, TaxonomyAdditiveField> {
  /// Configuration to get additives from their tags
  TaxonomyAdditiveQueryConfiguration({
    required List<String> tags,
    List<OpenFoodFactsLanguage>? languages,
    OpenFoodFactsCountry? country,
    List<TaxonomyAdditiveField> fields = const [],
    List<Parameter> additionalParameters = const [],
  }) : super(
          TagType.ADDITIVES,
          tags,
          languages: languages,
          country: country,
          includeChildren: false,
          fields: fields,
          additionalParameters: additionalParameters,
        );

  /// Configuration to get the root additives
  TaxonomyAdditiveQueryConfiguration.roots({
    final List<OpenFoodFactsLanguage>? languages,
    final OpenFoodFactsCountry? country,
    final bool includeChildren = false,
    final List<TaxonomyAdditiveField> fields = const [],
    final List<Parameter> additionalParameters = const [],
  }) : super.roots(
          TagType.ADDITIVES,
          languages: languages,
          country: country,
          includeChildren: includeChildren,
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
        .map<String>((TaxonomyAdditiveField field) => field.offTag);
  }
}
