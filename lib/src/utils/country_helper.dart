import '../model/off_tagged.dart';
import '../prices/currency.dart';

/// Countries.
///
/// cf. https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2
/// ISO 3166-1 alpha-3 codes are also included for each country
enum OpenFoodFactsCountry implements OffTagged {
  /// Andorra
  ANDORRA(offTag: 'ad', iso3Code: 'AND', currency: Currency.EUR),

  /// United Arab Emirates
  UNITED_ARAB_EMIRATES(offTag: 'ae', iso3Code: 'ARE', currency: Currency.AED),

  /// Afghanistan
  AFGHANISTAN(offTag: 'af', iso3Code: 'AFG', currency: Currency.AFN),

  /// Antigua and Barbuda
  ANTIGUA_AND_BARBUDA(offTag: 'ag', iso3Code: 'ATG', currency: Currency.XCD),

  /// Anguilla
  ANGUILLA(offTag: 'ai', iso3Code: 'AIA', currency: Currency.XCD),

  /// Albania
  ALBANIA(offTag: 'al', iso3Code: 'ALB', currency: Currency.ALL),

  /// Armenia
  ARMENIA(offTag: 'am', iso3Code: 'ARM', currency: Currency.AMD),

  /// Angola
  ANGOLA(offTag: 'ao', iso3Code: 'AGO', currency: Currency.AOA),

  /// Antarctica
  ANTARCTICA(offTag: 'aq', iso3Code: 'ATA', currency: null),

  /// Argentina
  ARGENTINA(
    offTag: 'ar',
    iso3Code: 'ARG',
    currency: Currency.ARS,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Argentina',
  ),

  /// American Samoa
  AMERICAN_SAMOA(
    offTag: 'as',
    iso3Code: 'ASM',
    currency: Currency.USD,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_United_States',
  ),

  /// Austria
  AUSTRIA(
    offTag: 'at',
    iso3Code: 'AUT'
    currency: Currency.EUR,
    wikiUrl:
        'https://wiki.openfoodfacts.org/Local_Communities/GermanTeam/Country_Support',
  ),

  /// Australia
  AUSTRALIA(
    offTag: 'au',
    iso3Code: 'AUS',
    currency: Currency.AUD,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Australia',
  ),

  /// Aruba
  ARUBA(offTag: 'aw', iso3Code: 'ABW', currency: Currency.AWG),

  /// Åland Islands
  ALAND_ISLANDS(offTag: 'ax', iso3Code: 'ALA', currency: Currency.EUR),

  /// Azerbaijan
  AZERBAIJAN(offTag: 'az', iso3Code: 'AZE', currency: Currency.AZN),

  /// Bosnia and Herzegovina
  BOSNIA_AND_HERZEGOVINA(offTag: 'ba', iso3Code: 'BIH', currency: Currency.BAM),

  /// Barbados
  BARBADOS(offTag: 'bb', iso3Code: 'BRB', currency: Currency.BBD),

  /// Bangladesh
  BANGLADESH(offTag: 'bd', iso3Code: 'BGD', currency: Currency.BDT),

  /// Belgium
  BELGIUM(
    offTag: 'be',
    iso3Code: 'BEL',
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Belgium',
  ),

  /// Burkina Faso
  BURKINA_FASO(offTag: 'bf', iso3Code: 'BFA', currency: Currency.XOF),

  /// Bulgaria
  BULGARIA(
    offTag: 'bg',
    iso3Code: 'BGR',
    currency: Currency.BGN,
    wikiUrl: 'https://wiki.openfoodfacts.org/Local_Communities/BulgarianTeam',
  ),

  /// Bahrain
  BAHRAIN(offTag: 'bh', iso3Code: 'BHR', currency: Currency.BHD),

  /// Burundi
  BURUNDI(offTag: 'bi', iso3Code: 'BDI', currency: Currency.BIF),

  /// Benin
  BENIN(offTag: 'bj', iso3Code: 'BEN', currency: Currency.XOF),

  /// Saint Barthélemy
  SAINT_BARTHELEMY(offTag: 'bl', iso3Code: 'BLM', currency: Currency.EUR),

  /// Bermuda
  BERMUDA(offTag: 'bm', iso3Code: 'BMU', currency: Currency.BMD),

  /// Brunei Darussalam
  BRUNEI_DARUSSALAM(offTag: 'bn', iso3Code: 'BRN', currency: Currency.BND),

  /// Bolivia (Plurinational State of)
  BOLIVIA(offTag: 'bo', iso3Code: 'BOL', currency: Currency.BOB),

  /// Bonaire, Sint Eustatius and Saba
  BONAIRE(offTag: 'bq', iso3Code: 'BES', currency: Currency.USD),

