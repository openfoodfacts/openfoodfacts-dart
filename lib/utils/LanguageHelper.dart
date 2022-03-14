/// Available languages
enum OpenFoodFactsLanguage {
  /// English
  ENGLISH,

  /// Old Church Slavonic
  OLD_CHURCH_SLAVONIC,

  /// Dzongkha
  DZONGKHA_LANGUAGE,

  /// Japanese
  JAPANESE,

  /// Malay
  MALAY,

  /// Tagalog
  TAGALOG,

  /// Moldovan
  MOLDOVAN,

  /// Mongolian
  MONGOLIAN,

  /// Korean
  KOREAN,

  /// Luba-Katanga
  LUBA_KATANGA_LANGUAGE,

  /// Kazakh
  KAZAKH,

  /// Quechua
  QUECHUA_LANGUAGES,

  /// Ukrainian
  UKRAINIAN,

  /// Occitan
  OCCITAN,

  /// Bihari
  BIHARI_LANGUAGES,

  /// South Ndebele
  SOUTHERN_NDEBELE,

  /// Bokmal
  BOKMAL,

  /// Komi
  KOMI,

  /// Modern Greek
  MODERN_GREEK,

  /// Fijian
  FIJIAN_LANGUAGE,

  /// Zulu
  ZULU,

  /// Ido
  IDO,

  /// Khmer
  KHMER,

  /// Sanskrit
  SANSKRIT,

  /// Macedonian
  MACEDONIAN,

  /// Sotho
  SOTHO,

  /// Scottish Gaelic
  SCOTTISH_GAELIC,

  /// Marathi
  MARATHI,

  /// Nauruan
  NAURUAN,

  /// Oromo
  OROMO,

  /// Welsh
  WELSH,

  /// Vietnamese
  VIETNAMESE,

  /// Bislama
  BISLAMA,

  /// Somali
  SOMALI,

  /// Lithuanian
  LITHUANIAN,

  /// Haitian Creole
  HAITIAN_CREOLE,

  /// Malagasy
  MALAGASY,

  /// Spanish
  SPANISH,

  /// Danish
  DANISH,

  /// Slovenian
  SLOVENE,

  /// Icelandic
  ICELANDIC,

  /// Estonian
  ESTONIAN,

  /// Wolof
  WOLOF,

  /// Hiri Motu
  HIRI_MOTU,

  /// Tamil
  TAMIL,

  /// Slovak
  SLOVAK,

  /// Herero
  HERERO,

  /// Italian
  ITALIAN,

  /// Irish
  IRISH,

  /// Shona
  SHONA,

  /// Marshallese
  MARSHALLESE,

  /// French
  FRENCH,

  /// Aymara
  AYMARA,

  /// Hebrew
  HEBREW,

  /// Northern Sami
  NORTHERN_SAMI,

  /// Bengali
  BENGALI,

  /// Odia
  ODIA,

  /// Malayalam
  MALAYALAM,

  /// Dutch
  DUTCH,

  /// Uyghur
  UYGHUR,

  /// Serbian
  SERBIAN,

  /// Tibetan
  TIBETAN_LANGUAGE,

  /// Belarusian
  BELARUSIAN,

  /// Samoan
  SAMOAN,

  /// Punjabi
  PUNJABI,

  /// Russian
  RUSSIAN,

  /// Tahitian
  TAHITIAN,

  /// Interlingua
  INTERLINGUA,

  /// Afar
  AFAR,

  /// Greenlandic
  GREENLANDIC,

  /// Latin
  LATIN,

  /// Chinese
  CHINESE,

  /// Turkmen
  TURKMEN,

  /// West Frisian
  WEST_FRISIAN,

  /// Tsonga
  TSONGA,

  /// Romansh
  ROMANSH,

  /// Inupiaq
  INUPIAT_LANGUAGE,

  /// Tajik
  TAJIK,

  /// Burmese
  BURMESE,

  /// Javanese
  JAVANESE,

  /// Chechen
  CHECHEN,

  /// Assamese
  ASSAMESE,

  /// Unknown language
  UNKNOWN_LANGUAGE,

