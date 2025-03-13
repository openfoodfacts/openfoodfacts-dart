import '../model/off_tagged.dart';
import '../prices/currency.dart';

/// Countries.
///
/// cf. https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2
enum OpenFoodFactsCountry implements OffTagged {
  /// Andorra
  ANDORRA(offTag: 'ad', currency: Currency.EUR),

  /// United Arab Emirates
  UNITED_ARAB_EMIRATES(offTag: 'ae', currency: Currency.AED),

  /// Afghanistan
  AFGHANISTAN(offTag: 'af', currency: Currency.AFN),

  /// Antigua and Barbuda
  ANTIGUA_AND_BARBUDA(offTag: 'ag', currency: Currency.XCD),

  /// Anguilla
  ANGUILLA(offTag: 'ai', currency: Currency.XCD),

  /// Albania
  ALBANIA(offTag: 'al', currency: Currency.ALL),

  /// Armenia
  ARMENIA(offTag: 'am', currency: Currency.AMD),

  /// Angola
  ANGOLA(offTag: 'ao', currency: Currency.AOA),

  /// Antarctica
  ANTARCTICA(offTag: 'aq', currency: null),

  /// Argentina
  ARGENTINA(
    offTag: 'ar',
    currency: Currency.ARS,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Argentina',
  ),

  /// American Samoa
  AMERICAN_SAMOA(
    offTag: 'as', 
    currency: Currency.USD,
    
  ),

  /// Austria
  AUSTRIA(
    offTag: 'at', 
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Local_Communities/GermanTeam/Country_Support',
  ),

  /// Australia
  AUSTRALIA(
    offTag: 'au',
    currency: Currency.AUD,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Australia',
  ),

  /// Aruba
  ARUBA(offTag: 'aw', currency: Currency.AWG),

  /// Åland Islands
  ALAND_ISLANDS(offTag: 'ax', currency: Currency.EUR),

  /// Azerbaijan
  AZERBAIJAN(offTag: 'az', currency: Currency.AZN),

  /// Bosnia and Herzegovina
  BOSNIA_AND_HERZEGOVINA(offTag: 'ba', currency: Currency.BAM),

  /// Barbados
  BARBADOS(offTag: 'bb', currency: Currency.BBD),

  /// Bangladesh
  BANGLADESH(offTag: 'bd', currency: Currency.BDT),

  /// Belgium
  BELGIUM(
    offTag: 'be', 
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Belgium',
  ),

  /// Burkina Faso
  BURKINA_FASO(offTag: 'bf', currency: Currency.XOF),

  /// Bulgaria
  BULGARIA(
    offTag: 'bg', 
    currency: Currency.BGN,
    wikiUrl: 'https://wiki.openfoodfacts.org/Local_Communities/BulgarianTeam',
  ),

  /// Bahrain
  BAHRAIN(offTag: 'bh', currency: Currency.BHD),

  /// Burundi
  BURUNDI(offTag: 'bi', currency: Currency.BIF),

  /// Benin
  BENIN(offTag: 'bj', currency: Currency.XOF),

  /// Saint Barthélemy
  SAINT_BARTHELEMY(offTag: 'bl', currency: Currency.EUR),

  /// Bermuda
  BERMUDA(offTag: 'bm', currency: Currency.BMD),

  /// Brunei Darussalam
  BRUNEI_DARUSSALAM(offTag: 'bn', currency: Currency.BND),

  /// Bolivia (Plurinational State of)
  BOLIVIA(offTag: 'bo', currency: Currency.BOB),

  /// Bonaire, Sint Eustatius and Saba
  BONAIRE(offTag: 'bq', currency: Currency.USD),

  /// Brazil
  BRAZIL(offTag: 'br', currency: Currency.BRL),

  /// Bahamas
  BAHAMAS(offTag: 'bs', currency: Currency.BSD),

  /// Bhutan
  BHUTAN(offTag: 'bt', currency: Currency.BTN),

  /// Bouvet Island
  BOUVET_ISLAND(offTag: 'bv', currency: Currency.NOK),

