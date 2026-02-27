import '../model/off_tagged.dart';

/// Available languages
enum OpenFoodFactsLanguage implements OffTagged {
  /// English
  ENGLISH(offTag: 'en'),

  /// Old Church Slavonic
  OLD_CHURCH_SLAVONIC(offTag: 'cu'),

  /// Dzongkha
  DZONGKHA_LANGUAGE(offTag: 'dz'),

  /// Japanese
  JAPANESE(offTag: 'ja'),

  /// Malay
  MALAY(offTag: 'ms'),

  /// Tagalog
  TAGALOG(offTag: 'tl'),

  /// Moldovan
  MOLDOVAN(offTag: 'mo'),

  /// Mongolian
  MONGOLIAN(offTag: 'mn'),

  /// Korean
  KOREAN(offTag: 'ko'),

  /// Luba-Katanga
  LUBA_KATANGA_LANGUAGE(offTag: 'lu'),

  /// Kazakh
  KAZAKH(offTag: 'kk'),

  /// Quechua
  QUECHUA_LANGUAGES(offTag: 'qu'),

  /// Ukrainian
  UKRAINIAN(offTag: 'uk'),

  /// Occitan
  OCCITAN(offTag: 'oc'),

  /// Bihari
  BIHARI_LANGUAGES(offTag: 'bh'),

  /// South Ndebele
  SOUTHERN_NDEBELE(offTag: 'nr'),

  /// Bokmal
  BOKMAL(offTag: 'nb'),

  /// Komi
  KOMI(offTag: 'kv'),

  /// Modern Greek
  MODERN_GREEK(offTag: 'el'),

  /// Fijian
  FIJIAN_LANGUAGE(offTag: 'fj'),

  /// Zulu
  ZULU(offTag: 'zu'),

  /// Ido
  IDO(offTag: 'io'),

  /// Khmer
  KHMER(offTag: 'km'),

  /// Sanskrit
  SANSKRIT(offTag: 'sa'),

  /// Macedonian
  MACEDONIAN(offTag: 'mk'),

  /// Sotho
  SOTHO(offTag: 'st'),

  /// Scottish Gaelic
  SCOTTISH_GAELIC(offTag: 'gd'),

  /// Marathi
  MARATHI(offTag: 'mr'),

  /// Nauruan
  NAURUAN(offTag: 'na'),

  /// Oromo
  OROMO(offTag: 'om'),

  /// Welsh
  WELSH(offTag: 'cy'),

  /// Vietnamese
  VIETNAMESE(offTag: 'vi'),

  /// Bislama
  BISLAMA(offTag: 'bi'),

  /// Somali
  SOMALI(offTag: 'so'),

  /// Lithuanian
  LITHUANIAN(offTag: 'lt'),

  /// Haitian Creole
  HAITIAN_CREOLE(offTag: 'ht'),

  /// Malagasy
  MALAGASY(offTag: 'mg'),

  /// Spanish
  SPANISH(offTag: 'es'),

  /// Danish
  DANISH(offTag: 'da'),

  /// Slovenian
  SLOVENE(offTag: 'sl'),

  /// Icelandic
  ICELANDIC(offTag: 'is'),

  /// Estonian
  ESTONIAN(offTag: 'et'),

  /// Wolof
  WOLOF(offTag: 'wo'),

  /// Hiri Motu
  HIRI_MOTU(offTag: 'ho'),

  /// Tamil
  TAMIL(offTag: 'ta'),

  /// Slovak
  SLOVAK(offTag: 'sk'),

  /// Herero
  HERERO(offTag: 'hz'),

  /// Italian
  ITALIAN(offTag: 'it'),

  /// Irish
  IRISH(offTag: 'ga'),

  /// Shona
  SHONA(offTag: 'sn'),

  /// Marshallese
  MARSHALLESE(offTag: 'mh'),

  /// French
  FRENCH(offTag: 'fr'),

