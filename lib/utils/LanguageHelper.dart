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

extension OpenFoodFactsLanguageExtension on OpenFoodFactsLanguage {
  String get code {
    switch (this) {
      case OpenFoodFactsLanguage.ENGLISH:
        return 'en';
      case OpenFoodFactsLanguage.OLD_CHURCH_SLAVONIC:
        return 'cu';
        break;
      case OpenFoodFactsLanguage.DZONGKHA_LANGUAGE:
        return 'dz';
        break;
      case OpenFoodFactsLanguage.JAPANESE:
        return 'ja';
        break;
      case OpenFoodFactsLanguage.MALAY:
        return 'ms';
        break;
      case OpenFoodFactsLanguage.TAGALOG:
        return 'tl';
        break;
      case OpenFoodFactsLanguage.MOLDOVAN:
        return 'mo';
        break;
      case OpenFoodFactsLanguage.KOREAN:
        return 'ko';
        break;
      case OpenFoodFactsLanguage.LUBA_KATANGA_LANGUAGE:
        return 'lu';
        break;
      case OpenFoodFactsLanguage.KAZAKH:
        return 'kk';
        break;
      case OpenFoodFactsLanguage.QUECHUA_LANGUAGES:
        return 'qu';
        break;
      case OpenFoodFactsLanguage.UKRAINIAN:
        return 'uk';
        break;
      case OpenFoodFactsLanguage.OCCITAN:
        return 'oc';
        break;
      case OpenFoodFactsLanguage.BIHARI_LANGUAGES:
        return 'bh';
        break;
      case OpenFoodFactsLanguage.SOUTHERN_NDEBELE:
        return 'nr';
        break;
      case OpenFoodFactsLanguage.BOKMAL:
        return 'nb';
        break;
      case OpenFoodFactsLanguage.KOMI:
        return 'kv';
        break;
      case OpenFoodFactsLanguage.MODERN_GREEK:
        return 'el';
        break;
      case OpenFoodFactsLanguage.FIJIAN_LANGUAGE:
        return 'fj';
        break;
      case OpenFoodFactsLanguage.ZULU:
        return 'zu';
        break;
      case OpenFoodFactsLanguage.IDO:
        return 'io';
        break;
      case OpenFoodFactsLanguage.KHMER:
        return 'km';
        break;
      case OpenFoodFactsLanguage.SANSKRIT:
        return 'sa';
        break;
      case OpenFoodFactsLanguage.MACEDONIAN:
        return 'mk';
        break;
      case OpenFoodFactsLanguage.SOTHO:
        return 'st';
        break;
      case OpenFoodFactsLanguage.SCOTTISH_GAELIC:
        return 'gd';
        break;
      case OpenFoodFactsLanguage.MARATHI:
        return 'mr';
        break;
      case OpenFoodFactsLanguage.NAURUAN:
        return 'na';
        break;
      case OpenFoodFactsLanguage.OROMO:
        return 'om';
        break;
      case OpenFoodFactsLanguage.WELSH:
        return 'cy';
        break;
      case OpenFoodFactsLanguage.VIETNAMESE:
        return 'vi';
        break;
      case OpenFoodFactsLanguage.BISLAMA:
        return 'bi';
        break;
      case OpenFoodFactsLanguage.SOMALI:
        return 'so';
        break;
      case OpenFoodFactsLanguage.LITHUANIAN:
        return 'lt';
        break;
      case OpenFoodFactsLanguage.HAITIAN_CREOLE:
        return 'ht';
        break;
      case OpenFoodFactsLanguage.MALAGASY:
        return 'mg';
        break;
      case OpenFoodFactsLanguage.SPANISH:
        return 'es';
        break;
      case OpenFoodFactsLanguage.DANISH:
        return 'da';
        break;
      case OpenFoodFactsLanguage.SLOVENE:
        return 'sl';
        break;
      case OpenFoodFactsLanguage.ICELANDIC:
        return 'is';
        break;
      case OpenFoodFactsLanguage.ESTONIAN:
        return 'et';
        break;
      case OpenFoodFactsLanguage.WOLOF:
        return 'wo';
        break;
      case OpenFoodFactsLanguage.HIRI_MOTU:
        return 'ho';
        break;
      case OpenFoodFactsLanguage.TAMIL:
        return 'ta';
        break;
      case OpenFoodFactsLanguage.SLOVAK:
        return 'sk';
        break;
      case OpenFoodFactsLanguage.HERERO:
        return 'hz';
        break;
      case OpenFoodFactsLanguage.ITALIAN:
        return 'it';
        break;
      case OpenFoodFactsLanguage.IRISH:
        return 'ga';
        break;
      case OpenFoodFactsLanguage.SHONA:
        return 'sn';
        break;
      case OpenFoodFactsLanguage.MARSHALLESE:
        return 'mh';
        break;
      case OpenFoodFactsLanguage.FRENCH:
        return 'fr';
        break;
      case OpenFoodFactsLanguage.AYMARA:
        return 'ay';
        break;
      case OpenFoodFactsLanguage.HEBREW:
        return 'he';
        break;
      case OpenFoodFactsLanguage.NORTHERN_SAMI:
        return 'se';
        break;
      case OpenFoodFactsLanguage.BENGALI:
        return 'bn';
        break;
      case OpenFoodFactsLanguage.ODIA:
        return 'or';
        break;
      case OpenFoodFactsLanguage.MALAYALAM:
        return 'ml';
        break;
      case OpenFoodFactsLanguage.DUTCH:
        return 'nl';
        break;
      case OpenFoodFactsLanguage.UYGHUR:
        return 'ug';
        break;
      case OpenFoodFactsLanguage.SERBIAN:
        return 'sr';
        break;
      case OpenFoodFactsLanguage.TIBETAN_LANGUAGE:
        return 'bo';
        break;
      case OpenFoodFactsLanguage.BELARUSIAN:
        return 'be';
        break;
      case OpenFoodFactsLanguage.SAMOAN:
        return 'sm';
        break;
      case OpenFoodFactsLanguage.PUNJABI:
        return 'pa';
        break;
      case OpenFoodFactsLanguage.RUSSIAN:
        return 'ru';
        break;
      case OpenFoodFactsLanguage.TAHITIAN:
        return 'ty';
        break;
      case OpenFoodFactsLanguage.INTERLINGUA:
        return 'ia';
        break;
      case OpenFoodFactsLanguage.AFAR:
        return 'aa';
        break;
      case OpenFoodFactsLanguage.GREENLANDIC:
        return 'kl';
        break;
      case OpenFoodFactsLanguage.LATIN:
        return 'la';
        break;
      case OpenFoodFactsLanguage.CHINESE:
        return 'zh';
        break;
      case OpenFoodFactsLanguage.TURKMEN:
        return 'tk';
        break;
      case OpenFoodFactsLanguage.WEST_FRISIAN:
        return 'fy';
        break;
      case OpenFoodFactsLanguage.TSONGA:
        return 'ts';
        break;
      case OpenFoodFactsLanguage.ROMANSH:
        return 'rm';
        break;
      case OpenFoodFactsLanguage.INUPIAT_LANGUAGE:
        return 'ik';
        break;
      case OpenFoodFactsLanguage.TAJIK:
        return 'tg';
        break;
      case OpenFoodFactsLanguage.BURMESE:
        return 'my';
        break;
      case OpenFoodFactsLanguage.JAVANESE:
        return 'jv';
        break;
      case OpenFoodFactsLanguage.CHECHEN:
        return 'ce';
        break;
      case OpenFoodFactsLanguage.ASSAMESE:
        return 'as';
        break;
      case OpenFoodFactsLanguage.UNKNOWN_LANGUAGE:
        return 'xx';
        break;
      case OpenFoodFactsLanguage.ARABIC:
        return 'ar';
        break;
      case OpenFoodFactsLanguage.KINYARWANDA:
        return 'rw';
        break;
      case OpenFoodFactsLanguage.TONGAN_LANGUAGE:
        return 'to';
        break;
      case OpenFoodFactsLanguage.CHURCH_SLAVONIC:
        return 'cu';
        break;
      case OpenFoodFactsLanguage.SINHALA:
        return 'si';
        break;
      case OpenFoodFactsLanguage.ARMENIAN:
        return 'hy';
        break;
      case OpenFoodFactsLanguage.KURDISH:
        return 'ku';
        break;
      case OpenFoodFactsLanguage.THAI:
        return 'th';
        break;
      case OpenFoodFactsLanguage.CREE:
        return 'cr';
        break;
      case OpenFoodFactsLanguage.SWAHILI:
        return 'sw';
        break;
      case OpenFoodFactsLanguage.GUJARATI:
        return 'gu';
        break;
      case OpenFoodFactsLanguage.PERSIAN:
        return 'fa';
        break;
      case OpenFoodFactsLanguage.BOSNIAN:
        return 'bs';
        break;
      case OpenFoodFactsLanguage.AMHARIC:
        return 'am';
        break;
      case OpenFoodFactsLanguage.ARAGONESE:
        return 'an';
        break;
      case OpenFoodFactsLanguage.CROATIAN:
        return 'hr';
        break;
      case OpenFoodFactsLanguage.CHEWA:
        return 'ny';
        break;
      case OpenFoodFactsLanguage.ZHUANG_LANGUAGES:
        return 'za';
        break;
      case OpenFoodFactsLanguage.LINGALA_LANGUAGE:
        return 'ln';
        break;
      case OpenFoodFactsLanguage.BAMBARA:
        return 'bm';
        break;
      case OpenFoodFactsLanguage.LIMBURGISH_LANGUAGE:
        return 'li';
        break;
      case OpenFoodFactsLanguage.NUOSU_LANGUAGE:
        return 'ii';
        break;
      case OpenFoodFactsLanguage.KWANYAMA:
        return 'kj';
        break;
      case OpenFoodFactsLanguage.KIRUNDI:
        return 'rn';
        break;
      case OpenFoodFactsLanguage.EWE:
        return 'ee';
        break;
      case OpenFoodFactsLanguage.FAROESE:
        return 'fo';
        break;
      case OpenFoodFactsLanguage.SINDHI:
        return 'sd';
        break;
      case OpenFoodFactsLanguage.CORSICAN:
        return 'co';
        break;
      case OpenFoodFactsLanguage.KANNADA:
        return 'kn';
        break;
      case OpenFoodFactsLanguage.NORWEGIAN:
        return 'no';
        break;
      case OpenFoodFactsLanguage.SUNDANESE_LANGUAGE:
        return 'su';
        break;
      case OpenFoodFactsLanguage.GEORGIAN:
        return 'ka';
        break;
      case OpenFoodFactsLanguage.HAUSA:
        return 'ha';
        break;
      case OpenFoodFactsLanguage.TSWANA:
        return 'tn';
        break;
      case OpenFoodFactsLanguage.CATALAN:
        return 'ca';
        break;
      case OpenFoodFactsLanguage.NDONGA_DIALECT:
        return 'ng';
        break;
      case OpenFoodFactsLanguage.IGBO_LANGUAGE:
        return 'ig';
        break;
      case OpenFoodFactsLanguage.AFRIKAANS:
        return 'af';
        break;
      case OpenFoodFactsLanguage.POLISH:
        return 'pl';
        break;
      case OpenFoodFactsLanguage.KASHMIRI:
        return 'ks';
        break;
      case OpenFoodFactsLanguage.MAORI:
        return 'mi';
        break;
      case OpenFoodFactsLanguage.HUNGARIAN:
        return 'hu';
        break;
      case OpenFoodFactsLanguage.BRETON:
        return 'br';
        break;
      case OpenFoodFactsLanguage.PORTUGUESE:
        return 'pt';
        break;
      case OpenFoodFactsLanguage.BULGARIAN:
        return 'bg';
        break;
      case OpenFoodFactsLanguage.AVESTAN:
        return 'ae';
        break;
      case OpenFoodFactsLanguage.NEPALI:
        return 'ne';
        break;
      case OpenFoodFactsLanguage.TWI:
        return 'tw';
        break;
      case OpenFoodFactsLanguage.UZBEK:
        return 'uz';
        break;
      case OpenFoodFactsLanguage.CHAMORRO:
        return 'ch';
        break;
      case OpenFoodFactsLanguage.GUARANI:
        return 'gn';
        break;
      case OpenFoodFactsLanguage.NYNORSK:
        return 'nn';
        break;
      case OpenFoodFactsLanguage.AZERBAIJANI:
        return 'az';
        break;
      case OpenFoodFactsLanguage.CZECH:
        return 'cs';
        break;
      case OpenFoodFactsLanguage.NAVAJO:
        return 'nv';
        break;
      case OpenFoodFactsLanguage.FINNISH:
        return 'fi';
        break;
      case OpenFoodFactsLanguage.LUXEMBOURGISH:
        return 'lb';
        break;
      case OpenFoodFactsLanguage.SWEDISH:
        return 'sv';
        break;
      case OpenFoodFactsLanguage.YIDDISH:
        return 'yi';
        break;
      case OpenFoodFactsLanguage.INUKTITUT:
        return 'iu';
        break;
      case OpenFoodFactsLanguage.LAO:
        return 'lo';
        break;
      case OpenFoodFactsLanguage.CHUVASH:
        return 'cv';
        break;
      case OpenFoodFactsLanguage.MALTESE:
        return 'mt';
        break;
      case OpenFoodFactsLanguage.MALDIVIAN_LANGUAGE:
        return 'dv';
        break;
      case OpenFoodFactsLanguage.INTERLINGUE:
        return 'ie';
        break;
      case OpenFoodFactsLanguage.OSSETIAN:
        return 'os';
        break;
      case OpenFoodFactsLanguage.BASHKIR:
        return 'ba';
        break;
      case OpenFoodFactsLanguage.OJIBWE:
        return 'oj';
        break;
      case OpenFoodFactsLanguage.KANURI:
        return 'kr';
        break;
      case OpenFoodFactsLanguage.INDONESIAN:
        return 'id';
        break;
      case OpenFoodFactsLanguage.SARDINIAN_LANGUAGE:
        return 'sc';
        break;
      case OpenFoodFactsLanguage.AKAN:
        return 'ak';
        break;
      case OpenFoodFactsLanguage.MANX:
        return 'gv';
        break;
      case OpenFoodFactsLanguage.TURKISH:
        return 'tr';
        break;
      case OpenFoodFactsLanguage.ESPERANTO:
        return 'eo';
        break;
      case OpenFoodFactsLanguage.PASHTO:
        return 'ps';
        break;
      case OpenFoodFactsLanguage.KYRGYZ:
        return 'ky';
        break;
      case OpenFoodFactsLanguage.VOLAPUK:
        return 'vo';
        break;
      case OpenFoodFactsLanguage.AVAR:
        return 'av';
        break;
      case OpenFoodFactsLanguage.SANGO:
        return 'sg';
        break;
      case OpenFoodFactsLanguage.VENDA:
        return 've';
        break;
      case OpenFoodFactsLanguage.ALBANIAN:
        return 'sq';
        break;
      case OpenFoodFactsLanguage.BASQUE:
        return 'eu';
        break;
      case OpenFoodFactsLanguage.FULA_LANGUAGE:
        return 'ff';
        break;
      case OpenFoodFactsLanguage.GERMAN:
        return 'de';
        break;
      case OpenFoodFactsLanguage.LATVIAN:
        return 'lv';
        break;
      case OpenFoodFactsLanguage.CORNISH:
        return 'kw';
        break;
      case OpenFoodFactsLanguage.PALI:
        return 'pi';
        break;
      case OpenFoodFactsLanguage.TATAR:
        return 'tt';
        break;
      case OpenFoodFactsLanguage.ROMANIAN:
        return 'ro';
        break;
      case OpenFoodFactsLanguage.GIKUYU:
        return 'ki';
        break;
      case OpenFoodFactsLanguage.TIGRINYA:
        return 'ti';
        break;
      case OpenFoodFactsLanguage.GALICIAN:
        return 'gl';
        break;
      case OpenFoodFactsLanguage.TELUGU:
        return 'te';
        break;
      case OpenFoodFactsLanguage.HINDI:
        return 'hi';
        break;
      case OpenFoodFactsLanguage.KONGO_LANGUAGE:
        return 'kg';
        break;
      case OpenFoodFactsLanguage.XHOSA:
        return 'xh';
        break;
      case OpenFoodFactsLanguage.SWAZI:
        return 'ss';
        break;
      case OpenFoodFactsLanguage.LUGANDA:
        return 'lg';
        break;
      case OpenFoodFactsLanguage.URDU:
        return 'ur';
        break;
      case OpenFoodFactsLanguage.NORTHERN_NDEBELE_LANGUAGE:
        return 'nd';
        break;
      case OpenFoodFactsLanguage.YORUBA:
        return 'yo';
        break;
      case OpenFoodFactsLanguage.WORLD:
        return 'world';
        break;
      case OpenFoodFactsLanguage.UNDEFINED:
        return '-';
        break;
      default:
        return '-';
        break;
    }
  }
}

class LanguageHelper {
  static String toJson(OpenFoodFactsLanguage language) {
    return language.code;
  }

  static OpenFoodFactsLanguage fromJson(String code) {
    for (OpenFoodFactsLanguage language in OpenFoodFactsLanguage.values) {
      if (code == language.code) {
        return language;
      }
    }
    return OpenFoodFactsLanguage.UNDEFINED;
  }
}