  /// Botswana
  BOTSWANA(offTag: 'bw', currency: Currency.BWP),

  /// Belarus
  BELARUS(offTag: 'by', currency: Currency.BYN),

  /// Belize
  BELIZE(offTag: 'bz', currency: Currency.BZD),

  /// Canada
  CANADA(
    offTag: 'ca',
    currency: Currency.CAD,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Canada',
  ),

  /// Cocos (Keeling) Islands
  COCOS_ISLANDS(offTag: 'cc', currency: Currency.AUD),

  /// Congo, Democratic Republic of the
  DEMOCRATIC_REPUBLIC_OF_THE_CONGO(offTag: 'cd', currency: Currency.CDF),

  /// Central African Republic
  CENTRAL_AFRICAN_REPUBLIC(offTag: 'cf', currency: Currency.XAF),

  /// Congo
  CONGO(offTag: 'cg', currency: Currency.XAF),

  /// Switzerland
  SWITZERLAND(
    offTag: 'ch', 
    currency: Currency.CHF,
    wikiUrl: 'https://wiki.openfoodfacts.org/Local_Communities/SwissTeam/Country_Support',
  ),

  /// Côte d'Ivoire
  COTE_D_IVOIRE(offTag: 'ci', currency: Currency.XOF),

  /// Cook Islands
  COOK_ISLANDS(offTag: 'ck', currency: Currency.NZD),

  /// Chile
  CHILE(
    offTag: 'cl', 
    currency: Currency.CLP,
    wikiUrl: 'https://wiki.openfoodfacts.org/Local_Communities/ChileanTeam',
  ),

  /// Cameroon
  CAMEROON(offTag: 'cm', currency: Currency.XAF),

  /// China
  CHINA(
    offTag: 'cn',
    currency: Currency.CNY,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_China',
  ),

  /// Colombia
  COLOMBIA(offTag: 'co', currency: Currency.COP),

  /// Costa Rica
  COSTA_RICA(offTag: 'cr', currency: Currency.CRC),

  /// Cuba
  CUBA(offTag: 'cu', currency: Currency.CUP),

  /// Cabo Verde
  CABO_VERDE(offTag: 'cv', currency: Currency.CVE),

  /// Curaçao
  CURACAO(offTag: 'cw', currency: Currency.ANG),

  /// Christmas Island
  CHRISTMAS_ISLAND(offTag: 'cx', currency: Currency.AUD),

  ///Cyprus
  CYPRUS(offTag: 'cy', currency: Currency.EUR),

  /// Czechia
  CZECHIA(offTag: 'cz', currency: Currency.CZK),

  /// Germany
  GERMANY(
    offTag: 'de',
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Germany',
  ),

  /// Djibouti
  DJIBOUTI(offTag: 'dj', currency: Currency.DJF),

  /// Denmark
  DENMARK(offTag: 'dk', currency: Currency.DKK),

  /// Dominica
  DOMINICA(offTag: 'dm', currency: Currency.XCD),

  /// Dominican Republic
  DOMINICAN_REPUBLIC(offTag: 'do', currency: Currency.DOP),

  /// Algeria
  ALGERIA(offTag: 'dz', currency: Currency.DZD),

  /// Ecuador
  ECUADOR(offTag: 'ec', currency: Currency.USD),

  /// Estonia
  ESTONIA(offTag: 'ee', currency: Currency.EUR),

  /// Egypt
  EGYPT(offTag: 'eg', currency: Currency.EGP),

  /// Western Sahara
  WESTERN_SAHARA(offTag: 'eh', currency: Currency.MAD),

  /// Eritrea
  ERITREA(offTag: 'er', currency: Currency.ERN),

  /// Spain
  SPAIN(
    offTag: 'es',
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Spain',
  ),

  /// Ethiopia
  ETHIOPIA(offTag: 'et', currency: Currency.ETB),

  /// Finland
  FINLAND(
    offTag: 'fi', 
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Local_Communities/FinnishTeam/Country_Support',
  ),

  /// Fiji
  FIJI(offTag: 'fj', currency: Currency.FJD),

