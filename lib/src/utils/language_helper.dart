import '../model/off_tagged.dart';

/// Available languages
///
/// cf. https://en.wikipedia.org/wiki/List_of_ISO_639-2_codes
enum OpenFoodFactsLanguage implements OffTagged {
  /// English
  ENGLISH(
    offTag: 'en',
    iso3Code: 'ENG',
    nativeName: 'English',
    englishName: 'English',
  ),

  /// Old Church Slavonic
  OLD_CHURCH_SLAVONIC(
    offTag: 'cu',
    iso3Code: 'CHU',
    nativeName: 'Славе́нскїй ѧ҆зы́къ',
    englishName: 'Church Slavic',
  ),

  /// Dzongkha
  DZONGKHA_LANGUAGE(
    offTag: 'dz',
    iso3Code: 'DZO',
    nativeName: 'རྫོང་ཁ་',
    englishName: 'Dzongkha',
  ),

  /// Japanese
  JAPANESE(
    offTag: 'ja',
    iso3Code: 'JPN',
    nativeName: '日本語',
    englishName: 'Japanese',
  ),

  /// Malay
  MALAY(
    offTag: 'ms',
    iso3Code: 'MSA',
    nativeName: 'Bahasa Melayu',
    englishName: 'Malay',
  ),

  /// Tagalog
  TAGALOG(
    offTag: 'tl',
    iso3Code: 'TGL',
    nativeName: 'Wikang Tagalog',
    englishName: 'Tagalog',
  ),

  /// Moldovan
  MOLDOVAN(offTag: 'mo', iso3Code: null, nativeName: null, englishName: null),

  /// Mongolian
  MONGOLIAN(
    offTag: 'mn',
    iso3Code: 'MON',
    nativeName: 'ᠮᠣᠩᠭᠣᠯ ᠬᠡᠯᠡ',
    englishName: 'Mongolian',
  ),

  /// Korean
  KOREAN(
    offTag: 'ko',
    iso3Code: 'KOR',
    nativeName: '한국어',
    englishName: 'Korean',
  ),

  /// Luba-Katanga
  LUBA_KATANGA_LANGUAGE(
    offTag: 'lu',
    iso3Code: 'LUB',
    nativeName: 'Kiluba',
    englishName: 'Luba-Katanga',
  ),

  /// Kazakh
  KAZAKH(
    offTag: 'kk',
    iso3Code: 'KAZ',
    nativeName: 'Қазақ тілі',
    englishName: 'Kazakh',
  ),

  /// Quechua
  QUECHUA_LANGUAGES(
    offTag: 'qu',
    iso3Code: 'QUE',
    nativeName: 'Runa simi',
    englishName: 'Quechua',
  ),

  /// Ukrainian
  UKRAINIAN(
    offTag: 'uk',
    iso3Code: 'UKR',
    nativeName: 'Українська мова',
    englishName: 'Ukrainian',
  ),

  /// Occitan
  OCCITAN(
    offTag: 'oc',
    iso3Code: 'OCI',
    nativeName: 'Occitan',
    englishName: 'Occitan',
  ),

  /// Bihari
  BIHARI_LANGUAGES(
    offTag: 'bh',
    iso3Code: null,
    nativeName: null,
    englishName: null,
  ),

  /// South Ndebele
  SOUTHERN_NDEBELE(
    offTag: 'nr',
    iso3Code: 'NBL',
    nativeName: 'isiNdebele seSewula',
    englishName: 'South Ndebele',
  ),

  /// Bokmal
  BOKMAL(
    offTag: 'nb',
    iso3Code: 'NOB',
    nativeName: 'Norsk Bokmål',
    englishName: 'Norwegian Bokmål',
  ),

  /// Komi
  KOMI(
    offTag: 'kv',
    iso3Code: 'KOM',
    nativeName: 'Коми кыв',
    englishName: 'Komi',
  ),

  /// Modern Greek
  MODERN_GREEK(
    offTag: 'el',
    iso3Code: 'ELL',
    nativeName: 'Ελληνικά',
    englishName: 'Greek',
  ),

  /// Fijian
  FIJIAN_LANGUAGE(
    offTag: 'fj',
    iso3Code: 'FIJ',
    nativeName: 'Na Vosa Vakaviti',
    englishName: 'Fijian',
  ),

  /// Zulu
  ZULU(
    offTag: 'zu',
    iso3Code: 'ZUL',
    nativeName: 'isiZulu',
    englishName: 'Zulu',
  ),

  /// Ido
  IDO(offTag: 'io', iso3Code: 'IDO', nativeName: 'Ido', englishName: 'Ido'),

