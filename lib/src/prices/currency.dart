/// Currency of the price.
///
/// The currency must be a valid currency code.
/// See https://en.wikipedia.org/wiki/ISO_4217 for a list of valid currency
/// codes.
enum Currency {
  /// Andorran peseta
  ADP(historicalCode: true),

  /// United Arab Emirates dirham
  AED,

  /// Afghan afghani
  AFA(historicalCode: true),

  /// Afghan afghani
  AFN,

  /// Old Albanian lek
  ALK(historicalCode: true),

  /// Albanian lek
  ALL,

  /// Armenian dram
  AMD,

  /// Netherlands Antillean guilder
  ANG,

  /// Angolan kwanza
  AOA,

  /// Angolan kwanza
  AOK(historicalCode: true),

  /// Angolan novo kwanza
  AON(historicalCode: true),

  /// Angolan kwanza reajustado
  AOR(historicalCode: true),

  /// Argentine austral
  ARA(historicalCode: true),

  /// Argentine peso ley
  ARL(unofficialCode: true),
  ARM(noCountry: true),

  /// Argentine peso argentino
  ARP(historicalCode: true),

  /// Argentine peso
  ARS,

  /// Austrian schilling
  ATS(historicalCode: true),

  /// Australian dollar
  AUD,

  /// Aruban florin
  AWG,

  /// Azerbaijani manat
  AZM(historicalCode: true),

  /// Azerbaijani manat
  AZN,

  /// Bosnia and Herzegovina dinar
  BAD(historicalCode: true),

  /// Bosnia and Herzegovina convertible mark
  BAM,
  BAN(noCountry: true),

  /// Barbados dollar
  BBD,

  /// Bangladeshi taka
  BDT,

  /// Belgian convertible franc (funds code)
  BEC(historicalCode: true, fundsCode: true),

  /// Belgian franc
  BEF(historicalCode: true),

  /// Belgian financial franc (funds code)
  BEL(historicalCode: true, fundsCode: true),

  /// Bulgarian lev
  BGL(historicalCode: true),
  BGM(noCountry: true),

  /// Bulgarian lev
  BGN,
  BGO(noCountry: true),

  /// Bahraini dinar
  BHD(decimalNumbers: 3),

  /// Burundian franc
  BIF(decimalNumbers: 0),

  /// Bermudian dollar
  BMD,

  /// Brunei dollar
  BND,

  /// Boliviano
  BOB,
  BOL(noCountry: true),

  /// Bolivian peso
  BOP(historicalCode: true),

  /// Bolivian Mvdol (funds code)
  BOV(fundsCode: true),

  /// Brazilian cruzeiro
  BRB(historicalCode: true),

  /// Brazilian cruzado
  BRC(historicalCode: true),

  /// Brazilian cruzeiro
  BRE(historicalCode: true),

  /// Brazilian real
  BRL,

  /// Brazilian cruzado novo
  BRN(historicalCode: true),

  /// Brazilian cruzeiro real
  BRR(historicalCode: true),
  BRZ(noCountry: true),

  /// Bahamian dollar
  BSD,

  /// Bhutanese ngultrum
  BTN,

  /// Burmese kyat
  BUK(historicalCode: true),

  /// Botswana pula
  BWP,

  /// Belarusian ruble
  BYB(historicalCode: true),

  /// Belarusian ruble
  BYN,

  /// Belarusian ruble
  BYR(historicalCode: true),

  /// Belize dollar
  BZD,

  /// Canadian dollar
  CAD,

  /// Congolese franc
  CDF,

  /// WIR euro (complementary currency)
  CHE(complementaryCurrency: true),

  /// Swiss franc
  CHF,

  /// WIR franc (complementary currency)
  CHW(complementaryCurrency: true),
  CLE(noCountry: true),

  /// Unidad de Fomento (funds code)
  CLF(fundsCode: true, decimalNumbers: 4),

  /// Chilean peso
  CLP(decimalNumbers: 0),
  CNH(noCountry: true),
  CNX(noCountry: true),

  /// Renminbi
  CNY,

  /// Colombian peso
  COP,

  /// Unidad de Valor Real (UVR) (funds code)
  COU(fundsCode: true),

  /// Costa Rican colon
  CRC,

  /// Serbian dinar
  CSD(historicalCode: true),

  /// Czechoslovak koruna
  CSK(historicalCode: true),

  /// Cuban convertible peso
  CUC(historicalCode: true),

  /// Cuban peso
  CUP,

  /// Cape Verdean escudo
  CVE,

  /// Cypriot pound
  CYP(historicalCode: true),

  /// Czech koruna
  CZK,

  /// East German mark
  DDM(historicalCode: true),

  /// German mark
  DEM(historicalCode: true),

