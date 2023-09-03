import 'package:json_annotation/json_annotation.dart';
import 'off_tagged.dart';
import '../interface/json_object.dart';
import '../interface/parameter.dart';
import '../utils/country_helper.dart';
import '../utils/language_helper.dart';
import '../utils/taxonomy_query_configuration.dart';
import '../utils/tag_type.dart';

part 'taxonomy_ingredient.g.dart';

/// Fields of an [TaxonomyIngredient]
enum TaxonomyIngredientField implements OffTagged {
  ALL(offTag: 'all'),
  ADDITIVES_CLASSES(offTag: 'additives_classes'),
  ALLERGENS(offTag: 'allergens'),
  BRIOCHE(offTag: 'brioche'),
  CARBON_FOOTPRINT_FR_FOODGES_INGREDIENT(
      offTag: 'carbon_footprint_fr_foodges_ingredient'),
  CARBON_FOOTPRINT_FR_FOODGES_VALUE(
      offTag: 'carbon_footprint_fr_foodges_value'),
  CHILDREN(offTag: 'children'),
  CIQUAL_FOOD_CODE(offTag: 'ciqual_food_code'),
  CIQUAL_FOOD_NAME(offTag: 'ciqual_food_name'),
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
  LIKELY_ALLERGENS(offTag: 'likely_allergens'),
  MANDATORY_ADDITIVE_CLASS(offTag: 'mandatory_additive_class'),
  NAME(offTag: 'name'),
  NOVA(offTag: 'nova'),
  NUTRISCORE_FRUITS_VEGETABLES_NUTS(
      offTag: 'nutriscore_fruits_vegetables_nuts'),
  ORGANIC_EU(offTag: 'organic_eu'),
  ORIGINS(offTag: 'origins'),
  PARENTS(offTag: 'parents'),
  PNNS_GROUP_2(offTag: 'pnns_group_2'),
  PROTECTED_NAME_TYPE(offTag: 'protected_name_type'),
  REBLOCHON(offTag: 'reblochon'),
  SYNONYMS(offTag: 'synonyms'),
  VEGAN(offTag: 'vegan'),
  VEGETARIAN(offTag: 'vegetarian'),
  WIKIDATA(offTag: 'wikidata'),
  WIKTIONARY(offTag: 'wiktionary');

  const TaxonomyIngredientField({
    required this.offTag,
  });

  @override
  final String offTag;
}

/// A JSON-serializable version of a Ingredient taxonomy result.
///
/// See [OpenFoodAPIClient.getTaxonomy] for more details on how to retrieve one
/// of these.
@JsonSerializable()
class TaxonomyIngredient extends JsonObject {
  TaxonomyIngredient(
    this.additivesClasses,
    this.allergens,
    this.brioche,
    this.carbonFootprintFrFoodgesIngredient,
    this.carbonFootprintFrFoodgesValue,
    this.children,
    this.ciqualFoodCode,
    this.ciqualFoodName,
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
    this.efsaEvaluationExposure95ThGreaterThanAdi,
    this.efsaEvaluationExposure95ThGreaterThanNoael,
    this.efsaEvaluationExposureMeanGreaterThanAdi,
    this.efsaEvaluationExposureMeanGreaterThanNoael,
    this.efsaEvaluationOverexposureRisk,
    this.efsaEvaluationSafetyAssessed,
    this.efsaEvaluationUrl,
    this.fromPalmOil,
    this.likelyAllergens,
    this.mandatoryAdditiveClass,
    this.name,
    this.nova,
    this.nutriscoreFruitsVegetablesNuts,
    this.organicEu,
    this.origins,
    this.parents,
    this.pnnsGroup2,
    this.protectedNameType,
    this.reblochon,
    this.synonyms,
    this.vegan,
    this.vegetarian,
    this.wikidata,
    this.wiktionary,
  );

  factory TaxonomyIngredient.fromJson(Map<String, dynamic> json) {
    return _$TaxonomyIngredientFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TaxonomyIngredientToJson(this);
  }