  /// Arabic
  ARABIC,

  /// Kinyarmanda
  KINYARWANDA,

  /// Tonga
  TONGAN_LANGUAGE,

  /// Church Slavonic
  CHURCH_SLAVONIC,

  /// Sinhala
  SINHALA,

  /// Armenian
  ARMENIAN,

  /// Kurdish
  KURDISH,

  /// Thai
  THAI,

  /// Cree
  CREE,

  /// Swahili
  SWAHILI,

  /// Gujarati
  GUJARATI,

  /// Persian
  PERSIAN,

  /// Bosnian
  BOSNIAN,

  /// Amharic
  AMHARIC,

  /// Aragonese
  ARAGONESE,

  /// Croatian
  CROATIAN,

  /// Chewa
  CHEWA,

  /// Zhuang
  ZHUANG_LANGUAGES,

  /// Lingala
  LINGALA_LANGUAGE,

  /// Bambara
  BAMBARA,

  /// Limburgan
  LIMBURGISH_LANGUAGE,

  /// Nuosu
  NUOSU_LANGUAGE,

  /// Kwanyama
  KWANYAMA,

  /// Kirundi
  KIRUNDI,

  /// Ewe
  EWE,

  /// Faorese
  FAROESE,

  /// Sindhi
  SINDHI,

  /// Corsican
  CORSICAN,

  /// Kannada
  KANNADA,

  /// Norwegian
  NORWEGIAN,

  /// Sundanese
  SUNDANESE_LANGUAGE,

  /// Georgian
  GEORGIAN,

  /// Hausa
  HAUSA,

  /// Tswana
  TSWANA,

  /// Catalan
  CATALAN,

  /// Ndonga
  NDONGA_DIALECT,

  /// Igbo
  IGBO_LANGUAGE,

  /// Afrikaans
  AFRIKAANS,

  /// Polish
  POLISH,

  /// Kashmiri
  KASHMIRI,

  /// Maori
  MAORI,

  /// Hungarian
  HUNGARIAN,

  /// Breton
  BRETON,

  /// Portuguese
  PORTUGUESE,

  /// Bulgarian
  BULGARIAN,

  /// Avestan
  AVESTAN,

  /// Nepali
  NEPALI,

  /// Twi
  TWI,

  /// Uzbek
  UZBEK,

  /// Chamorro
  CHAMORRO,

  /// Guarani
  GUARANI,

  /// Nynorsk
  NYNORSK,

  /// Azerbaijani
  AZERBAIJANI,

  /// Czech
  CZECH,

  /// Navajo
  NAVAJO,

  /// Finnish
  FINNISH,

  /// Luxembourgish
  LUXEMBOURGISH,

  /// Swedish
  SWEDISH,

  /// Yiddish
  YIDDISH,

  /// Inuktitut
  INUKTITUT,

  /// Lao
  LAO,

  /// Chuvash
  CHUVASH,

  /// Maltese
  MALTESE,

  /// Maldivian
  MALDIVIAN_LANGUAGE,

  /// Interlingue
  INTERLINGUE,

  /// Ossetian
  OSSETIAN,

  /// Bashkir
  BASHKIR,

  /// Ojibwe
  OJIBWE,

  /// Kanuri
  KANURI,

  /// Indonesian
  INDONESIAN,

  /// Sardinian
  SARDINIAN_LANGUAGE,

  /// Akan
  AKAN,

  /// Manx
  MANX,

  /// Turkish
  TURKISH,

  /// Esperanto
  ESPERANTO,

  /// Pashto
  PASHTO,

  /// Kyrgyz
  KYRGYZ,

  /// Volapuk
  VOLAPUK,

  /// Avar
  AVAR,

  /// Sango
  SANGO,

  /// Venda
  VENDA,

  /// Albanian
  ALBANIAN,

  /// Basque
  BASQUE,

  /// Fulah
  FULA_LANGUAGE,

  /// German
  GERMAN,

  /// Latvian
  LATVIAN,

  /// Cornish
  CORNISH,

  /// Pali
  PALI,

  /// Tatar
  TATAR,

  /// Romanian
  ROMANIAN,

