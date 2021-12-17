// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      barcode: json['code'] as String?,
      productName: json['product_name'] as String?,
      productNameInLanguages:
          LanguageHelper.fromJsonStringMap(json['product_name_in_languages']),
      genericName: json['generic_name'] as String?,
      brands: json['brands'] as String?,
      brandsTags: (json['brands_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      countries: json['countries'] as String?,
      countriesTags: (json['countries_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      countriesTagsInLanguages: LanguageHelper.fromJsonStringsListMap(
          json['countries_tags_in_languages']),
      lang: LanguageHelper.fromJson(json['lang'] as String?),
      quantity: json['quantity'] as String?,
      imgSmallUrl: json['image_small_url'] as String?,
      imageFrontUrl: json['image_front_url'] as String?,
      imageFrontSmallUrl: json['image_front_small_url'] as String?,
      imageIngredientsUrl: json['image_ingredients_url'] as String?,
      imageIngredientsSmallUrl: json['image_ingredients_small_url'] as String?,
      imageNutritionUrl: json['image_nutrition_url'] as String?,
      imageNutritionSmallUrl: json['image_nutrition_small_url'] as String?,
      imagePackagingUrl: json['image_packaging_url'] as String?,
      imagePackagingSmallUrl: json['image_packaging_small_url'] as String?,
      servingSize: json['serving_size'] as String?,
      servingQuantity:
          JsonHelper.servingQuantityFromJson(json['serving_quantity']),
      packagingQuantity: json['product_quantity'],
      selectedImages:
          JsonHelper.selectedImagesFromJson(json['selected_images'] as Map?),
      images: JsonHelper.imagesFromJson(json['images'] as Map?),
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      ingredientsText: json['ingredients_text'] as String?,
      ingredientsTextInLanguages: LanguageHelper.fromJsonStringMap(
          json['ingredients_text_in_languages']),
      ingredientsTags: (json['ingredients_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      ingredientsTagsInLanguages: LanguageHelper.fromJsonStringsListMap(
          json['ingredients_tags_in_languages']),
      ingredientsAnalysisTags: IngredientsAnalysisTags.fromJson(
          json['ingredients_analysis_tags'] as List?),
      nutriments: json['nutriments'] == null
          ? null
          : Nutriments.fromJson(json['nutriments'] as Map<String, dynamic>),
      additives: Additives.additivesFromJson(json['additives_tags'] as List?),
      environmentImpactLevels: EnvironmentImpactLevels.fromJson(
          json['environment_impact_level_tags'] as List?),
      allergens: Allergens.allergensFromJson(json['allergens_tags'] as List?),
      nutrientLevels: NutrientLevels.fromJson(json['nutrient_levels'] as Map?),
      nutrimentEnergyUnit: json['nutriment_energy_unit'] as String?,
      nutrimentDataPer: json['nutrition_data_per'] as String?,
      nutriscore: json['nutrition_grade_fr'] as String?,
      categories: json['categories'] as String?,
      categoriesTags: (json['categories_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      categoriesTagsInLanguages: LanguageHelper.fromJsonStringsListMap(
          json['categories_tags_in_languages']),
      labels: json['labels'] as String?,
      labelsTags: (json['labels_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      labelsTagsInLanguages: LanguageHelper.fromJsonStringsListMap(
          json['labels_tags_in_languages']),
      packaging: json['packaging'] as String?,
      packagingTags: (json['packaging_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      miscTags:
          (json['misc'] as List<dynamic>?)?.map((e) => e as String).toList(),
      statesTags: (json['states_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tracesTags: (json['traces_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      storesTags: (json['stores_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      stores: json['stores'] as String?,
      attributeGroups: (json['attribute_groups'] as List<dynamic>?)
          ?.map((e) => AttributeGroup.fromJson(e))
          .toList(),
      lastModified: JsonHelper.timestampToDate(json['last_modified_t']),
      ecoscoreGrade: json['ecoscore_grade'] as String?,
      ecoscoreScore: JsonObject.parseDouble(json['ecoscore_score']),
      ecoscoreData: json['ecoscore_data'] == null
          ? null
          : EcoscoreData.fromJson(
              json['ecoscore_data'] as Map<String, dynamic>),
    )..imagesFreshnessInLanguages =
          (json['imagesFreshnessInLanguages'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            _$enumDecode(_$OpenFoodFactsLanguageEnumMap, k),
            (e as Map<String, dynamic>).map(
              (k, e) =>
                  MapEntry(_$enumDecode(_$ImageFieldEnumMap, k), e as int),
            )),
      );

Map<String, dynamic> _$ProductToJson(Product instance) {
  final val = <String, dynamic>{
    'code': instance.barcode,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('product_name', instance.productName);
  writeNotNull('product_name_in_languages',
      LanguageHelper.toJsonStringMap(instance.productNameInLanguages));
  writeNotNull('generic_name', instance.genericName);
  writeNotNull('brands', instance.brands);
  writeNotNull('brands_tags', instance.brandsTags);
  writeNotNull('countries', instance.countries);
  writeNotNull('countries_tags', instance.countriesTags);
  writeNotNull('countries_tags_in_languages',
      LanguageHelper.toJsonStringsListMap(instance.countriesTagsInLanguages));
  writeNotNull('lang', LanguageHelper.toJson(instance.lang));
  writeNotNull('quantity', instance.quantity);
  writeNotNull('image_small_url', instance.imgSmallUrl);
  writeNotNull('image_front_url', instance.imageFrontUrl);
  writeNotNull('image_front_small_url', instance.imageFrontSmallUrl);
  writeNotNull('image_ingredients_url', instance.imageIngredientsUrl);
  writeNotNull(
      'image_ingredients_small_url', instance.imageIngredientsSmallUrl);
  writeNotNull('image_nutrition_url', instance.imageNutritionUrl);
  writeNotNull('image_nutrition_small_url', instance.imageNutritionSmallUrl);
  writeNotNull('image_packaging_url', instance.imagePackagingUrl);
  writeNotNull('image_packaging_small_url', instance.imagePackagingSmallUrl);
  writeNotNull('serving_size', instance.servingSize);
  writeNotNull('serving_quantity', jsonEncode(instance.servingQuantity));
  writeNotNull('product_quantity', instance.packagingQuantity);
  writeNotNull('selected_images',
      JsonHelper.selectedImagesToJson(instance.selectedImages));
  writeNotNull('images', JsonHelper.imagesToJson(instance.images));
  writeNotNull(
      'ingredients', JsonHelper.ingredientsToJson(instance.ingredients));
  writeNotNull('ingredients_text', instance.ingredientsText);
  writeNotNull('ingredients_text_in_languages',
      LanguageHelper.toJsonStringMap(instance.ingredientsTextInLanguages));
  writeNotNull('ingredients_tags', instance.ingredientsTags);
  writeNotNull('ingredients_tags_in_languages',
      LanguageHelper.toJsonStringsListMap(instance.ingredientsTagsInLanguages));
  val['imagesFreshnessInLanguages'] = instance.imagesFreshnessInLanguages?.map(
      (k, e) => MapEntry(_$OpenFoodFactsLanguageEnumMap[k],
          e.map((k, e) => MapEntry(_$ImageFieldEnumMap[k], e))));
  writeNotNull('ingredients_analysis_tags',
      IngredientsAnalysisTags.toJson(instance.ingredientsAnalysisTags));
  writeNotNull('nutriments', Nutriments.toJsonHelper(instance.nutriments));
  writeNotNull('additives_tags', Additives.additivesToJson(instance.additives));
  writeNotNull('environment_impact_level_tags',
      EnvironmentImpactLevels.toJson(instance.environmentImpactLevels));
  writeNotNull('allergens_tags', Allergens.allergensToJson(instance.allergens));
  writeNotNull(
      'nutrient_levels', NutrientLevels.toJson(instance.nutrientLevels));
  writeNotNull('nutriment_energy_unit', instance.nutrimentEnergyUnit);
  writeNotNull('nutrition_data_per', instance.nutrimentDataPer);
  writeNotNull('nutrition_grade_fr', instance.nutriscore);
  writeNotNull('categories', instance.categories);
  writeNotNull('categories_tags', instance.categoriesTags);
  writeNotNull('categories_tags_in_languages',
      LanguageHelper.toJsonStringsListMap(instance.categoriesTagsInLanguages));
  writeNotNull('labels', instance.labels);
  writeNotNull('labels_tags', instance.labelsTags);
  writeNotNull('labels_tags_in_languages',
      LanguageHelper.toJsonStringsListMap(instance.labelsTagsInLanguages));
  writeNotNull('packaging', instance.packaging);
  writeNotNull('packaging_tags', instance.packagingTags);
  writeNotNull('misc', instance.miscTags);
  writeNotNull('states_tags', instance.statesTags);
  writeNotNull('traces_tags', instance.tracesTags);
  writeNotNull('stores_tags', instance.storesTags);
  writeNotNull('stores', instance.stores);
  writeNotNull('attribute_groups',
      JsonHelper.attributeGroupsToJson(instance.attributeGroups));
  writeNotNull(
      'last_modified_t', JsonHelper.dateToTimestamp(instance.lastModified));
  writeNotNull('ecoscore_grade', instance.ecoscoreGrade);
  writeNotNull('ecoscore_score', instance.ecoscoreScore);
  writeNotNull(
      'ecoscore_data', EcoscoreData.toJsonHelper(instance.ecoscoreData));
  return val;
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$ImageFieldEnumMap = {
  ImageField.FRONT: 'FRONT',
  ImageField.INGREDIENTS: 'INGREDIENTS',
  ImageField.NUTRITION: 'NUTRITION',
  ImageField.PACKAGING: 'PACKAGING',
  ImageField.OTHER: 'OTHER',
};

const _$OpenFoodFactsLanguageEnumMap = {
  OpenFoodFactsLanguage.ENGLISH: 'ENGLISH',
  OpenFoodFactsLanguage.OLD_CHURCH_SLAVONIC: 'OLD_CHURCH_SLAVONIC',
  OpenFoodFactsLanguage.DZONGKHA_LANGUAGE: 'DZONGKHA_LANGUAGE',
  OpenFoodFactsLanguage.JAPANESE: 'JAPANESE',
  OpenFoodFactsLanguage.MALAY: 'MALAY',
  OpenFoodFactsLanguage.TAGALOG: 'TAGALOG',
  OpenFoodFactsLanguage.MOLDOVAN: 'MOLDOVAN',
  OpenFoodFactsLanguage.KOREAN: 'KOREAN',
  OpenFoodFactsLanguage.LUBA_KATANGA_LANGUAGE: 'LUBA_KATANGA_LANGUAGE',
  OpenFoodFactsLanguage.KAZAKH: 'KAZAKH',
  OpenFoodFactsLanguage.QUECHUA_LANGUAGES: 'QUECHUA_LANGUAGES',
  OpenFoodFactsLanguage.UKRAINIAN: 'UKRAINIAN',
  OpenFoodFactsLanguage.OCCITAN: 'OCCITAN',
  OpenFoodFactsLanguage.BIHARI_LANGUAGES: 'BIHARI_LANGUAGES',
  OpenFoodFactsLanguage.SOUTHERN_NDEBELE: 'SOUTHERN_NDEBELE',
  OpenFoodFactsLanguage.BOKMAL: 'BOKMAL',
  OpenFoodFactsLanguage.KOMI: 'KOMI',
  OpenFoodFactsLanguage.MODERN_GREEK: 'MODERN_GREEK',
  OpenFoodFactsLanguage.FIJIAN_LANGUAGE: 'FIJIAN_LANGUAGE',
  OpenFoodFactsLanguage.ZULU: 'ZULU',
  OpenFoodFactsLanguage.IDO: 'IDO',
  OpenFoodFactsLanguage.KHMER: 'KHMER',
  OpenFoodFactsLanguage.SANSKRIT: 'SANSKRIT',
  OpenFoodFactsLanguage.MACEDONIAN: 'MACEDONIAN',
  OpenFoodFactsLanguage.SOTHO: 'SOTHO',
  OpenFoodFactsLanguage.SCOTTISH_GAELIC: 'SCOTTISH_GAELIC',
  OpenFoodFactsLanguage.MARATHI: 'MARATHI',
  OpenFoodFactsLanguage.NAURUAN: 'NAURUAN',
  OpenFoodFactsLanguage.OROMO: 'OROMO',
  OpenFoodFactsLanguage.WELSH: 'WELSH',
  OpenFoodFactsLanguage.VIETNAMESE: 'VIETNAMESE',
  OpenFoodFactsLanguage.BISLAMA: 'BISLAMA',
  OpenFoodFactsLanguage.SOMALI: 'SOMALI',
  OpenFoodFactsLanguage.LITHUANIAN: 'LITHUANIAN',
  OpenFoodFactsLanguage.HAITIAN_CREOLE: 'HAITIAN_CREOLE',
  OpenFoodFactsLanguage.MALAGASY: 'MALAGASY',
  OpenFoodFactsLanguage.SPANISH: 'SPANISH',
  OpenFoodFactsLanguage.DANISH: 'DANISH',
  OpenFoodFactsLanguage.SLOVENE: 'SLOVENE',
  OpenFoodFactsLanguage.ICELANDIC: 'ICELANDIC',
  OpenFoodFactsLanguage.ESTONIAN: 'ESTONIAN',
  OpenFoodFactsLanguage.WOLOF: 'WOLOF',
  OpenFoodFactsLanguage.HIRI_MOTU: 'HIRI_MOTU',
  OpenFoodFactsLanguage.TAMIL: 'TAMIL',
  OpenFoodFactsLanguage.SLOVAK: 'SLOVAK',
  OpenFoodFactsLanguage.HERERO: 'HERERO',
  OpenFoodFactsLanguage.ITALIAN: 'ITALIAN',
  OpenFoodFactsLanguage.IRISH: 'IRISH',
  OpenFoodFactsLanguage.SHONA: 'SHONA',
  OpenFoodFactsLanguage.MARSHALLESE: 'MARSHALLESE',
  OpenFoodFactsLanguage.FRENCH: 'FRENCH',
  OpenFoodFactsLanguage.AYMARA: 'AYMARA',
  OpenFoodFactsLanguage.HEBREW: 'HEBREW',
  OpenFoodFactsLanguage.NORTHERN_SAMI: 'NORTHERN_SAMI',
  OpenFoodFactsLanguage.BENGALI: 'BENGALI',
  OpenFoodFactsLanguage.ODIA: 'ODIA',
  OpenFoodFactsLanguage.MALAYALAM: 'MALAYALAM',
  OpenFoodFactsLanguage.DUTCH: 'DUTCH',
  OpenFoodFactsLanguage.UYGHUR: 'UYGHUR',
  OpenFoodFactsLanguage.SERBIAN: 'SERBIAN',
  OpenFoodFactsLanguage.TIBETAN_LANGUAGE: 'TIBETAN_LANGUAGE',
  OpenFoodFactsLanguage.BELARUSIAN: 'BELARUSIAN',
  OpenFoodFactsLanguage.SAMOAN: 'SAMOAN',
  OpenFoodFactsLanguage.PUNJABI: 'PUNJABI',
  OpenFoodFactsLanguage.RUSSIAN: 'RUSSIAN',
  OpenFoodFactsLanguage.TAHITIAN: 'TAHITIAN',
  OpenFoodFactsLanguage.INTERLINGUA: 'INTERLINGUA',
  OpenFoodFactsLanguage.AFAR: 'AFAR',
  OpenFoodFactsLanguage.GREENLANDIC: 'GREENLANDIC',
  OpenFoodFactsLanguage.LATIN: 'LATIN',
  OpenFoodFactsLanguage.CHINESE: 'CHINESE',
  OpenFoodFactsLanguage.TURKMEN: 'TURKMEN',
  OpenFoodFactsLanguage.WEST_FRISIAN: 'WEST_FRISIAN',
  OpenFoodFactsLanguage.TSONGA: 'TSONGA',
  OpenFoodFactsLanguage.ROMANSH: 'ROMANSH',
  OpenFoodFactsLanguage.INUPIAT_LANGUAGE: 'INUPIAT_LANGUAGE',
  OpenFoodFactsLanguage.TAJIK: 'TAJIK',
  OpenFoodFactsLanguage.BURMESE: 'BURMESE',
  OpenFoodFactsLanguage.JAVANESE: 'JAVANESE',
  OpenFoodFactsLanguage.CHECHEN: 'CHECHEN',
  OpenFoodFactsLanguage.ASSAMESE: 'ASSAMESE',
  OpenFoodFactsLanguage.UNKNOWN_LANGUAGE: 'UNKNOWN_LANGUAGE',
  OpenFoodFactsLanguage.ARABIC: 'ARABIC',
  OpenFoodFactsLanguage.KINYARWANDA: 'KINYARWANDA',
  OpenFoodFactsLanguage.TONGAN_LANGUAGE: 'TONGAN_LANGUAGE',
  OpenFoodFactsLanguage.CHURCH_SLAVONIC: 'CHURCH_SLAVONIC',
  OpenFoodFactsLanguage.SINHALA: 'SINHALA',
  OpenFoodFactsLanguage.ARMENIAN: 'ARMENIAN',
  OpenFoodFactsLanguage.KURDISH: 'KURDISH',
  OpenFoodFactsLanguage.THAI: 'THAI',
  OpenFoodFactsLanguage.CREE: 'CREE',
  OpenFoodFactsLanguage.SWAHILI: 'SWAHILI',
  OpenFoodFactsLanguage.GUJARATI: 'GUJARATI',
  OpenFoodFactsLanguage.PERSIAN: 'PERSIAN',
  OpenFoodFactsLanguage.BOSNIAN: 'BOSNIAN',
  OpenFoodFactsLanguage.AMHARIC: 'AMHARIC',
  OpenFoodFactsLanguage.ARAGONESE: 'ARAGONESE',
  OpenFoodFactsLanguage.CROATIAN: 'CROATIAN',
  OpenFoodFactsLanguage.CHEWA: 'CHEWA',
  OpenFoodFactsLanguage.ZHUANG_LANGUAGES: 'ZHUANG_LANGUAGES',
  OpenFoodFactsLanguage.LINGALA_LANGUAGE: 'LINGALA_LANGUAGE',
  OpenFoodFactsLanguage.BAMBARA: 'BAMBARA',
  OpenFoodFactsLanguage.LIMBURGISH_LANGUAGE: 'LIMBURGISH_LANGUAGE',
  OpenFoodFactsLanguage.NUOSU_LANGUAGE: 'NUOSU_LANGUAGE',
  OpenFoodFactsLanguage.KWANYAMA: 'KWANYAMA',
  OpenFoodFactsLanguage.KIRUNDI: 'KIRUNDI',
  OpenFoodFactsLanguage.EWE: 'EWE',
  OpenFoodFactsLanguage.FAROESE: 'FAROESE',
  OpenFoodFactsLanguage.SINDHI: 'SINDHI',
  OpenFoodFactsLanguage.CORSICAN: 'CORSICAN',
  OpenFoodFactsLanguage.KANNADA: 'KANNADA',
  OpenFoodFactsLanguage.NORWEGIAN: 'NORWEGIAN',
  OpenFoodFactsLanguage.SUNDANESE_LANGUAGE: 'SUNDANESE_LANGUAGE',
  OpenFoodFactsLanguage.GEORGIAN: 'GEORGIAN',
  OpenFoodFactsLanguage.HAUSA: 'HAUSA',
  OpenFoodFactsLanguage.TSWANA: 'TSWANA',
  OpenFoodFactsLanguage.CATALAN: 'CATALAN',
  OpenFoodFactsLanguage.NDONGA_DIALECT: 'NDONGA_DIALECT',
  OpenFoodFactsLanguage.IGBO_LANGUAGE: 'IGBO_LANGUAGE',
  OpenFoodFactsLanguage.AFRIKAANS: 'AFRIKAANS',
  OpenFoodFactsLanguage.POLISH: 'POLISH',
  OpenFoodFactsLanguage.KASHMIRI: 'KASHMIRI',
  OpenFoodFactsLanguage.MAORI: 'MAORI',
  OpenFoodFactsLanguage.HUNGARIAN: 'HUNGARIAN',
  OpenFoodFactsLanguage.BRETON: 'BRETON',
  OpenFoodFactsLanguage.PORTUGUESE: 'PORTUGUESE',
  OpenFoodFactsLanguage.BULGARIAN: 'BULGARIAN',
  OpenFoodFactsLanguage.AVESTAN: 'AVESTAN',
  OpenFoodFactsLanguage.NEPALI: 'NEPALI',
  OpenFoodFactsLanguage.TWI: 'TWI',
  OpenFoodFactsLanguage.UZBEK: 'UZBEK',
  OpenFoodFactsLanguage.CHAMORRO: 'CHAMORRO',
  OpenFoodFactsLanguage.GUARANI: 'GUARANI',
  OpenFoodFactsLanguage.NYNORSK: 'NYNORSK',
  OpenFoodFactsLanguage.AZERBAIJANI: 'AZERBAIJANI',
  OpenFoodFactsLanguage.CZECH: 'CZECH',
  OpenFoodFactsLanguage.NAVAJO: 'NAVAJO',
  OpenFoodFactsLanguage.FINNISH: 'FINNISH',
  OpenFoodFactsLanguage.LUXEMBOURGISH: 'LUXEMBOURGISH',
  OpenFoodFactsLanguage.SWEDISH: 'SWEDISH',
  OpenFoodFactsLanguage.YIDDISH: 'YIDDISH',
  OpenFoodFactsLanguage.INUKTITUT: 'INUKTITUT',
  OpenFoodFactsLanguage.LAO: 'LAO',
  OpenFoodFactsLanguage.CHUVASH: 'CHUVASH',
  OpenFoodFactsLanguage.MALTESE: 'MALTESE',
  OpenFoodFactsLanguage.MALDIVIAN_LANGUAGE: 'MALDIVIAN_LANGUAGE',
  OpenFoodFactsLanguage.INTERLINGUE: 'INTERLINGUE',
  OpenFoodFactsLanguage.OSSETIAN: 'OSSETIAN',
  OpenFoodFactsLanguage.BASHKIR: 'BASHKIR',
  OpenFoodFactsLanguage.OJIBWE: 'OJIBWE',
  OpenFoodFactsLanguage.KANURI: 'KANURI',
  OpenFoodFactsLanguage.INDONESIAN: 'INDONESIAN',
  OpenFoodFactsLanguage.SARDINIAN_LANGUAGE: 'SARDINIAN_LANGUAGE',
  OpenFoodFactsLanguage.AKAN: 'AKAN',
  OpenFoodFactsLanguage.MANX: 'MANX',
  OpenFoodFactsLanguage.TURKISH: 'TURKISH',
  OpenFoodFactsLanguage.ESPERANTO: 'ESPERANTO',
  OpenFoodFactsLanguage.PASHTO: 'PASHTO',
  OpenFoodFactsLanguage.KYRGYZ: 'KYRGYZ',
  OpenFoodFactsLanguage.VOLAPUK: 'VOLAPUK',
  OpenFoodFactsLanguage.AVAR: 'AVAR',
  OpenFoodFactsLanguage.SANGO: 'SANGO',
  OpenFoodFactsLanguage.VENDA: 'VENDA',
  OpenFoodFactsLanguage.ALBANIAN: 'ALBANIAN',
  OpenFoodFactsLanguage.BASQUE: 'BASQUE',
  OpenFoodFactsLanguage.FULA_LANGUAGE: 'FULA_LANGUAGE',
  OpenFoodFactsLanguage.GERMAN: 'GERMAN',
  OpenFoodFactsLanguage.LATVIAN: 'LATVIAN',
  OpenFoodFactsLanguage.CORNISH: 'CORNISH',
  OpenFoodFactsLanguage.PALI: 'PALI',
  OpenFoodFactsLanguage.TATAR: 'TATAR',
  OpenFoodFactsLanguage.ROMANIAN: 'ROMANIAN',
  OpenFoodFactsLanguage.GIKUYU: 'GIKUYU',
  OpenFoodFactsLanguage.TIGRINYA: 'TIGRINYA',
  OpenFoodFactsLanguage.GALICIAN: 'GALICIAN',
  OpenFoodFactsLanguage.TELUGU: 'TELUGU',
  OpenFoodFactsLanguage.HINDI: 'HINDI',
  OpenFoodFactsLanguage.KONGO_LANGUAGE: 'KONGO_LANGUAGE',
  OpenFoodFactsLanguage.XHOSA: 'XHOSA',
  OpenFoodFactsLanguage.SWAZI: 'SWAZI',
  OpenFoodFactsLanguage.LUGANDA: 'LUGANDA',
  OpenFoodFactsLanguage.URDU: 'URDU',
  OpenFoodFactsLanguage.NORTHERN_NDEBELE_LANGUAGE: 'NORTHERN_NDEBELE_LANGUAGE',
  OpenFoodFactsLanguage.YORUBA: 'YORUBA',
  OpenFoodFactsLanguage.WORLD: 'WORLD',
  OpenFoodFactsLanguage.UNDEFINED: 'UNDEFINED',
};