  @JsonKey(
    name: 'additives_classes',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? additivesClasses;
  @JsonKey(
    name: 'allergens',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? allergens;
  @JsonKey(
    name: 'brioche',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? brioche;
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
    name: 'ciqual_food_code',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? ciqualFoodCode;
  @JsonKey(
    name: 'ciqual_food_name',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? ciqualFoodName;
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
    name: 'efsa_evaluation_exposure_95_th_greater_than_adi',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? efsaEvaluationExposure95ThGreaterThanAdi;
  @JsonKey(
    name: 'efsa_evaluation_exposure_95_th_greater_than_noael',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>?
      efsaEvaluationExposure95ThGreaterThanNoael;
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
    name: 'likely_allergens',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? likelyAllergens;
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
    name: 'nova',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? nova;
  @JsonKey(
    name: 'nutriscore_fruits_vegetables_nuts',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? nutriscoreFruitsVegetablesNuts;
  @JsonKey(
    name: 'organic_eu',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? organicEu;
  @JsonKey(
    name: 'origins',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? origins;
  @JsonKey(name: 'parents', includeIfNull: false)
  List<String>? parents;
  @JsonKey(
    name: 'pnns_group_2',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? pnnsGroup2;
  @JsonKey(
    name: 'protected_name_type',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? protectedNameType;
  @JsonKey(
    name: 'reblochon',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? reblochon;
  @JsonKey(
    name: 'synonyms',
    fromJson: LanguageHelper.fromJsonStringsListMap,
    toJson: LanguageHelper.toJsonStringsListMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, List<String>>? synonyms;
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
  @JsonKey(
    name: 'wiktionary',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
    includeIfNull: false,
  )
  Map<OpenFoodFactsLanguage, String>? wiktionary;

  @override
  String toString() => toJson().toString();
}

class TaxonomyIngredientQueryConfiguration extends TaxonomyQueryConfiguration<
    TaxonomyIngredient, TaxonomyIngredientField> {
  TaxonomyIngredientQueryConfiguration({
    required List<String> tags,
    List<OpenFoodFactsLanguage>? languages,
    OpenFoodFactsCountry? country,
    List<TaxonomyIngredientField> fields = const [],
    List<Parameter> additionalParameters = const [],
    bool includeChildren = false,
  }) : super(
          TagType.INGREDIENTS,
          tags,
          languages: languages,
          country: country,
          includeChildren: includeChildren,
          fields: fields,
          additionalParameters: additionalParameters,
        );

  TaxonomyIngredientQueryConfiguration.roots({
    List<OpenFoodFactsLanguage>? languages,
    OpenFoodFactsCountry? country,
    List<TaxonomyIngredientField> fields = const [],
    List<Parameter> additionalParameters = const [],
    bool includeChildren = false,
  }) : super.roots(
          TagType.INGREDIENTS,
          languages: languages,
          country: country,
          includeChildren: includeChildren,
          fields: fields,
          additionalParameters: additionalParameters,
        );

  @override
  Map<String, TaxonomyIngredient> convertResults(dynamic jsonData) {
    if (jsonData is! Map<String, dynamic>) {
      return const {};
    }
    return jsonData
        .map<String, TaxonomyIngredient>((String key, dynamic taxonomy) {
      if (taxonomy is! Map<String, dynamic>) {
        assert(false, 'Received JSON Ingredient is not a Map');
        return MapEntry(key, TaxonomyIngredient.fromJson({}));
      }
      return MapEntry(key, TaxonomyIngredient.fromJson(taxonomy));
    });
  }

  @override
  Set<TaxonomyIngredientField> get ignoredFields =>
      const {TaxonomyIngredientField.ALL};

  @override
  Iterable<String> convertFieldsToStrings(
      Iterable<TaxonomyIngredientField> fields) {
    return fields
        .where(
            (TaxonomyIngredientField field) => !ignoredFields.contains(field))
        .map<String>((TaxonomyIngredientField field) => field.offTag);
  }
}