  /// Gikuyu
  GIKUYU,

  /// Tigrinya
  TIGRINYA,

  /// Galician
  GALICIAN,

  /// Telugu
  TELUGU,

  /// Hindi
  HINDI,

  /// Kongo
  KONGO_LANGUAGE,

  /// Xhosa
  XHOSA,

  /// Swazi
  SWAZI,

  /// Luganda
  LUGANDA,

  /// Urdu
  URDU,

  /// North Ndbele
  NORTHERN_NDEBELE_LANGUAGE,

  /// Yoruba
  YORUBA,

  /// World, as pseudo language
  WORLD,

  /// Undefined language
  UNDEFINED
}

extension OpenFoodFactsLanguageExtension on OpenFoodFactsLanguage? {
  /// ISO 639-1 for [OpenFoodFactsLanguage]s
  static const Map<OpenFoodFactsLanguage, String> _CODES = {
    OpenFoodFactsLanguage.ENGLISH: 'en',
    OpenFoodFactsLanguage.OLD_CHURCH_SLAVONIC: 'cu',
    OpenFoodFactsLanguage.DZONGKHA_LANGUAGE: 'dz',
    OpenFoodFactsLanguage.JAPANESE: 'ja',
    OpenFoodFactsLanguage.MALAY: 'ms',
    OpenFoodFactsLanguage.TAGALOG: 'tl',
    OpenFoodFactsLanguage.MOLDOVAN: 'mo',
    OpenFoodFactsLanguage.MONGOLIAN: 'mn',
    OpenFoodFactsLanguage.KOREAN: 'ko',
    OpenFoodFactsLanguage.LUBA_KATANGA_LANGUAGE: 'lu',
    OpenFoodFactsLanguage.KAZAKH: 'kk',
    OpenFoodFactsLanguage.QUECHUA_LANGUAGES: 'qu',
    OpenFoodFactsLanguage.UKRAINIAN: 'uk',
    OpenFoodFactsLanguage.OCCITAN: 'oc',
    OpenFoodFactsLanguage.BIHARI_LANGUAGES: 'bh',
    OpenFoodFactsLanguage.SOUTHERN_NDEBELE: 'nr',
    OpenFoodFactsLanguage.BOKMAL: 'nb',
    OpenFoodFactsLanguage.KOMI: 'kv',
    OpenFoodFactsLanguage.MODERN_GREEK: 'el',
    OpenFoodFactsLanguage.FIJIAN_LANGUAGE: 'fj',
    OpenFoodFactsLanguage.ZULU: 'zu',
    OpenFoodFactsLanguage.IDO: 'io',
    OpenFoodFactsLanguage.KHMER: 'km',
    OpenFoodFactsLanguage.SANSKRIT: 'sa',
    OpenFoodFactsLanguage.MACEDONIAN: 'mk',
    OpenFoodFactsLanguage.SOTHO: 'st',
    OpenFoodFactsLanguage.SCOTTISH_GAELIC: 'gd',
    OpenFoodFactsLanguage.MARATHI: 'mr',
    OpenFoodFactsLanguage.NAURUAN: 'na',
    OpenFoodFactsLanguage.OROMO: 'om',
    OpenFoodFactsLanguage.WELSH: 'cy',
    OpenFoodFactsLanguage.VIETNAMESE: 'vi',
    OpenFoodFactsLanguage.BISLAMA: 'bi',
    OpenFoodFactsLanguage.SOMALI: 'so',
    OpenFoodFactsLanguage.LITHUANIAN: 'lt',
    OpenFoodFactsLanguage.HAITIAN_CREOLE: 'ht',
    OpenFoodFactsLanguage.MALAGASY: 'mg',
    OpenFoodFactsLanguage.SPANISH: 'es',
    OpenFoodFactsLanguage.DANISH: 'da',
    OpenFoodFactsLanguage.SLOVENE: 'sl',
    OpenFoodFactsLanguage.ICELANDIC: 'is',
    OpenFoodFactsLanguage.ESTONIAN: 'et',
    OpenFoodFactsLanguage.WOLOF: 'wo',
    OpenFoodFactsLanguage.HIRI_MOTU: 'ho',
    OpenFoodFactsLanguage.TAMIL: 'ta',
    OpenFoodFactsLanguage.SLOVAK: 'sk',
    OpenFoodFactsLanguage.HERERO: 'hz',
    OpenFoodFactsLanguage.ITALIAN: 'it',
    OpenFoodFactsLanguage.IRISH: 'ga',
    OpenFoodFactsLanguage.SHONA: 'sn',
    OpenFoodFactsLanguage.MARSHALLESE: 'mh',
    OpenFoodFactsLanguage.FRENCH: 'fr',
    OpenFoodFactsLanguage.AYMARA: 'ay',
    OpenFoodFactsLanguage.HEBREW: 'he',
    OpenFoodFactsLanguage.NORTHERN_SAMI: 'se',
    OpenFoodFactsLanguage.BENGALI: 'bn',
    OpenFoodFactsLanguage.ODIA: 'or',
    OpenFoodFactsLanguage.MALAYALAM: 'ml',
    OpenFoodFactsLanguage.DUTCH: 'nl',
    OpenFoodFactsLanguage.UYGHUR: 'ug',
    OpenFoodFactsLanguage.SERBIAN: 'sr',
    OpenFoodFactsLanguage.TIBETAN_LANGUAGE: 'bo',
    OpenFoodFactsLanguage.BELARUSIAN: 'be',
    OpenFoodFactsLanguage.SAMOAN: 'sm',
    OpenFoodFactsLanguage.PUNJABI: 'pa',
    OpenFoodFactsLanguage.RUSSIAN: 'ru',
    OpenFoodFactsLanguage.TAHITIAN: 'ty',
    OpenFoodFactsLanguage.INTERLINGUA: 'ia',
    OpenFoodFactsLanguage.AFAR: 'aa',
    OpenFoodFactsLanguage.GREENLANDIC: 'kl',
    OpenFoodFactsLanguage.LATIN: 'la',
    OpenFoodFactsLanguage.CHINESE: 'zh',
    OpenFoodFactsLanguage.TURKMEN: 'tk',
    OpenFoodFactsLanguage.WEST_FRISIAN: 'fy',
    OpenFoodFactsLanguage.TSONGA: 'ts',
    OpenFoodFactsLanguage.ROMANSH: 'rm',
    OpenFoodFactsLanguage.INUPIAT_LANGUAGE: 'ik',
    OpenFoodFactsLanguage.TAJIK: 'tg',
    OpenFoodFactsLanguage.BURMESE: 'my',
    OpenFoodFactsLanguage.JAVANESE: 'jv',
    OpenFoodFactsLanguage.CHECHEN: 'ce',
    OpenFoodFactsLanguage.ASSAMESE: 'as',
    OpenFoodFactsLanguage.UNKNOWN_LANGUAGE: 'xx',
    OpenFoodFactsLanguage.ARABIC: 'ar',
    OpenFoodFactsLanguage.KINYARWANDA: 'rw',
    OpenFoodFactsLanguage.TONGAN_LANGUAGE: 'to',
    OpenFoodFactsLanguage.CHURCH_SLAVONIC: 'cu',
    OpenFoodFactsLanguage.SINHALA: 'si',
    OpenFoodFactsLanguage.ARMENIAN: 'hy',
    OpenFoodFactsLanguage.KURDISH: 'ku',
    OpenFoodFactsLanguage.THAI: 'th',
    OpenFoodFactsLanguage.CREE: 'cr',
    OpenFoodFactsLanguage.SWAHILI: 'sw',
    OpenFoodFactsLanguage.GUJARATI: 'gu',
    OpenFoodFactsLanguage.PERSIAN: 'fa',
    OpenFoodFactsLanguage.BOSNIAN: 'bs',
    OpenFoodFactsLanguage.AMHARIC: 'am',
    OpenFoodFactsLanguage.ARAGONESE: 'an',
    OpenFoodFactsLanguage.CROATIAN: 'hr',
    OpenFoodFactsLanguage.CHEWA: 'ny',
    OpenFoodFactsLanguage.ZHUANG_LANGUAGES: 'za',
    OpenFoodFactsLanguage.LINGALA_LANGUAGE: 'ln',
    OpenFoodFactsLanguage.BAMBARA: 'bm',
    OpenFoodFactsLanguage.LIMBURGISH_LANGUAGE: 'li',
    OpenFoodFactsLanguage.NUOSU_LANGUAGE: 'ii',
    OpenFoodFactsLanguage.KWANYAMA: 'kj',
    OpenFoodFactsLanguage.KIRUNDI: 'rn',
    OpenFoodFactsLanguage.EWE: 'ee',
    OpenFoodFactsLanguage.FAROESE: 'fo',
    OpenFoodFactsLanguage.SINDHI: 'sd',
    OpenFoodFactsLanguage.CORSICAN: 'co',
    OpenFoodFactsLanguage.KANNADA: 'kn',
    OpenFoodFactsLanguage.NORWEGIAN: 'no',
    OpenFoodFactsLanguage.SUNDANESE_LANGUAGE: 'su',
    OpenFoodFactsLanguage.GEORGIAN: 'ka',
    OpenFoodFactsLanguage.HAUSA: 'ha',
    OpenFoodFactsLanguage.TSWANA: 'tn',
    OpenFoodFactsLanguage.CATALAN: 'ca',
    OpenFoodFactsLanguage.NDONGA_DIALECT: 'ng',
    OpenFoodFactsLanguage.IGBO_LANGUAGE: 'ig',
    OpenFoodFactsLanguage.AFRIKAANS: 'af',
    OpenFoodFactsLanguage.POLISH: 'pl',
    OpenFoodFactsLanguage.KASHMIRI: 'ks',
    OpenFoodFactsLanguage.MAORI: 'mi',
    OpenFoodFactsLanguage.HUNGARIAN: 'hu',
    OpenFoodFactsLanguage.BRETON: 'br',
    OpenFoodFactsLanguage.PORTUGUESE: 'pt',
    OpenFoodFactsLanguage.BULGARIAN: 'bg',
    OpenFoodFactsLanguage.AVESTAN: 'ae',
    OpenFoodFactsLanguage.NEPALI: 'ne',
    OpenFoodFactsLanguage.TWI: 'tw',
    OpenFoodFactsLanguage.UZBEK: 'uz',
    OpenFoodFactsLanguage.CHAMORRO: 'ch',
    OpenFoodFactsLanguage.GUARANI: 'gn',
    OpenFoodFactsLanguage.NYNORSK: 'nn',
    OpenFoodFactsLanguage.AZERBAIJANI: 'az',
    OpenFoodFactsLanguage.CZECH: 'cs',
    OpenFoodFactsLanguage.NAVAJO: 'nv',
    OpenFoodFactsLanguage.FINNISH: 'fi',
    OpenFoodFactsLanguage.LUXEMBOURGISH: 'lb',
    OpenFoodFactsLanguage.SWEDISH: 'sv',
    OpenFoodFactsLanguage.YIDDISH: 'yi',
    OpenFoodFactsLanguage.INUKTITUT: 'iu',
    OpenFoodFactsLanguage.LAO: 'lo',
    OpenFoodFactsLanguage.CHUVASH: 'cv',
    OpenFoodFactsLanguage.MALTESE: 'mt',
    OpenFoodFactsLanguage.MALDIVIAN_LANGUAGE: 'dv',
    OpenFoodFactsLanguage.INTERLINGUE: 'ie',
    OpenFoodFactsLanguage.OSSETIAN: 'os',
    OpenFoodFactsLanguage.BASHKIR: 'ba',
    OpenFoodFactsLanguage.OJIBWE: 'oj',
    OpenFoodFactsLanguage.KANURI: 'kr',
    OpenFoodFactsLanguage.INDONESIAN: 'id',
    OpenFoodFactsLanguage.SARDINIAN_LANGUAGE: 'sc',
    OpenFoodFactsLanguage.AKAN: 'ak',
    OpenFoodFactsLanguage.MANX: 'gv',
    OpenFoodFactsLanguage.TURKISH: 'tr',
    OpenFoodFactsLanguage.ESPERANTO: 'eo',
    OpenFoodFactsLanguage.PASHTO: 'ps',
    OpenFoodFactsLanguage.KYRGYZ: 'ky',
    OpenFoodFactsLanguage.VOLAPUK: 'vo',
    OpenFoodFactsLanguage.AVAR: 'av',
    OpenFoodFactsLanguage.SANGO: 'sg',
    OpenFoodFactsLanguage.VENDA: 've',
    OpenFoodFactsLanguage.ALBANIAN: 'sq',
    OpenFoodFactsLanguage.BASQUE: 'eu',
    OpenFoodFactsLanguage.FULA_LANGUAGE: 'ff',
    OpenFoodFactsLanguage.GERMAN: 'de',
    OpenFoodFactsLanguage.LATVIAN: 'lv',
    OpenFoodFactsLanguage.CORNISH: 'kw',
    OpenFoodFactsLanguage.PALI: 'pi',
    OpenFoodFactsLanguage.TATAR: 'tt',
    OpenFoodFactsLanguage.ROMANIAN: 'ro',
    OpenFoodFactsLanguage.GIKUYU: 'ki',
    OpenFoodFactsLanguage.TIGRINYA: 'ti',
    OpenFoodFactsLanguage.GALICIAN: 'gl',
    OpenFoodFactsLanguage.TELUGU: 'te',
    OpenFoodFactsLanguage.HINDI: 'hi',
    OpenFoodFactsLanguage.KONGO_LANGUAGE: 'kg',
    OpenFoodFactsLanguage.XHOSA: 'xh',
    OpenFoodFactsLanguage.SWAZI: 'ss',
    OpenFoodFactsLanguage.LUGANDA: 'lg',
    OpenFoodFactsLanguage.URDU: 'ur',
    OpenFoodFactsLanguage.NORTHERN_NDEBELE_LANGUAGE: 'nd',
    OpenFoodFactsLanguage.YORUBA: 'yo',
    OpenFoodFactsLanguage.WORLD: 'world',
    OpenFoodFactsLanguage.UNDEFINED: '-',
  };

