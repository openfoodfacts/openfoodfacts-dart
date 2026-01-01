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
  'additives_classes': ?LanguageHelper.toJsonStringMap(
    instance.additivesClasses,
  ),
  'allergens': ?LanguageHelper.toJsonStringMap(instance.allergens),
  'brioche': ?LanguageHelper.toJsonStringMap(instance.brioche),
  'carbon_footprint_fr_foodges_ingredient': ?LanguageHelper.toJsonStringMap(
    instance.carbonFootprintFrFoodgesIngredient,
  ),
  'carbon_footprint_fr_foodges_value': ?LanguageHelper.toJsonStringMap(
    instance.carbonFootprintFrFoodgesValue,
  ),
  'children': ?instance.children,
  'ciqual_food_code': ?LanguageHelper.toJsonStringMap(instance.ciqualFoodCode),
  'ciqual_food_name': ?LanguageHelper.toJsonStringMap(instance.ciqualFoodName),
  'colour_index': ?LanguageHelper.toJsonStringMap(instance.colourIndex),
  'comment': ?LanguageHelper.toJsonStringMap(instance.comment),
  'default_additive_class': ?LanguageHelper.toJsonStringMap(
    instance.defaultAdditiveClass,
  ),
  'description': ?LanguageHelper.toJsonStringMap(instance.description),
  'e_number': ?LanguageHelper.toJsonStringMap(instance.eNumber),
  'efsa': ?LanguageHelper.toJsonStringMap(instance.efsa),
  'efsa_evaluation': ?LanguageHelper.toJsonStringMap(instance.efsaEvaluation),
  'efsa_evaluation_adi': ?LanguageHelper.toJsonStringMap(
    instance.efsaEvaluationAdi,
  ),
  'efsa_evaluation_adi_established': ?LanguageHelper.toJsonStringMap(
    instance.efsaEvaluationAdiEstablished,
  ),
  'efsa_evaluation_date': ?LanguageHelper.toJsonStringMap(
    instance.efsaEvaluationDate,
  ),
  'efsa_evaluation_exposure_95_th_greater_than_adi':
      ?LanguageHelper.toJsonStringMap(
        instance.efsaEvaluationExposure95ThGreaterThanAdi,
      ),
  'efsa_evaluation_exposure_95_th_greater_than_noael':
      ?LanguageHelper.toJsonStringMap(
        instance.efsaEvaluationExposure95ThGreaterThanNoael,
      ),
  'efsa_evaluation_exposure_mean_greater_than_adi':
      ?LanguageHelper.toJsonStringMap(
        instance.efsaEvaluationExposureMeanGreaterThanAdi,
      ),
  'efsa_evaluation_exposure_mean_greater_than_noael':
      ?LanguageHelper.toJsonStringMap(
        instance.efsaEvaluationExposureMeanGreaterThanNoael,
      ),
  'efsa_evaluation_overexposure_risk': ?LanguageHelper.toJsonStringMap(
    instance.efsaEvaluationOverexposureRisk,
  ),
  'efsa_evaluation_safety_assessed': ?LanguageHelper.toJsonStringMap(
    instance.efsaEvaluationSafetyAssessed,
  ),
  'efsa_evaluation_url': ?LanguageHelper.toJsonStringMap(
    instance.efsaEvaluationUrl,
  ),
  'from_palm_oil': ?LanguageHelper.toJsonStringMap(instance.fromPalmOil),
  'likely_allergens': ?LanguageHelper.toJsonStringMap(instance.likelyAllergens),
  'mandatory_additive_class': ?LanguageHelper.toJsonStringMap(
    instance.mandatoryAdditiveClass,
  ),
  'name': ?LanguageHelper.toJsonStringMap(instance.name),
  'nova': ?LanguageHelper.toJsonStringMap(instance.nova),
  'nutriscore_fruits_vegetables_nuts': ?LanguageHelper.toJsonStringMap(
    instance.nutriscoreFruitsVegetablesNuts,
  ),
  'organic_eu': ?LanguageHelper.toJsonStringMap(instance.organicEu),
  'origins': ?LanguageHelper.toJsonStringMap(instance.origins),
  'parents': ?instance.parents,
  'pnns_group_2': ?LanguageHelper.toJsonStringMap(instance.pnnsGroup2),
  'protected_name_type': ?LanguageHelper.toJsonStringMap(
    instance.protectedNameType,
  ),
  'reblochon': ?LanguageHelper.toJsonStringMap(instance.reblochon),
  'synonyms': ?LanguageHelper.toJsonStringsListMap(instance.synonyms),
  'vegan': ?LanguageHelper.toJsonStringMap(instance.vegan),
  'vegetarian': ?LanguageHelper.toJsonStringMap(instance.vegetarian),
  'wikidata': ?LanguageHelper.toJsonStringMap(instance.wikidata),
  'wiktionary': ?LanguageHelper.toJsonStringMap(instance.wiktionary),
};
