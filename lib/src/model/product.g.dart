// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

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
      imageFrontUrl: json['image_front_url'] as String?,
      imageFrontSmallUrl: json['image_front_small_url'] as String?,
      imageIngredientsUrl: json['image_ingredients_url'] as String?,
      imageIngredientsSmallUrl: json['image_ingredients_small_url'] as String?,
      imageNutritionUrl: json['image_nutrition_url'] as String?,
      imageNutritionSmallUrl: json['image_nutrition_small_url'] as String?,
      imagePackagingUrl: json['image_packaging_url'] as String?,
      imagePackagingSmallUrl: json['image_packaging_small_url'] as String?,
      servingSize: json['serving_size'] as String?,
      servingQuantity: JsonHelper.quantityFromJson(json['serving_quantity']),
      packagingQuantity: JsonHelper.quantityFromJson(json['product_quantity']),
      selectedImages:
          JsonHelper.selectedImagesFromJson(json['selected_images'] as Map?),
      images: JsonHelper.allImagesFromJson(json['images'] as Map?),
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
      additives: Additives.additivesFromJson(json['additives_tags'] as List?),
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
      miscTags: (json['misc_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
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
          ?.map(AttributeGroup.fromJson)
          .toList(),
      lastModified: JsonHelper.timestampToDate(json['last_modified_t']),
      ecoscoreGrade: json['ecoscore_grade'] as String?,
      ecoscoreScore: JsonObject.parseDouble(json['ecoscore_score']),
      ecoscoreData: json['ecoscore_data'] == null
          ? null
          : EcoscoreData.fromJson(
              json['ecoscore_data'] as Map<String, dynamic>),
      nutriments: json['nutriments'] == null
          ? null
          : Nutriments.fromJson(json['nutriments'] as Map<String, dynamic>),
      noNutritionData: JsonHelper.checkboxFromJSON(json['no_nutrition_data']),
    )
      ..productType =
          $enumDecodeNullable(_$ProductTypeEnumMap, json['product_type'])
      ..schemaVersion = (json['schema_version'] as num?)?.toInt()
      ..conservationConditionsInLanguages = LanguageHelper.fromJsonStringMap(
          json['conservation_conditions_in_languages'])
      ..customerServiceInLanguages = LanguageHelper.fromJsonStringMap(
          json['customer_service_in_languages'])
      ..genericNameInLanguages =
          LanguageHelper.fromJsonStringMap(json['generic_name_in_languages'])
      ..abbreviatedName = json['abbreviated_product_name'] as String?
      ..abbreviatedNameInLanguages = LanguageHelper.fromJsonStringMap(
          json['abbreviated_product_name_in_languages'])
      ..brandsTagsInLanguages = LanguageHelper.fromJsonStringsListMap(
          json['brands_tags_in_languages'])
      ..imagesFreshnessInLanguages =
          (json['imagesFreshnessInLanguages'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            $enumDecode(_$OpenFoodFactsLanguageEnumMap, k),
            (e as Map<String, dynamic>).map(
              (k, e) => MapEntry(
                  $enumDecode(_$ImageFieldEnumMap, k), (e as num).toInt()),
            )),
      )
      ..ingredientsAnalysisTagsInLanguages =
          LanguageHelper.fromJsonStringsListMap(
              json['ingredients_analysis_tags_in_languages'])
      ..additivesTagsInLanguages = LanguageHelper.fromJsonStringsListMap(
          json['additives_tags_in_languages'])
      ..allergensTagsInLanguages = LanguageHelper.fromJsonStringsListMap(
          json['allergens_tags_in_languages'])
      ..nutritionData = JsonHelper.checkboxFromJSON(json['nutrition_data'])
      ..nutriScoreDetails = json['nutriscore'] == null
          ? null
          : NutriScoreDetails.fromJson(
              json['nutriscore'] as Map<String, dynamic>)
      ..comparedToCategory = json['compared_to_category'] as String?
      ..packagings = (json['packagings'] as List<dynamic>?)
          ?.map(ProductPackaging.fromJson)
          .toList()
      ..packagingsComplete =
          JsonHelper.boolFromJSON(json['packagings_complete'])
      ..packagingTextInLanguages =
          LanguageHelper.fromJsonStringMap(json['packaging_text_in_languages'])
      ..miscTagsInLanguages =
          LanguageHelper.fromJsonStringsListMap(json['misc_tags_in_languages'])
      ..statesTagsInLanguages = LanguageHelper.fromJsonStringsListMap(
          json['states_tags_in_languages'])
      ..tracesTagsInLanguages = LanguageHelper.fromJsonStringsListMap(
          json['traces_tags_in_languages'])
      ..traces = json['traces'] as String?
      ..storesTagsInLanguages = LanguageHelper.fromJsonStringsListMap(
          json['stores_tags_in_languages'])
      ..lastModifiedBy = json['last_modified_by'] as String?
      ..lastImage = JsonHelper.timestampToDate(json['last_image_t'])
      ..lastEditor = json['last_editor'] as String?
      ..entryDates = (json['entry_dates_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..lastCheckDates = (json['last_check_dates_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..lastEditDates = (json['last_edit_dates_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..lastImageDates = (json['last_image_dates_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..lastChecked = JsonHelper.timestampToDate(json['last_checked_t'])
      ..lastChecker = json['last_checker'] as String?
      ..created = JsonHelper.timestampToDate(json['created_t'])
      ..creator = json['creator'] as String?
      ..editors = (json['editors_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..knowledgePanels =
          KnowledgePanels.fromJsonHelper(json['knowledge_panels'] as Map?)
      ..embCodes = json['emb_codes'] as String?
      ..manufacturingPlaces = json['manufacturing_places'] as String?
      ..origins = json['origins'] as String?
      ..novaGroup = (json['nova_group'] as num?)?.toInt()
      ..website = json['link'] as String?
      ..dataQualityTags = (json['data_quality_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..dataQualityBugsTags = (json['data_quality_bugs_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..dataQualityErrorsTags =
          (json['data_quality_errors_tags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..dataQualityInfoTags = (json['data_quality_info_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..dataQualityWarningsTags =
          (json['data_quality_warnings_tags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..obsolete = JsonHelper.checkboxFromJSON(json['obsolete'])
      ..ownerFields = (json['owner_fields'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      )
      ..owner = json['owner'] as String?
      ..expirationDate = json['expiration_date'] as String?;

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'code': instance.barcode,
      if (_$ProductTypeEnumMap[instance.productType] case final value?)
        'product_type': value,
      if (instance.schemaVersion case final value?) 'schema_version': value,
      if (instance.productName case final value?) 'product_name': value,
      if (LanguageHelper.toJsonStringMap(instance.productNameInLanguages)
          case final value?)
        'product_name_in_languages': value,
      if (LanguageHelper.toJsonStringMap(
              instance.conservationConditionsInLanguages)
          case final value?)
        'conservation_conditions_in_languages': value,
      if (LanguageHelper.toJsonStringMap(instance.customerServiceInLanguages)
          case final value?)
        'customer_service_in_languages': value,
      if (instance.genericName case final value?) 'generic_name': value,
      if (LanguageHelper.toJsonStringMap(instance.genericNameInLanguages)
          case final value?)
        'generic_name_in_languages': value,
      if (instance.abbreviatedName case final value?)
        'abbreviated_product_name': value,
      if (LanguageHelper.toJsonStringMap(instance.abbreviatedNameInLanguages)
          case final value?)
        'abbreviated_product_name_in_languages': value,
      if (instance.brands case final value?) 'brands': value,
      if (instance.brandsTags case final value?) 'brands_tags': value,
      if (LanguageHelper.toJsonStringsListMap(instance.brandsTagsInLanguages)
          case final value?)
        'brands_tags_in_languages': value,
      if (instance.countries case final value?) 'countries': value,
      if (instance.countriesTags case final value?) 'countries_tags': value,
      if (LanguageHelper.toJsonStringsListMap(instance.countriesTagsInLanguages)
          case final value?)
        'countries_tags_in_languages': value,
      'lang': LanguageHelper.toJson(instance.lang),
      if (instance.quantity case final value?) 'quantity': value,
      if (instance.imageFrontUrl case final value?) 'image_front_url': value,
      if (instance.imageFrontSmallUrl case final value?)
        'image_front_small_url': value,
      if (instance.imageIngredientsUrl case final value?)
        'image_ingredients_url': value,
      if (instance.imageIngredientsSmallUrl case final value?)
        'image_ingredients_small_url': value,
      if (instance.imageNutritionUrl case final value?)
        'image_nutrition_url': value,
      if (instance.imageNutritionSmallUrl case final value?)
        'image_nutrition_small_url': value,
      if (instance.imagePackagingUrl case final value?)
        'image_packaging_url': value,
      if (instance.imagePackagingSmallUrl case final value?)
        'image_packaging_small_url': value,
      if (instance.servingSize case final value?) 'serving_size': value,
      if (instance.servingQuantity case final value?) 'serving_quantity': value,
      if (instance.packagingQuantity case final value?)
        'product_quantity': value,
      'selected_images':
          JsonHelper.selectedImagesToJson(instance.selectedImages),
      'images': JsonHelper.allImagesToJson(instance.images),
      if (JsonHelper.ingredientsToJson(instance.ingredients) case final value?)
        'ingredients': value,
      if (instance.ingredientsText case final value?) 'ingredients_text': value,
      if (LanguageHelper.toJsonStringMap(instance.ingredientsTextInLanguages)
          case final value?)
        'ingredients_text_in_languages': value,
      if (instance.ingredientsTags case final value?) 'ingredients_tags': value,
      if (LanguageHelper.toJsonStringsListMap(
              instance.ingredientsTagsInLanguages)
          case final value?)
        'ingredients_tags_in_languages': value,
      'imagesFreshnessInLanguages': instance.imagesFreshnessInLanguages?.map(
          (k, e) => MapEntry(_$OpenFoodFactsLanguageEnumMap[k]!,
              e.map((k, e) => MapEntry(_$ImageFieldEnumMap[k]!, e)))),
      'ingredients_analysis_tags':
          IngredientsAnalysisTags.toJson(instance.ingredientsAnalysisTags),
      if (LanguageHelper.toJsonStringsListMap(
              instance.ingredientsAnalysisTagsInLanguages)
          case final value?)
        'ingredients_analysis_tags_in_languages': value,
      if (Additives.additivesToJson(instance.additives) case final value?)
        'additives_tags': value,
      if (LanguageHelper.toJsonStringsListMap(instance.additivesTagsInLanguages)
          case final value?)
        'additives_tags_in_languages': value,
      if (Allergens.allergensToJson(instance.allergens) case final value?)
        'allergens_tags': value,
      if (LanguageHelper.toJsonStringsListMap(instance.allergensTagsInLanguages)
          case final value?)
        'allergens_tags_in_languages': value,
      if (NutrientLevels.toJson(instance.nutrientLevels) case final value?)
        'nutrient_levels': value,
      if (instance.nutrimentEnergyUnit case final value?)
        'nutriment_energy_unit': value,
      'nutrition_data': JsonHelper.checkboxToJSON(instance.nutritionData),
      if (instance.nutrimentDataPer case final value?)
        'nutrition_data_per': value,
      if (instance.nutriscore case final value?) 'nutrition_grade_fr': value,
      if (instance.nutriScoreDetails case final value?) 'nutriscore': value,
      if (instance.comparedToCategory case final value?)
        'compared_to_category': value,
      if (instance.categories case final value?) 'categories': value,
      if (instance.categoriesTags case final value?) 'categories_tags': value,
      if (LanguageHelper.toJsonStringsListMap(
              instance.categoriesTagsInLanguages)
          case final value?)
        'categories_tags_in_languages': value,
      if (instance.labels case final value?) 'labels': value,
      if (instance.labelsTags case final value?) 'labels_tags': value,
      if (LanguageHelper.toJsonStringsListMap(instance.labelsTagsInLanguages)
          case final value?)
        'labels_tags_in_languages': value,
      if (instance.packaging case final value?) 'packaging': value,
      if (JsonHelper.productPackagingsToJson(instance.packagings)
          case final value?)
        'packagings': value,
      'packagings_complete': JsonHelper.boolToJSON(instance.packagingsComplete),
      if (instance.packagingTags case final value?) 'packaging_tags': value,
      if (LanguageHelper.toJsonStringMap(instance.packagingTextInLanguages)
          case final value?)
        'packaging_text_in_languages': value,
      if (instance.miscTags case final value?) 'misc_tags': value,
      if (LanguageHelper.toJsonStringsListMap(instance.miscTagsInLanguages)
          case final value?)
        'misc_tags_in_languages': value,
      if (instance.statesTags case final value?) 'states_tags': value,
      if (LanguageHelper.toJsonStringsListMap(instance.statesTagsInLanguages)
          case final value?)
        'states_tags_in_languages': value,
      if (instance.tracesTags case final value?) 'traces_tags': value,
      if (LanguageHelper.toJsonStringsListMap(instance.tracesTagsInLanguages)
          case final value?)
        'traces_tags_in_languages': value,
      if (instance.traces case final value?) 'traces': value,
      if (instance.storesTags case final value?) 'stores_tags': value,
      if (LanguageHelper.toJsonStringsListMap(instance.storesTagsInLanguages)
          case final value?)
        'stores_tags_in_languages': value,
      if (instance.stores case final value?) 'stores': value,
      if (JsonHelper.attributeGroupsToJson(instance.attributeGroups)
          case final value?)
        'attribute_groups': value,
      if (JsonHelper.dateToTimestamp(instance.lastModified) case final value?)
        'last_modified_t': value,
      if (instance.lastModifiedBy case final value?) 'last_modified_by': value,
      if (JsonHelper.dateToTimestamp(instance.lastImage) case final value?)
        'last_image_t': value,
      if (instance.lastEditor case final value?) 'last_editor': value,
      if (instance.entryDates case final value?) 'entry_dates_tags': value,
      if (instance.lastCheckDates case final value?)
        'last_check_dates_tags': value,
      if (instance.lastEditDates case final value?)
        'last_edit_dates_tags': value,
      if (instance.lastImageDates case final value?)
        'last_image_dates_tags': value,
      if (JsonHelper.dateToTimestamp(instance.lastChecked) case final value?)
        'last_checked_t': value,
      if (instance.lastChecker case final value?) 'last_checker': value,
      if (JsonHelper.dateToTimestamp(instance.created) case final value?)
        'created_t': value,
      if (instance.creator case final value?) 'creator': value,
      if (instance.editors case final value?) 'editors_tags': value,
      if (instance.ecoscoreGrade case final value?) 'ecoscore_grade': value,
      if (instance.ecoscoreScore case final value?) 'ecoscore_score': value,
      if (EcoscoreData.toJsonHelper(instance.ecoscoreData) case final value?)
        'ecoscore_data': value,
      if (KnowledgePanels.toJsonHelper(instance.knowledgePanels)
          case final value?)
        'knowledge_panels': value,
      if (instance.embCodes case final value?) 'emb_codes': value,
      if (instance.manufacturingPlaces case final value?)
        'manufacturing_places': value,
      if (instance.origins case final value?) 'origins': value,
      if (instance.novaGroup case final value?) 'nova_group': value,
      if (instance.website case final value?) 'link': value,
      if (instance.dataQualityTags case final value?)
        'data_quality_tags': value,
      if (instance.dataQualityBugsTags case final value?)
        'data_quality_bugs_tags': value,
      if (instance.dataQualityErrorsTags case final value?)
        'data_quality_errors_tags': value,
      if (instance.dataQualityInfoTags case final value?)
        'data_quality_info_tags': value,
      if (instance.dataQualityWarningsTags case final value?)
        'data_quality_warnings_tags': value,
      'obsolete': JsonHelper.checkboxToJSON(instance.obsolete),
      if (instance.ownerFields case final value?) 'owner_fields': value,
      if (instance.owner case final value?) 'owner': value,
      if (instance.expirationDate case final value?) 'expiration_date': value,
      'no_nutrition_data': JsonHelper.checkboxToJSON(instance.noNutritionData),
      'nutriments': Nutriments.toJsonHelper(instance.nutriments),
    };

const _$ProductTypeEnumMap = {
  ProductType.food: 'food',
  ProductType.beauty: 'beauty',
  ProductType.petFood: 'petfood',
  ProductType.product: 'product',
};

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
  OpenFoodFactsLanguage.MONGOLIAN: 'MONGOLIAN',
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
