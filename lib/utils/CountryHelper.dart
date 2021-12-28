/// Countries, cf. https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2
enum OpenFoodFactsCountry {
  /// Andorra
  ANDORRA,

  /// United Arab Emirates
  UNITED_ARAB_EMIRATES,

  /// Afghanistan
  AFGHANISTAN,

  /// Antigua and Barbuda
  ANTIGUA_AND_BARBUDA,

  /// Anguilla
  ANGUILLA,

  /// Albania
  ALBANIA,

  /// Armenia
  ARMENIA,

  /// Angola
  ANGOLA,

  /// Antarctica
  ANTARCTICA,

  /// Argentina
  ARGENTINA,

  /// American Samoa
  AMERICAN_SAMOA,

  /// Austria
  AUSTRIA,

  /// Australia
  AUSTRALIA,

  /// Aruba
  ARUBA,

  /// Åland Islands
  ALAND_ISLANDS,

  /// Azerbaijan
  AZERBAIJAN,

  /// Bosnia and Herzegovina
  BOSNIA_AND_HERZEGOVINA,

  /// Barbados
  BARBADOS,

  /// Bangladesh
  BANGLADESH,

  /// Belgium
  BELGIUM,

  /// Burkina Faso
  BURKINA_FASO,

  /// Bulgaria
  BULGARIA,

  /// Bahrain
  BAHRAIN,

  /// Burundi
  BURUNDI,

  /// Benin
  BENIN,

  /// Saint Barthélemy
  SAINT_BARTHELEMY,

  /// Bermuda
  BERMUDA,

  /// Brunei Darussalam
  BRUNEI_DARUSSALAM,

  /// Bolivia (Plurinational State of)
  BOLIVIA,

  /// Bonaire, Sint Eustatius and Saba
  BONAIRE,

  /// Brazil
  BRAZIL,

  /// Bahamas
  BAHAMAS,

  /// Bhutan
  BHUTAN,

  /// Bouvet Island
  BOUVET_ISLAND,

  /// Botswana
  BOTSWANA,

  /// Belarus
  BELARUS,

  /// Belize
  BELIZE,

  /// Canada
  CANADA,

  /// Cocos (Keeling) Islands
  COCOS_ISLANDS,

  /// Congo, Democratic Republic of the
  DEMOCRATIC_REPUBLIC_OF_THE_CONGO,

  /// Central African Republic
  CENTRAL_AFRICAN_REPUBLIC,

  /// Congo
  CONGO,

  /// Switzerland
  SWITZERLAND,

  /// Côte d'Ivoire
  COTE_D_IVOIRE,

  /// Cook Islands
  COOK_ISLANDS,

  /// Chile
  CHILE,

  /// Cameroon
  CAMEROON,

  /// China
  CHINA,

  /// Colombia
  COLOMBIA,

  /// Costa Rica
  COSTA_RICA,

  /// Cuba
  CUBA,

  /// Cabo Verde
  CABO_VERDE,

  /// Curaçao
  CURACAO,

  /// Christmas Island
  CHRISTMAS_ISLAND,

  ///Cyprus
  CYPRUS,

  /// Czechia
  CZECHIA,

  /// Germany
  GERMANY,

  /// Djibouti
  DJIBOUTI,

  /// Denmark
  DENMARK,

  /// Dominica
  DOMINICA,

  /// Dominican Republic
  DOMINICAN_REPUBLIC,

  /// Algeria
  ALGERIA,

  /// Ecuador
  ECUADOR,

  /// Estonia
  ESTONIA,

  /// Egypt
  EGYPT,

  /// Western Sahara
  WESTERN_SAHARA,

  /// Eritrea
  ERITREA,

  /// Spain
  SPAIN,

  /// Ethiopia
  ETHIOPIA,

  /// Finland
  FINLAND,

  /// Fiji
  FIJI,

  /// Falkland Islands (Malvinas)
  FALKLAND_ISLANDS,

  /// Micronesia (Federated States of)
  MICRONESIA,

  /// Faroe Islands
  FAROE_ISLANDS,