  /// Aymara
  AYMARA(offTag: 'ay'),

  /// Hebrew
  HEBREW(offTag: 'he'),

  /// Northern Sami
  NORTHERN_SAMI(offTag: 'se'),

  /// Bengali
  BENGALI(offTag: 'bn'),

  /// Odia
  ODIA(offTag: 'or'),

  /// Malayalam
  MALAYALAM(offTag: 'ml'),

  /// Dutch
  DUTCH(offTag: 'nl'),

  /// Uyghur
  UYGHUR(offTag: 'ug'),

  /// Serbian
  SERBIAN(offTag: 'sr'),

  /// Tibetan
  TIBETAN_LANGUAGE(offTag: 'bo'),

  /// Belarusian
  BELARUSIAN(offTag: 'be'),

  /// Samoan
  SAMOAN(offTag: 'sm'),

  /// Punjabi
  PUNJABI(offTag: 'pa'),

  /// Russian
  RUSSIAN(offTag: 'ru'),

  /// Tahitian
  TAHITIAN(offTag: 'ty'),

  /// Interlingua
  INTERLINGUA(offTag: 'ia'),

  /// Afar
  AFAR(offTag: 'aa'),

  /// Greenlandic
  GREENLANDIC(offTag: 'kl'),

  /// Latin
  LATIN(offTag: 'la'),

  /// Chinese
  CHINESE(offTag: 'zh'),

  /// Turkmen
  TURKMEN(offTag: 'tk'),

  /// West Frisian
  WEST_FRISIAN(offTag: 'fy'),

  /// Tsonga
  TSONGA(offTag: 'ts'),

  /// Romansh
  ROMANSH(offTag: 'rm'),

  /// Inupiaq
  INUPIAT_LANGUAGE(offTag: 'ik'),

  /// Tajik
  TAJIK(offTag: 'tg'),

  /// Burmese
  BURMESE(offTag: 'my'),

  /// Javanese
  JAVANESE(offTag: 'jv'),

  /// Chechen
  CHECHEN(offTag: 'ce'),

  /// Assamese
  ASSAMESE(offTag: 'as'),

  /// Unknown language
  UNKNOWN_LANGUAGE(offTag: 'xx'),

  /// Arabic
  ARABIC(offTag: 'ar'),

  /// Kinyarmanda
  KINYARWANDA(offTag: 'rw'),

  /// Tonga
  TONGAN_LANGUAGE(offTag: 'to'),

  /// Church Slavonic
  // same as OLD_CHURCH_SLAVONIC
  CHURCH_SLAVONIC(offTag: 'cu'),

  /// Sinhala
  SINHALA(offTag: 'si'),

  /// Armenian
  ARMENIAN(offTag: 'hy'),

  /// Kurdish
  KURDISH(offTag: 'ku'),

  /// Thai
  THAI(offTag: 'th'),

  /// Cree
  CREE(offTag: 'cr'),

  /// Swahili
  SWAHILI(offTag: 'sw'),

  /// Gujarati
  GUJARATI(offTag: 'gu'),

  /// Persian
  PERSIAN(offTag: 'fa'),

  /// Bosnian
  BOSNIAN(offTag: 'bs'),

  /// Amharic
  AMHARIC(offTag: 'am'),

  /// Aragonese
  ARAGONESE(offTag: 'an'),

  /// Croatian
  CROATIAN(offTag: 'hr'),

  /// Chewa
  CHEWA(offTag: 'ny'),

  /// Zhuang
  ZHUANG_LANGUAGES(offTag: 'za'),

  /// Lingala
  LINGALA_LANGUAGE(offTag: 'ln'),

  /// Bambara
  BAMBARA(offTag: 'bm'),

  /// Limburgan
  LIMBURGISH_LANGUAGE(offTag: 'li'),

  /// Nuosu
  NUOSU_LANGUAGE(offTag: 'ii'),

  /// Kwanyama
  KWANYAMA(offTag: 'kj'),

