/// Available languages
enum OpenFoodFactsLanguage {
  ENGLISH,
  OLD_CHURCH_SLAVONIC,
  DZONGKHA_LANGUAGE,
  JAPANESE,
  MALAY,
  TAGALOG,
  MOLDOVAN,
  KOREAN,
  LUBA_KATANGA_LANGUAGE,
  KAZAKH,
  QUECHUA_LANGUAGES,
  UKRAINIAN,
  OCCITAN,
  BIHARI_LANGUAGES,
  SOUTHERN_NDEBELE,
  BOKMAL,
  KOMI,
  MODERN_GREEK,
  FIJIAN_LANGUAGE,
  ZULU,
  IDO,
  KHMER,
  SANSKRIT,
  MACEDONIAN,
  SOTHO,
  SCOTTISH_GAELIC,
  MARATHI,
  NAURUAN,
  OROMO,
  WELSH,
  VIETNAMESE,
  BISLAMA,
  SOMALI,
  LITHUANIAN,
  HAITIAN_CREOLE,
  MALAGASY,
  SPANISH,
  DANISH,
  SLOVENE,
  ICELANDIC,
  ESTONIAN,
  WOLOF,
  HIRI_MOTU,
  TAMIL,
  SLOVAK,
  HERERO,
  ITALIAN,
  IRISH,
  SHONA,
  MARSHALLESE,
  FRENCH,
  AYMARA,
  HEBREW,
  NORTHERN_SAMI,
  BENGALI,
  ODIA,
  MALAYALAM,
  DUTCH,
  UYGHUR,
  SERBIAN,
  TIBETAN_LANGUAGE,
  BELARUSIAN,
  SAMOAN,
  PUNJABI,
  RUSSIAN,
  TAHITIAN,
  INTERLINGUA,
  AFAR,
  GREENLANDIC,
  LATIN,
  CHINESE,
  TURKMEN,
  WEST_FRISIAN,
  TSONGA,
  ROMANSH,
  INUPIAT_LANGUAGE,
  TAJIK,
  BURMESE,
  JAVANESE,
  CHECHEN,
  ASSAMESE,
  UNKNOWN_LANGUAGE,
  ARABIC,
  KINYARWANDA,
  TONGAN_LANGUAGE,
  CHURCH_SLAVONIC,
  SINHALA,
  ARMENIAN,
  KURDISH,
  THAI,
  CREE,
  SWAHILI,
  GUJARATI,
  PERSIAN,
  BOSNIAN,
  AMHARIC,
  ARAGONESE,
  CROATIAN,
  CHEWA,
  ZHUANG_LANGUAGES,
  LINGALA_LANGUAGE,
  BAMBARA,
  LIMBURGISH_LANGUAGE,
  NUOSU_LANGUAGE,
  KWANYAMA,
  KIRUNDI,
  EWE,
  FAROESE,
  SINDHI,
  CORSICAN,
  KANNADA,
  NORWEGIAN,
  SUNDANESE_LANGUAGE,
  GEORGIAN,
  HAUSA,
  TSWANA,
  CATALAN,
  NDONGA_DIALECT,
  IGBO_LANGUAGE,
  AFRIKAANS,
  POLISH,
  KASHMIRI,
  MAORI,
  HUNGARIAN,
  BRETON,
  PORTUGUESE,
  BULGARIAN,
  AVESTAN,
  NEPALI,
  TWI,
  UZBEK,
  CHAMORRO,
  GUARANI,
  NYNORSK,
  AZERBAIJANI,
  CZECH,
  NAVAJO,
  FINNISH,
  LUXEMBOURGISH,
  SWEDISH,
  YIDDISH,
  INUKTITUT,
  LAO,
  CHUVASH,
  MALTESE,
  MALDIVIAN_LANGUAGE,
  INTERLINGUE,
  OSSETIAN,
  BASHKIR,
  OJIBWE,
  KANURI,
  INDONESIAN,
  SARDINIAN_LANGUAGE,
  AKAN,
  MANX,
  TURKISH,
  ESPERANTO,
  PASHTO,
  KYRGYZ,
  VOLAPUK,
  AVAR,
  SANGO,
  VENDA,
  ALBANIAN,
  BASQUE,
  FULA_LANGUAGE,
  GERMAN,
  LATVIAN,
  CORNISH,
  PALI,
  TATAR,
  ROMANIAN,
  GIKUYU,
  TIGRINYA,
  GALICIAN,
  TELUGU,
  HINDI,
  KONGO_LANGUAGE,
  XHOSA,
  SWAZI,
  LUGANDA,
  URDU,
  NORTHERN_NDEBELE_LANGUAGE,
  YORUBA,
  WORLD,
  UNDEFINED
}