  /// France
  FRANCE,

  /// Gabon
  GABON,

  /// United Kingdom of Great Britain and Northern Ireland
  UNITED_KINGDOM,

  /// Grenada
  GRENADA,

  /// Georgia
  GEORGIA,

  /// French Guiana
  FRENCH_GUIANA,

  /// Guernsey
  GUERNSEY,

  /// Ghana
  GHANA,

  /// Gibraltar
  GIBRALTAR,

  /// Greenland
  GREENLAND,

  /// Gambia
  GAMBIA,

  /// Guinea
  GUINEA,

  /// Guadeloupe
  GUADELOUPE,

  /// Equatorial Guinea
  EQUATORIAL_GUINEA,

  /// Greece
  GREECE,

  /// South Georgia and the South Sandwich Islands
  SOUTH_GEORGIA,

  /// Guatemala
  GUATEMALA,

  /// Guam
  GUAM,

  /// Guinea-Bissau
  GUINEA_BISSAU,

  /// Guyana
  GUYANA,

  /// Hong Kong
  HONG_KONG,

  /// Heard Island and McDonald Islands
  HEARD_ISLAND,

  /// Honduras
  HONDURAS,

  /// Croatia
  CROATIA,

  /// Haiti
  HAITI,

  /// Hungary
  HUNGARY,

  /// Indonesia
  INDONESIA,

  /// Ireland
  IRELAND,

  /// Israel
  ISRAEL,

  /// Isle of Man
  ISLE_OF_MAN,

  /// India
  INDIA,

  /// British Indian Ocean Territory
  BRITISH_INDIAN_OCEAN_TERRITORY,

  /// Iraq
  IRAQ,

  /// Iran (Islamic Republic of)
  IRAN,

  /// Iceland
  ICELAND,

  /// Italy
  ITALY,

  /// Jersey
  JERSEY,

  /// Jamaica
  JAMAICA,

  /// Jordan
  JORDAN,

  /// Japan
  JAPAN,

  /// Kenya
  KENYA,

  /// Kyrgyzstan
  KYRGYZSTAN,

  /// Cambodia
  CAMBODIA,

  /// Kiribati
  KIRIBATI,

  /// Comoros
  COMOROS,

  /// Saint Kitts and Nevis
  SAINT_KITTS_AND_NEVIS,

  /// Korea (Democratic People's Republic of)
  NORTH_KOREA,

  /// Korea, Republic of
  SOUTH_KOREA,

  /// Kuwait
  KUWAIT,

  /// Cayman Islands
  CAYMAN_ISLANDS,

  /// Kazakhstan
  KAZAKHSTAN,

  /// Lao People's Democratic Republic
  LAOS,

  /// Lebanon
  LEBANON,

  /// Saint Lucia
  SAINT_LUCIA,

  /// Liechtenstein
  LIECHTENSTEIN,

  /// Sri Lanka
  SRI_LANKA,

  /// Liberia
  LIBERIA,

  /// Lesotho
  LESOTHO,

  /// Lithuania
  LITHUANIA,

  /// Luxembourg
  LUXEMBOURG,

  /// Latvia
  LATVIA,

  /// Libya
  LIBYA,

  /// Morocco
  MOROCCO,

  /// Monaco
  MONACO,

  /// Moldova, Republic of
  MOLDOVA,

  /// Montenegro
  MONTENEGRO,

  /// Saint Martin (French part)
  SAINT_MARTIN,

  /// Madagascar
  MADAGASCAR,

  /// Marshall Islands
  MARSHALL_ISLANDS,

  /// North Macedonia
  NORTH_MACEDONIA,

  /// Mali
  MALI,

  /// Myanmar
  MYANMAR,

  /// Mongolia
  MONGOLIA,

  /// Macao
  MACAO,

  /// Northern Mariana Islands
  NORTHERN_MARIANA_ISLANDS,

  /// Martinique
  MARTINIQUE,

  /// Mauritania
  MAURITANIA,

  /// Montserrat
  MONTSERRAT,

