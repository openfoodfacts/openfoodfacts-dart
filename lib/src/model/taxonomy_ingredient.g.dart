// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxonomy_ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxonomyIngredient _$TaxonomyIngredientFromJson(
  Map<String, dynamic> json,
) => TaxonomyIngredient(
  LanguageHelper.fromJsonStringMap(json['additives_classes']),
  LanguageHelper.fromJsonStringMap(json['allergens']),
  LanguageHelper.fromJsonStringMap(json['brioche']),
  LanguageHelper.fromJsonStringMap(
    json['carbon_footprint_fr_foodges_ingredient'],
  ),
  LanguageHelper.fromJsonStringMap(json['carbon_footprint_fr_foodges_value']),
  (json['children'] as List<dynamic>?)?.map((e) => e as String).toList(),
  LanguageHelper.fromJsonStringMap(json['ciqual_food_code']),
  LanguageHelper.fromJsonStringMap(json['ciqual_food_name']),
  LanguageHelper.fromJsonStringMap(json['colour_index']),
  LanguageHelper.fromJsonStringMap(json['comment']),
  LanguageHelper.fromJsonStringMap(json['default_additive_class']),
  LanguageHelper.fromJsonStringMap(json['description']),
  LanguageHelper.fromJsonStringMap(json['e_number']),
  LanguageHelper.fromJsonStringMap(json['efsa']),
  LanguageHelper.fromJsonStringMap(json['efsa_evaluation']),
  LanguageHelper.fromJsonStringMap(json['efsa_evaluation_adi']),
  LanguageHelper.fromJsonStringMap(json['efsa_evaluation_adi_established']),
  LanguageHelper.fromJsonStringMap(json['efsa_evaluation_date']),
  LanguageHelper.fromJsonStringMap(
    json['efsa_evaluation_exposure_95_th_greater_than_adi'],
  ),
  LanguageHelper.fromJsonStringMap(
    json['efsa_evaluation_exposure_95_th_greater_than_noael'],
  ),
  LanguageHelper.fromJsonStringMap(
    json['efsa_evaluation_exposure_mean_greater_than_adi'],
  ),
  LanguageHelper.fromJsonStringMap(
    json['efsa_evaluation_exposure_mean_greater_than_noael'],
  ),
  LanguageHelper.fromJsonStringMap(json['efsa_evaluation_overexposure_risk']),
  LanguageHelper.fromJsonStringMap(json['efsa_evaluation_safety_assessed']),
  LanguageHelper.fromJsonStringMap(json['efsa_evaluation_url']),
  LanguageHelper.fromJsonStringMap(json['from_palm_oil']),
  LanguageHelper.fromJsonStringMap(json['likely_allergens']),
  LanguageHelper.fromJsonStringMap(json['mandatory_additive_class']),
  LanguageHelper.fromJsonStringMap(json['name']),
  LanguageHelper.fromJsonStringMap(json['nova']),
  LanguageHelper.fromJsonStringMap(json['nutriscore_fruits_vegetables_nuts']),
  LanguageHelper.fromJsonStringMap(json['organic_eu']),
  LanguageHelper.fromJsonStringMap(json['origins']),
  (json['parents'] as List<dynamic>?)?.map((e) => e as String).toList(),
  LanguageHelper.fromJsonStringMap(json['pnns_group_2']),
  LanguageHelper.fromJsonStringMap(json['protected_name_type']),
  LanguageHelper.fromJsonStringMap(json['reblochon']),
  LanguageHelper.fromJsonStringsListMap(json['synonyms']),
  LanguageHelper.fromJsonStringMap(json['vegan']),
  LanguageHelper.fromJsonStringMap(json['vegetarian']),
  LanguageHelper.fromJsonStringMap(json['wikidata']),
  LanguageHelper.fromJsonStringMap(json['wiktionary']),
);