  /// Khmer
  KHMER(
    offTag: 'km',
    iso3Code: 'KHM',
    nativeName: 'ភាសាខ្មែរ',
    englishName: 'Khmer',
  ),

  /// Sanskrit
  SANSKRIT(
    offTag: 'sa',
    iso3Code: 'SAN',
    nativeName: 'संस्कृतम् Sąskŕtam',
    englishName: 'Sanskrit',
  ),

  /// Macedonian
  MACEDONIAN(
    offTag: 'mk',
    iso3Code: 'MKD',
    nativeName: 'Македонски јазик',
    englishName: 'Macedonian',
  ),

  /// Sotho
  SOTHO(
    offTag: 'st',
    iso3Code: 'SOT',
    nativeName: 'Sesotho',
    englishName: 'Sotho, Southern',
  ),

  /// Scottish Gaelic
  SCOTTISH_GAELIC(
    offTag: 'gd',
    iso3Code: 'GLA',
    nativeName: 'Gàidhlig',
    englishName: 'Gaelic',
  ),

  /// Marathi
  MARATHI(
    offTag: 'mr',
    iso3Code: 'MAR',
    nativeName: 'मराठी',
    englishName: 'Marathi',
  ),

  /// Nauruan
  NAURUAN(
    offTag: 'na',
    iso3Code: 'NAU',
    nativeName: 'dorerin Naoero',
    englishName: 'Nauru',
  ),

  /// Oromo
  OROMO(
    offTag: 'om',
    iso3Code: 'ORM',
    nativeName: 'Afaan Oromoo',
    englishName: 'Oromo',
  ),

  /// Welsh
  WELSH(
    offTag: 'cy',
    iso3Code: 'CYM',
    nativeName: 'Cymraeg',
    englishName: 'Welsh',
  ),

  /// Vietnamese
  VIETNAMESE(
    offTag: 'vi',
    iso3Code: 'VIE',
    nativeName: 'Tiếng Việt',
    englishName: 'Vietnamese',
  ),

  /// Bislama
  BISLAMA(
    offTag: 'bi',
    iso3Code: 'BIS',
    nativeName: 'Bislama',
    englishName: 'Bislama',
  ),

  /// Somali
  SOMALI(
    offTag: 'so',
    iso3Code: 'SOM',
    nativeName: 'af Soomaali',
    englishName: 'Somali',
  ),

  /// Lithuanian
  LITHUANIAN(
    offTag: 'lt',
    iso3Code: 'LIT',
    nativeName: 'Lietuvių kalba',
    englishName: 'Lithuanian',
  ),

  /// Haitian Creole
  HAITIAN_CREOLE(
    offTag: 'ht',
    iso3Code: 'HAT',
    nativeName: 'Kreyòl Ayisyen',
    englishName: 'Haitian',
  ),

  /// Malagasy
  MALAGASY(
    offTag: 'mg',
    iso3Code: 'MLG',
    nativeName: 'مَلَغَسِ',
    englishName: 'Malagasy',
  ),

  /// Spanish
  SPANISH(
    offTag: 'es',
    iso3Code: 'SPA',
    nativeName: 'Español',
    englishName: 'Spanish',
  ),

  /// Danish
  DANISH(
    offTag: 'da',
    iso3Code: 'DAN',
    nativeName: 'Dansk',
    englishName: 'Danish',
  ),

  /// Slovenian
  SLOVENE(
    offTag: 'sl',
    iso3Code: 'SLV',
    nativeName: 'Slovenščina',
    englishName: 'Slovenian',
  ),

  /// Icelandic
  ICELANDIC(
    offTag: 'is',
    iso3Code: 'ISL',
    nativeName: 'Íslenska',
    englishName: 'Icelandic',
  ),

  /// Estonian
  ESTONIAN(
    offTag: 'et',
    iso3Code: 'EST',
    nativeName: 'Eesti keel',
    englishName: 'Estonian',
  ),

  /// Wolof
  WOLOF(
    offTag: 'wo',
    iso3Code: 'WOL',
    nativeName: 'Wolof làkk',
    englishName: 'Wolof',
  ),

  /// Hiri Motu
  HIRI_MOTU(
    offTag: 'ho',
    iso3Code: 'HMO',
    nativeName: 'Police Motu',
    englishName: 'Hiri Motu',
  ),

  /// Tamil
  TAMIL(
    offTag: 'ta',
    iso3Code: 'TAM',
    nativeName: 'தமிழ்',
    englishName: 'Tamil',
  ),

  /// Slovak
  SLOVAK(
    offTag: 'sk',
    iso3Code: 'SLK',
    nativeName: 'Slovenčina',
    englishName: 'Slovak',
  ),