  /// Brazil
  BRAZIL(offTag: 'br', iso3Code: 'BRA', currency: Currency.BRL),

  /// Bahamas
  BAHAMAS(offTag: 'bs', iso3Code: 'BHS', currency: Currency.BSD),

  /// Bhutan
  BHUTAN(offTag: 'bt', iso3Code: 'BTN', currency: Currency.BTN),

  /// Bouvet Island
  BOUVET_ISLAND(offTag: 'bv', iso3Code: 'BVT', currency: Currency.NOK),

  /// Botswana
  BOTSWANA(offTag: 'bw', iso3Code: 'BWA', currency: Currency.BWP),

  /// Belarus
  BELARUS(offTag: 'by', iso3Code: 'BLR', currency: Currency.BYN),

  /// Belize
  BELIZE(offTag: 'bz', iso3Code: 'BLZ', currency: Currency.BZD),

  /// Canada
  CANADA(
    offTag: 'ca',
    iso3Code: 'CAN',
    currency: Currency.CAD,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Canada',
  ),

  /// Cocos (Keeling) Islands
  COCOS_ISLANDS(offTag: 'cc', iso3Code: 'CCK', currency: Currency.AUD),

  /// Congo, Democratic Republic of the
  DEMOCRATIC_REPUBLIC_OF_THE_CONGO(
      offTag: 'cd', iso3Code: 'COD', currency: Currency.CDF),

  /// Central African Republic
  CENTRAL_AFRICAN_REPUBLIC(
      offTag: 'cf', iso3Code: 'CAF', currency: Currency.XAF),

  /// Congo
  CONGO(offTag: 'cg', iso3Code: 'COG', currency: Currency.XAF),

  /// Switzerland
  SWITZERLAND(
    offTag: 'ch',
    iso3Code: 'CHE',
    currency: Currency.CHF,
    wikiUrl:
        'https://wiki.openfoodfacts.org/Local_Communities/SwissTeam/Country_Support',
  ),

  /// Côte d'Ivoire
  COTE_D_IVOIRE(offTag: 'ci', iso3Code: 'CIV', currency: Currency.XOF),

  /// Cook Islands
  COOK_ISLANDS(offTag: 'ck', iso3Code: 'COK', currency: Currency.NZD),

  /// Chile
  CHILE(
    offTag: 'cl',
    iso3Code: 'CHL',
    currency: Currency.CLP,
    wikiUrl: 'https://wiki.openfoodfacts.org/Local_Communities/ChileanTeam',
  ),

  /// Cameroon
  CAMEROON(offTag: 'cm', iso3Code: 'CMR', currency: Currency.XAF),

  /// China
  CHINA(
    offTag: 'cn',
    iso3Code: 'CHN',
    currency: Currency.CNY,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_China',
  ),

  /// Colombia
  COLOMBIA(offTag: 'co', iso3Code: 'COL', currency: Currency.COP),

  /// Costa Rica
  COSTA_RICA(offTag: 'cr', iso3Code: 'CRI', currency: Currency.CRC),

  /// Cuba
  CUBA(offTag: 'cu', iso3Code: 'CUB', currency: Currency.CUP),

  /// Cabo Verde
  CABO_VERDE(offTag: 'cv', iso3Code: 'CPV', currency: Currency.CVE),

  /// Curaçao
  CURACAO(offTag: 'cw', iso3Code: 'CUW', currency: Currency.ANG),

  /// Christmas Island
  CHRISTMAS_ISLAND(offTag: 'cx', iso3Code: 'CXR', currency: Currency.AUD),

  ///Cyprus
  CYPRUS(offTag: 'cy', iso3Code: 'CYP', currency: Currency.EUR),

  /// Czechia
  CZECHIA(offTag: 'cz', iso3Code: 'CZE', currency: Currency.CZK),

  /// Germany
  GERMANY(
    offTag: 'de',
    iso3Code: 'DEU',
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Germany',
  ),

  /// Djibouti
  DJIBOUTI(offTag: 'dj', iso3Code: 'DJI', currency: Currency.DJF),

  /// Denmark
  DENMARK(offTag: 'dk', iso3Code: 'DNK', currency: Currency.DKK),

  /// Dominica
  DOMINICA(offTag: 'dm', iso3Code: 'DMA', currency: Currency.XCD),

  /// Dominican Republic
  DOMINICAN_REPUBLIC(offTag: 'do', iso3Code: 'DOM', currency: Currency.DOP),

  /// Algeria
  ALGERIA(offTag: 'dz', iso3Code: 'DZA', currency: Currency.DZD),