extension OpenFoodFactsLanguageExtension on OpenFoodFactsLanguage? {
  /// Returns the corresponding ISO-639-1 code
  ///
  /// Won't return 2 characters for special cases like
  /// * [OpenFoodFactsLanguage.WORLD]
  /// * [OpenFoodFactsLanguage.UNDEFINED]
  String get code {
    switch (this) {
      case OpenFoodFactsLanguage.ENGLISH:
        return 'en';
      case OpenFoodFactsLanguage.OLD_CHURCH_SLAVONIC:
        return 'cu';
      case OpenFoodFactsLanguage.DZONGKHA_LANGUAGE:
        return 'dz';
      case OpenFoodFactsLanguage.JAPANESE:
        return 'ja';
      case OpenFoodFactsLanguage.MALAY:
        return 'ms';
      case OpenFoodFactsLanguage.TAGALOG:
        return 'tl';
      case OpenFoodFactsLanguage.MOLDOVAN:
        return 'mo';
      case OpenFoodFactsLanguage.KOREAN:
        return 'ko';
      case OpenFoodFactsLanguage.LUBA_KATANGA_LANGUAGE:
        return 'lu';
      case OpenFoodFactsLanguage.KAZAKH:
        return 'kk';
      case OpenFoodFactsLanguage.QUECHUA_LANGUAGES:
        return 'qu';
      case OpenFoodFactsLanguage.UKRAINIAN:
        return 'uk';
      case OpenFoodFactsLanguage.OCCITAN:
        return 'oc';
      case OpenFoodFactsLanguage.BIHARI_LANGUAGES:
        return 'bh';
      case OpenFoodFactsLanguage.SOUTHERN_NDEBELE:
        return 'nr';
      case OpenFoodFactsLanguage.BOKMAL:
        return 'nb';
      case OpenFoodFactsLanguage.KOMI:
        return 'kv';
      case OpenFoodFactsLanguage.MODERN_GREEK:
        return 'el';
      case OpenFoodFactsLanguage.FIJIAN_LANGUAGE:
        return 'fj';
      case OpenFoodFactsLanguage.ZULU:
        return 'zu';
      case OpenFoodFactsLanguage.IDO:
        return 'io';
      case OpenFoodFactsLanguage.KHMER:
        return 'km';
      case OpenFoodFactsLanguage.SANSKRIT:
        return 'sa';
      case OpenFoodFactsLanguage.MACEDONIAN:
        return 'mk';
      case OpenFoodFactsLanguage.SOTHO:
        return 'st';
      case OpenFoodFactsLanguage.SCOTTISH_GAELIC:
        return 'gd';
      case OpenFoodFactsLanguage.MARATHI:
        return 'mr';
      case OpenFoodFactsLanguage.NAURUAN:
        return 'na';
      case OpenFoodFactsLanguage.OROMO:
        return 'om';
      case OpenFoodFactsLanguage.WELSH:
        return 'cy';
      case OpenFoodFactsLanguage.VIETNAMESE:
        return 'vi';
      case OpenFoodFactsLanguage.BISLAMA:
        return 'bi';
      case OpenFoodFactsLanguage.SOMALI:
        return 'so';
      case OpenFoodFactsLanguage.LITHUANIAN:
        return 'lt';
      case OpenFoodFactsLanguage.HAITIAN_CREOLE:
        return 'ht';
      case OpenFoodFactsLanguage.MALAGASY:
        return 'mg';
      case OpenFoodFactsLanguage.SPANISH:
        return 'es';
      case OpenFoodFactsLanguage.DANISH:
        return 'da';
      case OpenFoodFactsLanguage.SLOVENE:
        return 'sl';
      case OpenFoodFactsLanguage.ICELANDIC:
        return 'is';
      case OpenFoodFactsLanguage.ESTONIAN:
        return 'et';
      case OpenFoodFactsLanguage.WOLOF:
        return 'wo';
      case OpenFoodFactsLanguage.HIRI_MOTU:
        return 'ho';
      case OpenFoodFactsLanguage.TAMIL:
        return 'ta';
      case OpenFoodFactsLanguage.SLOVAK:
        return 'sk';
      case OpenFoodFactsLanguage.HERERO:
        return 'hz';
      case OpenFoodFactsLanguage.ITALIAN:
        return 'it';
      case OpenFoodFactsLanguage.IRISH:
        return 'ga';
      case OpenFoodFactsLanguage.SHONA:
        return 'sn';
      case OpenFoodFactsLanguage.MARSHALLESE:
        return 'mh';
      case OpenFoodFactsLanguage.FRENCH:
        return 'fr';
      case OpenFoodFactsLanguage.AYMARA:
        return 'ay';
      case OpenFoodFactsLanguage.HEBREW:
        return 'he';
      case OpenFoodFactsLanguage.NORTHERN_SAMI:
        return 'se';
      case OpenFoodFactsLanguage.BENGALI:
        return 'bn';
      case OpenFoodFactsLanguage.ODIA:
        return 'or';
      case OpenFoodFactsLanguage.MALAYALAM:
        return 'ml';
      case OpenFoodFactsLanguage.DUTCH:
        return 'nl';
      case OpenFoodFactsLanguage.UYGHUR:
        return 'ug';
      case OpenFoodFactsLanguage.SERBIAN:
        return 'sr';
      case OpenFoodFactsLanguage.TIBETAN_LANGUAGE:
        return 'bo';
      case OpenFoodFactsLanguage.BELARUSIAN:
        return 'be';
      case OpenFoodFactsLanguage.SAMOAN:
        return 'sm';
      case OpenFoodFactsLanguage.PUNJABI:
        return 'pa';
      case OpenFoodFactsLanguage.RUSSIAN:
        return 'ru';
      case OpenFoodFactsLanguage.TAHITIAN:
        return 'ty';
      case OpenFoodFactsLanguage.INTERLINGUA:
        return 'ia';
      case OpenFoodFactsLanguage.AFAR:
        return 'aa';
      case OpenFoodFactsLanguage.GREENLANDIC:
        return 'kl';
      case OpenFoodFactsLanguage.LATIN:
        return 'la';
      case OpenFoodFactsLanguage.CHINESE:
        return 'zh';
      case OpenFoodFactsLanguage.TURKMEN:
        return 'tk';
      case OpenFoodFactsLanguage.WEST_FRISIAN:
        return 'fy';
      case OpenFoodFactsLanguage.TSONGA:
        return 'ts';
      case OpenFoodFactsLanguage.ROMANSH:
        return 'rm';
      case OpenFoodFactsLanguage.INUPIAT_LANGUAGE:
        return 'ik';
      case OpenFoodFactsLanguage.TAJIK:
        return 'tg';
      case OpenFoodFactsLanguage.BURMESE:
        return 'my';
      case OpenFoodFactsLanguage.JAVANESE:
        return 'jv';
      case OpenFoodFactsLanguage.CHECHEN:
        return 'ce';
      case OpenFoodFactsLanguage.ASSAMESE:
        return 'as';
      case OpenFoodFactsLanguage.UNKNOWN_LANGUAGE:
        return 'xx';
      case OpenFoodFactsLanguage.ARABIC:
        return 'ar';
      case OpenFoodFactsLanguage.KINYARWANDA:
        return 'rw';
      case OpenFoodFactsLanguage.TONGAN_LANGUAGE:
        return 'to';
      case OpenFoodFactsLanguage.CHURCH_SLAVONIC:
        return 'cu';
      case OpenFoodFactsLanguage.SINHALA:
        return 'si';
      case OpenFoodFactsLanguage.ARMENIAN:
        return 'hy';
      case OpenFoodFactsLanguage.KURDISH:
        return 'ku';
      case OpenFoodFactsLanguage.THAI:
        return 'th';
      case OpenFoodFactsLanguage.CREE:
        return 'cr';
      case OpenFoodFactsLanguage.SWAHILI:
        return 'sw';
      case OpenFoodFactsLanguage.GUJARATI:
        return 'gu';
      case OpenFoodFactsLanguage.PERSIAN:
        return 'fa';
      case OpenFoodFactsLanguage.BOSNIAN:
        return 'bs';
      case OpenFoodFactsLanguage.AMHARIC:
        return 'am';
      case OpenFoodFactsLanguage.ARAGONESE:
        return 'an';
      case OpenFoodFactsLanguage.CROATIAN:
        return 'hr';
      case OpenFoodFactsLanguage.CHEWA:
        return 'ny';
      case OpenFoodFactsLanguage.ZHUANG_LANGUAGES:
        return 'za';
      case OpenFoodFactsLanguage.LINGALA_LANGUAGE:
        return 'ln';
      case OpenFoodFactsLanguage.BAMBARA:
        return 'bm';
      case OpenFoodFactsLanguage.LIMBURGISH_LANGUAGE:
        return 'li';
      case OpenFoodFactsLanguage.NUOSU_LANGUAGE:
        return 'ii';
      case OpenFoodFactsLanguage.KWANYAMA:
        return 'kj';
      case OpenFoodFactsLanguage.KIRUNDI:
        return 'rn';
      case OpenFoodFactsLanguage.EWE:
        return 'ee';
      case OpenFoodFactsLanguage.FAROESE:
        return 'fo';
      case OpenFoodFactsLanguage.SINDHI:
        return 'sd';
      case OpenFoodFactsLanguage.CORSICAN:
        return 'co';
      case OpenFoodFactsLanguage.KANNADA:
        return 'kn';
      case OpenFoodFactsLanguage.NORWEGIAN:
        return 'no';
      case OpenFoodFactsLanguage.SUNDANESE_LANGUAGE:
        return 'su';
      case OpenFoodFactsLanguage.GEORGIAN:
        return 'ka';
      case OpenFoodFactsLanguage.HAUSA:
        return 'ha';
      case OpenFoodFactsLanguage.TSWANA:
        return 'tn';
      case OpenFoodFactsLanguage.CATALAN:
        return 'ca';
      case OpenFoodFactsLanguage.NDONGA_DIALECT:
        return 'ng';
      case OpenFoodFactsLanguage.IGBO_LANGUAGE:
        return 'ig';
      case OpenFoodFactsLanguage.AFRIKAANS:
        return 'af';
      case OpenFoodFactsLanguage.POLISH:
        return 'pl';
      case OpenFoodFactsLanguage.KASHMIRI:
        return 'ks';
      case OpenFoodFactsLanguage.MAORI:
        return 'mi';
      case OpenFoodFactsLanguage.HUNGARIAN:
        return 'hu';
      case OpenFoodFactsLanguage.BRETON:
        return 'br';
      case OpenFoodFactsLanguage.PORTUGUESE:
        return 'pt';
      case OpenFoodFactsLanguage.BULGARIAN:
        return 'bg';
      case OpenFoodFactsLanguage.AVESTAN:
        return 'ae';
      case OpenFoodFactsLanguage.NEPALI:
        return 'ne';
      case OpenFoodFactsLanguage.TWI:
        return 'tw';
      case OpenFoodFactsLanguage.UZBEK:
        return 'uz';
      case OpenFoodFactsLanguage.CHAMORRO:
        return 'ch';
      case OpenFoodFactsLanguage.GUARANI:
        return 'gn';
      case OpenFoodFactsLanguage.NYNORSK:
        return 'nn';
      case OpenFoodFactsLanguage.AZERBAIJANI:
        return 'az';
      case OpenFoodFactsLanguage.CZECH:
        return 'cs';
      case OpenFoodFactsLanguage.NAVAJO:
        return 'nv';
      case OpenFoodFactsLanguage.FINNISH:
        return 'fi';
      case OpenFoodFactsLanguage.LUXEMBOURGISH:
        return 'lb';
      case OpenFoodFactsLanguage.SWEDISH:
        return 'sv';
      case OpenFoodFactsLanguage.YIDDISH:
        return 'yi';
      case OpenFoodFactsLanguage.INUKTITUT:
        return 'iu';
      case OpenFoodFactsLanguage.LAO:
        return 'lo';
      case OpenFoodFactsLanguage.CHUVASH:
        return 'cv';
      case OpenFoodFactsLanguage.MALTESE:
        return 'mt';
      case OpenFoodFactsLanguage.MALDIVIAN_LANGUAGE:
        return 'dv';
      case OpenFoodFactsLanguage.INTERLINGUE:
        return 'ie';
      case OpenFoodFactsLanguage.OSSETIAN:
        return 'os';
      case OpenFoodFactsLanguage.BASHKIR:
        return 'ba';
      case OpenFoodFactsLanguage.OJIBWE:
        return 'oj';
      case OpenFoodFactsLanguage.KANURI:
        return 'kr';
      case OpenFoodFactsLanguage.INDONESIAN:
        return 'id';
      case OpenFoodFactsLanguage.SARDINIAN_LANGUAGE:
        return 'sc';
      case OpenFoodFactsLanguage.AKAN:
        return 'ak';
      case OpenFoodFactsLanguage.MANX:
        return 'gv';
      case OpenFoodFactsLanguage.TURKISH:
        return 'tr';
      case OpenFoodFactsLanguage.ESPERANTO:
        return 'eo';
      case OpenFoodFactsLanguage.PASHTO:
        return 'ps';
      case OpenFoodFactsLanguage.KYRGYZ:
        return 'ky';
      case OpenFoodFactsLanguage.VOLAPUK:
        return 'vo';
      case OpenFoodFactsLanguage.AVAR:
        return 'av';
      case OpenFoodFactsLanguage.SANGO:
        return 'sg';
      case OpenFoodFactsLanguage.VENDA:
        return 've';
      case OpenFoodFactsLanguage.ALBANIAN:
        return 'sq';
      case OpenFoodFactsLanguage.BASQUE:
        return 'eu';
      case OpenFoodFactsLanguage.FULA_LANGUAGE:
        return 'ff';
      case OpenFoodFactsLanguage.GERMAN:
        return 'de';
      case OpenFoodFactsLanguage.LATVIAN:
        return 'lv';
      case OpenFoodFactsLanguage.CORNISH:
        return 'kw';
      case OpenFoodFactsLanguage.PALI:
        return 'pi';
      case OpenFoodFactsLanguage.TATAR:
        return 'tt';
      case OpenFoodFactsLanguage.ROMANIAN:
        return 'ro';
      case OpenFoodFactsLanguage.GIKUYU:
        return 'ki';
      case OpenFoodFactsLanguage.TIGRINYA:
        return 'ti';
      case OpenFoodFactsLanguage.GALICIAN:
        return 'gl';
      case OpenFoodFactsLanguage.TELUGU:
        return 'te';
      case OpenFoodFactsLanguage.HINDI:
        return 'hi';
      case OpenFoodFactsLanguage.KONGO_LANGUAGE:
        return 'kg';
      case OpenFoodFactsLanguage.XHOSA:
        return 'xh';
      case OpenFoodFactsLanguage.SWAZI:
        return 'ss';
      case OpenFoodFactsLanguage.LUGANDA:
        return 'lg';
      case OpenFoodFactsLanguage.URDU:
        return 'ur';
      case OpenFoodFactsLanguage.NORTHERN_NDEBELE_LANGUAGE:
        return 'nd';
      case OpenFoodFactsLanguage.YORUBA:
        return 'yo';
      case OpenFoodFactsLanguage.WORLD:
        return 'world';
      case OpenFoodFactsLanguage.UNDEFINED:
        return '-';
      default:
        return '-';
    }
  }
}

/// Helper class around [OpenFoodFactsLanguage]
class LanguageHelper {
  /// Converts an [OpenFoodFactsLanguage] into an ISO-639-1 code
  static String toJson(OpenFoodFactsLanguage? language) {
    return language.code;
  }

  /// Converts an ISO-639-1 code into an [OpenFoodFactsLanguage]
  static OpenFoodFactsLanguage fromJson(String? code) {
    for (OpenFoodFactsLanguage language in OpenFoodFactsLanguage.values) {
      if (code == language.code) {
        return language;
      }
    }
    return OpenFoodFactsLanguage.UNDEFINED;
  }
}