  /// Herero
  HERERO(
    offTag: 'hz',
    iso3Code: 'HER',
    nativeName: 'Otjiherero',
    englishName: 'Herero',
  ),

  /// Italian
  ITALIAN(
    offTag: 'it',
    iso3Code: 'ITA',
    nativeName: 'Italiano',
    englishName: 'Italian',
  ),

  /// Irish
  IRISH(
    offTag: 'ga',
    iso3Code: 'GLE',
    nativeName: 'Gaeilge',
    englishName: 'Irish',
  ),

  /// Shona
  SHONA(
    offTag: 'sn',
    iso3Code: 'SNA',
    nativeName: 'chiShona',
    englishName: 'Shona',
  ),

  /// Marshallese
  MARSHALLESE(
    offTag: 'mh',
    iso3Code: 'MAH',
    nativeName: 'Kajin M̧ajeļ',
    englishName: 'Marshallese',
  ),

  /// French
  FRENCH(
    offTag: 'fr',
    iso3Code: 'FRA',
    nativeName: 'Français',
    englishName: 'French',
  ),

  /// Aymara
  AYMARA(
    offTag: 'ay',
    iso3Code: 'AYM',
    nativeName: 'Aymar aru',
    englishName: 'Aymara',
  ),

  /// Hebrew
  HEBREW(
    offTag: 'he',
    iso3Code: 'HEB',
    nativeName: 'עברית',
    englishName: 'Hebrew',
  ),

  /// Northern Sami
  NORTHERN_SAMI(
    offTag: 'se',
    iso3Code: 'SME',
    nativeName: 'Davvisámegiella',
    englishName: 'Northern Sami',
  ),

  /// Bengali
  BENGALI(
    offTag: 'bn',
    iso3Code: 'BEN',
    nativeName: 'বাংলা',
    englishName: 'Bengali',
  ),

  /// Oriya
  ODIA(
    offTag: 'or',
    iso3Code: 'ORI',
    nativeName: 'ଓଡ଼ିଆ',
    englishName: 'Oriya',
  ),

  /// Malayalam
  MALAYALAM(
    offTag: 'ml',
    iso3Code: 'MAL',
    nativeName: 'മലയാളം',
    englishName: 'Malayalam',
  ),

  /// Dutch
  DUTCH(
    offTag: 'nl',
    iso3Code: 'NLD',
    nativeName: 'Nederlands',
    englishName: 'Dutch',
  ),

  /// Uyghur
  UYGHUR(
    offTag: 'ug',
    iso3Code: 'UIG',
    nativeName: 'ئۇيغۇر تىلى',
    englishName: 'Uighur',
  ),

  /// Serbian
  SERBIAN(
    offTag: 'sr',
    iso3Code: 'SRP',
    nativeName: 'Ссрпски',
    englishName: 'Serbian',
  ),

  /// Tibetan
  TIBETAN_LANGUAGE(
    offTag: 'bo',
    iso3Code: 'BOD',
    nativeName: 'བོད་སྐད་',
    englishName: 'Tibetan',
  ),

  /// Belarusian
  BELARUSIAN(
    offTag: 'be',
    iso3Code: 'BEL',
    nativeName: 'Беларуская мова',
    englishName: 'Belarusian',
  ),

  /// Samoan
  SAMOAN(
    offTag: 'sm',
    iso3Code: 'SMO',
    nativeName: 'Gagana faʻa Sāmoa',
    englishName: 'Samoan',
  ),

  /// Punjabi
  PUNJABI(
    offTag: 'pa',
    iso3Code: 'PAN',
    nativeName: 'ਪੰਜਾਬੀ',
    englishName: 'Panjabi',
  ),

  /// Russian
  RUSSIAN(
    offTag: 'ru',
    iso3Code: 'RUS',
    nativeName: 'Русский язык',
    englishName: 'Russian',
  ),

  /// Tahitian
  TAHITIAN(
    offTag: 'ty',
    iso3Code: 'TAH',
    nativeName: 'Reo Tahiti',
    englishName: 'Tahitian',
  ),

  /// Interlingua
  INTERLINGUA(
    offTag: 'ia',
    iso3Code: 'INA',
    nativeName: 'Interlingua',
    englishName: 'Interlingua',
  ),

  /// Afar
  AFAR(
    offTag: 'aa',
    iso3Code: 'AAR',
    nativeName: 'Qafaraf',
    englishName: 'Afar',
  ),

  /// Greenlandic
  GREENLANDIC(
    offTag: 'kl',
    iso3Code: 'KAL',
    nativeName: 'Kalaallisut',
    englishName: 'Kalaallisut',
  ),