  /// Falkland Islands (Malvinas)
  FALKLAND_ISLANDS(offTag: 'fk', currency: Currency.FKP),

  /// Micronesia (Federated States of)
  MICRONESIA(offTag: 'fm', currency: Currency.USD),

  /// Faroe Islands
  FAROE_ISLANDS(offTag: 'fo', currency: Currency.DKK),

  /// France
  FRANCE(
    offTag: 'fr',
    currency: Currency.EUR,
    wikiUrl:
        'https://wiki.openfoodfacts.org/Local_Communities/FrenchTeam/Country_Support',
  ),

  /// Gabon
  GABON(offTag: 'ga', currency: Currency.XAF),

  /// United Kingdom of Great Britain and Northern Ireland
  // in OFF this is not 'gb'
  UNITED_KINGDOM(
    offTag: 'uk', 
    currency: Currency.GBP,
    wikiUrl: 'https://wiki.openfoodfacts.org/Local_Communities/UKTeam',
  ),

  /// Grenada
  GRENADA(offTag: 'gd', currency: Currency.XCD),

  /// Georgia
  GEORGIA(offTag: 'ge', currency: Currency.GEL),

  /// French Guiana
  FRENCH_GUIANA(
    offTag: 'gf', 
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Local_Communities/FrenchTeam/Country_Support',
  ),

  /// Guernsey
  GUERNSEY(offTag: 'gg', currency: Currency.GBP),

  /// Ghana
  GHANA(offTag: 'gh', currency: Currency.GHS),

  /// Gibraltar
  GIBRALTAR(offTag: 'gi', currency: Currency.GIP),

  /// Greenland
  GREENLAND(offTag: 'gl', currency: Currency.DKK),

  /// Gambia
  GAMBIA(offTag: 'gm', currency: Currency.GMD),

  /// Guinea
  GUINEA(offTag: 'gn', currency: Currency.GNF),

  /// Guadeloupe
  GUADELOUPE(
    offTag: 'gp', 
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Local_Communities/FrenchTeam/Country_Support',
  ),

  /// Equatorial Guinea
  EQUATORIAL_GUINEA(offTag: 'gq', currency: Currency.XAF),

  /// Greece
  GREECE(
    offTag: 'gr', 
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Greece',
  ),

  /// South Georgia and the South Sandwich Islands
  SOUTH_GEORGIA(offTag: 'gs', currency: Currency.FKP),

  /// Guatemala
  GUATEMALA(offTag: 'gt', currency: Currency.GTQ),

  /// Guam
  GUAM(offTag: 'gu', currency: Currency.USD),

  /// Guinea-Bissau
  GUINEA_BISSAU(offTag: 'gw', currency: Currency.XOF),

  /// Guyana
  GUYANA(offTag: 'gy', currency: Currency.GYD),

  /// Hong Kong
  HONG_KONG(offTag: 'hk', currency: Currency.HKD),

  /// Heard Island and McDonald Islands
  HEARD_ISLAND(offTag: 'hm', currency: Currency.AUD),

  /// Honduras
  HONDURAS(offTag: 'hn', currency: Currency.HNL),

  /// Croatia
  CROATIA(
    offTag: 'hr', 
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Local_Communities/CroatianTeam',
  ),

  /// Haiti
  HAITI(offTag: 'ht', currency: Currency.HTG),

  /// Hungary
  HUNGARY(offTag: 'hu', currency: Currency.HUF),

  /// Indonesia
  INDONESIA(offTag: 'id', currency: Currency.IDR),

  /// Ireland
  IRELAND(offTag: 'ie', currency: Currency.EUR),

  /// Israel
  ISRAEL(
    offTag: 'il', 
    currency: Currency.ILS,
    wikiUrl: 'https://wiki.openfoodfacts.org/Local_Communities/IsraeliTeam/Country_Support',
  ),

  /// Isle of Man
  ISLE_OF_MAN(offTag: 'im', currency: Currency.GBP),

  /// India
  INDIA(
    offTag: 'in',
    currency: Currency.INR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_India',
  ),

  /// British Indian Ocean Territory
  BRITISH_INDIAN_OCEAN_TERRITORY(offTag: 'io', currency: Currency.USD),