  /// Kirundi
  KIRUNDI(offTag: 'rn'),

  /// Ewe
  EWE(offTag: 'ee'),

  /// Faorese
  FAROESE(offTag: 'fo'),

  /// Sindhi
  SINDHI(offTag: 'sd'),

  /// Corsican
  CORSICAN(offTag: 'co'),

  /// Kannada
  KANNADA(offTag: 'kn'),

  /// Norwegian
  NORWEGIAN(offTag: 'no'),

  /// Sundanese
  SUNDANESE_LANGUAGE(offTag: 'su'),

  /// Georgian
  GEORGIAN(offTag: 'ka'),

  /// Hausa
  HAUSA(offTag: 'ha'),

  /// Tswana
  TSWANA(offTag: 'tn'),

  /// Catalan
  CATALAN(offTag: 'ca'),

  /// Ndonga
  NDONGA_DIALECT(offTag: 'ng'),

  /// Igbo
  IGBO_LANGUAGE(offTag: 'ig'),

  /// Afrikaans
  AFRIKAANS(offTag: 'af'),

  /// Polish
  POLISH(offTag: 'pl'),

  /// Kashmiri
  KASHMIRI(offTag: 'ks'),

  /// Maori
  MAORI(offTag: 'mi'),

  /// Hungarian
  HUNGARIAN(offTag: 'hu'),

  /// Breton
  BRETON(offTag: 'br'),

  /// Portuguese
  PORTUGUESE(offTag: 'pt'),

  /// Bulgarian
  BULGARIAN(offTag: 'bg'),

  /// Avestan
  AVESTAN(offTag: 'ae'),

  /// Nepali
  NEPALI(offTag: 'ne'),

  /// Twi
  TWI(offTag: 'tw'),

  /// Uzbek
  UZBEK(offTag: 'uz'),

  /// Chamorro
  CHAMORRO(offTag: 'ch'),

  /// Guarani
  GUARANI(offTag: 'gn'),

  /// Nynorsk
  NYNORSK(offTag: 'nn'),

  /// Azerbaijani
  AZERBAIJANI(offTag: 'az'),

  /// Czech
  CZECH(offTag: 'cs'),

  /// Navajo
  NAVAJO(offTag: 'nv'),

  /// Finnish
  FINNISH(offTag: 'fi'),

  /// Luxembourgish
  LUXEMBOURGISH(offTag: 'lb'),

  /// Swedish
  SWEDISH(offTag: 'sv'),

  /// Yiddish
  YIDDISH(offTag: 'yi'),

  /// Inuktitut
  INUKTITUT(offTag: 'iu'),

  /// Lao
  LAO(offTag: 'lo'),

  /// Chuvash
  CHUVASH(offTag: 'cv'),

  /// Maltese
  MALTESE(offTag: 'mt'),

  /// Maldivian
  MALDIVIAN_LANGUAGE(offTag: 'dv'),

  /// Interlingue
  INTERLINGUE(offTag: 'ie'),

  /// Ossetian
  OSSETIAN(offTag: 'os'),

  /// Bashkir
  BASHKIR(offTag: 'ba'),

  /// Ojibwe
  OJIBWE(offTag: 'oj'),

  /// Kanuri
  KANURI(offTag: 'kr'),

  /// Indonesian
  INDONESIAN(offTag: 'id'),

  /// Sardinian
  SARDINIAN_LANGUAGE(offTag: 'sc'),

  /// Akan
  AKAN(offTag: 'ak'),

  /// Manx
  MANX(offTag: 'gv'),

  /// Turkish
  TURKISH(offTag: 'tr'),

  /// Esperanto
  ESPERANTO(offTag: 'eo'),

  /// Pashto
  PASHTO(offTag: 'ps'),

  /// Kyrgyz
  KYRGYZ(offTag: 'ky'),

  /// Volapuk
  VOLAPUK(offTag: 'vo'),