  /// Returns the corresponding ISO-639-1 code
  ///
  /// Won't return 2 characters for special cases like
  /// * [OpenFoodFactsLanguage.WORLD]
  /// * [OpenFoodFactsLanguage.UNDEFINED]
  String get code => _CODES[this] ?? '-';
}

/// Helper class around [OpenFoodFactsLanguage]
class LanguageHelper {
  /// Converts an [OpenFoodFactsLanguage] into an ISO-639-1 code
  static String toJson(OpenFoodFactsLanguage? language) => language.code;

  /// Converts an ISO-639-1 code into an [OpenFoodFactsLanguage]
  static OpenFoodFactsLanguage fromJson(String? code) =>
      OpenFoodFactsLanguage.values.firstWhere(
        (final OpenFoodFactsLanguage language) => language.code == code,
        orElse: () => OpenFoodFactsLanguage.UNDEFINED,
      );

  /// Converts a Map with [OpenFoodFactsLanguage] into
  /// a map with ISO-639-1 codes.
  static Map<String, T>? toJsonMap<T>(Map<OpenFoodFactsLanguage, T>? map) {
    if (map == null) {
      return null;
    }
    return map.map((key, value) => MapEntry(key.code, value));
  }

  /// Helper function without generic types. Needed for the
  /// `@JsonKey` annotation (the annotation can't work with generics).
  static Map<String, String>? toJsonStringMap(
      Map<OpenFoodFactsLanguage, String>? map) {
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
      dynamic map) {
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
  /// [OpenFoodFactsLanguage.DUTCH, OpenFoodFactsLanguage.FRENCH]
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
      Map<OpenFoodFactsLanguage, List<String>>? map) {
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
          'Expected type: Map<String, List<String>>, got ${map.runtimeType}');
    }
    final result = <OpenFoodFactsLanguage, List<String>>{};
    for (final key in map.keys) {
      result[LanguageHelper.fromJson(key)] = map[key]!.cast<String>();
    }
    return result;
  }
}