  /// Latin
  LATIN(
    offTag: 'la',
    iso3Code: 'LAT',
    nativeName: 'Lingua latīna',
    englishName: 'Latin',
  ),

  /// Chinese
  CHINESE(
    offTag: 'zh',
    iso3Code: 'ZHO',
    nativeName: '中文',
    englishName: 'Chinese',
  ),

  /// Turkmen
  TURKMEN(
    offTag: 'tk',
    iso3Code: 'TUK',
    nativeName: 'Türkmençe',
    englishName: 'Turkmen',
  ),

  /// West Frisian
  WEST_FRISIAN(
    offTag: 'fy',
    iso3Code: 'FRY',
    nativeName: 'Frysk',
    englishName: 'Western Frisian',
  ),

  /// Tsonga
  TSONGA(
    offTag: 'ts',
    iso3Code: 'TSO',
    nativeName: 'Xitsonga',
    englishName: 'Tsonga',
  ),

  /// Romansh
  ROMANSH(
    offTag: 'rm',
    iso3Code: 'ROH',
    nativeName: 'Rumantsch',
    englishName: 'Romansh',
  ),

  /// Inupiaq
  INUPIAT_LANGUAGE(
    offTag: 'ik',
    iso3Code: 'IPK',
    nativeName: 'Iñupiaq',
    englishName: 'Inupiaq',
  ),

  /// Tajik
  TAJIK(
    offTag: 'tg',
    iso3Code: 'TGK',
    nativeName: 'Тоҷикӣ',
    englishName: 'Tajik',
  ),

  /// Burmese
  BURMESE(
    offTag: 'my',
    iso3Code: 'MYA',
    nativeName: 'မြန်မာစာ',
    englishName: 'Burmese',
  ),

  /// Javanese
  JAVANESE(
    offTag: 'jv',
    iso3Code: 'JAV',
    nativeName: 'ꦧꦱꦗꦮ',
    englishName: 'Javanese',
  ),

  /// Chechen
  CHECHEN(
    offTag: 'ce',
    iso3Code: 'CHE',
    nativeName: 'Нохчийн мотт',
    englishName: 'Chechen',
  ),

  /// Assamese
  ASSAMESE(
    offTag: 'as',
    iso3Code: 'ASM',
    nativeName: 'অসমীয়া',
    englishName: 'Assamese',
  ),

  /// Unknown language
  UNKNOWN_LANGUAGE(
    offTag: 'xx',
    iso3Code: null,
    nativeName: null,
    englishName: null,
  ),

  /// Arabic
  ARABIC(
    offTag: 'ar',
    iso3Code: 'ARA',
    nativeName: 'العربية',
    englishName: 'Arabic',
  ),

  /// Kinyarmanda
  KINYARWANDA(
    offTag: 'rw',
    iso3Code: 'KIN',
    nativeName: 'Ikinyarwanda',
    englishName: 'Kinyarwanda',
  ),

  /// Tonga
  TONGAN_LANGUAGE(
    offTag: 'to',
    iso3Code: 'TON',
    nativeName: 'lea faka-Tonga',
    englishName: 'Tonga',
  ),

  /// Church Slavonic
  ///
  /// Same as OLD_CHURCH_SLAVONIC
  CHURCH_SLAVONIC(
    offTag: 'cu',
    iso3Code: 'CHU',
    nativeName: 'Славе́нскїй ѧ҆зы́къ',
    englishName: 'Church Slavic',
  ),

  /// Sinhala
  SINHALA(
    offTag: 'si',
    iso3Code: 'SIN',
    nativeName: 'සිංහල',
    englishName: 'Sinhala',
  ),

  /// Armenian
  ARMENIAN(
    offTag: 'hy',
    iso3Code: 'HYE',
    nativeName: 'Հայերէն',
    englishName: 'Armenian',
  ),

  /// Kurdish
  KURDISH(
    offTag: 'ku',
    iso3Code: 'KUR',
    nativeName: 'کوردی',
    englishName: 'Kurdish',
  ),

  /// Thai
  THAI(
    offTag: 'th',
    iso3Code: 'THA',
    nativeName: 'ภาษาไทย',
    englishName: 'Thai',
  ),

  /// Cree
  CREE(
    offTag: 'cr',
    iso3Code: 'CRE',
    nativeName: 'ᓀᐦᐃᔭᐍᐏᐣ',
    englishName: 'Cree',
  ),

  /// Swahili
  SWAHILI(
    offTag: 'sw',
    iso3Code: 'SWA',
    nativeName: 'Kiswahili',
    englishName: 'Swahili',
  ),