  /// Ecuador
  ECUADOR(offTag: 'ec', iso3Code: 'ECU', currency: Currency.USD),

  /// Estonia
  ESTONIA(offTag: 'ee', iso3Code: 'EST', currency: Currency.EUR),

  /// Egypt
  EGYPT(offTag: 'eg', iso3Code: 'EGY', currency: Currency.EGP),

  /// Western Sahara
  WESTERN_SAHARA(offTag: 'eh', iso3Code: 'ESH', currency: Currency.MAD),

  /// Eritrea
  ERITREA(offTag: 'er', iso3Code: 'ERI', currency: Currency.ERN),

  /// Spain
  SPAIN(
    offTag: 'es',
    iso3Code: 'ESP',
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Spain',
  ),

  /// Ethiopia
  ETHIOPIA(offTag: 'et', iso3Code: 'ETH', currency: Currency.ETB),

  /// Finland
  FINLAND(
    offTag: 'fi',
    iso3Code: 'FIN',
    currency: Currency.EUR,
    wikiUrl:
        'https://wiki.openfoodfacts.org/Local_Communities/FinnishTeam/Country_Support',
  ),

  /// Fiji
  FIJI(offTag: 'fj', iso3Code: 'FJI', currency: Currency.FJD),

  /// Falkland Islands (Malvinas)
  FALKLAND_ISLANDS(offTag: 'fk', iso3Code: 'FLK', currency: Currency.FKP),

  /// Micronesia (Federated States of)
  MICRONESIA(offTag: 'fm', iso3Code: 'FSM', currency: Currency.USD),

  /// Faroe Islands
  FAROE_ISLANDS(offTag: 'fo', iso3Code: 'FRO', currency: Currency.DKK),

  /// France
  FRANCE(
    offTag: 'fr',
    iso3Code: 'FRA',
    currency: Currency.EUR,
    wikiUrl:
        'https://wiki.openfoodfacts.org/Local_Communities/FrenchTeam/Country_Support',
  ),

  /// Gabon
  GABON(offTag: 'ga', iso3Code: 'GAB', currency: Currency.XAF),

  /// United Kingdom of Great Britain and Northern Ireland
  // in OFF this is not 'gb'
  UNITED_KINGDOM(
    offTag: 'uk',
    iso3Code: 'GBR',
    currency: Currency.GBP,
    wikiUrl: 'https://wiki.openfoodfacts.org/Local_Communities/UKTeam',
  ),

  /// Grenada
  GRENADA(offTag: 'gd', iso3Code: 'GRD', currency: Currency.XCD),

  /// Georgia
  GEORGIA(offTag: 'ge', iso3Code: 'GEO', currency: Currency.GEL),

  /// French Guiana
  FRENCH_GUIANA(
    offTag: 'gf',
    iso3Code: 'GUF',
    currency: Currency.EUR,
    wikiUrl:
        'https://wiki.openfoodfacts.org/Local_Communities/FrenchTeam/Country_Support',
  ),

  /// Guernsey
  GUERNSEY(offTag: 'gg', iso3Code: 'GGY', currency: Currency.GBP),

  /// Ghana
  GHANA(offTag: 'gh', iso3Code: 'GHA', currency: Currency.GHS),

  /// Gibraltar
  GIBRALTAR(offTag: 'gi', iso3Code: 'GIB', currency: Currency.GIP),

  /// Greenland
  GREENLAND(offTag: 'gl', iso3Code: 'GRL', currency: Currency.DKK),

  /// Gambia
  GAMBIA(offTag: 'gm', iso3Code: 'GMB', currency: Currency.GMD),

  /// Guinea
  GUINEA(offTag: 'gn', iso3Code: 'GIN', currency: Currency.GNF),

  /// Guadeloupe
  GUADELOUPE(
    offTag: 'gp',
    iso3Code: 'GLP'
    currency: Currency.EUR,
    wikiUrl:
        'https://wiki.openfoodfacts.org/Local_Communities/FrenchTeam/Country_Support',
  ),

  /// Equatorial Guinea
  EQUATORIAL_GUINEA(offTag: 'gq', iso3Code: 'GNQ', currency: Currency.XAF),

  /// Greece
  GREECE(
    offTag: 'gr',
    iso3Code: 'GRC',
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Greece',
  ),

  /// South Georgia and the South Sandwich Islands
  SOUTH_GEORGIA(offTag: 'gs', iso3Code: 'SGS', currency: Currency.FKP),

  /// Guatemala
  GUATEMALA(offTag: 'gt', iso3Code: 'GTM', currency: Currency.GTQ),

  /// Guam
  GUAM(offTag: 'gu', iso3Code: 'GUM', currency: Currency.USD),

