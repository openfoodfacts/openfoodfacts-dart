import '../model/off_tagged.dart';

/// Countries.
///
/// cf. https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2
enum OpenFoodFactsCountry implements OffTagged {
  /// Andorra
  ANDORRA(offTag: 'ad'),

  /// United Arab Emirates
  UNITED_ARAB_EMIRATES(offTag: 'ae'),

  /// Afghanistan
  AFGHANISTAN(offTag: 'af'),

  /// Antigua and Barbuda
  ANTIGUA_AND_BARBUDA(offTag: 'ag'),

  /// Anguilla
  ANGUILLA(offTag: 'ai'),

  /// Albania
  ALBANIA(offTag: 'al'),

  /// Armenia
  ARMENIA(offTag: 'am'),

  /// Angola
  ANGOLA(offTag: 'ao'),

  /// Antarctica
  ANTARCTICA(offTag: 'aq'),

  /// Argentina
  ARGENTINA(offTag: 'ar'),

  /// American Samoa
  AMERICAN_SAMOA(offTag: 'as'),

  /// Austria
  AUSTRIA(offTag: 'at'),

  /// Australia
  AUSTRALIA(offTag: 'au'),

  /// Aruba
  ARUBA(offTag: 'aw'),

  /// Åland Islands
  ALAND_ISLANDS(offTag: 'ax'),

  /// Azerbaijan
  AZERBAIJAN(offTag: 'az'),

  /// Bosnia and Herzegovina
  BOSNIA_AND_HERZEGOVINA(offTag: 'ba'),

  /// Barbados
  BARBADOS(offTag: 'bb'),

  /// Bangladesh
  BANGLADESH(offTag: 'bd'),

  /// Belgium
  BELGIUM(offTag: 'be'),

  /// Burkina Faso
  BURKINA_FASO(offTag: 'bf'),

  /// Bulgaria
  BULGARIA(offTag: 'bg'),

  /// Bahrain
  BAHRAIN(offTag: 'bh'),

  /// Burundi
  BURUNDI(offTag: 'bi'),

  /// Benin
  BENIN(offTag: 'bj'),

  /// Saint Barthélemy
  SAINT_BARTHELEMY(offTag: 'bl'),

  /// Bermuda
  BERMUDA(offTag: 'bm'),

  /// Brunei Darussalam
  BRUNEI_DARUSSALAM(offTag: 'bn'),

  /// Bolivia (Plurinational State of)
  BOLIVIA(offTag: 'bo'),

  /// Bonaire, Sint Eustatius and Saba
  BONAIRE(offTag: 'bq'),

  /// Brazil
  BRAZIL(offTag: 'br'),

  /// Bahamas
  BAHAMAS(offTag: 'bs'),

  /// Bhutan
  BHUTAN(offTag: 'bt'),

  /// Bouvet Island
  BOUVET_ISLAND(offTag: 'bv'),

  /// Botswana
  BOTSWANA(offTag: 'bw'),

  /// Belarus
  BELARUS(offTag: 'by'),

  /// Belize
  BELIZE(offTag: 'bz'),

  /// Canada
  CANADA(offTag: 'ca'),

  /// Cocos (Keeling) Islands
  COCOS_ISLANDS(offTag: 'cc'),

  /// Congo, Democratic Republic of the
  DEMOCRATIC_REPUBLIC_OF_THE_CONGO(offTag: 'cd'),

  /// Central African Republic
  CENTRAL_AFRICAN_REPUBLIC(offTag: 'cf'),

  /// Congo
  CONGO(offTag: 'cg'),

  /// Switzerland
  SWITZERLAND(offTag: 'ch'),

  /// Côte d'Ivoire
  COTE_D_IVOIRE(offTag: 'ci'),

  /// Cook Islands
  COOK_ISLANDS(offTag: 'ck'),

  /// Chile
  CHILE(offTag: 'cl'),

  /// Cameroon
  CAMEROON(offTag: 'cm'),

  /// China
  CHINA(offTag: 'cn'),

  /// Colombia
  COLOMBIA(offTag: 'co'),