  /// Gujarati
  GUJARATI(
    offTag: 'gu',
    iso3Code: 'GUJ',
    nativeName: 'ગુજરાતી',
    englishName: 'Gujarati',
  ),

  /// Persian
  PERSIAN(
    offTag: 'fa',
    iso3Code: 'FAS',
    nativeName: 'فارسی',
    englishName: 'Persian',
  ),

  /// Bosnian
  BOSNIAN(
    offTag: 'bs',
    iso3Code: 'BOS',
    nativeName: 'Bosanski',
    englishName: 'Bosnian',
  ),

  /// Amharic
  AMHARIC(
    offTag: 'am',
    iso3Code: 'AMH',
    nativeName: 'አማርኛ',
    englishName: 'Amharic',
  ),

  /// Aragonese
  ARAGONESE(
    offTag: 'an',
    iso3Code: 'ARG',
    nativeName: 'Aragonés',
    englishName: 'Aragonese',
  ),

  /// Croatian
  CROATIAN(
    offTag: 'hr',
    iso3Code: 'HRV',
    nativeName: 'Hrvatski jezik',
    englishName: 'Croatian',
  ),

  /// Chewa
  CHEWA(
    offTag: 'ny',
    iso3Code: 'NYA',
    nativeName: 'Chichewa',
    englishName: 'Chichewa',
  ),

  /// Zhuang
  ZHUANG_LANGUAGES(
    offTag: 'za',
    iso3Code: 'ZHA',
    nativeName: '話僮',
    englishName: 'Zhuang',
  ),

  /// Lingala
  LINGALA_LANGUAGE(
    offTag: 'ln',
    iso3Code: 'LIN',
    nativeName: 'Lingála',
    englishName: 'Lingala',
  ),

  /// Bambara
  BAMBARA(
    offTag: 'bm',
    iso3Code: 'BAM',
    nativeName: 'ߓߡߊߣߊ߲ߞߊ߲',
    englishName: 'Bambara',
  ),

  /// Limburgan
  LIMBURGISH_LANGUAGE(
    offTag: 'li',
    iso3Code: 'LIM',
    nativeName: 'Lèmburgs',
    englishName: 'Limburgan',
  ),

  /// Nuosu
  NUOSU_LANGUAGE(
    offTag: 'ii',
    iso3Code: 'III',
    nativeName: 'ꆈꌠꉙ',
    englishName: 'Sichuan Yi',
  ),

  /// Kwanyama
  KWANYAMA(
    offTag: 'kj',
    iso3Code: 'KUA',
    nativeName: 'Oshikwanyama',
    englishName: 'Kuanyama',
  ),

  /// Kirundi
  KIRUNDI(
    offTag: 'rn',
    iso3Code: 'RUN',
    nativeName: 'Ikirundi',
    englishName: 'Rundi',
  ),

  /// Ewe
  EWE(offTag: 'ee', iso3Code: 'EWE', nativeName: 'Èʋegbe', englishName: 'Ewe'),

  /// Faorese
  FAROESE(
    offTag: 'fo',
    iso3Code: 'FAO',
    nativeName: 'Føroyskt',
    englishName: 'Faroese',
  ),

  /// Sindhi
  SINDHI(
    offTag: 'sd',
    iso3Code: 'SND',
    nativeName: 'सिन्धी',
    englishName: 'Sindhi',
  ),

  /// Corsican
  CORSICAN(
    offTag: 'co',
    iso3Code: 'COS',
    nativeName: 'Corsu',
    englishName: 'Corsican',
  ),

  /// Kannada
  KANNADA(
    offTag: 'kn',
    iso3Code: 'KAN',
    nativeName: 'ಕನ್ನಡ',
    englishName: 'Kannada',
  ),

  /// Norwegian
  NORWEGIAN(
    offTag: 'no',
    iso3Code: 'NOR',
    nativeName: 'Norsk',
    englishName: 'Norwegian',
  ),

  /// Sundanese
  SUNDANESE_LANGUAGE(
    offTag: 'su',
    iso3Code: 'SUN',
    nativeName: 'ᮘᮞ ᮞᮥᮔ᮪ᮓ',
    englishName: 'Sundanese',
  ),

  /// Georgian
  GEORGIAN(
    offTag: 'ka',
    iso3Code: 'KAT',
    nativeName: 'ქართული',
    englishName: 'Georgian',
  ),

  /// Hausa
  HAUSA(
    offTag: 'ha',
    iso3Code: 'HAU',
    nativeName: 'Harshen Hausa',
    englishName: 'Hausa',
  ),

  /// Tswana
  TSWANA(
    offTag: 'tn',
    iso3Code: 'TSN',
    nativeName: 'Setswana',
    englishName: 'Tswana',
  ),