  /// Guinea-Bissau
  GUINEA_BISSAU(offTag: 'gw', iso3Code: 'GNB', currency: Currency.XOF),

  /// Guyana
  GUYANA(offTag: 'gy', iso3Code: 'GUY', currency: Currency.GYD),

  /// Hong Kong
  HONG_KONG(offTag: 'hk', iso3Code: 'HKG', currency: Currency.HKD),

  /// Heard Island and McDonald Islands
  HEARD_ISLAND(offTag: 'hm', iso3Code: 'HMD', currency: Currency.AUD),

  /// Honduras
  HONDURAS(offTag: 'hn', iso3Code: 'HND', currency: Currency.HNL),

  /// Croatia
  CROATIA(
    offTag: 'hr',
    iso3Code: 'HRV',
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Local_Communities/CroatianTeam',
  ),

  /// Haiti
  HAITI(offTag: 'ht', iso3Code: 'HTI', currency: Currency.HTG),

  /// Hungary
  HUNGARY(offTag: 'hu', iso3Code: 'HUN', currency: Currency.HUF),

  /// Indonesia
  INDONESIA(offTag: 'id', iso3Code: 'IDN', currency: Currency.IDR),

  /// Ireland
  IRELAND(offTag: 'ie', iso3Code: 'IRL', currency: Currency.EUR),

  /// Israel
  ISRAEL(
    offTag: 'il',
    iso3Code: 'ISR',
    currency: Currency.ILS,
    wikiUrl:
        'https://wiki.openfoodfacts.org/Local_Communities/IsraeliTeam/Country_Support',
  ),

  /// Isle of Man
  ISLE_OF_MAN(offTag: 'im', iso3Code: 'IMN', currency: Currency.GBP),

  /// India
  INDIA(
    offTag: 'in',
    iso3Code: 'IND',
    currency: Currency.INR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_India',
  ),

  /// British Indian Ocean Territory
  BRITISH_INDIAN_OCEAN_TERRITORY(
      offTag: 'io', iso3Code: 'IOT', currency: Currency.USD),

  /// Iraq
  IRAQ(offTag: 'iq', iso3Code: 'IRQ', currency: Currency.IQD),

  /// Iran (Islamic Republic of)
  IRAN(offTag: 'ir', iso3Code: 'IRN', currency: Currency.IRR),

  /// Iceland
  ICELAND(offTag: 'is', iso3Code: 'ISL', currency: Currency.ISK),

  /// Italy
  ITALY(
    offTag: 'it',
    iso3Code: 'ITA',
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Italy',
  ),

  /// Jersey
  JERSEY(offTag: 'je', iso3Code: 'JEY', currency: Currency.GBP),

  /// Jamaica
  JAMAICA(offTag: 'jm', iso3Code: 'JAM', currency: Currency.JMD),

  /// Jordan
  JORDAN(offTag: 'jo', iso3Code: 'JOR', currency: Currency.JOD),

  /// Japan
  JAPAN(
    offTag: 'jp',
    iso3Code: 'JPN',
    currency: Currency.JPY,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Japan',
  ),

  /// Kenya
  KENYA(offTag: 'ke', iso3Code: 'KEN', currency: Currency.KES),

  /// Kyrgyzstan
  KYRGYZSTAN(offTag: 'kg', iso3Code: 'KGZ', currency: Currency.KGS),

  /// Cambodia
  CAMBODIA(offTag: 'kh', iso3Code: 'KHM', currency: Currency.KHR),

  /// Kiribati
  KIRIBATI(offTag: 'ki', iso3Code: 'KIR', currency: Currency.AUD),

  /// Comoros
  COMOROS(offTag: 'km', iso3Code: 'COM', currency: Currency.KMF),

  /// Saint Kitts and Nevis
  SAINT_KITTS_AND_NEVIS(offTag: 'kn', iso3Code: 'KNA', currency: Currency.XCD),

  /// Korea (Democratic People's Republic of)
  NORTH_KOREA(offTag: 'kp', iso3Code: 'PRK', currency: Currency.KPW),

  /// Korea, Republic of
  SOUTH_KOREA(
    offTag: 'kr',
    iso3Code: 'KOR',
    currency: Currency.KRW,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_South_Korea',
  ),

  /// Kuwait
  KUWAIT(offTag: 'kw', iso3Code: 'KWT', currency: Currency.KWD),

  /// Cayman Islands
  CAYMAN_ISLANDS(offTag: 'ky', iso3Code: 'CYM', currency: Currency.KYD),

  /// Kazakhstan
  KAZAKHSTAN(offTag: 'kz', iso3Code: 'KAZ', currency: Currency.KZT),