  /// Iraq
  IRAQ(offTag: 'iq', currency: Currency.IQD),

  /// Iran (Islamic Republic of)
  IRAN(offTag: 'ir', currency: Currency.IRR),

  /// Iceland
  ICELAND(offTag: 'is', currency: Currency.ISK),

  /// Italy
  ITALY(
    offTag: 'it',
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Italy',
  ),

  /// Jersey
  JERSEY(offTag: 'je', currency: Currency.GBP),

  /// Jamaica
  JAMAICA(offTag: 'jm', currency: Currency.JMD),

  /// Jordan
  JORDAN(offTag: 'jo', currency: Currency.JOD),

  /// Japan
  JAPAN(
    offTag: 'jp',
    currency: Currency.JPY,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Japan',
  ),

  /// Kenya
  KENYA(offTag: 'ke', currency: Currency.KES),

  /// Kyrgyzstan
  KYRGYZSTAN(offTag: 'kg', currency: Currency.KGS),

  /// Cambodia
  CAMBODIA(offTag: 'kh', currency: Currency.KHR),

  /// Kiribati
  KIRIBATI(offTag: 'ki', currency: Currency.AUD),

  /// Comoros
  COMOROS(offTag: 'km', currency: Currency.KMF),

  /// Saint Kitts and Nevis
  SAINT_KITTS_AND_NEVIS(offTag: 'kn', currency: Currency.XCD),

  /// Korea (Democratic People's Republic of)
  NORTH_KOREA(offTag: 'kp', currency: Currency.KPW),

  /// Korea, Republic of
  SOUTH_KOREA(
    offTag: 'kr',
    currency: Currency.KRW,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_South_Korea',
  ),

  /// Kuwait
  KUWAIT(offTag: 'kw', currency: Currency.KWD),

  /// Cayman Islands
  CAYMAN_ISLANDS(offTag: 'ky', currency: Currency.KYD),

  /// Kazakhstan
  KAZAKHSTAN(offTag: 'kz', currency: Currency.KZT),

  /// Lao People's Democratic Republic
  LAOS(offTag: 'la', currency: Currency.LAK),

  /// Lebanon
  LEBANON(offTag: 'lb', currency: Currency.LBP),

  /// Saint Lucia
  SAINT_LUCIA(offTag: 'lc', currency: Currency.XCD),

  /// Liechtenstein
  LIECHTENSTEIN(offTag: 'li', currency: Currency.CHF),

  /// Sri Lanka
  SRI_LANKA(offTag: 'lk', currency: Currency.LKR),

  /// Liberia
  LIBERIA(offTag: 'lr', currency: Currency.LRD),

  /// Lesotho
  LESOTHO(offTag: 'ls', currency: Currency.LSL),

  /// Lithuania
  LITHUANIA(offTag: 'lt', currency: Currency.EUR),

  /// Luxembourg
  LUXEMBOURG(offTag: 'lu', currency: Currency.EUR),

  /// Latvia
  LATVIA(offTag: 'lv', currency: Currency.EUR),

  /// Libya
  LIBYA(offTag: 'ly', currency: Currency.LYD),

  /// Morocco
  MOROCCO(offTag: 'ma', currency: Currency.MAD),

  /// Monaco
  MONACO(offTag: 'mc', currency: Currency.EUR),

  /// Moldova, Republic of
  MOLDOVA(offTag: 'md', currency: Currency.MDL),

  /// Montenegro
  MONTENEGRO(offTag: 'me', currency: Currency.EUR),

  /// Saint Martin (French part)
  SAINT_MARTIN(offTag: 'mf', currency: Currency.EUR),

  /// Madagascar
  MADAGASCAR(offTag: 'mg', currency: Currency.MGA),

  /// Marshall Islands
  MARSHALL_ISLANDS(offTag: 'mh', currency: Currency.USD),

  /// North Macedonia
  NORTH_MACEDONIA(offTag: 'mk', currency: Currency.MKD),

  /// Mali
  MALI(offTag: 'ml', currency: Currency.XOF),