  /// Catalan
  CATALAN(
    offTag: 'ca',
    iso3Code: 'CAT',
    nativeName: 'Català',
    englishName: 'Catalan',
  ),

  /// Ndonga
  NDONGA_DIALECT(
    offTag: 'ng',
    iso3Code: 'NDO',
    nativeName: 'Ndonga',
    englishName: 'Ndonga',
  ),

  /// Igbo
  IGBO_LANGUAGE(
    offTag: 'ig',
    iso3Code: 'IBO',
    nativeName: 'Asụsụ Igbo',
    englishName: 'Igbo',
  ),

  /// Afrikaans
  AFRIKAANS(
    offTag: 'af',
    iso3Code: 'AFR',
    nativeName: 'Afrikaans',
    englishName: 'Afrikaans',
  ),

  /// Polish
  POLISH(
    offTag: 'pl',
    iso3Code: 'POL',
    nativeName: 'Język polski',
    englishName: 'Polish',
  ),

  /// Kashmiri
  KASHMIRI(
    offTag: 'ks',
    iso3Code: 'KAS',
    nativeName: 'कॉशुर',
    englishName: 'Kashmiri',
  ),

  /// Maori
  MAORI(
    offTag: 'mi',
    iso3Code: 'MRI',
    nativeName: 'Te Reo Māori',
    englishName: 'Maori',
  ),

  /// Hungarian
  HUNGARIAN(
    offTag: 'hu',
    iso3Code: 'HUN',
    nativeName: 'Magyar nyelv',
    englishName: 'Hungarian',
  ),

  /// Breton
  BRETON(
    offTag: 'br',
    iso3Code: 'BRE',
    nativeName: 'Brezhoneg',
    englishName: 'Breton',
  ),

  /// Portuguese
  PORTUGUESE(
    offTag: 'pt',
    iso3Code: 'POR',
    nativeName: 'Português',
    englishName: 'Portuguese',
  ),

  /// Bulgarian
  BULGARIAN(
    offTag: 'bg',
    iso3Code: 'BUL',
    nativeName: 'български език',
    englishName: 'Bulgarian',
  ),

  /// Avestan
  AVESTAN(
    offTag: 'ae',
    iso3Code: 'AVE',
    nativeName: 'Avestan',
    englishName: 'Avestan',
  ),

  /// Nepali
  NEPALI(
    offTag: 'ne',
    iso3Code: 'NEP',
    nativeName: 'नेपाली',
    englishName: 'Nepali',
  ),

  /// Twi
  TWI(offTag: 'tw', iso3Code: 'TWI', nativeName: 'Twi', englishName: 'Twi'),

  /// Uzbek
  UZBEK(
    offTag: 'uz',
    iso3Code: 'UZB',
    nativeName: 'Oʻzbekcha',
    englishName: 'Uzbek',
  ),

  /// Chamorro
  CHAMORRO(
    offTag: 'ch',
    iso3Code: 'CHA',
    nativeName: "Finu' Chamoru",
    englishName: 'Chamorro',
  ),

  /// Guarani
  GUARANI(
    offTag: 'gn',
    iso3Code: 'GRN',
    nativeName: "Avañe'ẽ",
    englishName: 'Guarani',
  ),

  /// Nynorsk
  NYNORSK(
    offTag: 'nn',
    iso3Code: 'NNO',
    nativeName: 'Norsk Nynorsk',
    englishName: 'Norwegian Nynorsk',
  ),

  /// Azerbaijani
  AZERBAIJANI(
    offTag: 'az',
    iso3Code: 'AZE',
    nativeName: 'Azərbaycan dili',
    englishName: 'Azerbaijani',
  ),

  /// Czech
  CZECH(
    offTag: 'cs',
    iso3Code: 'CES',
    nativeName: 'Čeština',
    englishName: 'Czech',
  ),

  /// Navajo
  NAVAJO(
    offTag: 'nv',
    iso3Code: 'NAV',
    nativeName: 'Diné bizaad',
    englishName: 'Navajo',
  ),

  /// Finnish
  FINNISH(
    offTag: 'fi',
    iso3Code: 'FIN',
    nativeName: 'suomen kieli',
    englishName: 'Finnish',
  ),

  /// Luxembourgish
  LUXEMBOURGISH(
    offTag: 'lb',
    iso3Code: 'LTZ',
    nativeName: 'Lëtzebuergesch',
    englishName: 'Luxembourgish',
  ),

  /// Swedish
  SWEDISH(
    offTag: 'sv',
    iso3Code: 'SWE',
    nativeName: 'Svenska',
    englishName: 'Swedish',
  ),