  /// Lao People's Democratic Republic
  LAOS(offTag: 'la', iso3Code: 'LAO', currency: Currency.LAK),

  /// Lebanon
  LEBANON(offTag: 'lb', iso3Code: 'LBN', currency: Currency.LBP),

  /// Saint Lucia
  SAINT_LUCIA(offTag: 'lc', iso3Code: 'LCA', currency: Currency.XCD),

  /// Liechtenstein
  LIECHTENSTEIN(offTag: 'li', iso3Code: 'LIE', currency: Currency.CHF),

  /// Sri Lanka
  SRI_LANKA(offTag: 'lk', iso3Code: 'LKA', currency: Currency.LKR),

  /// Liberia
  LIBERIA(offTag: 'lr', iso3Code: 'LBR', currency: Currency.LRD),

  /// Lesotho
  LESOTHO(offTag: 'ls', iso3Code: 'LSO', currency: Currency.LSL),

  /// Lithuania
  LITHUANIA(offTag: 'lt', iso3Code: 'LTU', currency: Currency.EUR),

  /// Luxembourg
  LUXEMBOURG(offTag: 'lu', iso3Code: 'LUX', currency: Currency.EUR),

  /// Latvia
  LATVIA(offTag: 'lv', iso3Code: 'LVA', currency: Currency.EUR),

  /// Libya
  LIBYA(offTag: 'ly', iso3Code: 'LBY', currency: Currency.LYD),

  /// Morocco
  MOROCCO(offTag: 'ma', iso3Code: 'MAR', currency: Currency.MAD),

  /// Monaco
  MONACO(offTag: 'mc', iso3Code: 'MCO', currency: Currency.EUR),

  /// Moldova, Republic of
  MOLDOVA(offTag: 'md', iso3Code: 'MDA', currency: Currency.MDL),

  /// Montenegro
  MONTENEGRO(offTag: 'me', iso3Code: 'MNE', currency: Currency.EUR),

  /// Saint Martin (French part)
  SAINT_MARTIN(offTag: 'mf', iso3Code: 'MAF', currency: Currency.EUR),

  /// Madagascar
  MADAGASCAR(offTag: 'mg', iso3Code: 'MDG', currency: Currency.MGA),

  /// Marshall Islands
  MARSHALL_ISLANDS(offTag: 'mh', iso3Code: 'MHL', currency: Currency.USD),

  /// North Macedonia
  NORTH_MACEDONIA(offTag: 'mk', iso3Code: 'MKD', currency: Currency.MKD),

  /// Mali
  MALI(offTag: 'ml', iso3Code: 'MLI', currency: Currency.XOF),

  /// Myanmar
  MYANMAR(offTag: 'mm', iso3Code: 'MMR', currency: Currency.MMK),

  /// Mongolia
  MONGOLIA(offTag: 'mn', iso3Code: 'MNG', currency: Currency.MNT),

  /// Macao
  MACAO(offTag: 'mo', iso3Code: 'MAC', currency: Currency.MOP),

  /// Northern Mariana Islands
  NORTHERN_MARIANA_ISLANDS(
      offTag: 'mp', iso3Code: 'MNP', currency: Currency.USD),

  /// Martinique
  MARTINIQUE(
    offTag: 'mq',
    iso3Code: 'MTQ',
    currency: Currency.EUR,
    wikiUrl:
        'https://wiki.openfoodfacts.org/Local_Communities/FrenchTeam/Country_Support',
  ),

  /// Mauritania
  MAURITANIA(offTag: 'mr', iso3Code: 'MRT', currency: Currency.MRU),

  /// Montserrat
  MONTSERRAT(offTag: 'ms', iso3Code: 'MSR', currency: Currency.XCD),

  /// Malta
  MALTA(offTag: 'mt', iso3Code: 'MLT', currency: Currency.EUR),

  /// Mauritius
  MAURITIUS(offTag: 'mu', iso3Code: 'MUS', currency: Currency.MUR),

  /// Maldives
  MALDIVES(offTag: 'mv', iso3Code: 'MDV', currency: Currency.MVR),

  /// Malawi
  MALAWI(offTag: 'mw', iso3Code: 'MWI', currency: Currency.MWK),

  /// Mexico
  MEXICO(
    offTag: 'mx',
    iso3Code: 'MEX',
    currency: Currency.MXN,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Mexico',
  ),

  /// Malaysia
  MALAYSIA(offTag: 'my', iso3Code: 'MYS', currency: Currency.MYR),

  /// Mozambique
  MOZAMBIQUE(offTag: 'mz', iso3Code: 'MOZ', currency: Currency.MZN),

