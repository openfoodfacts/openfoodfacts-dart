// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaxonomyLabel.dart';

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

Map<String, dynamic> _$TaxonomyLabelToJson(TaxonomyLabel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'auth_address', LanguageHelper.toJsonStringMap(instance.authAddress));
  writeNotNull('auth_name', LanguageHelper.toJsonStringMap(instance.authName));
  writeNotNull('auth_url', LanguageHelper.toJsonStringMap(instance.authUrl));
  writeNotNull(
      'categories', LanguageHelper.toJsonStringMap(instance.categories));
  writeNotNull('countries_where_sold',
      LanguageHelper.toJsonStringMap(instance.countriesWhereSold));
  writeNotNull('children', instance.children);
  writeNotNull('country', LanguageHelper.toJsonStringMap(instance.country));
  writeNotNull(
      'description', LanguageHelper.toJsonStringMap(instance.description));
  writeNotNull('eu_groups', LanguageHelper.toJsonStringMap(instance.euGroups));
  writeNotNull(
      'exceptions', LanguageHelper.toJsonStringMap(instance.exceptions));
  writeNotNull('image', LanguageHelper.toJsonStringMap(instance.image));
  writeNotNull('images', LanguageHelper.toJsonStringMap(instance.images));
  writeNotNull(
      'ingredients', LanguageHelper.toJsonStringMap(instance.ingredients));
  writeNotNull('label_categories',
      LanguageHelper.toJsonStringMap(instance.labelCategories));
  writeNotNull('manufacturing_places',
      LanguageHelper.toJsonStringMap(instance.manufacturingPlaces));
  writeNotNull('name', LanguageHelper.toJsonStringMap(instance.name));
  writeNotNull('opposite', LanguageHelper.toJsonStringMap(instance.opposite));
  writeNotNull('origins', LanguageHelper.toJsonStringMap(instance.origins));
  writeNotNull('packaging', LanguageHelper.toJsonStringMap(instance.packaging));
  writeNotNull('packaging_places',
      LanguageHelper.toJsonStringMap(instance.packagingPlaces));
  writeNotNull('parents', instance.parents);
  writeNotNull('protected_name_type',
      LanguageHelper.toJsonStringMap(instance.protectedNameType));
  writeNotNull('stores', LanguageHelper.toJsonStringMap(instance.stores));
  writeNotNull('wikidata', LanguageHelper.toJsonStringMap(instance.wikidata));
  return val;
}