  /// Yiddish
  YIDDISH(
    offTag: 'yi',
    iso3Code: 'YID',
    nativeName: 'ייִדיש',
    englishName: 'Yiddish',
  ),

  /// Inuktitut
  INUKTITUT(
    offTag: 'iu',
    iso3Code: 'IKU',
    nativeName: 'ᐃᓄᒃᑎᑐᑦ',
    englishName: 'Inuktitut',
  ),

  /// Lao
  LAO(offTag: 'lo', iso3Code: 'LAO', nativeName: 'ພາສາລາວ', englishName: 'Lao'),

  /// Chuvash
  CHUVASH(
    offTag: 'cv',
    iso3Code: 'CHV',
    nativeName: 'Чӑвашла',
    englishName: 'Chuvash',
  ),

  /// Maltese
  MALTESE(
    offTag: 'mt',
    iso3Code: 'MLT',
    nativeName: 'Malti',
    englishName: 'Maltese',
  ),

  /// Maldivian
  MALDIVIAN_LANGUAGE(
    offTag: 'dv',
    iso3Code: 'DIV',
    nativeName: 'ދިވެހި ދިވެހިބަސް',
    englishName: 'Divehi',
  ),

  /// Interlingue
  INTERLINGUE(
    offTag: 'ie',
    iso3Code: 'ILE',
    nativeName: 'Interlingue',
    englishName: 'Interlingue',
  ),

  /// Ossetian
  OSSETIAN(
    offTag: 'os',
    iso3Code: 'OSS',
    nativeName: 'Ирон ӕвзаг',
    englishName: 'Ossetian',
  ),

  /// Bashkir
  BASHKIR(
    offTag: 'ba',
    iso3Code: 'BAK',
    nativeName: 'Башҡорт теле',
    englishName: 'Bashkir',
  ),

  /// Ojibwe
  OJIBWE(
    offTag: 'oj',
    iso3Code: 'OJI',
    nativeName: 'ᐊᓂᐦᔑᓈᐯᒧᐎᓐ',
    englishName: 'Ojibwa',
  ),

  /// Kanuri
  KANURI(
    offTag: 'kr',
    iso3Code: 'KAU',
    nativeName: 'Kànùrí',
    englishName: 'Kanuri',
  ),

  /// Indonesian
  INDONESIAN(
    offTag: 'id',
    iso3Code: 'IND',
    nativeName: 'bahasa Indonesia',
    englishName: 'Indonesian',
  ),

  /// Sardinian
  SARDINIAN_LANGUAGE(
    offTag: 'sc',
    iso3Code: 'SRD',
    nativeName: 'Sardu',
    englishName: 'Sardinian',
  ),

  /// Akan
  AKAN(offTag: 'ak', iso3Code: 'AKA', nativeName: 'Akan', englishName: 'Akan'),

  /// Manx
  MANX(offTag: 'gv', iso3Code: 'GLV', nativeName: 'Gaelg', englishName: 'Manx'),

  /// Turkish
  TURKISH(
    offTag: 'tr',
    iso3Code: 'TUR',
    nativeName: 'Türkçe',
    englishName: 'Turkish',
  ),

  /// Esperanto
  ESPERANTO(
    offTag: 'eo',
    iso3Code: 'EPO',
    nativeName: 'Esperanto',
    englishName: 'Esperanto',
  ),

  /// Pashto
  PASHTO(
    offTag: 'ps',
    iso3Code: 'PUS',
    nativeName: 'پښتو',
    englishName: 'Pushto',
  ),

  /// Kyrgyz
  KYRGYZ(
    offTag: 'ky',
    iso3Code: 'KIR',
    nativeName: 'Кыргызча',
    englishName: 'Kirghiz',
  ),

  /// Volapuk
  VOLAPUK(
    offTag: 'vo',
    iso3Code: 'VOL',
    nativeName: 'Volapük',
    englishName: 'Volapük',
  ),

  /// Avar
  AVAR(
    offTag: 'av',
    iso3Code: 'AVA',
    nativeName: 'Авар мацӏ',
    englishName: 'Avaric',
  ),

  /// Sango
  SANGO(
    offTag: 'sg',
    iso3Code: 'SAG',
    nativeName: 'yângâ tî Sängö',
    englishName: 'Sango',
  ),

  /// Venda
  VENDA(
    offTag: 've',
    iso3Code: 'VEN',
    nativeName: 'Tshivenḓa',
    englishName: 'Venda',
  ),

  /// Albanian
  ALBANIAN(
    offTag: 'sq',
    iso3Code: 'SQI',
    nativeName: 'Shqip',
    englishName: 'Albanian',
  ),