  /// Djiboutian franc
  DJF(decimalNumbers: 0),

  /// Danish krone
  DKK,

  /// Dominican peso
  DOP,

  /// Algerian dinar
  DZD,

  /// Ecuadorian sucre
  ECS(historicalCode: true),

  /// Ecuador Unidad de Valor Constante (funds code)
  ECV(historicalCode: true, fundsCode: true),

  /// Estonian kroon
  EEK(historicalCode: true),

  /// Egyptian pound
  EGP,

  /// Eritrean nakfa
  ERN,

  /// Spanish peseta (account A)
  ESA(historicalCode: true),

  /// Spanish peseta (account B)
  ESB(historicalCode: true),

  /// Spanish peseta
  ESP(historicalCode: true),

  /// Ethiopian birr
  ETB,

  /// Euro
  EUR,

  /// Finnish markka
  FIM(historicalCode: true),

  /// Fiji dollar
  FJD,

  /// Falkland Islands pound
  FKP,

  /// French franc
  FRF(historicalCode: true),

  /// Pound sterling
  GBP,

  /// Georgian kuponi
  GEK(historicalCode: true),

  /// Georgian lari
  GEL,

  /// Ghanaian cedi
  GHC(historicalCode: true),

  /// Ghanaian cedi
  GHS,

  /// Gibraltar pound
  GIP,

  /// Gambian dalasi
  GMD,

  /// Guinean franc
  GNF(decimalNumbers: 0),

  /// Guinean syli
  GNS(historicalCode: true),

  /// Equatorial Guinean ekwele
  GQE(historicalCode: true),

  /// Greek drachma
  GRD(historicalCode: true),

  /// Guatemalan quetzal
  GTQ,

  /// Guinean escudo
  GWE(historicalCode: true),

  /// Guinea-Bissau peso
  GWP(historicalCode: true),

  /// Guyanese dollar
  GYD,

  /// Hong Kong dollar
  HKD,

  /// Honduran lempira
  HNL,

  /// Croatian dinar
  HRD(historicalCode: true),

  /// Croatian kuna
  HRK(historicalCode: true),

  /// Haitian gourde
  HTG,

  /// Hungarian forint
  HUF,

  /// Indonesian rupiah
  IDR,

  /// Irish pound
  IEP(historicalCode: true),

  /// Israeli pound
  ILP(historicalCode: true),

  /// Israeli shekel
  ILR(historicalCode: true),

  /// Israeli new shekel
  ILS,

  /// Indian rupee
  INR,

  /// Iraqi dinar
  IQD(decimalNumbers: 3),

  /// Iranian rial
  IRR,

  /// Icelandic króna
  ISJ(historicalCode: true),

  /// Icelandic króna
  ISK(decimalNumbers: 0),

  /// Italian lira
  ITL(historicalCode: true),

  /// Jamaican dollar
  JMD,

  /// Jordanian dinar
  JOD(decimalNumbers: 3),

  /// Japanese yen
  JPY(decimalNumbers: 0),

  /// Kenyan shilling
  KES,

  /// Kyrgyzstani som
  KGS,

  /// Cambodian riel
  KHR,

  /// Comoro franc
  KMF(decimalNumbers: 0),

  /// North Korean won
  KPW,
  KRH(noCountry: true),
  KRO(noCountry: true),

  /// South Korean won
  KRW(decimalNumbers: 0),

  /// Kuwaiti dinar
  KWD(decimalNumbers: 3),

  /// Cayman Islands dollar
  KYD,

  /// Kazakhstani tenge
  KZT,

  /// Lao kip
  LAK,

  /// Lebanese pound
  LBP,

  /// Sri Lankan rupee
  LKR,

  /// Liberian dollar
  LRD,

  /// Lesotho loti
  LSL,

  /// Lithuanian litas
  LTL(historicalCode: true),

  /// Lithuanian talonas
  LTT(historicalCode: true),

  /// Luxembourg convertible franc (funds code)
  LUC(historicalCode: true, fundsCode: true),

  /// Luxembourg franc
  LUF(historicalCode: true),

  /// Luxembourg financial franc (funds code)
  LUL(historicalCode: true, fundsCode: true),

  /// Latvian lats
  LVL(historicalCode: true),

  /// Latvian rublis
  LVR(historicalCode: true),

  /// Libyan dinar
  LYD(decimalNumbers: 3),

  /// Moroccan dirham
  MAD,

  /// Malian franc
  MAF(historicalCode: true, unofficialCode: true),

  /// Monégasque franc
  MCF(historicalCode: true, unofficialCode: true),
  MDC(noCountry: true),

  /// Moldovan leu
  MDL,

  /// Malagasy ariary
  MGA,