  /// Namibia
  NAMIBIA(offTag: 'na', iso3Code: 'NAM', currency: Currency.NAD),

  /// New Caledonia
  NEW_CALEDONIA(
    offTag: 'nc',
    iso3Code: 'NCL',
    currency: Currency.XPF,
    wikiUrl:
        'https://wiki.openfoodfacts.org/Local_Communities/FrenchTeam/Country_Support',
  ),

  /// Niger
  NIGER(offTag: 'ne', iso3Code: 'NER', currency: Currency.XOF),

  /// Norfolk Island
  NORFOLK_ISLAND(offTag: 'nf', iso3Code: 'NFK', currency: Currency.AUD),

  /// Nigeria
  NIGERIA(
    offTag: 'ng',
    iso3Code: 'NGA',
    currency: Currency.NGN,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Nigeria',
  ),

  /// Nicaragua
  NICARAGUA(offTag: 'ni', iso3Code: 'NIC', currency: Currency.NIO),

  /// Netherlands
  NETHERLANDS(
    offTag: 'nl',
    iso3Code: 'NLD',
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Netherlands',
  ),

  /// Norway
  NORWAY(offTag: 'no', iso3Code: 'NOR', currency: Currency.NOK),

  /// Nepal
  NEPAL(offTag: 'np', iso3Code: 'NPL', currency: Currency.NPR),

  /// Nauru
  NAURU(offTag: 'nr', iso3Code: 'NRU', currency: Currency.AUD),

  /// Niue
  NIUE(offTag: 'nu', iso3Code: 'NIU', currency: Currency.NZD),

  /// New Zealand
  NEW_ZEALAND(offTag: 'nz', iso3Code: 'NZL', currency: Currency.NZD),

  /// Oman
  OMAN(offTag: 'om', iso3Code: 'OMN', currency: Currency.OMR),

  /// Panama
  PANAMA(offTag: 'pa', iso3Code: 'PAN', currency: Currency.PAB),

  /// Peru
  PERU(offTag: 'pe', iso3Code: 'PER', currency: Currency.PEN),

  /// French Polynesia
  FRENCH_POLYNESIA(
    offTag: 'pf',
    iso3Code: 'PYF',
    currency: Currency.XPF,
    wikiUrl:
        'https://wiki.openfoodfacts.org/Local_Communities/FrenchTeam/Country_Support',
  ),

  /// Papua New Guinea
  PAPUA_NEW_GUINEA(offTag: 'pg', iso3Code: 'PNG', currency: Currency.PGK),

  /// Philippines
  PHILIPPINES(offTag: 'ph', iso3Code: 'PHL', currency: Currency.PHP),

  /// Pakistan
  PAKISTAN(offTag: 'pk', iso3Code: 'PAK', currency: Currency.PKR),

  /// Poland
  POLAND(
    offTag: 'pl',
    iso3Code: 'POL',
    currency: Currency.PLN,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Poland',
  ),

  /// Saint Pierre and Miquelon
  SAINT_PIERRE_AND_MIQUELON(
    offTag: 'pm',
    iso3Code: 'SPM',
    currency: Currency.EUR,
    wikiUrl:
        'https://wiki.openfoodfacts.org/Local_Communities/FrenchTeam/Country_Support',
  ),

  /// Pitcairn
  PITCAIRN(offTag: 'pn', iso3Code: 'PCN', currency: Currency.NZD),

  /// Puerto Rico
  PUERTO_RICO(offTag: 'pr', iso3Code: 'PRI', currency: Currency.USD),

  /// Palestine, State of
  PALESTINE(offTag: 'ps', iso3Code: 'PSE', currency: Currency.ILS),

  /// Portugal
  PORTUGAL(
    offTag: 'pt',
    iso3Code: 'PRT',
    currency: Currency.EUR,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Portugal',
  ),

  /// Palau
  PALAU(offTag: 'pw', iso3Code: 'PLW', currency: Currency.USD),

  /// Paraguay
  PARAGUAY(offTag: 'py', iso3Code: 'PRY', currency: Currency.PYG),

  /// Qatar
  QATAR(offTag: 'qa', iso3Code: 'QAT', currency: Currency.QAR),

  /// Réunion
  REUNION(
    offTag: 're',
    iso3Code: 'REU',
    currency: Currency.EUR,
    wikiUrl:
        'https://wiki.openfoodfacts.org/Local_Communities/FrenchTeam/Country_Support',
  ),

  /// Romania
  ROMANIA(offTag: 'ro', iso3Code: 'ROU', currency: Currency.RON),

  /// Serbia
  SERBIA(offTag: 'rs', iso3Code: 'SRB', currency: Currency.RSD),

