// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaxonomyCountry.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TaxonomyCountryCWProxy {
  TaxonomyCountry countryCode2(String? countryCode2);

  TaxonomyCountry countryCode3(String? countryCode3);

  TaxonomyCountry languages(List<OpenFoodFactsLanguage>? languages);

  TaxonomyCountry name(Map<OpenFoodFactsLanguage, String>? name);

  TaxonomyCountry officialCountryCode2(String? officialCountryCode2);

  TaxonomyCountry synonyms(Map<OpenFoodFactsLanguage, List<String>>? synonyms);

  TaxonomyCountry wikidata(String? wikidata);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TaxonomyCountry(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TaxonomyCountry(...).copyWith(id: 12, name: "My name")
  /// ````
  TaxonomyCountry call({
    String? countryCode2,
    String? countryCode3,
    List<OpenFoodFactsLanguage>? languages,
    Map<OpenFoodFactsLanguage, String>? name,
    String? officialCountryCode2,
    Map<OpenFoodFactsLanguage, List<String>>? synonyms,
    String? wikidata,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTaxonomyCountry.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTaxonomyCountry.copyWith.fieldName(...)`
class _$TaxonomyCountryCWProxyImpl implements _$TaxonomyCountryCWProxy {
  final TaxonomyCountry _value;

  const _$TaxonomyCountryCWProxyImpl(this._value);

  @override
  TaxonomyCountry countryCode2(String? countryCode2) =>
      this(countryCode2: countryCode2);

  @override
  TaxonomyCountry countryCode3(String? countryCode3) =>
      this(countryCode3: countryCode3);

  @override
  TaxonomyCountry languages(List<OpenFoodFactsLanguage>? languages) =>
      this(languages: languages);

  @override
  TaxonomyCountry name(Map<OpenFoodFactsLanguage, String>? name) =>
      this(name: name);

  @override
  TaxonomyCountry officialCountryCode2(String? officialCountryCode2) =>
      this(officialCountryCode2: officialCountryCode2);

  @override
  TaxonomyCountry synonyms(
          Map<OpenFoodFactsLanguage, List<String>>? synonyms) =>
      this(synonyms: synonyms);

  @override
  TaxonomyCountry wikidata(String? wikidata) => this(wikidata: wikidata);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TaxonomyCountry(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TaxonomyCountry(...).copyWith(id: 12, name: "My name")
  /// ````
  TaxonomyCountry call({
    Object? countryCode2 = const $CopyWithPlaceholder(),
    Object? countryCode3 = const $CopyWithPlaceholder(),
    Object? languages = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? officialCountryCode2 = const $CopyWithPlaceholder(),
    Object? synonyms = const $CopyWithPlaceholder(),
    Object? wikidata = const $CopyWithPlaceholder(),
  }) {
    return TaxonomyCountry(
      countryCode2: countryCode2 == const $CopyWithPlaceholder()
          ? _value.countryCode2
          // ignore: cast_nullable_to_non_nullable
          : countryCode2 as String?,
      countryCode3: countryCode3 == const $CopyWithPlaceholder()
          ? _value.countryCode3
          // ignore: cast_nullable_to_non_nullable
          : countryCode3 as String?,
      languages: languages == const $CopyWithPlaceholder()
          ? _value.languages
          // ignore: cast_nullable_to_non_nullable
          : languages as List<OpenFoodFactsLanguage>?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as Map<OpenFoodFactsLanguage, String>?,
      officialCountryCode2: officialCountryCode2 == const $CopyWithPlaceholder()
          ? _value.officialCountryCode2
          // ignore: cast_nullable_to_non_nullable
          : officialCountryCode2 as String?,
      synonyms: synonyms == const $CopyWithPlaceholder()
          ? _value.synonyms
          // ignore: cast_nullable_to_non_nullable
          : synonyms as Map<OpenFoodFactsLanguage, List<String>>?,
      wikidata: wikidata == const $CopyWithPlaceholder()
          ? _value.wikidata
          // ignore: cast_nullable_to_non_nullable
          : wikidata as String?,
    );
  }
}

extension $TaxonomyCountryCopyWith on TaxonomyCountry {
  /// Returns a callable class that can be used as follows: `instanceOfTaxonomyCountry.copyWith(...)` or like so:`instanceOfTaxonomyCountry.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TaxonomyCountryCWProxy get copyWith => _$TaxonomyCountryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxonomyCountry _$TaxonomyCountryFromJson(Map<String, dynamic> json) =>
    TaxonomyCountry(
      countryCode2:
          LanguageHelper.fromJsonStringMapIsoUnique(json['country_code_2']),
      countryCode3:
          LanguageHelper.fromJsonStringMapIsoUnique(json['country_code_3']),
      languages:
          LanguageHelper.fromJsonStringMapIsoList(json['language_codes']),
      name: LanguageHelper.fromJsonStringMap(json['name']),
      synonyms: LanguageHelper.fromJsonStringMapList(json['synonyms']),
      wikidata: LanguageHelper.fromJsonStringMapIsoUnique(json['wikidata']),
      officialCountryCode2: LanguageHelper.fromJsonStringMapIsoUnique(
          json['official_country_code_2']),
    );

Map<String, dynamic> _$TaxonomyCountryToJson(TaxonomyCountry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('country_code_2', instance.countryCode2);
  writeNotNull('country_code_3', instance.countryCode3);
  writeNotNull(
      'language_codes',
      instance.languages
          ?.map((e) => _$OpenFoodFactsLanguageEnumMap[e]!)
          .toList());
  writeNotNull(
      'name',
      instance.name
          ?.map((k, e) => MapEntry(_$OpenFoodFactsLanguageEnumMap[k]!, e)));
  writeNotNull(
      'synonyms',
      instance.synonyms
          ?.map((k, e) => MapEntry(_$OpenFoodFactsLanguageEnumMap[k]!, e)));
  writeNotNull('wikidata', instance.wikidata);
  writeNotNull('official_country_code_2', instance.officialCountryCode2);
  return val;
}

const _$OpenFoodFactsLanguageEnumMap = {
  OpenFoodFactsLanguage.ENGLISH: 'ENGLISH',
  OpenFoodFactsLanguage.OLD_CHURCH_SLAVONIC: 'OLD_CHURCH_SLAVONIC',
  OpenFoodFactsLanguage.DZONGKHA_LANGUAGE: 'DZONGKHA_LANGUAGE',
  OpenFoodFactsLanguage.JAPANESE: 'JAPANESE',
  OpenFoodFactsLanguage.MALAY: 'MALAY',
  OpenFoodFactsLanguage.TAGALOG: 'TAGALOG',
  OpenFoodFactsLanguage.MOLDOVAN: 'MOLDOVAN',
  OpenFoodFactsLanguage.MONGOLIAN: 'MONGOLIAN',
  OpenFoodFactsLanguage.KOREAN: 'KOREAN',
  OpenFoodFactsLanguage.LUBA_KATANGA_LANGUAGE: 'LUBA_KATANGA_LANGUAGE',
  OpenFoodFactsLanguage.KAZAKH: 'KAZAKH',
  OpenFoodFactsLanguage.QUECHUA_LANGUAGES: 'QUECHUA_LANGUAGES',
  OpenFoodFactsLanguage.UKRAINIAN: 'UKRAINIAN',
  OpenFoodFactsLanguage.OCCITAN: 'OCCITAN',
  OpenFoodFactsLanguage.BIHARI_LANGUAGES: 'BIHARI_LANGUAGES',
  OpenFoodFactsLanguage.SOUTHERN_NDEBELE: 'SOUTHERN_NDEBELE',
  OpenFoodFactsLanguage.BOKMAL: 'BOKMAL',
  OpenFoodFactsLanguage.KOMI: 'KOMI',
  OpenFoodFactsLanguage.MODERN_GREEK: 'MODERN_GREEK',
  OpenFoodFactsLanguage.FIJIAN_LANGUAGE: 'FIJIAN_LANGUAGE',
  OpenFoodFactsLanguage.ZULU: 'ZULU',
  OpenFoodFactsLanguage.IDO: 'IDO',
  OpenFoodFactsLanguage.KHMER: 'KHMER',
  OpenFoodFactsLanguage.SANSKRIT: 'SANSKRIT',
  OpenFoodFactsLanguage.MACEDONIAN: 'MACEDONIAN',
  OpenFoodFactsLanguage.SOTHO: 'SOTHO',
  OpenFoodFactsLanguage.SCOTTISH_GAELIC: 'SCOTTISH_GAELIC',
  OpenFoodFactsLanguage.MARATHI: 'MARATHI',
  OpenFoodFactsLanguage.NAURUAN: 'NAURUAN',
  OpenFoodFactsLanguage.OROMO: 'OROMO',
  OpenFoodFactsLanguage.WELSH: 'WELSH',
  OpenFoodFactsLanguage.VIETNAMESE: 'VIETNAMESE',
  OpenFoodFactsLanguage.BISLAMA: 'BISLAMA',
  OpenFoodFactsLanguage.SOMALI: 'SOMALI',
  OpenFoodFactsLanguage.LITHUANIAN: 'LITHUANIAN',
  OpenFoodFactsLanguage.HAITIAN_CREOLE: 'HAITIAN_CREOLE',
  OpenFoodFactsLanguage.MALAGASY: 'MALAGASY',
  OpenFoodFactsLanguage.SPANISH: 'SPANISH',
  OpenFoodFactsLanguage.DANISH: 'DANISH',
  OpenFoodFactsLanguage.SLOVENE: 'SLOVENE',
  OpenFoodFactsLanguage.ICELANDIC: 'ICELANDIC',
  OpenFoodFactsLanguage.ESTONIAN: 'ESTONIAN',
  OpenFoodFactsLanguage.WOLOF: 'WOLOF',
  OpenFoodFactsLanguage.HIRI_MOTU: 'HIRI_MOTU',
  OpenFoodFactsLanguage.TAMIL: 'TAMIL',
  OpenFoodFactsLanguage.SLOVAK: 'SLOVAK',
  OpenFoodFactsLanguage.HERERO: 'HERERO',
  OpenFoodFactsLanguage.ITALIAN: 'ITALIAN',
  OpenFoodFactsLanguage.IRISH: 'IRISH',
  OpenFoodFactsLanguage.SHONA: 'SHONA',
  OpenFoodFactsLanguage.MARSHALLESE: 'MARSHALLESE',
  OpenFoodFactsLanguage.FRENCH: 'FRENCH',
  OpenFoodFactsLanguage.AYMARA: 'AYMARA',
  OpenFoodFactsLanguage.HEBREW: 'HEBREW',
  OpenFoodFactsLanguage.NORTHERN_SAMI: 'NORTHERN_SAMI',
  OpenFoodFactsLanguage.BENGALI: 'BENGALI',
  OpenFoodFactsLanguage.ODIA: 'ODIA',
  OpenFoodFactsLanguage.MALAYALAM: 'MALAYALAM',
  OpenFoodFactsLanguage.DUTCH: 'DUTCH',
  OpenFoodFactsLanguage.UYGHUR: 'UYGHUR',
  OpenFoodFactsLanguage.SERBIAN: 'SERBIAN',
  OpenFoodFactsLanguage.TIBETAN_LANGUAGE: 'TIBETAN_LANGUAGE',
  OpenFoodFactsLanguage.BELARUSIAN: 'BELARUSIAN',
  OpenFoodFactsLanguage.SAMOAN: 'SAMOAN',
  OpenFoodFactsLanguage.PUNJABI: 'PUNJABI',
  OpenFoodFactsLanguage.RUSSIAN: 'RUSSIAN',
  OpenFoodFactsLanguage.TAHITIAN: 'TAHITIAN',
  OpenFoodFactsLanguage.INTERLINGUA: 'INTERLINGUA',
  OpenFoodFactsLanguage.AFAR: 'AFAR',
  OpenFoodFactsLanguage.GREENLANDIC: 'GREENLANDIC',
  OpenFoodFactsLanguage.LATIN: 'LATIN',
  OpenFoodFactsLanguage.CHINESE: 'CHINESE',
  OpenFoodFactsLanguage.TURKMEN: 'TURKMEN',
  OpenFoodFactsLanguage.WEST_FRISIAN: 'WEST_FRISIAN',
  OpenFoodFactsLanguage.TSONGA: 'TSONGA',
  OpenFoodFactsLanguage.ROMANSH: 'ROMANSH',
  OpenFoodFactsLanguage.INUPIAT_LANGUAGE: 'INUPIAT_LANGUAGE',
  OpenFoodFactsLanguage.TAJIK: 'TAJIK',
  OpenFoodFactsLanguage.BURMESE: 'BURMESE',
  OpenFoodFactsLanguage.JAVANESE: 'JAVANESE',
  OpenFoodFactsLanguage.CHECHEN: 'CHECHEN',
  OpenFoodFactsLanguage.ASSAMESE: 'ASSAMESE',
  OpenFoodFactsLanguage.UNKNOWN_LANGUAGE: 'UNKNOWN_LANGUAGE',
  OpenFoodFactsLanguage.ARABIC: 'ARABIC',
  OpenFoodFactsLanguage.KINYARWANDA: 'KINYARWANDA',
  OpenFoodFactsLanguage.TONGAN_LANGUAGE: 'TONGAN_LANGUAGE',
  OpenFoodFactsLanguage.CHURCH_SLAVONIC: 'CHURCH_SLAVONIC',
  OpenFoodFactsLanguage.SINHALA: 'SINHALA',
  OpenFoodFactsLanguage.ARMENIAN: 'ARMENIAN',
  OpenFoodFactsLanguage.KURDISH: 'KURDISH',
  OpenFoodFactsLanguage.THAI: 'THAI',
  OpenFoodFactsLanguage.CREE: 'CREE',
  OpenFoodFactsLanguage.SWAHILI: 'SWAHILI',
  OpenFoodFactsLanguage.GUJARATI: 'GUJARATI',
  OpenFoodFactsLanguage.PERSIAN: 'PERSIAN',
  OpenFoodFactsLanguage.BOSNIAN: 'BOSNIAN',
  OpenFoodFactsLanguage.AMHARIC: 'AMHARIC',
  OpenFoodFactsLanguage.ARAGONESE: 'ARAGONESE',
  OpenFoodFactsLanguage.CROATIAN: 'CROATIAN',
  OpenFoodFactsLanguage.CHEWA: 'CHEWA',
  OpenFoodFactsLanguage.ZHUANG_LANGUAGES: 'ZHUANG_LANGUAGES',
  OpenFoodFactsLanguage.LINGALA_LANGUAGE: 'LINGALA_LANGUAGE',
  OpenFoodFactsLanguage.BAMBARA: 'BAMBARA',
  OpenFoodFactsLanguage.LIMBURGISH_LANGUAGE: 'LIMBURGISH_LANGUAGE',
  OpenFoodFactsLanguage.NUOSU_LANGUAGE: 'NUOSU_LANGUAGE',
  OpenFoodFactsLanguage.KWANYAMA: 'KWANYAMA',
  OpenFoodFactsLanguage.KIRUNDI: 'KIRUNDI',
  OpenFoodFactsLanguage.EWE: 'EWE',
  OpenFoodFactsLanguage.FAROESE: 'FAROESE',
  OpenFoodFactsLanguage.SINDHI: 'SINDHI',
  OpenFoodFactsLanguage.CORSICAN: 'CORSICAN',
  OpenFoodFactsLanguage.KANNADA: 'KANNADA',
  OpenFoodFactsLanguage.NORWEGIAN: 'NORWEGIAN',
  OpenFoodFactsLanguage.SUNDANESE_LANGUAGE: 'SUNDANESE_LANGUAGE',
  OpenFoodFactsLanguage.GEORGIAN: 'GEORGIAN',
  OpenFoodFactsLanguage.HAUSA: 'HAUSA',
  OpenFoodFactsLanguage.TSWANA: 'TSWANA',
  OpenFoodFactsLanguage.CATALAN: 'CATALAN',
  OpenFoodFactsLanguage.NDONGA_DIALECT: 'NDONGA_DIALECT',
  OpenFoodFactsLanguage.IGBO_LANGUAGE: 'IGBO_LANGUAGE',
  OpenFoodFactsLanguage.AFRIKAANS: 'AFRIKAANS',
  OpenFoodFactsLanguage.POLISH: 'POLISH',
  OpenFoodFactsLanguage.KASHMIRI: 'KASHMIRI',
  OpenFoodFactsLanguage.MAORI: 'MAORI',
  OpenFoodFactsLanguage.HUNGARIAN: 'HUNGARIAN',
  OpenFoodFactsLanguage.BRETON: 'BRETON',
  OpenFoodFactsLanguage.PORTUGUESE: 'PORTUGUESE',
  OpenFoodFactsLanguage.BULGARIAN: 'BULGARIAN',
  OpenFoodFactsLanguage.AVESTAN: 'AVESTAN',
  OpenFoodFactsLanguage.NEPALI: 'NEPALI',
  OpenFoodFactsLanguage.TWI: 'TWI',
  OpenFoodFactsLanguage.UZBEK: 'UZBEK',
  OpenFoodFactsLanguage.CHAMORRO: 'CHAMORRO',
  OpenFoodFactsLanguage.GUARANI: 'GUARANI',
  OpenFoodFactsLanguage.NYNORSK: 'NYNORSK',
  OpenFoodFactsLanguage.AZERBAIJANI: 'AZERBAIJANI',
  OpenFoodFactsLanguage.CZECH: 'CZECH',
  OpenFoodFactsLanguage.NAVAJO: 'NAVAJO',
  OpenFoodFactsLanguage.FINNISH: 'FINNISH',
  OpenFoodFactsLanguage.LUXEMBOURGISH: 'LUXEMBOURGISH',
  OpenFoodFactsLanguage.SWEDISH: 'SWEDISH',
  OpenFoodFactsLanguage.YIDDISH: 'YIDDISH',
  OpenFoodFactsLanguage.INUKTITUT: 'INUKTITUT',
  OpenFoodFactsLanguage.LAO: 'LAO',
  OpenFoodFactsLanguage.CHUVASH: 'CHUVASH',
  OpenFoodFactsLanguage.MALTESE: 'MALTESE',
  OpenFoodFactsLanguage.MALDIVIAN_LANGUAGE: 'MALDIVIAN_LANGUAGE',
  OpenFoodFactsLanguage.INTERLINGUE: 'INTERLINGUE',
  OpenFoodFactsLanguage.OSSETIAN: 'OSSETIAN',
  OpenFoodFactsLanguage.BASHKIR: 'BASHKIR',
  OpenFoodFactsLanguage.OJIBWE: 'OJIBWE',
  OpenFoodFactsLanguage.KANURI: 'KANURI',
  OpenFoodFactsLanguage.INDONESIAN: 'INDONESIAN',
  OpenFoodFactsLanguage.SARDINIAN_LANGUAGE: 'SARDINIAN_LANGUAGE',
  OpenFoodFactsLanguage.AKAN: 'AKAN',
  OpenFoodFactsLanguage.MANX: 'MANX',
  OpenFoodFactsLanguage.TURKISH: 'TURKISH',
  OpenFoodFactsLanguage.ESPERANTO: 'ESPERANTO',
  OpenFoodFactsLanguage.PASHTO: 'PASHTO',
  OpenFoodFactsLanguage.KYRGYZ: 'KYRGYZ',
  OpenFoodFactsLanguage.VOLAPUK: 'VOLAPUK',
  OpenFoodFactsLanguage.AVAR: 'AVAR',
  OpenFoodFactsLanguage.SANGO: 'SANGO',
  OpenFoodFactsLanguage.VENDA: 'VENDA',
  OpenFoodFactsLanguage.ALBANIAN: 'ALBANIAN',
  OpenFoodFactsLanguage.BASQUE: 'BASQUE',
  OpenFoodFactsLanguage.FULA_LANGUAGE: 'FULA_LANGUAGE',
  OpenFoodFactsLanguage.GERMAN: 'GERMAN',
  OpenFoodFactsLanguage.LATVIAN: 'LATVIAN',
  OpenFoodFactsLanguage.CORNISH: 'CORNISH',
  OpenFoodFactsLanguage.PALI: 'PALI',
  OpenFoodFactsLanguage.TATAR: 'TATAR',
  OpenFoodFactsLanguage.ROMANIAN: 'ROMANIAN',
  OpenFoodFactsLanguage.GIKUYU: 'GIKUYU',
  OpenFoodFactsLanguage.TIGRINYA: 'TIGRINYA',
  OpenFoodFactsLanguage.GALICIAN: 'GALICIAN',
  OpenFoodFactsLanguage.TELUGU: 'TELUGU',
  OpenFoodFactsLanguage.HINDI: 'HINDI',
  OpenFoodFactsLanguage.KONGO_LANGUAGE: 'KONGO_LANGUAGE',
  OpenFoodFactsLanguage.XHOSA: 'XHOSA',
  OpenFoodFactsLanguage.SWAZI: 'SWAZI',
  OpenFoodFactsLanguage.LUGANDA: 'LUGANDA',
  OpenFoodFactsLanguage.URDU: 'URDU',
  OpenFoodFactsLanguage.NORTHERN_NDEBELE_LANGUAGE: 'NORTHERN_NDEBELE_LANGUAGE',
  OpenFoodFactsLanguage.YORUBA: 'YORUBA',
  OpenFoodFactsLanguage.WORLD: 'WORLD',
  OpenFoodFactsLanguage.UNDEFINED: 'UNDEFINED',
};