  /// Costa Rica
  COSTA_RICA(offTag: 'cr'),

  /// Cuba
  CUBA(offTag: 'cu'),

  /// Cabo Verde
  CABO_VERDE(offTag: 'cv'),

  /// Curaçao
  CURACAO(offTag: 'cw'),

  /// Christmas Island
  CHRISTMAS_ISLAND(offTag: 'cx'),

  ///Cyprus
  CYPRUS(offTag: 'cy'),

  /// Czechia
  CZECHIA(offTag: 'cz'),

  /// Germany
  GERMANY(offTag: 'de'),

  /// Djibouti
  DJIBOUTI(offTag: 'dj'),

  /// Denmark
  DENMARK(offTag: 'dk'),

  /// Dominica
  DOMINICA(offTag: 'dm'),

  /// Dominican Republic
  DOMINICAN_REPUBLIC(offTag: 'do'),

  /// Algeria
  ALGERIA(offTag: 'dz'),

  /// Ecuador
  ECUADOR(offTag: 'ec'),

  /// Estonia
  ESTONIA(offTag: 'ee'),

  /// Egypt
  EGYPT(offTag: 'eg'),

  /// Western Sahara
  WESTERN_SAHARA(offTag: 'eh'),

  /// Eritrea
  ERITREA(offTag: 'er'),

  /// Spain
  SPAIN(offTag: 'es'),

  /// Ethiopia
  ETHIOPIA(offTag: 'et'),

  /// Finland
  FINLAND(offTag: 'fi'),

  /// Fiji
  FIJI(offTag: 'fj'),

  /// Falkland Islands (Malvinas)
  FALKLAND_ISLANDS(offTag: 'fk'),

  /// Micronesia (Federated States of)
  MICRONESIA(offTag: 'fm'),

  /// Faroe Islands
  FAROE_ISLANDS(offTag: 'fo'),

  /// France
  FRANCE(offTag: 'fr'),

  /// Gabon
  GABON(offTag: 'ga'),

  /// United Kingdom of Great Britain and Northern Ireland
  // in OFF this is not 'gb'
  UNITED_KINGDOM(offTag: 'uk'),

  /// Grenada
  GRENADA(offTag: 'gd'),

  /// Georgia
  GEORGIA(offTag: 'ge'),

  /// French Guiana
  FRENCH_GUIANA(offTag: 'gf'),

  /// Guernsey
  GUERNSEY(offTag: 'gg'),

  /// Ghana
  GHANA(offTag: 'gh'),

  /// Gibraltar
  GIBRALTAR(offTag: 'gi'),

  /// Greenland
  GREENLAND(offTag: 'gl'),

  /// Gambia
  GAMBIA(offTag: 'gm'),

  /// Guinea
  GUINEA(offTag: 'gn'),

  /// Guadeloupe
  GUADELOUPE(offTag: 'gp'),

  /// Equatorial Guinea
  EQUATORIAL_GUINEA(offTag: 'gq'),

  /// Greece
  GREECE(offTag: 'gr'),

  /// South Georgia and the South Sandwich Islands
  SOUTH_GEORGIA(offTag: 'gs'),

  /// Guatemala
  GUATEMALA(offTag: 'gt'),

  /// Guam
  GUAM(offTag: 'gu'),

  /// Guinea-Bissau
  GUINEA_BISSAU(offTag: 'gw'),

  /// Guyana
  GUYANA(offTag: 'gy'),

  /// Hong Kong
  HONG_KONG(offTag: 'hk'),

  /// Heard Island and McDonald Islands
  HEARD_ISLAND(offTag: 'hm'),

  /// Honduras
  HONDURAS(offTag: 'hn'),

  /// Croatia
  CROATIA(offTag: 'hr'),

  /// Haiti
  HAITI(offTag: 'ht'),

  /// Hungary
  HUNGARY(offTag: 'hu'),

  /// Indonesia
  INDONESIA(offTag: 'id'),

  /// Ireland
  IRELAND(offTag: 'ie'),

  /// Israel
  ISRAEL(offTag: 'il'),