  /// Myanmar
  MYANMAR(offTag: 'mm', currency: Currency.MMK),

  /// Mongolia
  MONGOLIA(offTag: 'mn', currency: Currency.MNT),

  /// Macao
  MACAO(offTag: 'mo', currency: Currency.MOP),

  /// Northern Mariana Islands
  NORTHERN_MARIANA_ISLANDS(offTag: 'mp', currency: Currency.USD),

  /// Martinique
  MARTINIQUE(
    offTag: 'mq', 
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Local_Communities/FrenchTeam/Country_Support',
  ),

  /// Mauritania
  MAURITANIA(offTag: 'mr', currency: Currency.MRU),

  /// Montserrat
  MONTSERRAT(offTag: 'ms', currency: Currency.XCD),

  /// Malta
  MALTA(offTag: 'mt', currency: Currency.EUR),

  /// Mauritius
  MAURITIUS(offTag: 'mu', currency: Currency.MUR),

  /// Maldives
  MALDIVES(offTag: 'mv', currency: Currency.MVR),

  /// Malawi
  MALAWI(offTag: 'mw', currency: Currency.MWK),

  /// Mexico
  MEXICO(
    offTag: 'mx',
    currency: Currency.MXN,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Mexico',
  ),

  /// Malaysia
  MALAYSIA(offTag: 'my', currency: Currency.MYR),

  /// Mozambique
  MOZAMBIQUE(offTag: 'mz', currency: Currency.MZN),

  /// Namibia
  NAMIBIA(offTag: 'na', currency: Currency.NAD),

  /// New Caledonia
  NEW_CALEDONIA(
    offTag: 'nc', 
    currency: Currency.XPF,
    wikiUrl: 'https://wiki.openfoodfacts.org/Local_Communities/FrenchTeam/Country_Support',
  ),

  /// Niger
  NIGER(offTag: 'ne', currency: Currency.XOF),

  /// Norfolk Island
  NORFOLK_ISLAND(offTag: 'nf', currency: Currency.AUD),

  /// Nigeria
  NIGERIA(
    offTag: 'ng', 
    currency: Currency.NGN,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Nigeria',
  ),

  /// Nicaragua
  NICARAGUA(offTag: 'ni', currency: Currency.NIO),

  /// Netherlands
  NETHERLANDS(
    offTag: 'nl',
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Netherlands',
  ),

  /// Norway
  NORWAY(offTag: 'no', currency: Currency.NOK),

  /// Nepal
  NEPAL(offTag: 'np', currency: Currency.NPR),

  /// Nauru
  NAURU(offTag: 'nr', currency: Currency.AUD),

  /// Niue
  NIUE(offTag: 'nu', currency: Currency.NZD),

  /// New Zealand
  NEW_ZEALAND(offTag: 'nz', currency: Currency.NZD),

  /// Oman
  OMAN(offTag: 'om', currency: Currency.OMR),

  /// Panama
  PANAMA(offTag: 'pa', currency: Currency.PAB),

  /// Peru
  PERU(offTag: 'pe', currency: Currency.PEN),

  /// French Polynesia
  FRENCH_POLYNESIA(
    offTag: 'pf', 
    currency: Currency.XPF,
    wikiUrl: 'https://wiki.openfoodfacts.org/Local_Communities/FrenchTeam/Country_Support',
  ),

  /// Papua New Guinea
  PAPUA_NEW_GUINEA(offTag: 'pg', currency: Currency.PGK),

  /// Philippines
  PHILIPPINES(offTag: 'ph', currency: Currency.PHP),

  /// Pakistan
  PAKISTAN(offTag: 'pk', currency: Currency.PKR),

  /// Poland
  POLAND(
    offTag: 'pl', 
    currency: Currency.PLN,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Poland',
  ),

  /// Saint Pierre and Miquelon
  SAINT_PIERRE_AND_MIQUELON(
    offTag: 'pm', 
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Local_Communities/FrenchTeam/Country_Support',
  ),

  /// Pitcairn
  PITCAIRN(offTag: 'pn', currency: Currency.NZD),

