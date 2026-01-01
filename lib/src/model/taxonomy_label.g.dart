// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxonomy_label.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxonomyLabel _$TaxonomyLabelFromJson(Map<String, dynamic> json) =>
    TaxonomyLabel(
      LanguageHelper.fromJsonStringMap(json['auth_address']),
      LanguageHelper.fromJsonStringMap(json['auth_name']),
      LanguageHelper.fromJsonStringMap(json['auth_url']),
      LanguageHelper.fromJsonStringMap(json['categories']),
      (json['children'] as List<dynamic>?)?.map((e) => e as String).toList(),
      LanguageHelper.fromJsonStringMap(json['countries_where_sold']),
      LanguageHelper.fromJsonStringMap(json['country']),
      LanguageHelper.fromJsonStringMap(json['description']),
      LanguageHelper.fromJsonStringMap(json['eu_groups']),
      LanguageHelper.fromJsonStringMap(json['exceptions']),
      LanguageHelper.fromJsonStringMap(json['image']),
      LanguageHelper.fromJsonStringMap(json['images']),
      LanguageHelper.fromJsonStringMap(json['ingredients']),
      LanguageHelper.fromJsonStringMap(json['label_categories']),
      LanguageHelper.fromJsonStringMap(json['manufacturing_places']),
      LanguageHelper.fromJsonStringMap(json['name']),
      LanguageHelper.fromJsonStringMap(json['opposite']),
      LanguageHelper.fromJsonStringMap(json['origins']),
      LanguageHelper.fromJsonStringMap(json['packaging']),
      LanguageHelper.fromJsonStringMap(json['packaging_places']),
      (json['parents'] as List<dynamic>?)?.map((e) => e as String).toList(),
      LanguageHelper.fromJsonStringMap(json['protected_name_type']),
      LanguageHelper.fromJsonStringMap(json['stores']),
      LanguageHelper.fromJsonStringMap(json['wikidata']),
    );

Map<String, dynamic> _$TaxonomyLabelToJson(
  TaxonomyLabel instance,
) => <String, dynamic>{
  'auth_address': ?LanguageHelper.toJsonStringMap(instance.authAddress),
  'auth_name': ?LanguageHelper.toJsonStringMap(instance.authName),
  'auth_url': ?LanguageHelper.toJsonStringMap(instance.authUrl),
  'categories': ?LanguageHelper.toJsonStringMap(instance.categories),
  'countries_where_sold': ?LanguageHelper.toJsonStringMap(
    instance.countriesWhereSold,
  ),
  'children': ?instance.children,
  'country': ?LanguageHelper.toJsonStringMap(instance.country),
  'description': ?LanguageHelper.toJsonStringMap(instance.description),
  'eu_groups': ?LanguageHelper.toJsonStringMap(instance.euGroups),
  'exceptions': ?LanguageHelper.toJsonStringMap(instance.exceptions),
  'image': ?LanguageHelper.toJsonStringMap(instance.image),
  'images': ?LanguageHelper.toJsonStringMap(instance.images),
  'ingredients': ?LanguageHelper.toJsonStringMap(instance.ingredients),
  'label_categories': ?LanguageHelper.toJsonStringMap(instance.labelCategories),
  'manufacturing_places': ?LanguageHelper.toJsonStringMap(
    instance.manufacturingPlaces,
  ),
  'name': ?LanguageHelper.toJsonStringMap(instance.name),
  'opposite': ?LanguageHelper.toJsonStringMap(instance.opposite),
  'origins': ?LanguageHelper.toJsonStringMap(instance.origins),
  'packaging': ?LanguageHelper.toJsonStringMap(instance.packaging),
  'packaging_places': ?LanguageHelper.toJsonStringMap(instance.packagingPlaces),
  'parents': ?instance.parents,
  'protected_name_type': ?LanguageHelper.toJsonStringMap(
    instance.protectedNameType,
  ),
  'stores': ?LanguageHelper.toJsonStringMap(instance.stores),
  'wikidata': ?LanguageHelper.toJsonStringMap(instance.wikidata),
};
