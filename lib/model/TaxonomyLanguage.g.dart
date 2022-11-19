// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaxonomyLanguage.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TaxonomyLanguageCWProxy {
  TaxonomyLanguage languageCode2(
      Map<OpenFoodFactsLanguage, String>? languageCode2);

  TaxonomyLanguage languageCode3(
      Map<OpenFoodFactsLanguage, String>? languageCode3);

  TaxonomyLanguage name(Map<OpenFoodFactsLanguage, String>? name);

  TaxonomyLanguage wikidata(Map<OpenFoodFactsLanguage, String>? wikidata);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TaxonomyLanguage(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TaxonomyLanguage(...).copyWith(id: 12, name: "My name")
  /// ````
  TaxonomyLanguage call({
    Map<OpenFoodFactsLanguage, String>? languageCode2,
    Map<OpenFoodFactsLanguage, String>? languageCode3,
    Map<OpenFoodFactsLanguage, String>? name,
    Map<OpenFoodFactsLanguage, String>? wikidata,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTaxonomyLanguage.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTaxonomyLanguage.copyWith.fieldName(...)`
class _$TaxonomyLanguageCWProxyImpl implements _$TaxonomyLanguageCWProxy {
  final TaxonomyLanguage _value;

  const _$TaxonomyLanguageCWProxyImpl(this._value);

  @override
  TaxonomyLanguage languageCode2(
          Map<OpenFoodFactsLanguage, String>? languageCode2) =>
      this(languageCode2: languageCode2);

  @override
  TaxonomyLanguage languageCode3(
          Map<OpenFoodFactsLanguage, String>? languageCode3) =>
      this(languageCode3: languageCode3);

  @override
  TaxonomyLanguage name(Map<OpenFoodFactsLanguage, String>? name) =>
      this(name: name);

  @override
  TaxonomyLanguage wikidata(Map<OpenFoodFactsLanguage, String>? wikidata) =>
      this(wikidata: wikidata);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TaxonomyLanguage(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TaxonomyLanguage(...).copyWith(id: 12, name: "My name")
  /// ````
  TaxonomyLanguage call({
    Object? languageCode2 = const $CopyWithPlaceholder(),
    Object? languageCode3 = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? wikidata = const $CopyWithPlaceholder(),
  }) {
    return TaxonomyLanguage(
      languageCode2: languageCode2 == const $CopyWithPlaceholder()
          ? _value.languageCode2
          // ignore: cast_nullable_to_non_nullable
          : languageCode2 as Map<OpenFoodFactsLanguage, String>?,
      languageCode3: languageCode3 == const $CopyWithPlaceholder()
          ? _value.languageCode3
          // ignore: cast_nullable_to_non_nullable
          : languageCode3 as Map<OpenFoodFactsLanguage, String>?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as Map<OpenFoodFactsLanguage, String>?,
      wikidata: wikidata == const $CopyWithPlaceholder()
          ? _value.wikidata
          // ignore: cast_nullable_to_non_nullable
          : wikidata as Map<OpenFoodFactsLanguage, String>?,
    );
  }
}

extension $TaxonomyLanguageCopyWith on TaxonomyLanguage {
  /// Returns a callable class that can be used as follows: `instanceOfTaxonomyLanguage.copyWith(...)` or like so:`instanceOfTaxonomyLanguage.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TaxonomyLanguageCWProxy get copyWith => _$TaxonomyLanguageCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxonomyLanguage _$TaxonomyLanguageFromJson(Map<String, dynamic> json) =>
    TaxonomyLanguage(
      languageCode2: LanguageHelper.fromJsonStringMap(json['language_code_2']),
      languageCode3: LanguageHelper.fromJsonStringMap(json['language_code_3']),
      name: LanguageHelper.fromJsonStringMap(json['name']),
      wikidata: LanguageHelper.fromJsonStringMap(json['wikidata']),
    );

Map<String, dynamic> _$TaxonomyLanguageToJson(TaxonomyLanguage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('language_code_2',
      LanguageHelper.toJsonStringMap(instance.languageCode2));
  writeNotNull('language_code_3',
      LanguageHelper.toJsonStringMap(instance.languageCode3));
  writeNotNull('name', LanguageHelper.toJsonStringMap(instance.name));
  writeNotNull('wikidata', LanguageHelper.toJsonStringMap(instance.wikidata));
  return val;
}