  /// Puerto Rico
  PUERTO_RICO(offTag: 'pr', currency: Currency.USD),

  /// Palestine, State of
  PALESTINE(offTag: 'ps', currency: Currency.ILS),

  /// Portugal
  PORTUGAL(
    offTag: 'pt', 
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Portugal',
  ),

  /// Palau
  PALAU(offTag: 'pw', currency: Currency.USD),

  /// Paraguay
  PARAGUAY(offTag: 'py', currency: Currency.PYG),

  /// Qatar
  QATAR(offTag: 'qa', currency: Currency.QAR),

  /// Réunion
  REUNION(
    offTag: 're', 
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Local_Communities/FrenchTeam/Country_Support',
  ),

  /// Romania
  ROMANIA(offTag: 'ro', currency: Currency.RON),

  /// Serbia
  SERBIA(offTag: 'rs', currency: Currency.RSD),

  /// Russian Federation
  RUSSIA(
    offTag: 'ru',
    currency: Currency.RUB,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Russia',
  ),

  /// Rwanda
  RWANDA(offTag: 'rw', currency: Currency.RWF),

  /// Saudi Arabia
  SAUDI_ARABIA(offTag: 'sa', currency: Currency.SAR),

  /// Solomon Islands
  SOLOMON_ISLANDS(offTag: 'sb', currency: Currency.SBD),

  /// Seychelles
  SEYCHELLES(offTag: 'sc', currency: Currency.SCR),

  /// Sudan
  SUDAN(offTag: 'sd', currency: Currency.SDG),

  /// Sweden
  SWEDEN(
    offTag: 'se', 
    currency: Currency.SEK,
    wikiUrl: 'https://wiki.openfoodfacts.org/Local_Communities/SwedishTeam/Country_Support',
  ),

  /// Singapore
  SINGAPORE(offTag: 'sg', currency: Currency.SGD),

  /// Saint Helena, Ascension and Tristan da Cunha
  SAINT_HELENA(offTag: 'sh', currency: Currency.SHP),

  /// Slovenia
  SLOVENIA(offTag: 'si', currency: Currency.EUR),

  /// Svalbard and Jan Mayen
  SVALBARD_AND_JAN_MAYEN(offTag: 'sj', currency: Currency.NOK),

  /// Slovakia
  SLOVAKIA(offTag: 'sk', currency: Currency.EUR),

  /// Sierra Leone
  SIERRA_LEONE(offTag: 'sl', currency: Currency.SLE),

  /// San Marino
  SAN_MARINO(offTag: 'sm', currency: Currency.EUR),

  /// Senegal
  SENEGAL(offTag: 'sn', currency: Currency.XOF),

  /// Somalia
  SOMALIA(offTag: 'so', currency: Currency.SOS),

  /// Suriname
  SURINAME(offTag: 'sr', currency: Currency.SRD),

  /// South Sudan
  SOUTH_SUDAN(offTag: 'ss', currency: Currency.SSP),

  /// Sao Tome and Principe
  SAO_TOME_AND_PRINCIPE(offTag: 'st', currency: Currency.STN),

  /// El Salvador
  EL_SALVADOR(offTag: 'sv', currency: Currency.SVC),

  /// Sint Maarten (Dutch part)
  SINT_MAARTEN(offTag: 'sx', currency: Currency.ANG),

  /// Syrian Arab Republic
  SYRIA(offTag: 'sy', currency: Currency.SYP),

  /// Eswatini
  ESWATINI(offTag: 'sz', currency: Currency.SZL),

  /// Turks and Caicos Islands
  TURKS_AND_CAICOS_ISLANDS(offTag: 'tc', currency: Currency.USD),

  /// Chad
  CHAD(offTag: 'td', currency: Currency.XAF),

  /// French Southern Territories
  FRENCH_SOUTHERN_TERRITORIES(
    offTag: 'tf', 
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Local_Communities/FrenchTeam/Country_Support',
  ),

  /// Togo
  TOGO(offTag: 'tg', currency: Currency.XOF),

  /// Thailand
  THAILAND(
    offTag: 'th', 
    currency: Currency.THB,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Thailand',
  ),