  /// Russian Federation
  RUSSIA(
    offTag: 'ru',
    iso3Code: 'RUS',
    currency: Currency.RUB,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Russia',
  ),

  /// Rwanda
  RWANDA(offTag: 'rw', iso3Code: 'RWA', currency: Currency.RWF),

  /// Saudi Arabia
  SAUDI_ARABIA(offTag: 'sa', iso3Code: 'SAU', currency: Currency.SAR),

  /// Solomon Islands
  SOLOMON_ISLANDS(offTag: 'sb', iso3Code: 'SLB', currency: Currency.SBD),

  /// Seychelles
  SEYCHELLES(offTag: 'sc', iso3Code: 'SYC', currency: Currency.SCR),

  /// Sudan
  SUDAN(offTag: 'sd', iso3Code: 'SDN', currency: Currency.SDG),

  /// Sweden
  SWEDEN(
    offTag: 'se',
    iso3Code: 'SWE',
    currency: Currency.SEK,
    wikiUrl:
        'https://wiki.openfoodfacts.org/Local_Communities/SwedishTeam/Country_Support',
  ),

  /// Singapore
  SINGAPORE(offTag: 'sg', iso3Code: 'SGP', currency: Currency.SGD),

  /// Saint Helena, Ascension and Tristan da Cunha
  SAINT_HELENA(offTag: 'sh', iso3Code: 'SHN', currency: Currency.SHP),

  /// Slovenia
  SLOVENIA(offTag: 'si', iso3Code: 'SVN', currency: Currency.EUR),

  /// Svalbard and Jan Mayen
  SVALBARD_AND_JAN_MAYEN(offTag: 'sj', iso3Code: 'SJM', currency: Currency.NOK),

  /// Slovakia
  SLOVAKIA(offTag: 'sk', iso3Code: 'SVK', currency: Currency.EUR),

  /// Sierra Leone
  SIERRA_LEONE(offTag: 'sl', iso3Code: 'SLE', currency: Currency.SLE),

  /// San Marino
  SAN_MARINO(offTag: 'sm', iso3Code: 'SMR', currency: Currency.EUR),

  /// Senegal
  SENEGAL(offTag: 'sn', iso3Code: 'SEN', currency: Currency.XOF),

  /// Somalia
  SOMALIA(offTag: 'so', iso3Code: 'SOM', currency: Currency.SOS),

  /// Suriname
  SURINAME(offTag: 'sr', iso3Code: 'SUR', currency: Currency.SRD),

  /// South Sudan
  SOUTH_SUDAN(offTag: 'ss', iso3Code: 'SSD', currency: Currency.SSP),

  /// Sao Tome and Principe
  SAO_TOME_AND_PRINCIPE(offTag: 'st', iso3Code: 'STP', currency: Currency.STN),

  /// El Salvador
  EL_SALVADOR(offTag: 'sv', iso3Code: 'SLV', currency: Currency.SVC),

  /// Sint Maarten (Dutch part)
  SINT_MAARTEN(offTag: 'sx', iso3Code: 'SXM', currency: Currency.ANG),

  /// Syrian Arab Republic
  SYRIA(offTag: 'sy', iso3Code: 'SYR', currency: Currency.SYP),

  /// Eswatini
  ESWATINI(offTag: 'sz', iso3Code: 'SWZ', currency: Currency.SZL),

  /// Turks and Caicos Islands
  TURKS_AND_CAICOS_ISLANDS(
      offTag: 'tc', iso3Code: 'TCA', currency: Currency.USD),

  /// Chad
  CHAD(offTag: 'td', iso3Code: 'TCD', currency: Currency.XAF),

  /// French Southern Territories
  FRENCH_SOUTHERN_TERRITORIES(
    offTag: 'tf',
    iso3Code: 'ATF', 
    currency: Currency.EUR,
    wikiUrl:
        'https://wiki.openfoodfacts.org/Local_Communities/FrenchTeam/Country_Support',
  ),

  /// Togo
  TOGO(offTag: 'tg', iso3Code: 'TGO', currency: Currency.XOF),

  /// Thailand
  THAILAND(
    offTag: 'th',
    iso3Code: 'THA', 
    currency: Currency.THB,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Thailand',
  ),
  
  /// Tajikistan
  TAJIKISTAN(offTag: 'tj', iso3Code: 'TJK', currency: Currency.TJS),

  /// Tokelau
  TOKELAU(offTag: 'tk', iso3Code: 'TKL', currency: Currency.NZD),

  /// Timor-Leste
  TIMOR_LESTE(offTag: 'tl', iso3Code: 'TLS', currency: Currency.USD),