  /// Malagasy franc
  MGF(historicalCode: true),

  /// Macedonian denar
  MKD,

  /// First denar
  MKN(historicalCode: true, unofficialCode: true),

  /// Malian franc
  MLF(historicalCode: true),

  /// Myanmar kyat
  MMK,

  /// Mongolian tögrög
  MNT,

  /// Macanese pataca
  MOP,

  /// Mauritanian ouguiya
  MRO(historicalCode: true),

  /// Mauritanian ouguiya
  MRU,

  /// Maltese lira
  MTL(historicalCode: true),

  /// Maltese pound
  MTP(historicalCode: true),

  /// Mauritian rupee
  MUR,
  MVP(noCountry: true),

  /// Maldivian rufiyaa
  MVR,

  /// Malawian kwacha
  MWK,

  /// Mexican peso
  MXN,

  /// Mexican peso
  MXP(historicalCode: true),

  /// Mexican Unidad de Inversion (UDI) (funds code)
  MXV(fundsCode: true),

  /// Malaysian ringgit
  MYR,

  /// Mozambican escudo
  MZE(historicalCode: true),

  /// Mozambican metical
  MZM(historicalCode: true),

  /// Mozambican metical
  MZN,

  /// Namibian dollar
  NAD,

  /// Nigerian naira
  NGN,

  /// Nicaraguan córdoba
  NIC(historicalCode: true),

  /// Nicaraguan córdoba
  NIO,

  /// Dutch guilder
  NLG(historicalCode: true),

  /// Norwegian krone
  NOK,

  /// Nepalese rupee
  NPR,

  /// New Zealand dollar
  NZD,

  /// Omani rial
  OMR(decimalNumbers: 3),

  /// Panamanian balboa
  PAB,

  /// Peruvian inti
  PEI(historicalCode: true),

  /// Peruvian sol
  PEN,

  /// Peruvian sol
  PES(historicalCode: true),

  /// Papua New Guinean kina
  PGK,

  /// Philippine peso
  PHP,

  /// Pakistani rupee
  PKR,

  /// Polish złoty
  PLN,

  /// Polish zloty
  PLZ(historicalCode: true),

  /// Portuguese escudo
  PTE(historicalCode: true),

  /// Paraguayan guaraní
  PYG(decimalNumbers: 0),

  /// Qatari riyal
  QAR,

  /// Rhodesian dollar
  RHD(historicalCode: true),

  /// Romanian leu
  ROL(historicalCode: true),

  /// Romanian leu
  RON,

  /// Serbian dinar
  RSD,

  /// Russian ruble
  RUB,

  /// Russian ruble
  RUR(historicalCode: true),

  /// Rwandan franc
  RWF(decimalNumbers: 0),

  /// Saudi riyal
  SAR,

  /// Solomon Islands dollar
  SBD,

  /// Seychelles rupee
  SCR,

  /// Sudanese dinar
  SDD(historicalCode: true),

  /// Sudanese pound
  SDG,

  /// Sudanese old pound
  SDP(historicalCode: true),

  /// Swedish krona
  SEK,

  /// Singapore dollar
  SGD,

  /// Saint Helena pound
  SHP,

  /// Slovenian tolar
  SIT(historicalCode: true),

  /// Slovak koruna
  SKK(historicalCode: true),

  /// Sierra Leonean leone (new leone)
  SLE,

  /// Sierra Leonean leone (old leone)
  SLL(historicalCode: true),

  /// Somalian shilling
  SOS,

  /// Surinamese dollar
  SRD,

  /// Surinamese guilder
  SRG(historicalCode: true),

  /// South Sudanese pound
  SSP,

  /// São Tomé and Príncipe dobra
  STD(historicalCode: true),

  /// São Tomé and Príncipe dobra
  STN,

  /// Soviet Union ruble
  SUR(historicalCode: true),

  /// Salvadoran colón
  SVC,

  /// Syrian pound
  SYP,

  /// Swazi lilangeni
  SZL,

  /// Thai baht
  THB,

  /// Tajikistani ruble
  TJR(historicalCode: true),

  /// Tajikistani somoni
  TJS,

  /// Turkmenistani manat
  TMM(historicalCode: true),

  /// Turkmenistan manat
  TMT,

  /// Tunisian dinar
  TND(decimalNumbers: 3),

  /// Tongan paʻanga
  TOP,

  /// Portuguese Timorese escudo
  TPE(historicalCode: true),

  /// Turkish lira
  TRL(historicalCode: true),

  /// Turkish lira
  TRY,

  /// Trinidad and Tobago dollar
  TTD,

  /// New Taiwan dollar
  TWD,

  /// Tanzanian shilling
  TZS,

  /// Ukrainian hryvnia
  UAH,