  /// Isle of Man
  ISLE_OF_MAN(offTag: 'im'),

  /// India
  INDIA(offTag: 'in'),

  /// British Indian Ocean Territory
  BRITISH_INDIAN_OCEAN_TERRITORY(offTag: 'io'),

  /// Iraq
  IRAQ(offTag: 'iq'),

  /// Iran (Islamic Republic of)
  IRAN(offTag: 'ir'),

  /// Iceland
  ICELAND(offTag: 'is'),

  /// Italy
  ITALY(offTag: 'it'),

  /// Jersey
  JERSEY(offTag: 'je'),

  /// Jamaica
  JAMAICA(offTag: 'jm'),

  /// Jordan
  JORDAN(offTag: 'jo'),

  /// Japan
  JAPAN(offTag: 'jp'),

  /// Kenya
  KENYA(offTag: 'ke'),

  /// Kyrgyzstan
  KYRGYZSTAN(offTag: 'kg'),

  /// Cambodia
  CAMBODIA(offTag: 'kh'),

  /// Kiribati
  KIRIBATI(offTag: 'ki'),

  /// Comoros
  COMOROS(offTag: 'km'),

  /// Saint Kitts and Nevis
  SAINT_KITTS_AND_NEVIS(offTag: 'kn'),

  /// Korea (Democratic People's Republic of)
  NORTH_KOREA(offTag: 'kp'),

  /// Korea, Republic of
  SOUTH_KOREA(offTag: 'kr'),

  /// Kuwait
  KUWAIT(offTag: 'kw'),

  /// Cayman Islands
  CAYMAN_ISLANDS(offTag: 'ky'),

  /// Kazakhstan
  KAZAKHSTAN(offTag: 'kz'),

  /// Lao People's Democratic Republic
  LAOS(offTag: 'la'),

  /// Lebanon
  LEBANON(offTag: 'lb'),

  /// Saint Lucia
  SAINT_LUCIA(offTag: 'lc'),

  /// Liechtenstein
  LIECHTENSTEIN(offTag: 'li'),

  /// Sri Lanka
  SRI_LANKA(offTag: 'lk'),

  /// Liberia
  LIBERIA(offTag: 'lr'),

  /// Lesotho
  LESOTHO(offTag: 'ls'),

  /// Lithuania
  LITHUANIA(offTag: 'lt'),

  /// Luxembourg
  LUXEMBOURG(offTag: 'lu'),

  /// Latvia
  LATVIA(offTag: 'lv'),

  /// Libya
  LIBYA(offTag: 'ly'),

  /// Morocco
  MOROCCO(offTag: 'ma'),

  /// Monaco
  MONACO(offTag: 'mc'),

  /// Moldova, Republic of
  MOLDOVA(offTag: 'md'),

  /// Montenegro
  MONTENEGRO(offTag: 'me'),

  /// Saint Martin (French part)
  SAINT_MARTIN(offTag: 'mf'),

  /// Madagascar
  MADAGASCAR(offTag: 'mg'),

  /// Marshall Islands
  MARSHALL_ISLANDS(offTag: 'mh'),

  /// North Macedonia
  NORTH_MACEDONIA(offTag: 'mk'),

  /// Mali
  MALI(offTag: 'ml'),

  /// Myanmar
  MYANMAR(offTag: 'mm'),

  /// Mongolia
  MONGOLIA(offTag: 'mn'),

  /// Macao
  MACAO(offTag: 'mo'),

  /// Northern Mariana Islands
  NORTHERN_MARIANA_ISLANDS(offTag: 'mp'),

  /// Martinique
  MARTINIQUE(offTag: 'mq'),

  /// Mauritania
  MAURITANIA(offTag: 'mr'),

  /// Montserrat
  MONTSERRAT(offTag: 'ms'),

  /// Malta
  MALTA(offTag: 'mt'),

  /// Mauritius
  MAURITIUS(offTag: 'mu'),

  /// Maldives
  MALDIVES(offTag: 'mv'),

  /// Malawi
  MALAWI(offTag: 'mw'),

