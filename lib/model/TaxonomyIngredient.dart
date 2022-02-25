import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/interface/JsonObject.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/CountryHelper.dart';
import 'package:openfoodfacts/utils/TaxonomyQueryConfiguration.dart';
import 'package:openfoodfacts/utils/TagType.dart';

part 'TaxonomyIngredient.g.dart';

/// Fields of an [TaxonomyIngredient]
enum TaxonomyIngredientField {
  ALL,
  ADDITIVES_CLASSES,
  ALLERGENS,
  BRIOCHE,
  CARBON_FOOTPRINT_FR_FOODGES_INGREDIENT,
  CARBON_FOOTPRINT_FR_FOODGES_VALUE,
  CHILDREN,
  CIQUAL_FOOD_CODE,
  CIQUAL_FOOD_NAME,
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
  LIKELY_ALLERGENS,
  MANDATORY_ADDITIVE_CLASS,
  NAME,
  NOVA,
  NUTRISCORE_FRUITS_VEGETABLES_NUTS,
  ORGANIC_EU,
  ORIGINS,
  PARENTS,
  PNNS_GROUP_2,
  PROTECTED_NAME_TYPE,
  REBLOCHON,
  SYNONYMS,
  VEGAN,
  VEGETARIAN,
  WIKIDATA,
  WIKTIONARY,
}

extension TaxonomyIngredientFieldExtension on TaxonomyIngredientField {
  static const Map<TaxonomyIngredientField, String> _KEYS =
      <TaxonomyIngredientField, String>{
    TaxonomyIngredientField.ADDITIVES_CLASSES: 'additives_classes',
    TaxonomyIngredientField.ALLERGENS: 'allergens',
    TaxonomyIngredientField.BRIOCHE: 'brioche',
    TaxonomyIngredientField.CARBON_FOOTPRINT_FR_FOODGES_INGREDIENT:
        'carbon_footprint_fr_foodges_ingredient',
    TaxonomyIngredientField.CARBON_FOOTPRINT_FR_FOODGES_VALUE:
        'carbon_footprint_fr_foodges_value',
    TaxonomyIngredientField.CHILDREN: 'children',
    TaxonomyIngredientField.CIQUAL_FOOD_CODE: 'ciqual_food_code',
    TaxonomyIngredientField.CIQUAL_FOOD_NAME: 'ciqual_food_name',
    TaxonomyIngredientField.COLOUR_INDEX: 'colour_index',
    TaxonomyIngredientField.COMMENT: 'comment',
    TaxonomyIngredientField.DEFAULT_ADDITIVE_CLASS: 'default_additive_class',
    TaxonomyIngredientField.DESCRIPTION: 'description',
    TaxonomyIngredientField.E_NUMBER: 'e_number',
    TaxonomyIngredientField.EFSA: 'efsa',
    TaxonomyIngredientField.EFSA_EVALUATION: 'efsa_evaluation',
    TaxonomyIngredientField.EFSA_EVALUATION_ADI: 'efsa_evaluation_adi',
    TaxonomyIngredientField.EFSA_EVALUATION_ADI_ESTABLISHED:
        'efsa_evaluation_adi_established',
    TaxonomyIngredientField.EFSA_EVALUATION_DATE: 'efsa_evaluation_date',
    TaxonomyIngredientField.EFSA_EVALUATION_EXPOSURE_95TH_GREATER_THAN_ADI:
        'efsa_evaluation_exposure_95th_greater_than_adi',
    TaxonomyIngredientField.EFSA_EVALUATION_EXPOSURE_95TH_GREATER_THAN_NOAEL:
        'efsa_evaluation_exposure_95th_greater_than_noael',
    TaxonomyIngredientField.EFSA_EVALUATION_EXPOSURE_MEAN_GREATER_THAN_ADI:
        'efsa_evaluation_exposure_mean_greater_than_adi',
    TaxonomyIngredientField.EFSA_EVALUATION_EXPOSURE_MEAN_GREATER_THAN_NOAEL:
        'efsa_evaluation_exposure_mean_greater_than_noael',
    TaxonomyIngredientField.EFSA_EVALUATION_OVEREXPOSURE_RISK:
        'efsa_evaluation_overexposure_risk',
    TaxonomyIngredientField.EFSA_EVALUATION_SAFETY_ASSESSED:
        'efsa_evaluation_safety_assessed',
    TaxonomyIngredientField.EFSA_EVALUATION_URL: 'efsa_evaluation_url',
    TaxonomyIngredientField.FROM_PALM_OIL: 'from_palm_oil',
    TaxonomyIngredientField.LIKELY_ALLERGENS: 'likely_allergens',
    TaxonomyIngredientField.MANDATORY_ADDITIVE_CLASS:
        'mandatory_additive_class',
    TaxonomyIngredientField.NAME: 'name',
    TaxonomyIngredientField.NOVA: 'nova',
    TaxonomyIngredientField.NUTRISCORE_FRUITS_VEGETABLES_NUTS:
        'nutriscore_fruits_vegetables_nuts',
    TaxonomyIngredientField.ORGANIC_EU: 'organic_eu',
    TaxonomyIngredientField.ORIGINS: 'origins',
    TaxonomyIngredientField.PARENTS: 'parents',
    TaxonomyIngredientField.PNNS_GROUP_2: 'pnns_group_2',
    TaxonomyIngredientField.PROTECTED_NAME_TYPE: 'protected_name_type',
    TaxonomyIngredientField.REBLOCHON: 'reblochon',
    TaxonomyIngredientField.SYNONYMS: 'synonyms',
    TaxonomyIngredientField.VEGAN: 'vegan',
    TaxonomyIngredientField.VEGETARIAN: 'vegetarian',
    TaxonomyIngredientField.WIKIDATA: 'wikidata',
    TaxonomyIngredientField.WIKTIONARY: 'wiktionary',
  };

  /// Returns the key of the Ingredient field
  String get key => _KEYS[this] ?? '';
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
    @Deprecated('Use parameter country instead') String? cc,
    OpenFoodFactsCountry? country,
    List<TaxonomyIngredientField> fields = const [],
    List<Parameter> additionalParameters = const [],
    bool includeChildren = false,
  }) : super(
          TagType.INGREDIENTS,
          tags,
          languages: languages,
          cc: cc,
          country: country,
          includeChildren: includeChildren,
          fields: fields,
          additionalParameters: additionalParameters,
        );

  TaxonomyIngredientQueryConfiguration.roots({
    List<OpenFoodFactsLanguage>? languages,
    @Deprecated('Use parameter country instead') String? cc,
    OpenFoodFactsCountry? country,
    List<TaxonomyIngredientField> fields = const [],
    List<Parameter> additionalParameters = const [],
    bool includeChildren = false,
  }) : super.roots(
          TagType.INGREDIENTS,
          languages: languages,
          cc: cc,
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
        .map<String>((TaxonomyIngredientField field) => field.key);
  }
}
