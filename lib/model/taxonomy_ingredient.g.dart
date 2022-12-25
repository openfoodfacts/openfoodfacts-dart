// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxonomy_ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxonomyIngredient _$TaxonomyIngredientFromJson(Map<String, dynamic> json) =>
    TaxonomyIngredient(
      LanguageHelper.fromJsonStringMap(json['additives_classes']),
      LanguageHelper.fromJsonStringMap(json['allergens']),
      LanguageHelper.fromJsonStringMap(json['brioche']),
      LanguageHelper.fromJsonStringMap(
          json['carbon_footprint_fr_foodges_ingredient']),
      LanguageHelper.fromJsonStringMap(
          json['carbon_footprint_fr_foodges_value']),
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
          json['efsa_evaluation_exposure_95_th_greater_than_adi']),
      LanguageHelper.fromJsonStringMap(
          json['efsa_evaluation_exposure_95_th_greater_than_noael']),
      LanguageHelper.fromJsonStringMap(
          json['efsa_evaluation_exposure_mean_greater_than_adi']),
      LanguageHelper.fromJsonStringMap(
          json['efsa_evaluation_exposure_mean_greater_than_noael']),
      LanguageHelper.fromJsonStringMap(
          json['efsa_evaluation_overexposure_risk']),
      LanguageHelper.fromJsonStringMap(json['efsa_evaluation_safety_assessed']),
      LanguageHelper.fromJsonStringMap(json['efsa_evaluation_url']),
      LanguageHelper.fromJsonStringMap(json['from_palm_oil']),
      LanguageHelper.fromJsonStringMap(json['likely_allergens']),
      LanguageHelper.fromJsonStringMap(json['mandatory_additive_class']),
      LanguageHelper.fromJsonStringMap(json['name']),
      LanguageHelper.fromJsonStringMap(json['nova']),
      LanguageHelper.fromJsonStringMap(
          json['nutriscore_fruits_vegetables_nuts']),
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

Map<String, dynamic> _$TaxonomyIngredientToJson(TaxonomyIngredient instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('additives_classes',
      LanguageHelper.toJsonStringMap(instance.additivesClasses));
  writeNotNull('allergens', LanguageHelper.toJsonStringMap(instance.allergens));
  writeNotNull('brioche', LanguageHelper.toJsonStringMap(instance.brioche));
  writeNotNull(
      'carbon_footprint_fr_foodges_ingredient',
      LanguageHelper.toJsonStringMap(
          instance.carbonFootprintFrFoodgesIngredient));
  writeNotNull('carbon_footprint_fr_foodges_value',
      LanguageHelper.toJsonStringMap(instance.carbonFootprintFrFoodgesValue));
  writeNotNull('children', instance.children);
  writeNotNull('ciqual_food_code',
      LanguageHelper.toJsonStringMap(instance.ciqualFoodCode));
  writeNotNull('ciqual_food_name',
      LanguageHelper.toJsonStringMap(instance.ciqualFoodName));
  writeNotNull(
      'colour_index', LanguageHelper.toJsonStringMap(instance.colourIndex));
  writeNotNull('comment', LanguageHelper.toJsonStringMap(instance.comment));
  writeNotNull('default_additive_class',
      LanguageHelper.toJsonStringMap(instance.defaultAdditiveClass));
  writeNotNull(
      'description', LanguageHelper.toJsonStringMap(instance.description));
  writeNotNull('e_number', LanguageHelper.toJsonStringMap(instance.eNumber));
  writeNotNull('efsa', LanguageHelper.toJsonStringMap(instance.efsa));
  writeNotNull('efsa_evaluation',
      LanguageHelper.toJsonStringMap(instance.efsaEvaluation));
  writeNotNull('efsa_evaluation_adi',
      LanguageHelper.toJsonStringMap(instance.efsaEvaluationAdi));
  writeNotNull('efsa_evaluation_adi_established',
      LanguageHelper.toJsonStringMap(instance.efsaEvaluationAdiEstablished));
  writeNotNull('efsa_evaluation_date',
      LanguageHelper.toJsonStringMap(instance.efsaEvaluationDate));
  writeNotNull(
      'efsa_evaluation_exposure_95_th_greater_than_adi',
      LanguageHelper.toJsonStringMap(
          instance.efsaEvaluationExposure95ThGreaterThanAdi));
  writeNotNull(
      'efsa_evaluation_exposure_95_th_greater_than_noael',
      LanguageHelper.toJsonStringMap(
          instance.efsaEvaluationExposure95ThGreaterThanNoael));
  writeNotNull(
      'efsa_evaluation_exposure_mean_greater_than_adi',
      LanguageHelper.toJsonStringMap(
          instance.efsaEvaluationExposureMeanGreaterThanAdi));
  writeNotNull(
      'efsa_evaluation_exposure_mean_greater_than_noael',
      LanguageHelper.toJsonStringMap(
          instance.efsaEvaluationExposureMeanGreaterThanNoael));
  writeNotNull('efsa_evaluation_overexposure_risk',
      LanguageHelper.toJsonStringMap(instance.efsaEvaluationOverexposureRisk));
  writeNotNull('efsa_evaluation_safety_assessed',
      LanguageHelper.toJsonStringMap(instance.efsaEvaluationSafetyAssessed));
  writeNotNull('efsa_evaluation_url',
      LanguageHelper.toJsonStringMap(instance.efsaEvaluationUrl));
  writeNotNull(
      'from_palm_oil', LanguageHelper.toJsonStringMap(instance.fromPalmOil));
  writeNotNull('likely_allergens',
      LanguageHelper.toJsonStringMap(instance.likelyAllergens));
  writeNotNull('mandatory_additive_class',
      LanguageHelper.toJsonStringMap(instance.mandatoryAdditiveClass));
  writeNotNull('name', LanguageHelper.toJsonStringMap(instance.name));
  writeNotNull('nova', LanguageHelper.toJsonStringMap(instance.nova));
  writeNotNull('nutriscore_fruits_vegetables_nuts',
      LanguageHelper.toJsonStringMap(instance.nutriscoreFruitsVegetablesNuts));
  writeNotNull(
      'organic_eu', LanguageHelper.toJsonStringMap(instance.organicEu));
  writeNotNull('origins', LanguageHelper.toJsonStringMap(instance.origins));
  writeNotNull('parents', instance.parents);
  writeNotNull(
      'pnns_group_2', LanguageHelper.toJsonStringMap(instance.pnnsGroup2));
  writeNotNull('protected_name_type',
      LanguageHelper.toJsonStringMap(instance.protectedNameType));
  writeNotNull('reblochon', LanguageHelper.toJsonStringMap(instance.reblochon));
  writeNotNull(
      'synonyms', LanguageHelper.toJsonStringsListMap(instance.synonyms));
  writeNotNull('vegan', LanguageHelper.toJsonStringMap(instance.vegan));
  writeNotNull(
      'vegetarian', LanguageHelper.toJsonStringMap(instance.vegetarian));
  writeNotNull('wikidata', LanguageHelper.toJsonStringMap(instance.wikidata));
  writeNotNull(
      'wiktionary', LanguageHelper.toJsonStringMap(instance.wiktionary));
  return val;
}