  /// Avar
  AVAR(offTag: 'av'),

  /// Sango
  SANGO(offTag: 'sg'),

  /// Venda
  VENDA(offTag: 've'),

  /// Albanian
  ALBANIAN(offTag: 'sq'),

  /// Basque
  BASQUE(offTag: 'eu'),

  /// Fulah
  FULA_LANGUAGE(offTag: 'ff'),

  /// German
  GERMAN(offTag: 'de'),

  /// Latvian
  LATVIAN(offTag: 'lv'),

  /// Cornish
  CORNISH(offTag: 'kw'),

  /// Pali
  PALI(offTag: 'pi'),

  /// Tatar
  TATAR(offTag: 'tt'),

  /// Romanian
  ROMANIAN(offTag: 'ro'),

  /// Gikuyu
  GIKUYU(offTag: 'ki'),

  /// Tigrinya
  TIGRINYA(offTag: 'ti'),

  /// Galician
  GALICIAN(offTag: 'gl'),

  /// Telugu
  TELUGU(offTag: 'te'),

  /// Hindi
  HINDI(offTag: 'hi'),

  /// Kongo
  KONGO_LANGUAGE(offTag: 'kg'),

  /// Xhosa
  XHOSA(offTag: 'xh'),

  /// Swazi
  SWAZI(offTag: 'ss'),

  /// Luganda
  LUGANDA(offTag: 'lg'),

  /// Urdu
  URDU(offTag: 'ur'),

  /// North Ndbele
  NORTHERN_NDEBELE_LANGUAGE(offTag: 'nd'),

  /// Yoruba
  YORUBA(offTag: 'yo'),

  /// World, as pseudo language
  WORLD(offTag: 'world'),

  /// Undefined language
  UNDEFINED(offTag: '-');

  const OpenFoodFactsLanguage({required this.offTag});

  /// ISO 639-1
  @override
  final String offTag;

  /// Returns the first [OpenFoodFactsLanguage] that matches the [offTag].
  static OpenFoodFactsLanguage? fromOffTag(final String? offTag) =>
      OffTagged.fromOffTag(offTag, OpenFoodFactsLanguage.values)
          as OpenFoodFactsLanguage?;
}

extension OpenFoodFactsLanguageExtension on OpenFoodFactsLanguage? {
  /// Returns the corresponding ISO-639-1 code
  ///
  /// Won't return 2 characters for special cases like
  /// * [OpenFoodFactsLanguage.WORLD]
  /// * [OpenFoodFactsLanguage.UNDEFINED]
  String get code => this?.offTag ?? '-';
}

/// Helper class around [OpenFoodFactsLanguage]
class LanguageHelper {
  /// Converts an [OpenFoodFactsLanguage] into an ISO-639-1 code
  static String toJson(OpenFoodFactsLanguage? language) => language.code;

  /// Converts an ISO-639-1 code into an [OpenFoodFactsLanguage]
  static OpenFoodFactsLanguage fromJson(String? code) =>
      OpenFoodFactsLanguage.fromOffTag(code) ?? OpenFoodFactsLanguage.UNDEFINED;

  /// Converts an [OpenFoodFactsLanguage] into an ISO-639-1 code, or null.
  static String? toNullableJson(OpenFoodFactsLanguage? language) =>
      language?.offTag;

  /// Converts an ISO-639-1 code into an [OpenFoodFactsLanguage], or null.
  static OpenFoodFactsLanguage? fromNullableJson(String? code) =>
      OpenFoodFactsLanguage.fromOffTag(code);

  /// Converts a Map with [OpenFoodFactsLanguage] into
  /// a map with ISO-639-1 codes.
  static Map<String, T>? toJsonMap<T>(Map<OpenFoodFactsLanguage, T>? map) {
    if (map == null) {
      return null;
    }
    return map.map((key, value) => MapEntry(key.offTag, value));
  }