  /// Malta
  MALTA,

  /// Mauritius
  MAURITIUS,

  /// Maldives
  MALDIVES,

  /// Malawi
  MALAWI,

  /// Mexico
  MEXICO,

  /// Malaysia
  MALAYSIA,

  /// Mozambique
  MOZAMBIQUE,

  /// Namibia
  NAMIBIA,

  /// New Caledonia
  NEW_CALEDONIA,

  /// Niger
  NIGER,

  /// Norfolk Island
  NORFOLK_ISLAND,

  /// Nigeria
  NIGERIA,

  /// Nicaragua
  NICARAGUA,

  /// Netherlands
  NETHERLANDS,

  /// Norway
  NORWAY,

  /// Nepal
  NEPAL,

  /// Nauru
  NAURU,

  /// Niue
  NIUE,

  /// New Zealand
  NEW_ZEALAND,

  /// Oman
  OMAN,

  /// Panama
  PANAMA,

  /// Peru
  PERU,

  /// French Polynesia
  FRENCH_POLYNESIA,

  /// Papua New Guinea
  PAPUA_NEW_GUINEA,

  /// Philippines
  PHILIPPINES,

  /// Pakistan
  PAKISTAN,

  /// Poland
  POLAND,

  /// Saint Pierre and Miquelon
  SAINT_PIERRE_AND_MIQUELON,

  /// Pitcairn
  PITCAIRN,

  /// Puerto Rico
  PUERTO_RICO,

  /// Palestine, State of
  PALESTINE,

  /// Portugal
  PORTUGAL,

  /// Palau
  PALAU,

  /// Paraguay
  PARAGUAY,

  /// Qatar
  QATAR,

  /// Réunion
  REUNION,

  /// Romania
  ROMANIA,

  /// Serbia
  SERBIA,

  /// Russian Federation
  RUSSIA,

  /// Rwanda
  RWANDA,

  /// Saudi Arabia
  SAUDI_ARABIA,

  /// Solomon Islands
  SOLOMON_ISLANDS,

  /// Seychelles
  SEYCHELLES,

  /// Sudan
  SUDAN,

  /// Sweden
  SWEDEN,

  /// Singapore
  SINGAPORE,

  /// Saint Helena, Ascension and Tristan da Cunha
  SAINT_HELENA,

  /// Slovenia
  SLOVENIA,

  /// Svalbard and Jan Mayen
  SVALBARD_AND_JAN_MAYEN,

  /// Slovakia
  SLOVAKIA,

  /// Sierra Leone
  SIERRA_LEONE,

  /// San Marino
  SAN_MARINO,

  /// Senegal
  SENEGAL,

  /// Somalia
  SOMALIA,

  /// Suriname
  SURINAME,

  /// South Sudan
  SOUTH_SUDAN,

  /// Sao Tome and Principe
  SAO_TOME_AND_PRINCIPE,

  /// El Salvador
  EL_SALVADOR,

  /// Sint Maarten (Dutch part)
  SINT_MAARTEN,

  /// Syrian Arab Republic
  SYRIA,

  /// Eswatini
  ESWATINI,

  /// Turks and Caicos Islands
  TURKS_AND_CAICOS_ISLANDS,

  /// Chad
  CHAD,

  /// French Southern Territories
  FRENCH_SOUTHERN_TERRITORIES,

  /// Togo
  TOGO,

  /// Thailand
  THAILAND,

  /// Tajikistan
  TAJIKISTAN,

  /// Tokelau
  TOKELAU,

  /// Timor-Leste
  TIMOR_LESTE,

  /// Turkmenistan
  TURKMENISTAN,

  /// Tunisia
  TUNISIA,

  /// Tonga
  TONGA,

  /// Turkey
  TURKEY,

  /// Trinidad and Tobago
  TRINIDAD_AND_TOBAGO,

  /// Tuvalu
  TUVALU,

  /// Taiwan, Province of China
  TAIWAN,

  /// Tanzania, United Republic of
  TANZANIA,

  /// Ukraine
  UKRAINE,

