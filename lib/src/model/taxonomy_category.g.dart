// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxonomy_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxonomyCategory _$TaxonomyCategoryFromJson(Map<String, dynamic> json) =>
    TaxonomyCategory(
      LanguageHelper.fromJsonStringMap(json['agribalyse_food_code']),
      LanguageHelper.fromJsonStringMap(json['agribalyse_food_name']),
      LanguageHelper.fromJsonStringMap(json['agribalyse_proxy_food_code']),
      LanguageHelper.fromJsonStringMap(json['agribalyse_proxy_food_name']),
      LanguageHelper.fromJsonStringMap(json['agribalyse_proxy_name']),
      LanguageHelper.fromJsonStringMap(
          json['carbon_footprint_fr_foodges_ingredient']),
      (json['children'] as List<dynamic>?)?.map((e) => e as String).toList(),
      LanguageHelper.fromJsonStringMap(json['ciqual_food_code']),
      LanguageHelper.fromJsonStringMap(json['ciqual_food_name']),
      LanguageHelper.fromJsonStringMap(json['ciqual_proxy_food_code']),
      LanguageHelper.fromJsonStringMap(json['ciqual_proxy_food_name']),
      LanguageHelper.fromJsonStringMap(json['country']),
      LanguageHelper.fromJsonStringMap(json['grapevariety']),
      LanguageHelper.fromJsonStringMap(json['instanceof']),
      LanguageHelper.fromJsonStringMap(json['name']),
      LanguageHelper.fromJsonStringMap(json['nova']),
      LanguageHelper.fromJsonStringMap(json['oqali_family']),
      LanguageHelper.fromJsonStringMap(json['origins']),
      (json['parents'] as List<dynamic>?)?.map((e) => e as String).toList(),
      LanguageHelper.fromJsonStringMap(json['pnns_group_1']),
      LanguageHelper.fromJsonStringMap(json['pnns_group_2']),
      LanguageHelper.fromJsonStringMap(json['protected_name_file_number']),
      LanguageHelper.fromJsonStringMap(json['protected_name_type']),
      LanguageHelper.fromJsonStringMap(json['region']),
      LanguageHelper.fromJsonStringMap(json['season_in_country_fr']),
      LanguageHelper.fromJsonStringMap(json['who_id']),
      LanguageHelper.fromJsonStringMap(json['wikidata']),
      LanguageHelper.fromJsonStringMap(json['wikidata_category']),
      LanguageHelper.fromJsonStringMap(json['wikidata_wikipedia_category']),
    );

Map<String, dynamic> _$TaxonomyCategoryToJson(TaxonomyCategory instance) =>
    <String, dynamic>{
      if (LanguageHelper.toJsonStringMap(instance.agribalyseFoodCode)
          case final value?)
        'agribalyse_food_code': value,
      if (LanguageHelper.toJsonStringMap(instance.agribalyseFoodName)
          case final value?)
        'agribalyse_food_name': value,
      if (LanguageHelper.toJsonStringMap(instance.agribalyseProxyFoodCode)
          case final value?)
        'agribalyse_proxy_food_code': value,
      if (LanguageHelper.toJsonStringMap(instance.agribalyseProxyFoodName)
          case final value?)
        'agribalyse_proxy_food_name': value,
      if (LanguageHelper.toJsonStringMap(instance.agribalyseProxyName)
          case final value?)
        'agribalyse_proxy_name': value,
      if (LanguageHelper.toJsonStringMap(
              instance.carbonFootprintFrFoodgesIngredient)
          case final value?)
        'carbon_footprint_fr_foodges_ingredient': value,
      if (instance.children case final value?) 'children': value,
      if (LanguageHelper.toJsonStringMap(instance.ciqualFoodCode)
          case final value?)
        'ciqual_food_code': value,
      if (LanguageHelper.toJsonStringMap(instance.ciqualFoodName)
          case final value?)
        'ciqual_food_name': value,
      if (LanguageHelper.toJsonStringMap(instance.ciqualProxyFoodCode)
          case final value?)
        'ciqual_proxy_food_code': value,
      if (LanguageHelper.toJsonStringMap(instance.ciqualProxyFoodName)
          case final value?)
        'ciqual_proxy_food_name': value,
      if (LanguageHelper.toJsonStringMap(instance.country) case final value?)
        'country': value,
      if (LanguageHelper.toJsonStringMap(instance.grapevariety)
          case final value?)
        'grapevariety': value,
      if (LanguageHelper.toJsonStringMap(instance.instanceof) case final value?)
        'instanceof': value,
      if (LanguageHelper.toJsonStringMap(instance.name) case final value?)
        'name': value,
      if (LanguageHelper.toJsonStringMap(instance.nova) case final value?)
        'nova': value,
      if (LanguageHelper.toJsonStringMap(instance.oqaliFamily)
          case final value?)
        'oqali_family': value,
      if (LanguageHelper.toJsonStringMap(instance.origins) case final value?)
        'origins': value,
      if (instance.parents case final value?) 'parents': value,
      if (LanguageHelper.toJsonStringMap(instance.pnnsGroup1) case final value?)
        'pnns_group_1': value,
      if (LanguageHelper.toJsonStringMap(instance.pnnsGroup2) case final value?)
        'pnns_group_2': value,
      if (LanguageHelper.toJsonStringMap(instance.protectedNameFileNumber)
          case final value?)
        'protected_name_file_number': value,
      if (LanguageHelper.toJsonStringMap(instance.protectedNameType)
          case final value?)
        'protected_name_type': value,
      if (LanguageHelper.toJsonStringMap(instance.region) case final value?)
        'region': value,
      if (LanguageHelper.toJsonStringMap(instance.seasonInCountryFr)
          case final value?)
        'season_in_country_fr': value,
      if (LanguageHelper.toJsonStringMap(instance.whoId) case final value?)
        'who_id': value,
      if (LanguageHelper.toJsonStringMap(instance.wikidata) case final value?)
        'wikidata': value,
      if (LanguageHelper.toJsonStringMap(instance.wikidataCategory)
          case final value?)
        'wikidata_category': value,
      if (LanguageHelper.toJsonStringMap(instance.wikidataWikipediaCategory)
          case final value?)
        'wikidata_wikipedia_category': value,
    };