  /// Mexico
  MEXICO(offTag: 'mx'),

  /// Malaysia
  MALAYSIA(offTag: 'my'),

  /// Mozambique
  MOZAMBIQUE(offTag: 'mz'),

  /// Namibia
  NAMIBIA(offTag: 'na'),

  /// New Caledonia
  NEW_CALEDONIA(offTag: 'nc'),

  /// Niger
  NIGER(offTag: 'ne'),

  /// Norfolk Island
  NORFOLK_ISLAND(offTag: 'nf'),

  /// Nigeria
  NIGERIA(offTag: 'ng'),

  /// Nicaragua
  NICARAGUA(offTag: 'ni'),

  /// Netherlands
  NETHERLANDS(offTag: 'nl'),

  /// Norway
  NORWAY(offTag: 'no'),

  /// Nepal
  NEPAL(offTag: 'np'),

  /// Nauru
  NAURU(offTag: 'nr'),

  /// Niue
  NIUE(offTag: 'nu'),

  /// New Zealand
  NEW_ZEALAND(offTag: 'nz'),

  /// Oman
  OMAN(offTag: 'om'),

  /// Panama
  PANAMA(offTag: 'pa'),

  /// Peru
  PERU(offTag: 'pe'),

  /// French Polynesia
  FRENCH_POLYNESIA(offTag: 'pf'),

  /// Papua New Guinea
  PAPUA_NEW_GUINEA(offTag: 'pg'),

  /// Philippines
  PHILIPPINES(offTag: 'ph'),

  /// Pakistan
  PAKISTAN(offTag: 'pk'),

  /// Poland
  POLAND(offTag: 'pl'),

  /// Saint Pierre and Miquelon
  SAINT_PIERRE_AND_MIQUELON(offTag: 'pm'),

  /// Pitcairn
  PITCAIRN(offTag: 'pn'),

  /// Puerto Rico
  PUERTO_RICO(offTag: 'pr'),

  /// Palestine, State of
  PALESTINE(offTag: 'ps'),

  /// Portugal
  PORTUGAL(offTag: 'pt'),

  /// Palau
  PALAU(offTag: 'pw'),

  /// Paraguay
  PARAGUAY(offTag: 'py'),

  /// Qatar
  QATAR(offTag: 'qa'),

  /// Réunion
  REUNION(offTag: 're'),

  /// Romania
  ROMANIA(offTag: 'ro'),

  /// Serbia
  SERBIA(offTag: 'rs'),

  /// Russian Federation
  RUSSIA(offTag: 'ru'),

  /// Rwanda
  RWANDA(offTag: 'rw'),

  /// Saudi Arabia
  SAUDI_ARABIA(offTag: 'sa'),

  /// Solomon Islands
  SOLOMON_ISLANDS(offTag: 'sb'),

  /// Seychelles
  SEYCHELLES(offTag: 'sc'),

  /// Sudan
  SUDAN(offTag: 'sd'),

  /// Sweden
  SWEDEN(offTag: 'se'),

  /// Singapore
  SINGAPORE(offTag: 'sg'),

  /// Saint Helena, Ascension and Tristan da Cunha
  SAINT_HELENA(offTag: 'sh'),

  /// Slovenia
  SLOVENIA(offTag: 'si'),

  /// Svalbard and Jan Mayen
  SVALBARD_AND_JAN_MAYEN(offTag: 'sj'),

  /// Slovakia
  SLOVAKIA(offTag: 'sk'),

  /// Sierra Leone
  SIERRA_LEONE(offTag: 'sl'),

  /// San Marino
  SAN_MARINO(offTag: 'sm'),

  /// Senegal
  SENEGAL(offTag: 'sn'),

  /// Somalia
  SOMALIA(offTag: 'so'),

  /// Suriname
  SURINAME(offTag: 'sr'),

  /// South Sudan
  SOUTH_SUDAN(offTag: 'ss'),

  /// Sao Tome and Principe
  SAO_TOME_AND_PRINCIPE(offTag: 'st'),

  /// El Salvador
  EL_SALVADOR(offTag: 'sv'),