  /// Ukrainian karbovanets
  UAK(historicalCode: true),

  /// Ugandan shilling
  UGS(historicalCode: true),

  /// Ugandan shilling
  UGX(decimalNumbers: 0),

  /// United States dollar
  USD,

  /// United States dollar (next day) (funds code)
  USN(fundsCode: true),

  /// United States dollar (same day) (funds code)
  USS(historicalCode: true, fundsCode: true),

  /// Uruguay Peso en Unidades Indexadas (URUIURUI) (funds code)
  UYI(fundsCode: true, decimalNumbers: 0),

  /// Uruguay new peso
  UYP(historicalCode: true),

  /// Uruguayan peso
  UYU,

  /// Unidad previsional
  UYW(noCountry: true, decimalNumbers: 4),

  /// Uzbekistani sum
  UZS,

  /// Venezuelan bolívar
  VEB(historicalCode: true),

  /// Venezuelan digital bolívar
  VED,

  /// Venezuelan bolívar fuerte
  VEF(historicalCode: true),

  /// Venezuelan sovereign bolívar
  VES(historicalCode: true),

  /// Vietnamese đồng
  VND(decimalNumbers: 0),
  VNN(noCountry: true),

  /// Vanuatu vatu
  VUV(decimalNumbers: 0),

  /// Samoan tala
  WST,

  /// CFA franc BEAC
  XAF(decimalNumbers: 0),

  /// Silver (one troy ounce)
  XAG(noCountry: true),

  /// Gold (one troy ounce)
  XAU(noCountry: true),

  /// European Composite Unit (EURCO) (bond market unit)
  XBA(noCountry: true),

  /// European Monetary Unit (E.M.U.-6) (bond market unit)
  XBB(noCountry: true),

  /// European Unit of Account 9 (E.U.A.-9) (bond market unit)
  XBC(noCountry: true),

  /// European Unit of Account 17 (E.U.A.-17) (bond market unit)
  XBD(noCountry: true),

  /// East Caribbean dollar
  XCD,

  /// Special drawing rights
  XDR(noCountry: true),

  /// European Currency Unit
  XEU(historicalCode: true),

  /// Gold franc (special settlement currency)
  XFO(historicalCode: true),

  /// UIC franc (special settlement currency
  XFU(historicalCode: true),

  /// CFA franc BCEAO
  XOF(decimalNumbers: 0),

  /// Palladium (one troy ounce)
  XPD(noCountry: true),

  /// CFP franc (franc Pacifique)
  XPF(decimalNumbers: 0),

  /// Platinum (one troy ounce)
  XPT(noCountry: true),

  /// RINET funds code
  XRE(historicalCode: true, fundsCode: true),

  /// SUCRE
  XSU(noCountry: true),

  /// Code reserved for testing
  XTS(noCountry: true),

  /// ADB Unit of Account
  XUA(noCountry: true),

  /// No currency
  XXX(noCountry: true),

  /// South Yemeni dinar
  YDD(historicalCode: true),

  /// Yemeni rial
  YER,

  /// Yugoslav dinar
  YUD(historicalCode: true),

  /// Yugoslav dinar
  YUM(historicalCode: true),

  /// Yugoslav dinar
  YUN(historicalCode: true),

  /// Reformed Yugoslav dinar
  YUR(historicalCode: true, unofficialCode: true),

  /// South African financial rand (funds code)
  ZAL(historicalCode: true, fundsCode: true),

  /// South African rand
  ZAR,

  /// Zambian kwacha
  ZMK(historicalCode: true),

  /// Zambian kwacha
  ZMW,

  /// Zairean new zaire
  ZRN(historicalCode: true),

  /// Zairean zaire
  ZRZ(historicalCode: true),

  /// Zimbabwean dollar
  ZWD(historicalCode: true),

  /// Zimbabwean dollar
  ZWL,

  /// Zimbabwean dollar
  ZWR(historicalCode: true);

  const Currency({
    this.historicalCode = false,
    this.unofficialCode = false,
    this.fundsCode = false,
    this.complementaryCurrency = false,
    this.noCountry = false,
    this.decimalNumbers = 2,
  });

  /// ISO 4217 currency codes until their replacement by another currency.
  final bool historicalCode;

  /// Non-standard codes
  final bool unofficialCode;

  /// Funds code
  final bool fundsCode;

  /// Complementary currency
  final bool complementaryCurrency;

  /// Not really attached to a specific country at all.
  final bool noCountry;

  /// The number of digits after the decimal separator.
  final int decimalNumbers;

  static Currency? fromName(final String? name) {
    if (name == null) {
      return null;
    }
    for (final Currency currency in values) {
      if (currency.name == name) {
        return currency;
      }
    }
    return null;
  }
}
