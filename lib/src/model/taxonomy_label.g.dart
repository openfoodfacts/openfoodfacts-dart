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

Map<String, dynamic> _$TaxonomyLabelToJson(TaxonomyLabel instance) =>
    <String, dynamic>{
      if (LanguageHelper.toJsonStringMap(instance.authAddress)
          case final value?)
        'auth_address': value,
      if (LanguageHelper.toJsonStringMap(instance.authName) case final value?)
        'auth_name': value,
      if (LanguageHelper.toJsonStringMap(instance.authUrl) case final value?)
        'auth_url': value,
      if (LanguageHelper.toJsonStringMap(instance.categories) case final value?)
        'categories': value,
      if (LanguageHelper.toJsonStringMap(instance.countriesWhereSold)
          case final value?)
        'countries_where_sold': value,
      if (instance.children case final value?) 'children': value,
      if (LanguageHelper.toJsonStringMap(instance.country) case final value?)
        'country': value,
      if (LanguageHelper.toJsonStringMap(instance.description)
          case final value?)
        'description': value,
      if (LanguageHelper.toJsonStringMap(instance.euGroups) case final value?)
        'eu_groups': value,
      if (LanguageHelper.toJsonStringMap(instance.exceptions) case final value?)
        'exceptions': value,
      if (LanguageHelper.toJsonStringMap(instance.image) case final value?)
        'image': value,
      if (LanguageHelper.toJsonStringMap(instance.images) case final value?)
        'images': value,
      if (LanguageHelper.toJsonStringMap(instance.ingredients)
          case final value?)
        'ingredients': value,
      if (LanguageHelper.toJsonStringMap(instance.labelCategories)
          case final value?)
        'label_categories': value,
      if (LanguageHelper.toJsonStringMap(instance.manufacturingPlaces)
          case final value?)
        'manufacturing_places': value,
      if (LanguageHelper.toJsonStringMap(instance.name) case final value?)
        'name': value,
      if (LanguageHelper.toJsonStringMap(instance.opposite) case final value?)
        'opposite': value,
      if (LanguageHelper.toJsonStringMap(instance.origins) case final value?)
        'origins': value,
      if (LanguageHelper.toJsonStringMap(instance.packaging) case final value?)
        'packaging': value,
      if (LanguageHelper.toJsonStringMap(instance.packagingPlaces)
          case final value?)
        'packaging_places': value,
      if (instance.parents case final value?) 'parents': value,
      if (LanguageHelper.toJsonStringMap(instance.protectedNameType)
          case final value?)
        'protected_name_type': value,
      if (LanguageHelper.toJsonStringMap(instance.stores) case final value?)
        'stores': value,
      if (LanguageHelper.toJsonStringMap(instance.wikidata) case final value?)
        'wikidata': value,
    };