  /// Helper function without generic types. Needed for the
  /// `@JsonKey` annotation (the annotation can't work with generics).
  static Map<String, String>? toJsonStringMap(
    Map<OpenFoodFactsLanguage, String>? map,
  ) {
    return toJsonMap(map);
  }

  /// From a `Map<String, String>` in `dynamic`'s clothing (JsonKey annotation)
  static Map<OpenFoodFactsLanguage, String>? fromJsonStringMap(dynamic map) {
    if (map == null) {
      return null;
    }
    if (map is! Map<String, dynamic>) {
      throw Exception('Expected type: Map<String, String>');
    }
    final result = <OpenFoodFactsLanguage, String>{};
    for (final key in map.keys) {
      result[LanguageHelper.fromJson(key)] = map[key]! as String;
    }
    return result;
  }

  /// From a `Map<String, String>` in `dynamic`'s clothing (JsonKey annotation)
  static Map<OpenFoodFactsLanguage, List<String>>? fromJsonStringMapList(
    dynamic map,
  ) {
    if (map == null) {
      return null;
    }
    if (map is! Map<String, dynamic>) {
      throw Exception('Expected type: Map<String, List<String>>: $map');
    }
    final result = <OpenFoodFactsLanguage, List<String>>{};
    for (final key in map.keys) {
      final List<String> list = <String>[];
      for (final item in map[key]! as List<dynamic>) {
        list.add(item as String);
      }
      result[LanguageHelper.fromJson(key)] = list;
    }
    return result;
  }

  /// Special case for ISO codes that should be unique for all languages.
  ///
  /// e.g. "country_code_2": {"en": "BY"} will return 'BY'.
  /// From a `Map<String, String>` in `dynamic`'s clothing (JsonKey annotation)
  static String? fromJsonStringMapIsoUnique(dynamic map) {
    if (map == null) {
      return null;
    }
    if (map is! Map<String, dynamic>) {
      throw Exception('Expected type: Map<String, String>');
    }
    for (final value in map.values) {
      return value! as String;
    }
    return null;
  }

  /// Special case for ISO codes that should be unique for all languages.
  ///
  /// e.g. "language_codes": {"en":"nl,fr"} will return
  /// e.g. `[OpenFoodFactsLanguage.DUTCH`, `OpenFoodFactsLanguage.FRENCH]`
  /// From a `Map<String, String>` in `dynamic`'s clothing (JsonKey annotation)
  static List<OpenFoodFactsLanguage>? fromJsonStringMapIsoList(dynamic map) {
    if (map == null) {
      return null;
    }
    if (map is! Map<String, dynamic>) {
      throw Exception('Expected type: Map<String, String>');
    }
    final result = <OpenFoodFactsLanguage>[];
    for (final value in map.values) {
      final String list = value! as String;
      if (list.isEmpty) {
        continue;
      }
      final List<String> languages = list.split(',');
      for (final String language in languages) {
        result.add(LanguageHelper.fromJson(language));
      }
    }
    return result;
  }

  /// Helper function without generic types. Needed for the
  /// `@JsonKey` annotation (the annotation can't work with generics).
  static Map<String, List<String>>? toJsonStringsListMap(
    Map<OpenFoodFactsLanguage, List<String>>? map,
  ) {
    return toJsonMap(map);
  }

  /// From a `Map<String, List<String>>` in `dynamic`'s clothing (JsonKey)
  static Map<OpenFoodFactsLanguage, List<String>>? fromJsonStringsListMap(
    dynamic map,
  ) {
    if (map == null) {
      return null;
    }
    if (map is! Map<String, dynamic>) {
      throw Exception(
        'Expected type: Map<String, List<String>>, got ${map.runtimeType}',
      );
    }
    final result = <OpenFoodFactsLanguage, List<String>>{};
    for (final key in map.keys) {
      result[LanguageHelper.fromJson(key)] = map[key]!.cast<String>();
    }
    return result;
  }
}