  /// Turkmenistan
  TURKMENISTAN(offTag: 'tm', iso3Code: 'TKM', currency: Currency.TMT),

  /// Tunisia
  TUNISIA(offTag: 'tn', iso3Code: 'TUN', currency: Currency.TND),

  /// Tonga
  TONGA(offTag: 'to', iso3Code: 'TON', currency: Currency.TOP),

  /// Turkey
  TURKEY(offTag: 'tr', iso3Code: 'TUR', currency: Currency.TRY),

  /// Trinidad and Tobago
  TRINIDAD_AND_TOBAGO(offTag: 'tt', iso3Code: 'TTO', currency: Currency.TTD),

  /// Tuvalu
  TUVALU(offTag: 'tv', iso3Code: 'TUV', currency: Currency.AUD),

  /// Taiwan, Province of China
  TAIWAN(
    offTag: 'tw',
    iso3Code: 'TWN',
    currency: Currency.TWD,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Taiwan',
  ),

  /// Tanzania, United Republic of
  TANZANIA(offTag: 'tz', iso3Code: 'TZA', currency: Currency.TZS),

  /// Ukraine
  UKRAINE(
    offTag: 'ua',
    iso3Code: 'UKR',
    currency: Currency.UAH,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_Ukraine',
  ),

  /// Uganda
  UGANDA(offTag: 'ug', iso3Code: 'UGA', currency: Currency.UGX),

  /// United States Minor Outlying Islands
  UNITED_STATES_MINOR_OUTLYING_ISLANDS(
    offTag: 'um',
    iso3Code: 'UMI',
    currency: Currency.USD,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_United_States',
  ),

  /// United States of America
  USA(
    offTag: 'us',
    iso3Code: 'USA',
    currency: Currency.USD,
    wikiUrl: 'https://wiki.openfoodfacts.org/Country_Support_-_United_States',
  ),

  /// Uruguay
  URUGUAY(offTag: 'uy', iso3Code: 'URY', currency: Currency.UYU),

  /// Uzbekistan
  UZBEKISTAN(offTag: 'uz', iso3Code: 'UZB', currency: Currency.UZS),

  /// Holy See
  HOLY_SEE(offTag: 'va', iso3Code: 'VAT', currency: Currency.EUR),

  /// Saint Vincent and the Grenadines
  SAINT_VINCENT_AND_THE_GRENADINES(
      offTag: 'vc', iso3Code: 'VCT', currency: Currency.XCD),

  /// Venezuela (Bolivarian Republic of)
  VENEZUELA(offTag: 've', iso3Code: 'VEN', currency: Currency.VED),

  /// Virgin Islands (British)
  BRITISH_VIRGIN_ISLANDS(offTag: 'vg', iso3Code: 'VGB', currency: Currency.USD),

  /// Virgin Islands (U.S.)
  US_VIRGIN_ISLANDS(offTag: 'vi', iso3Code: 'VIR', currency: Currency.USD),

  /// Viet Nam
  VIET_NAM(offTag: 'vn', iso3Code: 'VNM', currency: Currency.VND),

  /// Vanuatu
  VANUATU(offTag: 'vu', iso3Code: 'VUT', currency: Currency.VUV),

  /// Wallis and Futuna
  WALLIS_AND_FUTUNA(offTag: 'wf', iso3Code: 'WLF', currency: Currency.XPF),

  /// Samoa
  SAMOA(offTag: 'ws', iso3Code: 'WSM', currency: Currency.WST),

  /// Yemen
  YEMEN(offTag: 'ye', iso3Code: 'YEM', currency: Currency.YER),

  /// Mayotte
  MAYOTTE(
    offTag: 'yt',
    iso3Code: 'MYT',
    currency: Currency.EUR,
    wikiUrl:
        'https://wiki.openfoodfacts.org/Local_Communities/FrenchTeam/Country_Support',
  ),

  /// South Africa
  SOUTH_AFRICA(offTag: 'za', iso3Code: 'ZAF', currency: Currency.ZAR),

  /// Zambia
  ZAMBIA(offTag: 'zm', iso3Code: 'ZMB', currency: Currency.ZMW),

  /// Zimbabwe
  ZIMBABWE(offTag: 'zw', iso3Code: 'ZWE', currency: Currency.ZWL);

  const OpenFoodFactsCountry({
    required this.offTag,
    required this.iso3Code,
    required this.currency,
    this.wikiUrl,
  });

  /// Lowercase ISO 639-1, except for [UNITED_KINGDOM].
  @override
  final String offTag;

  /// ISO 3166-1 alpha-3 country code.
  final String iso3Code;

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