  /// Sint Maarten (Dutch part)
  SINT_MAARTEN(offTag: 'sx'),

  /// Syrian Arab Republic
  SYRIA(offTag: 'sy'),

  /// Eswatini
  ESWATINI(offTag: 'sz'),

  /// Turks and Caicos Islands
  TURKS_AND_CAICOS_ISLANDS(offTag: 'tc'),

  /// Chad
  CHAD(offTag: 'td'),

  /// French Southern Territories
  FRENCH_SOUTHERN_TERRITORIES(offTag: 'tf'),

  /// Togo
  TOGO(offTag: 'tg'),

  /// Thailand
  THAILAND(offTag: 'th'),

  /// Tajikistan
  TAJIKISTAN(offTag: 'tj'),

  /// Tokelau
  TOKELAU(offTag: 'tk'),

  /// Timor-Leste
  TIMOR_LESTE(offTag: 'tl'),

  /// Turkmenistan
  TURKMENISTAN(offTag: 'tm'),

  /// Tunisia
  TUNISIA(offTag: 'tn'),

  /// Tonga
  TONGA(offTag: 'to'),

  /// Turkey
  TURKEY(offTag: 'tr'),

  /// Trinidad and Tobago
  TRINIDAD_AND_TOBAGO(offTag: 'tt'),

  /// Tuvalu
  TUVALU(offTag: 'tv'),

  /// Taiwan, Province of China
  TAIWAN(offTag: 'tw'),

  /// Tanzania, United Republic of
  TANZANIA(offTag: 'tz'),

  /// Ukraine
  UKRAINE(offTag: 'ua'),

  /// Uganda
  UGANDA(offTag: 'ug'),

  /// United States Minor Outlying Islands
  UNITED_STATES_MINOR_OUTLYING_ISLANDS(offTag: 'um'),

  /// United States of America
  USA(offTag: 'us'),

  /// Uruguay
  URUGUAY(offTag: 'uy'),

  /// Uzbekistan
  UZBEKISTAN(offTag: 'uz'),

  /// Holy See
  HOLY_SEE(offTag: 'va'),

  /// Saint Vincent and the Grenadines
  SAINT_VINCENT_AND_THE_GRENADINES(offTag: 'vc'),

  /// Venezuela (Bolivarian Republic of)
  VENEZUELA(offTag: 've'),

  /// Virgin Islands (British)
  BRITISH_VIRGIN_ISLANDS(offTag: 'vg'),

  /// Virgin Islands (U.S.)
  US_VIRGIN_ISLANDS(offTag: 'vi'),

  /// Viet Nam
  VIET_NAM(offTag: 'vn'),

  /// Vanuatu
  VANUATU(offTag: 'vu'),

  /// Wallis and Futuna
  WALLIS_AND_FUTUNA(offTag: 'wf'),

  /// Samoa
  SAMOA(offTag: 'ws'),

  /// Yemen
  YEMEN(offTag: 'ye'),

  /// Mayotte
  MAYOTTE(offTag: 'yt'),

  /// South Africa
  SOUTH_AFRICA(offTag: 'za'),

  /// Zambia
  ZAMBIA(offTag: 'zm'),

  /// Zimbabwe
  ZIMBABWE(offTag: 'zw');

  const OpenFoodFactsCountry({
    required this.offTag,
  });

  /// Lowercase ISO 639-1, except for [UNITED_KINGDOM].
  @override
  final String offTag;

  /// Returns the [OpenFoodFactsCountry] that matches the [offTag].
  ///
  /// Case-insensitive.
  /// Special case: "uk" and "gb" both mean United Kingdom.
  static OpenFoodFactsCountry? fromOffTag(String? offTag) {
    offTag = offTag?.toLowerCase();
    // special case as we use 'uk' in off-dart
    if (offTag == 'gb') {
      return OpenFoodFactsCountry.UNITED_KINGDOM;
    }
    return OffTagged.fromOffTag(offTag, OpenFoodFactsCountry.values)
        as OpenFoodFactsCountry?;
  }
}
