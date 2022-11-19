// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaxonomyAllergen.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TaxonomyAllergenCWProxy {
  TaxonomyAllergen name(Map<OpenFoodFactsLanguage, String>? name);

  TaxonomyAllergen synonyms(Map<OpenFoodFactsLanguage, List<String>>? synonyms);

  TaxonomyAllergen wikidata(Map<OpenFoodFactsLanguage, String>? wikidata);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TaxonomyAllergen(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TaxonomyAllergen(...).copyWith(id: 12, name: "My name")
  /// ````
  TaxonomyAllergen call({
    Map<OpenFoodFactsLanguage, String>? name,
    Map<OpenFoodFactsLanguage, List<String>>? synonyms,
    Map<OpenFoodFactsLanguage, String>? wikidata,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTaxonomyAllergen.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTaxonomyAllergen.copyWith.fieldName(...)`
class _$TaxonomyAllergenCWProxyImpl implements _$TaxonomyAllergenCWProxy {
  final TaxonomyAllergen _value;

  const _$TaxonomyAllergenCWProxyImpl(this._value);

  @override
  TaxonomyAllergen name(Map<OpenFoodFactsLanguage, String>? name) =>
      this(name: name);

  @override
  TaxonomyAllergen synonyms(
          Map<OpenFoodFactsLanguage, List<String>>? synonyms) =>
      this(synonyms: synonyms);

  @override
  TaxonomyAllergen wikidata(Map<OpenFoodFactsLanguage, String>? wikidata) =>
      this(wikidata: wikidata);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TaxonomyAllergen(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TaxonomyAllergen(...).copyWith(id: 12, name: "My name")
  /// ````
  TaxonomyAllergen call({
    Object? name = const $CopyWithPlaceholder(),
    Object? synonyms = const $CopyWithPlaceholder(),
    Object? wikidata = const $CopyWithPlaceholder(),
  }) {
    return TaxonomyAllergen(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as Map<OpenFoodFactsLanguage, String>?,
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

extension $TaxonomyAllergenCopyWith on TaxonomyAllergen {
  /// Returns a callable class that can be used as follows: `instanceOfTaxonomyAllergen.copyWith(...)` or like so:`instanceOfTaxonomyAllergen.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TaxonomyAllergenCWProxy get copyWith => _$TaxonomyAllergenCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxonomyAllergen _$TaxonomyAllergenFromJson(Map<String, dynamic> json) =>
    TaxonomyAllergen(
      name: LanguageHelper.fromJsonStringMap(json['name']),
      synonyms: LanguageHelper.fromJsonStringsListMap(json['synonyms']),
      wikidata: LanguageHelper.fromJsonStringMap(json['wikidata']),
    );

Map<String, dynamic> _$TaxonomyAllergenToJson(TaxonomyAllergen instance) {
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
  return val;
}