  /// Uganda
  UGANDA,

  /// United States Minor Outlying Islands
  UNITED_STATES_MINOR_OUTLYING_ISLANDS,

  /// United States of America
  USA,

  /// Uruguay
  URUGUAY,

  /// Uzbekistan
  UZBEKISTAN,

  /// Holy See
  HOLY_SEE,

  /// Saint Vincent and the Grenadines
  SAINT_VINCENT_AND_THE_GRENADINES,

  /// Venezuela (Bolivarian Republic of)
  VENEZUELA,

  /// Virgin Islands (British)
  BRITISH_VIRGIN_ISLANDS,

  /// Virgin Islands (U.S.)
  US_VIRGIN_ISLANDS,

  /// Viet Nam
  VIET_NAM,

  /// Vanuatu
  VANUATU,

  /// Wallis and Futuna
  WALLIS_AND_FUTUNA,

  /// Samoa
  SAMOA,

  /// Yemen
  YEMEN,

  /// Mayotte
  MAYOTTE,

  /// South Africa
  SOUTH_AFRICA,

  /// Zambia
  ZAMBIA,

  /// Zimbabwe
  ZIMBABWE,
}

extension OpenFoodFactsCoutryExtension on OpenFoodFactsCountry {
  static const Map<OpenFoodFactsCountry, String> _ISO_2_CODES = {
    OpenFoodFactsCountry.ANDORRA: 'ad',
    OpenFoodFactsCountry.UNITED_ARAB_EMIRATES: 'ae',
    OpenFoodFactsCountry.AFGHANISTAN: 'af',
    OpenFoodFactsCountry.ANTIGUA_AND_BARBUDA: 'ag',
    OpenFoodFactsCountry.ANGUILLA: 'ai',
    OpenFoodFactsCountry.ALBANIA: 'al',
    OpenFoodFactsCountry.ARMENIA: 'am',
    OpenFoodFactsCountry.ANGOLA: 'ao',
    OpenFoodFactsCountry.ANTARCTICA: 'aq',
    OpenFoodFactsCountry.ARGENTINA: 'ar',
    OpenFoodFactsCountry.AMERICAN_SAMOA: 'as',
    OpenFoodFactsCountry.AUSTRIA: 'at',
    OpenFoodFactsCountry.AUSTRALIA: 'au',
    OpenFoodFactsCountry.ARUBA: 'aw',
    OpenFoodFactsCountry.ALAND_ISLANDS: 'ax',
    OpenFoodFactsCountry.AZERBAIJAN: 'az',
    OpenFoodFactsCountry.BOSNIA_AND_HERZEGOVINA: 'ba',
    OpenFoodFactsCountry.BARBADOS: 'bb',
    OpenFoodFactsCountry.BANGLADESH: 'bd',
    OpenFoodFactsCountry.BELGIUM: 'be',
    OpenFoodFactsCountry.BURKINA_FASO: 'bf',
    OpenFoodFactsCountry.BULGARIA: 'bg',
    OpenFoodFactsCountry.BAHRAIN: 'bh',
    OpenFoodFactsCountry.BURUNDI: 'bi',
    OpenFoodFactsCountry.BENIN: 'bj',
    OpenFoodFactsCountry.SAINT_BARTHELEMY: 'bl',
    OpenFoodFactsCountry.BERMUDA: 'bm',
    OpenFoodFactsCountry.BRUNEI_DARUSSALAM: 'bn',
    OpenFoodFactsCountry.BOLIVIA: 'bo',
    OpenFoodFactsCountry.BONAIRE: 'bq',
    OpenFoodFactsCountry.BRAZIL: 'br',
    OpenFoodFactsCountry.BAHAMAS: 'bs',
    OpenFoodFactsCountry.BHUTAN: 'bt',
    OpenFoodFactsCountry.BOUVET_ISLAND: 'bv',
    OpenFoodFactsCountry.BOTSWANA: 'bw',
    OpenFoodFactsCountry.BELARUS: 'by',
    OpenFoodFactsCountry.BELIZE: 'bz',
    OpenFoodFactsCountry.CANADA: 'ca',
    OpenFoodFactsCountry.COCOS_ISLANDS: 'cc',
    OpenFoodFactsCountry.DEMOCRATIC_REPUBLIC_OF_THE_CONGO: 'cd',
    OpenFoodFactsCountry.CENTRAL_AFRICAN_REPUBLIC: 'cf',
    OpenFoodFactsCountry.CONGO: 'cg',
    OpenFoodFactsCountry.SWITZERLAND: 'ch',
    OpenFoodFactsCountry.COTE_D_IVOIRE: 'ci',
    OpenFoodFactsCountry.COOK_ISLANDS: 'ck',
    OpenFoodFactsCountry.CHILE: 'cl',
    OpenFoodFactsCountry.CAMEROON: 'cm',
    OpenFoodFactsCountry.CHINA: 'cn',
    OpenFoodFactsCountry.COLOMBIA: 'co',
    OpenFoodFactsCountry.COSTA_RICA: 'cr',
    OpenFoodFactsCountry.CUBA: 'cu',
    OpenFoodFactsCountry.CABO_VERDE: 'cv',
    OpenFoodFactsCountry.CURACAO: 'cw',
    OpenFoodFactsCountry.CHRISTMAS_ISLAND: 'cx',
    OpenFoodFactsCountry.CYPRUS: 'cy',
    OpenFoodFactsCountry.CZECHIA: 'cz',
    OpenFoodFactsCountry.GERMANY: 'de',
    OpenFoodFactsCountry.DJIBOUTI: 'dj',
    OpenFoodFactsCountry.DENMARK: 'dk',
    OpenFoodFactsCountry.DOMINICA: 'dm',
    OpenFoodFactsCountry.DOMINICAN_REPUBLIC: 'do',
    OpenFoodFactsCountry.ALGERIA: 'dz',
    OpenFoodFactsCountry.ECUADOR: 'ec',
    OpenFoodFactsCountry.ESTONIA: 'ee',
    OpenFoodFactsCountry.EGYPT: 'eg',
    OpenFoodFactsCountry.WESTERN_SAHARA: 'eh',
    OpenFoodFactsCountry.ERITREA: 'er',
    OpenFoodFactsCountry.SPAIN: 'es',
    OpenFoodFactsCountry.ETHIOPIA: 'et',
    OpenFoodFactsCountry.FINLAND: 'fi',
    OpenFoodFactsCountry.FIJI: 'fj',
    OpenFoodFactsCountry.FALKLAND_ISLANDS: 'fk',
    OpenFoodFactsCountry.MICRONESIA: 'fm',
    OpenFoodFactsCountry.FAROE_ISLANDS: 'fo',
    OpenFoodFactsCountry.FRANCE: 'fr',
    OpenFoodFactsCountry.GABON: 'ga',
    // in OFF this is not 'gb'
    OpenFoodFactsCountry.UNITED_KINGDOM: 'uk',
    OpenFoodFactsCountry.GRENADA: 'gd',
    OpenFoodFactsCountry.GEORGIA: 'ge',
    OpenFoodFactsCountry.FRENCH_GUIANA: 'gf',
    OpenFoodFactsCountry.GUERNSEY: 'gg',
    OpenFoodFactsCountry.GHANA: 'gh',
    OpenFoodFactsCountry.GIBRALTAR: 'gi',
    OpenFoodFactsCountry.GREENLAND: 'gl',
    OpenFoodFactsCountry.GAMBIA: 'gm',
    OpenFoodFactsCountry.GUINEA: 'gn',
    OpenFoodFactsCountry.GUADELOUPE: 'gp',
    OpenFoodFactsCountry.EQUATORIAL_GUINEA: 'gq',
    OpenFoodFactsCountry.GREECE: 'gr',
    OpenFoodFactsCountry.SOUTH_GEORGIA: 'gs',
    OpenFoodFactsCountry.GUATEMALA: 'gt',
    OpenFoodFactsCountry.GUAM: 'gu',
    OpenFoodFactsCountry.GUINEA_BISSAU: 'gw',
    OpenFoodFactsCountry.GUYANA: 'gy',
    OpenFoodFactsCountry.HONG_KONG: 'hk',
    OpenFoodFactsCountry.HEARD_ISLAND: 'hm',
    OpenFoodFactsCountry.HONDURAS: 'hn',
    OpenFoodFactsCountry.CROATIA: 'hr',
    OpenFoodFactsCountry.HAITI: 'ht',
    OpenFoodFactsCountry.HUNGARY: 'hu',
    OpenFoodFactsCountry.INDONESIA: 'id',
    OpenFoodFactsCountry.IRELAND: 'ie',
    OpenFoodFactsCountry.ISRAEL: 'il',
    OpenFoodFactsCountry.ISLE_OF_MAN: 'im',
    OpenFoodFactsCountry.INDIA: 'in',
    OpenFoodFactsCountry.BRITISH_INDIAN_OCEAN_TERRITORY: 'io',
    OpenFoodFactsCountry.IRAQ: 'iq',
    OpenFoodFactsCountry.IRAN: 'ir',
    OpenFoodFactsCountry.ICELAND: 'is',
    OpenFoodFactsCountry.ITALY: 'it',
    OpenFoodFactsCountry.JERSEY: 'je',
    OpenFoodFactsCountry.JAMAICA: 'jm',
    OpenFoodFactsCountry.JORDAN: 'jo',
    OpenFoodFactsCountry.JAPAN: 'jp',
    OpenFoodFactsCountry.KENYA: 'ke',
    OpenFoodFactsCountry.KYRGYZSTAN: 'kg',
    OpenFoodFactsCountry.CAMBODIA: 'kh',
    OpenFoodFactsCountry.KIRIBATI: 'ki',
    OpenFoodFactsCountry.COMOROS: 'km',
    OpenFoodFactsCountry.SAINT_KITTS_AND_NEVIS: 'kn',
    OpenFoodFactsCountry.NORTH_KOREA: 'kp',
    OpenFoodFactsCountry.SOUTH_KOREA: 'kr',
    OpenFoodFactsCountry.KUWAIT: 'kw',
    OpenFoodFactsCountry.CAYMAN_ISLANDS: 'ky',
    OpenFoodFactsCountry.KAZAKHSTAN: 'kz',
    OpenFoodFactsCountry.LAOS: 'la',
    OpenFoodFactsCountry.LEBANON: 'lb',
    OpenFoodFactsCountry.SAINT_LUCIA: 'lc',
    OpenFoodFactsCountry.LIECHTENSTEIN: 'li',
    OpenFoodFactsCountry.SRI_LANKA: 'lk',
    OpenFoodFactsCountry.LIBERIA: 'lr',
    OpenFoodFactsCountry.LESOTHO: 'ls',
    OpenFoodFactsCountry.LITHUANIA: 'lt',
    OpenFoodFactsCountry.LUXEMBOURG: 'lu',
    OpenFoodFactsCountry.LATVIA: 'lv',
    OpenFoodFactsCountry.LIBYA: 'ly',
    OpenFoodFactsCountry.MOROCCO: 'ma',
    OpenFoodFactsCountry.MONACO: 'mc',
    OpenFoodFactsCountry.MOLDOVA: 'md',
    OpenFoodFactsCountry.MONTENEGRO: 'me',
    OpenFoodFactsCountry.SAINT_MARTIN: 'mf',
    OpenFoodFactsCountry.MADAGASCAR: 'mg',
    OpenFoodFactsCountry.MARSHALL_ISLANDS: 'mh',
    OpenFoodFactsCountry.NORTH_MACEDONIA: 'mk',
    OpenFoodFactsCountry.MALI: 'ml',
    OpenFoodFactsCountry.MYANMAR: 'mm',
    OpenFoodFactsCountry.MONGOLIA: 'mn',
    OpenFoodFactsCountry.MACAO: 'mo',
    OpenFoodFactsCountry.NORTHERN_MARIANA_ISLANDS: 'mp',
    OpenFoodFactsCountry.MARTINIQUE: 'mq',
    OpenFoodFactsCountry.MAURITANIA: 'mr',
    OpenFoodFactsCountry.MONTSERRAT: 'ms',
    OpenFoodFactsCountry.MALTA: 'mt',
    OpenFoodFactsCountry.MAURITIUS: 'mu',
    OpenFoodFactsCountry.MALDIVES: 'mv',
    OpenFoodFactsCountry.MALAWI: 'mw',
    OpenFoodFactsCountry.MEXICO: 'mx',
    OpenFoodFactsCountry.MALAYSIA: 'my',
    OpenFoodFactsCountry.MOZAMBIQUE: 'mz',
    OpenFoodFactsCountry.NAMIBIA: 'na',
    OpenFoodFactsCountry.NEW_CALEDONIA: 'nc',
    OpenFoodFactsCountry.NIGER: 'ne',
    OpenFoodFactsCountry.NORFOLK_ISLAND: 'nf',
    OpenFoodFactsCountry.NIGERIA: 'ng',
    OpenFoodFactsCountry.NICARAGUA: 'ni',
    OpenFoodFactsCountry.NETHERLANDS: 'nl',
    OpenFoodFactsCountry.NORWAY: 'no',
    OpenFoodFactsCountry.NEPAL: 'np',
    OpenFoodFactsCountry.NAURU: 'nr',
    OpenFoodFactsCountry.NIUE: 'nu',
    OpenFoodFactsCountry.NEW_ZEALAND: 'nz',
    OpenFoodFactsCountry.OMAN: 'om',
    OpenFoodFactsCountry.PANAMA: 'pa',
    OpenFoodFactsCountry.PERU: 'pe',
    OpenFoodFactsCountry.FRENCH_POLYNESIA: 'pf',
    OpenFoodFactsCountry.PAPUA_NEW_GUINEA: 'pg',
    OpenFoodFactsCountry.PHILIPPINES: 'ph',
    OpenFoodFactsCountry.PAKISTAN: 'pk',
    OpenFoodFactsCountry.POLAND: 'pl',
    OpenFoodFactsCountry.SAINT_PIERRE_AND_MIQUELON: 'pm',
    OpenFoodFactsCountry.PITCAIRN: 'pn',
    OpenFoodFactsCountry.PUERTO_RICO: 'pr',
    OpenFoodFactsCountry.PALESTINE: 'ps',
    OpenFoodFactsCountry.PORTUGAL: 'pt',
    OpenFoodFactsCountry.PALAU: 'pw',
    OpenFoodFactsCountry.PARAGUAY: 'py',
    OpenFoodFactsCountry.QATAR: 'qa',
    OpenFoodFactsCountry.REUNION: 're',
    OpenFoodFactsCountry.ROMANIA: 'ro',
    OpenFoodFactsCountry.SERBIA: 'rs',
    OpenFoodFactsCountry.RUSSIA: 'ru',
    OpenFoodFactsCountry.RWANDA: 'rw',
    OpenFoodFactsCountry.SAUDI_ARABIA: 'sa',
    OpenFoodFactsCountry.SOLOMON_ISLANDS: 'sb',
    OpenFoodFactsCountry.SEYCHELLES: 'sc',
    OpenFoodFactsCountry.SUDAN: 'sd',
    OpenFoodFactsCountry.SWEDEN: 'se',
    OpenFoodFactsCountry.SINGAPORE: 'sg',
    OpenFoodFactsCountry.SAINT_HELENA: 'sh',
    OpenFoodFactsCountry.SLOVENIA: 'si',
    OpenFoodFactsCountry.SVALBARD_AND_JAN_MAYEN: 'sj',
    OpenFoodFactsCountry.SLOVAKIA: 'sk',
    OpenFoodFactsCountry.SIERRA_LEONE: 'sl',
    OpenFoodFactsCountry.SAN_MARINO: 'sm',
    OpenFoodFactsCountry.SENEGAL: 'sn',
    OpenFoodFactsCountry.SOMALIA: 'so',
    OpenFoodFactsCountry.SURINAME: 'sr',
    OpenFoodFactsCountry.SOUTH_SUDAN: 'ss',
    OpenFoodFactsCountry.SAO_TOME_AND_PRINCIPE: 'st',
    OpenFoodFactsCountry.EL_SALVADOR: 'sv',
    OpenFoodFactsCountry.SINT_MAARTEN: 'sx',
    OpenFoodFactsCountry.SYRIA: 'sy',
    OpenFoodFactsCountry.ESWATINI: 'sz',
    OpenFoodFactsCountry.TURKS_AND_CAICOS_ISLANDS: 'tc',
    OpenFoodFactsCountry.CHAD: 'td',
    OpenFoodFactsCountry.FRENCH_SOUTHERN_TERRITORIES: 'tf',
    OpenFoodFactsCountry.TOGO: 'tg',
    OpenFoodFactsCountry.THAILAND: 'th',
    OpenFoodFactsCountry.TAJIKISTAN: 'tj',
    OpenFoodFactsCountry.TOKELAU: 'tk',
    OpenFoodFactsCountry.TIMOR_LESTE: 'tl',
    OpenFoodFactsCountry.TURKMENISTAN: 'tm',
    OpenFoodFactsCountry.TUNISIA: 'tn',
    OpenFoodFactsCountry.TONGA: 'to',
    OpenFoodFactsCountry.TURKEY: 'tr',
    OpenFoodFactsCountry.TRINIDAD_AND_TOBAGO: 'tt',
    OpenFoodFactsCountry.TUVALU: 'tv',
    OpenFoodFactsCountry.TAIWAN: 'tw',
    OpenFoodFactsCountry.TANZANIA: 'tz',
    OpenFoodFactsCountry.UKRAINE: 'ua',
    OpenFoodFactsCountry.UGANDA: 'ug',
    OpenFoodFactsCountry.UNITED_STATES_MINOR_OUTLYING_ISLANDS: 'um',
    OpenFoodFactsCountry.USA: 'us',
    OpenFoodFactsCountry.URUGUAY: 'uy',
    OpenFoodFactsCountry.UZBEKISTAN: 'uz',
    OpenFoodFactsCountry.HOLY_SEE: 'va',
    OpenFoodFactsCountry.SAINT_VINCENT_AND_THE_GRENADINES: 'vc',
    OpenFoodFactsCountry.VENEZUELA: 've',
    OpenFoodFactsCountry.BRITISH_VIRGIN_ISLANDS: 'vg',
    OpenFoodFactsCountry.US_VIRGIN_ISLANDS: 'vi',
    OpenFoodFactsCountry.VIET_NAM: 'vn',
    OpenFoodFactsCountry.VANUATU: 'vu',
    OpenFoodFactsCountry.WALLIS_AND_FUTUNA: 'wf',
    OpenFoodFactsCountry.SAMOA: 'ws',
    OpenFoodFactsCountry.YEMEN: 'ye',
    OpenFoodFactsCountry.MAYOTTE: 'yt',
    OpenFoodFactsCountry.SOUTH_AFRICA: 'za',
    OpenFoodFactsCountry.ZAMBIA: 'zm',
    OpenFoodFactsCountry.ZIMBABWE: 'zw',
  };

  String get iso2Code => _ISO_2_CODES[this]!;
}

/// Helper class around [OpenFoodFactsCountry]
class CountryHelper {
  /// Converts an ISO 2 code into an [OpenFoodFactsCountry] (case-insensitive).
  ///
  /// E.g. 'fr' and 'FR' will give the same result: OpenFoodFactsCountry.FRANCE.
  static OpenFoodFactsCountry? fromJson(String? code) {
    if (code == null) {
      return null;
    }
    code = code.toLowerCase();
    for (final OpenFoodFactsCountry key in OpenFoodFactsCountry.values) {
      if (key.iso2Code == code) {
        return key;
      }
    }
    return null;
  }
}