Map<String, dynamic> _$TaxonomyIngredientToJson(
  TaxonomyIngredient instance,
) => <String, dynamic>{
  if (LanguageHelper.toJsonStringMap(instance.additivesClasses)
      case final value?)
    'additives_classes': value,
  if (LanguageHelper.toJsonStringMap(instance.allergens) case final value?)
    'allergens': value,
  if (LanguageHelper.toJsonStringMap(instance.brioche) case final value?)
    'brioche': value,
  if (LanguageHelper.toJsonStringMap(
        instance.carbonFootprintFrFoodgesIngredient,
      )
      case final value?)
    'carbon_footprint_fr_foodges_ingredient': value,
  if (LanguageHelper.toJsonStringMap(instance.carbonFootprintFrFoodgesValue)
      case final value?)
    'carbon_footprint_fr_foodges_value': value,
  if (instance.children case final value?) 'children': value,
  if (LanguageHelper.toJsonStringMap(instance.ciqualFoodCode) case final value?)
    'ciqual_food_code': value,
  if (LanguageHelper.toJsonStringMap(instance.ciqualFoodName) case final value?)
    'ciqual_food_name': value,
  if (LanguageHelper.toJsonStringMap(instance.colourIndex) case final value?)
    'colour_index': value,
  if (LanguageHelper.toJsonStringMap(instance.comment) case final value?)
    'comment': value,
  if (LanguageHelper.toJsonStringMap(instance.defaultAdditiveClass)
      case final value?)
    'default_additive_class': value,
  if (LanguageHelper.toJsonStringMap(instance.description) case final value?)
    'description': value,
  if (LanguageHelper.toJsonStringMap(instance.eNumber) case final value?)
    'e_number': value,
  if (LanguageHelper.toJsonStringMap(instance.efsa) case final value?)
    'efsa': value,
  if (LanguageHelper.toJsonStringMap(instance.efsaEvaluation) case final value?)
    'efsa_evaluation': value,
  if (LanguageHelper.toJsonStringMap(instance.efsaEvaluationAdi)
      case final value?)
    'efsa_evaluation_adi': value,
  if (LanguageHelper.toJsonStringMap(instance.efsaEvaluationAdiEstablished)
      case final value?)
    'efsa_evaluation_adi_established': value,
  if (LanguageHelper.toJsonStringMap(instance.efsaEvaluationDate)
      case final value?)
    'efsa_evaluation_date': value,
  if (LanguageHelper.toJsonStringMap(
        instance.efsaEvaluationExposure95ThGreaterThanAdi,
      )
      case final value?)
    'efsa_evaluation_exposure_95_th_greater_than_adi': value,
  if (LanguageHelper.toJsonStringMap(
        instance.efsaEvaluationExposure95ThGreaterThanNoael,
      )
      case final value?)
    'efsa_evaluation_exposure_95_th_greater_than_noael': value,
  if (LanguageHelper.toJsonStringMap(
        instance.efsaEvaluationExposureMeanGreaterThanAdi,
      )
      case final value?)
    'efsa_evaluation_exposure_mean_greater_than_adi': value,
  if (LanguageHelper.toJsonStringMap(
        instance.efsaEvaluationExposureMeanGreaterThanNoael,
      )
      case final value?)
    'efsa_evaluation_exposure_mean_greater_than_noael': value,
  if (LanguageHelper.toJsonStringMap(instance.efsaEvaluationOverexposureRisk)
      case final value?)
    'efsa_evaluation_overexposure_risk': value,
  if (LanguageHelper.toJsonStringMap(instance.efsaEvaluationSafetyAssessed)
      case final value?)
    'efsa_evaluation_safety_assessed': value,
  if (LanguageHelper.toJsonStringMap(instance.efsaEvaluationUrl)
      case final value?)
    'efsa_evaluation_url': value,
  if (LanguageHelper.toJsonStringMap(instance.fromPalmOil) case final value?)
    'from_palm_oil': value,
  if (LanguageHelper.toJsonStringMap(instance.likelyAllergens)
      case final value?)
    'likely_allergens': value,
  if (LanguageHelper.toJsonStringMap(instance.mandatoryAdditiveClass)
      case final value?)
    'mandatory_additive_class': value,
  if (LanguageHelper.toJsonStringMap(instance.name) case final value?)
    'name': value,
  if (LanguageHelper.toJsonStringMap(instance.nova) case final value?)
    'nova': value,
  if (LanguageHelper.toJsonStringMap(instance.nutriscoreFruitsVegetablesNuts)
      case final value?)
    'nutriscore_fruits_vegetables_nuts': value,
  if (LanguageHelper.toJsonStringMap(instance.organicEu) case final value?)
    'organic_eu': value,
  if (LanguageHelper.toJsonStringMap(instance.origins) case final value?)
    'origins': value,
  if (instance.parents case final value?) 'parents': value,
  if (LanguageHelper.toJsonStringMap(instance.pnnsGroup2) case final value?)
    'pnns_group_2': value,
  if (LanguageHelper.toJsonStringMap(instance.protectedNameType)
      case final value?)
    'protected_name_type': value,
  if (LanguageHelper.toJsonStringMap(instance.reblochon) case final value?)
    'reblochon': value,
  if (LanguageHelper.toJsonStringsListMap(instance.synonyms) case final value?)
    'synonyms': value,
  if (LanguageHelper.toJsonStringMap(instance.vegan) case final value?)
    'vegan': value,
  if (LanguageHelper.toJsonStringMap(instance.vegetarian) case final value?)
    'vegetarian': value,
  if (LanguageHelper.toJsonStringMap(instance.wikidata) case final value?)
    'wikidata': value,
  if (LanguageHelper.toJsonStringMap(instance.wiktionary) case final value?)
    'wiktionary': value,
};