  /// Tajikistan
  TAJIKISTAN(offTag: 'tj', currency: Currency.TJS),

  /// Tokelau
  TOKELAU(offTag: 'tk', currency: Currency.NZD),

  /// Timor-Leste
  TIMOR_LESTE(offTag: 'tl', currency: Currency.USD),

  /// Turkmenistan
  TURKMENISTAN(offTag: 'tm', currency: Currency.TMT),

  /// Tunisia
  TUNISIA(offTag: 'tn', currency: Currency.TND),

  /// Tonga
  TONGA(offTag: 'to', currency: Currency.TOP),

  /// Turkey
  TURKEY(offTag: 'tr', currency: Currency.TRY),

  /// Trinidad and Tobago
  TRINIDAD_AND_TOBAGO(offTag: 'tt', currency: Currency.TTD),

  /// Tuvalu
  TUVALU(offTag: 'tv', currency: Currency.AUD),

  /// Taiwan, Province of China
  TAIWAN(
    offTag: 'tw', 
    currency: Currency.TWD,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Taiwan',
  ),

  /// Tanzania, United Republic of
  TANZANIA(offTag: 'tz', currency: Currency.TZS),

  /// Ukraine
  UKRAINE(
    offTag: 'ua', 
    currency: Currency.UAH,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Ukraine',
  ),

  /// Uganda
  UGANDA(offTag: 'ug', currency: Currency.UGX),

  /// United States Minor Outlying Islands
  UNITED_STATES_MINOR_OUTLYING_ISLANDS(
    offTag: 'um', 
    currency: Currency.USD,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_United_States',
  ),

  /// United States of America
  USA(
    offTag: 'us',
    currency: Currency.USD,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_United_States',
  ),

  /// Uruguay
  URUGUAY(offTag: 'uy', currency: Currency.UYU),

  /// Uzbekistan
  UZBEKISTAN(offTag: 'uz', currency: Currency.UZS),

  /// Holy See
  HOLY_SEE(offTag: 'va', currency: Currency.EUR),

  /// Saint Vincent and the Grenadines
  SAINT_VINCENT_AND_THE_GRENADINES(offTag: 'vc', currency: Currency.XCD),

  /// Venezuela (Bolivarian Republic of)
  VENEZUELA(offTag: 've', currency: Currency.VED),

  /// Virgin Islands (British)
  BRITISH_VIRGIN_ISLANDS(offTag: 'vg', currency: Currency.USD),

  /// Virgin Islands (U.S.)
  US_VIRGIN_ISLANDS(offTag: 'vi', currency: Currency.USD),

  /// Viet Nam
  VIET_NAM(offTag: 'vn', currency: Currency.VND),

  /// Vanuatu
  VANUATU(offTag: 'vu', currency: Currency.VUV),

  /// Wallis and Futuna
  WALLIS_AND_FUTUNA(offTag: 'wf', currency: Currency.XPF),

  /// Samoa
  SAMOA(offTag: 'ws', currency: Currency.WST),

  /// Yemen
  YEMEN(offTag: 'ye', currency: Currency.YER),

  /// Mayotte
  MAYOTTE(
    offTag: 'yt', 
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Local_Communities/FrenchTeam/Country_Support',
  ),

  /// South Africa
  SOUTH_AFRICA(offTag: 'za', currency: Currency.ZAR),

  /// Zambia
  ZAMBIA(offTag: 'zm', currency: Currency.ZMW),

  /// Zimbabwe
  ZIMBABWE(offTag: 'zw', currency: Currency.ZWL);

  const OpenFoodFactsCountry({
    required this.offTag,
    required this.currency,
    this.wikiUrl,
  });

  /// Lowercase ISO 639-1, except for [UNITED_KINGDOM].
  @override
  final String offTag;

  // TODO(monsieurtanuki): remove ANTARCTICA, with no products and no currency?
  // Pierre: prices are probably frozen there. Food is probably also frozen.
  /// Country most probable and up-to-date currency.
  final Currency? currency;

  /// Wiki URL.
  final String? wikiUrl;

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
