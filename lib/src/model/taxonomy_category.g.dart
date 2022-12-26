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

Map<String, dynamic> _$TaxonomyCategoryToJson(TaxonomyCategory instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('agribalyse_food_code',
      LanguageHelper.toJsonStringMap(instance.agribalyseFoodCode));
  writeNotNull('agribalyse_food_name',
      LanguageHelper.toJsonStringMap(instance.agribalyseFoodName));
  writeNotNull('agribalyse_proxy_food_code',
      LanguageHelper.toJsonStringMap(instance.agribalyseProxyFoodCode));
  writeNotNull('agribalyse_proxy_food_name',
      LanguageHelper.toJsonStringMap(instance.agribalyseProxyFoodName));
  writeNotNull('agribalyse_proxy_name',
      LanguageHelper.toJsonStringMap(instance.agribalyseProxyName));
  writeNotNull(
      'carbon_footprint_fr_foodges_ingredient',
      LanguageHelper.toJsonStringMap(
          instance.carbonFootprintFrFoodgesIngredient));
  writeNotNull('children', instance.children);
  writeNotNull('ciqual_food_code',
      LanguageHelper.toJsonStringMap(instance.ciqualFoodCode));
  writeNotNull('ciqual_food_name',
      LanguageHelper.toJsonStringMap(instance.ciqualFoodName));
  writeNotNull('ciqual_proxy_food_code',
      LanguageHelper.toJsonStringMap(instance.ciqualProxyFoodCode));
  writeNotNull('ciqual_proxy_food_name',
      LanguageHelper.toJsonStringMap(instance.ciqualProxyFoodName));
  writeNotNull('country', LanguageHelper.toJsonStringMap(instance.country));
  writeNotNull(
      'grapevariety', LanguageHelper.toJsonStringMap(instance.grapevariety));
  writeNotNull(
      'instanceof', LanguageHelper.toJsonStringMap(instance.instanceof));
  writeNotNull('name', LanguageHelper.toJsonStringMap(instance.name));
  writeNotNull('nova', LanguageHelper.toJsonStringMap(instance.nova));
  writeNotNull(
      'oqali_family', LanguageHelper.toJsonStringMap(instance.oqaliFamily));
  writeNotNull('origins', LanguageHelper.toJsonStringMap(instance.origins));
  writeNotNull('parents', instance.parents);
  writeNotNull(
      'pnns_group_1', LanguageHelper.toJsonStringMap(instance.pnnsGroup1));
  writeNotNull(
      'pnns_group_2', LanguageHelper.toJsonStringMap(instance.pnnsGroup2));
  writeNotNull('protected_name_file_number',
      LanguageHelper.toJsonStringMap(instance.protectedNameFileNumber));
  writeNotNull('protected_name_type',
      LanguageHelper.toJsonStringMap(instance.protectedNameType));
  writeNotNull('region', LanguageHelper.toJsonStringMap(instance.region));
  writeNotNull('season_in_country_fr',
      LanguageHelper.toJsonStringMap(instance.seasonInCountryFr));
  writeNotNull('who_id', LanguageHelper.toJsonStringMap(instance.whoId));
  writeNotNull('wikidata', LanguageHelper.toJsonStringMap(instance.wikidata));
  writeNotNull('wikidata_category',
      LanguageHelper.toJsonStringMap(instance.wikidataCategory));
  writeNotNull('wikidata_wikipedia_category',
      LanguageHelper.toJsonStringMap(instance.wikidataWikipediaCategory));
  return val;
}
