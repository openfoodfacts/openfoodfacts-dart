// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaxonomyPackaging.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TaxonomyPackagingCWProxy {
  TaxonomyPackaging children(List<String>? children);

  TaxonomyPackaging name(Map<OpenFoodFactsLanguage, String>? name);

  TaxonomyPackaging parents(List<String>? parents);

  TaxonomyPackaging synonyms(
      Map<OpenFoodFactsLanguage, List<String>>? synonyms);

  TaxonomyPackaging wikidata(Map<OpenFoodFactsLanguage, String>? wikidata);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TaxonomyPackaging(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TaxonomyPackaging(...).copyWith(id: 12, name: "My name")
  /// ````
  TaxonomyPackaging call({
    List<String>? children,
    Map<OpenFoodFactsLanguage, String>? name,
    List<String>? parents,
    Map<OpenFoodFactsLanguage, List<String>>? synonyms,
    Map<OpenFoodFactsLanguage, String>? wikidata,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTaxonomyPackaging.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTaxonomyPackaging.copyWith.fieldName(...)`
class _$TaxonomyPackagingCWProxyImpl implements _$TaxonomyPackagingCWProxy {
  final TaxonomyPackaging _value;

  const _$TaxonomyPackagingCWProxyImpl(this._value);

  @override
  TaxonomyPackaging children(List<String>? children) =>
      this(children: children);

  @override
  TaxonomyPackaging name(Map<OpenFoodFactsLanguage, String>? name) =>
      this(name: name);

  @override
  TaxonomyPackaging parents(List<String>? parents) => this(parents: parents);

  @override
  TaxonomyPackaging synonyms(
          Map<OpenFoodFactsLanguage, List<String>>? synonyms) =>
      this(synonyms: synonyms);

  @override
  TaxonomyPackaging wikidata(Map<OpenFoodFactsLanguage, String>? wikidata) =>
      this(wikidata: wikidata);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TaxonomyPackaging(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TaxonomyPackaging(...).copyWith(id: 12, name: "My name")
  /// ````
  TaxonomyPackaging call({
    Object? children = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? parents = const $CopyWithPlaceholder(),
    Object? synonyms = const $CopyWithPlaceholder(),
    Object? wikidata = const $CopyWithPlaceholder(),
  }) {
    return TaxonomyPackaging(
      children: children == const $CopyWithPlaceholder()
          ? _value.children
          // ignore: cast_nullable_to_non_nullable
          : children as List<String>?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as Map<OpenFoodFactsLanguage, String>?,
      parents: parents == const $CopyWithPlaceholder()
          ? _value.parents
          // ignore: cast_nullable_to_non_nullable
          : parents as List<String>?,
      synonyms: synonyms == const $CopyWithPlaceholder()
          ? _value.synonyms
          // ignore: cast_nullable_to_non_nullable
          : synonyms as Map<OpenFoodFactsLanguage, List<String>>?,
      wikidata: wikidata == const $CopyWithPlaceholder()
          ? _value.wikidata
          // ignore: cast_nullable_to_non_nullable
          : wikidata as Map<OpenFoodFactsLanguage, String>?,
    );
  }
}

extension $TaxonomyPackagingCopyWith on TaxonomyPackaging {
  /// Returns a callable class that can be used as follows: `instanceOfTaxonomyPackaging.copyWith(...)` or like so:`instanceOfTaxonomyPackaging.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TaxonomyPackagingCWProxy get copyWith =>
      _$TaxonomyPackagingCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxonomyPackaging _$TaxonomyPackagingFromJson(Map<String, dynamic> json) =>
    TaxonomyPackaging(
      name: LanguageHelper.fromJsonStringMap(json['name']),
      synonyms: LanguageHelper.fromJsonStringsListMap(json['synonyms']),
      wikidata: LanguageHelper.fromJsonStringMap(json['wikidata']),
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      parents:
          (json['parents'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TaxonomyPackagingToJson(TaxonomyPackaging instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', LanguageHelper.toJsonStringMap(instance.name));
  writeNotNull(
      'synonyms', LanguageHelper.toJsonStringsListMap(instance.synonyms));
  writeNotNull('wikidata', LanguageHelper.toJsonStringMap(instance.wikidata));
  writeNotNull('children', instance.children);
  writeNotNull('parents', instance.parents);
  return val;
}