  /// Basque
  BASQUE(
    offTag: 'eu',
    iso3Code: 'EUS',
    nativeName: 'Euskara',
    englishName: 'Basque',
  ),

  /// Fulah
  FULA_LANGUAGE(
    offTag: 'ff',
    iso3Code: 'FUL',
    nativeName: 'Fulfulde',
    englishName: 'Fulah',
  ),

  /// German
  GERMAN(
    offTag: 'de',
    iso3Code: 'DEU',
    nativeName: 'Deutsch',
    englishName: 'German',
  ),

  /// Latvian
  LATVIAN(
    offTag: 'lv',
    iso3Code: 'LAV',
    nativeName: 'Latviešu valoda',
    englishName: 'Latvian',
  ),

  /// Cornish
  CORNISH(
    offTag: 'kw',
    iso3Code: 'COR',
    nativeName: 'Kernowek',
    englishName: 'Cornish',
  ),

  /// Pali
  PALI(offTag: 'pi', iso3Code: 'PLI', nativeName: 'Pāli', englishName: 'Pali'),

  /// Tatar
  TATAR(
    offTag: 'tt',
    iso3Code: 'TAT',
    nativeName: 'Татар теле',
    englishName: 'Tatar',
  ),

  /// Romanian
  ROMANIAN(
    offTag: 'ro',
    iso3Code: 'RON',
    nativeName: 'limba Română',
    englishName: 'Romanian',
  ),

  /// Gikuyu
  GIKUYU(
    offTag: 'ki',
    iso3Code: 'KIK',
    nativeName: 'Gĩkũyũ',
    englishName: 'Kikuyu',
  ),

  /// Tigrinya
  TIGRINYA(
    offTag: 'ti',
    iso3Code: 'TIR',
    nativeName: 'ትግርኛ',
    englishName: 'Tigrinya',
  ),

  /// Galician
  GALICIAN(
    offTag: 'gl',
    iso3Code: 'GLG',
    nativeName: 'Galego',
    englishName: 'Galician',
  ),

  /// Telugu
  TELUGU(
    offTag: 'te',
    iso3Code: 'TEL',
    nativeName: 'తెలుగు',
    englishName: 'Telugu',
  ),

  /// Hindi
  HINDI(
    offTag: 'hi',
    iso3Code: 'HIN',
    nativeName: 'हिन्दी',
    englishName: 'Hindi',
  ),

  /// Kongo
  KONGO_LANGUAGE(
    offTag: 'kg',
    iso3Code: 'KON',
    nativeName: 'Kikongo',
    englishName: 'Kongo',
  ),

  /// Xhosa
  XHOSA(
    offTag: 'xh',
    iso3Code: 'XHO',
    nativeName: 'isiXhosa',
    englishName: 'Xhosa',
  ),

  /// Swazi
  SWAZI(
    offTag: 'ss',
    iso3Code: 'SSW',
    nativeName: 'siSwati',
    englishName: 'Swati',
  ),

  /// Luganda
  LUGANDA(
    offTag: 'lg',
    iso3Code: 'LUG',
    nativeName: 'Luganda',
    englishName: 'Ganda',
  ),

  /// Urdu
  URDU(
    offTag: 'ur',
    iso3Code: 'URD',
    nativeName: 'اُردُو',
    englishName: 'Urdu',
  ),

  /// North Ndbele
  NORTHERN_NDEBELE_LANGUAGE(
    offTag: 'nd',
    iso3Code: 'NDE',
    nativeName: 'siNdebele saseNyakatho',
    englishName: 'North Ndebele',
  ),

  /// Yoruba
  YORUBA(
    offTag: 'yo',
    iso3Code: 'YOR',
    nativeName: 'èdè Yorùbá',
    englishName: 'Yoruba',
  ),

  /// World, as pseudo language
  WORLD(offTag: 'world', iso3Code: null, nativeName: null, englishName: null),

  /// Undefined language
  UNDEFINED(offTag: '-', iso3Code: null, nativeName: null, englishName: null);

  const OpenFoodFactsLanguage({
    required this.offTag,
    required this.iso3Code,
    required this.nativeName,
    required this.englishName,
  });

  /// ISO 639-1
  @override
  final String offTag;

  /// ISO 639-3 country code, uppercase.
  ///
  /// Not populated for fake or old languages, like "undefined" or "moldovan".
  final String? iso3Code;

  /// Translation of this language in itself.
  ///
  /// Not populated for fake or old languages, like "undefined" or "moldovan".
  final String? nativeName;

  /// Translation of this language in English.
  ///
  /// Not populated for fake or old languages, like "undefined" or "moldovan".
  final String? englishName;

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
