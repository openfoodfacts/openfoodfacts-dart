// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) =>
    Product(
        barcode: json['code'] as String?,
        productName: json['product_name'] as String?,
        productNameInLanguages: LanguageHelper.fromJsonStringMap(
          json['product_name_in_languages'],
        ),
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
          json['countries_tags_in_languages'],
        ),
        lang: LanguageHelper.fromJson(json['lang'] as String?),
        quantity: json['quantity'] as String?,
        imageFrontUrl: json['image_front_url'] as String?,
        imageFrontSmallUrl: json['image_front_small_url'] as String?,
        imageIngredientsUrl: json['image_ingredients_url'] as String?,
        imageIngredientsSmallUrl:
            json['image_ingredients_small_url'] as String?,
        imageNutritionUrl: json['image_nutrition_url'] as String?,
        imageNutritionSmallUrl: json['image_nutrition_small_url'] as String?,
        imagePackagingUrl: json['image_packaging_url'] as String?,
        imagePackagingSmallUrl: json['image_packaging_small_url'] as String?,
        servingSize: json['serving_size'] as String?,
        servingQuantity: JsonHelper.quantityFromJson(json['serving_quantity']),
        packagingQuantity: JsonHelper.quantityFromJson(
          json['product_quantity'],
        ),
        selectedImages: JsonHelper.selectedImagesFromJson(
          json['selected_images'] as Map?,
        ),
        images: JsonHelper.allImagesFromJson(json['images'] as Map?),
        ingredients: (json['ingredients'] as List<dynamic>?)
            ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
            .toList(),
        ingredientsText: json['ingredients_text'] as String?,
        ingredientsTextInLanguages: LanguageHelper.fromJsonStringMap(
          json['ingredients_text_in_languages'],
        ),
        ingredientsTags: (json['ingredients_tags'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        ingredientsTagsInLanguages: LanguageHelper.fromJsonStringsListMap(
          json['ingredients_tags_in_languages'],
        ),
        ingredientsAnalysisTags: IngredientsAnalysisTags.fromJson(
          json['ingredients_analysis_tags'] as List?,
        ),
        additives: Additives.additivesFromJson(json['additives_tags'] as List?),
        allergens: Allergens.allergensFromJson(json['allergens_tags'] as List?),
        nutrientLevels: NutrientLevels.fromJson(
          json['nutrient_levels'] as Map?,
        ),
        nutrimentEnergyUnit: json['nutriment_energy_unit'] as String?,
        nutrimentDataPer: json['nutrition_data_per'] as String?,
        nutriscore: json['nutrition_grade_fr'] as String?,
        categories: json['categories'] as String?,
        categoriesTags: (json['categories_tags'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        categoriesTagsInLanguages: LanguageHelper.fromJsonStringsListMap(
          json['categories_tags_in_languages'],
        ),
        labels: json['labels'] as String?,
        labelsTags: (json['labels_tags'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        labelsTagsInLanguages: LanguageHelper.fromJsonStringsListMap(
          json['labels_tags_in_languages'],
        ),
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
                json['ecoscore_data'] as Map<String, dynamic>,
              ),
        nutriments: json['nutriments'] == null
            ? null
            : Nutriments.fromJson(json['nutriments'] as Map<String, dynamic>),
        noNutritionData: JsonHelper.checkboxFromJSON(json['no_nutrition_data']),
      )
      ..productType = $enumDecodeNullable(
        _$ProductTypeEnumMap,
        json['product_type'],
      )
      ..schemaVersion = (json['schema_version'] as num?)?.toInt()
      ..conservationConditionsInLanguages = LanguageHelper.fromJsonStringMap(
        json['conservation_conditions_in_languages'],
      )
      ..customerServiceInLanguages = LanguageHelper.fromJsonStringMap(
        json['customer_service_in_languages'],
      )
      ..genericNameInLanguages = LanguageHelper.fromJsonStringMap(
        json['generic_name_in_languages'],
      )
      ..abbreviatedName = json['abbreviated_product_name'] as String?
      ..abbreviatedNameInLanguages = LanguageHelper.fromJsonStringMap(
        json['abbreviated_product_name_in_languages'],
      )
      ..brandsTagsInLanguages = LanguageHelper.fromJsonStringsListMap(
        json['brands_tags_in_languages'],
      )
      ..imagesFreshnessInLanguages = Product._fromJsonFreshness(
        json['imagesFreshnessInLanguages'],
      )
      ..ingredientsAnalysisTagsInLanguages =
          LanguageHelper.fromJsonStringsListMap(
            json['ingredients_analysis_tags_in_languages'],
          )
      ..additivesTagsInLanguages = LanguageHelper.fromJsonStringsListMap(
        json['additives_tags_in_languages'],
      )
      ..allergensTagsInLanguages = LanguageHelper.fromJsonStringsListMap(
        json['allergens_tags_in_languages'],
      )
      ..nutritionData = JsonHelper.checkboxFromJSON(json['nutrition_data'])
      ..comparedToCategory = json['compared_to_category'] as String?
      ..packagings = (json['packagings'] as List<dynamic>?)
          ?.map(ProductPackaging.fromJson)
          .toList()
      ..packagingsComplete = JsonHelper.boolFromJSON(
        json['packagings_complete'],
      )
      ..packagingTextInLanguages = LanguageHelper.fromJsonStringMap(
        json['packaging_text_in_languages'],
      )
      ..miscTagsInLanguages = LanguageHelper.fromJsonStringsListMap(
        json['misc_tags_in_languages'],
      )
      ..statesTagsInLanguages = LanguageHelper.fromJsonStringsListMap(
        json['states_tags_in_languages'],
      )
      ..tracesTagsInLanguages = LanguageHelper.fromJsonStringsListMap(
        json['traces_tags_in_languages'],
      )
      ..traces = json['traces'] as String?
      ..storesTagsInLanguages = LanguageHelper.fromJsonStringsListMap(
        json['stores_tags_in_languages'],
      )
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
      ..knowledgePanels = KnowledgePanels.fromJsonHelper(
        json['knowledge_panels'] as Map?,
      )
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
  'product_type': ?_$ProductTypeEnumMap[instance.productType],
  'schema_version': ?instance.schemaVersion,
  'product_name': ?instance.productName,
  'product_name_in_languages': ?LanguageHelper.toJsonStringMap(
    instance.productNameInLanguages,
  ),
  'conservation_conditions_in_languages': ?LanguageHelper.toJsonStringMap(
    instance.conservationConditionsInLanguages,
  ),
  'customer_service_in_languages': ?LanguageHelper.toJsonStringMap(
    instance.customerServiceInLanguages,
  ),
  'generic_name': ?instance.genericName,
  'generic_name_in_languages': ?LanguageHelper.toJsonStringMap(
    instance.genericNameInLanguages,
  ),
  'abbreviated_product_name': ?instance.abbreviatedName,
  'abbreviated_product_name_in_languages': ?LanguageHelper.toJsonStringMap(
    instance.abbreviatedNameInLanguages,
  ),
  'brands': ?instance.brands,
  'brands_tags': ?instance.brandsTags,
  'brands_tags_in_languages': ?LanguageHelper.toJsonStringsListMap(
    instance.brandsTagsInLanguages,
  ),
  'countries': ?instance.countries,
  'countries_tags': ?instance.countriesTags,
  'countries_tags_in_languages': ?LanguageHelper.toJsonStringsListMap(
    instance.countriesTagsInLanguages,
  ),
  'lang': LanguageHelper.toJson(instance.lang),
  'quantity': ?instance.quantity,
  'image_front_url': ?instance.imageFrontUrl,
  'image_front_small_url': ?instance.imageFrontSmallUrl,
  'image_ingredients_url': ?instance.imageIngredientsUrl,
  'image_ingredients_small_url': ?instance.imageIngredientsSmallUrl,
  'image_nutrition_url': ?instance.imageNutritionUrl,
  'image_nutrition_small_url': ?instance.imageNutritionSmallUrl,
  'image_packaging_url': ?instance.imagePackagingUrl,
  'image_packaging_small_url': ?instance.imagePackagingSmallUrl,
  'serving_size': ?instance.servingSize,
  'serving_quantity': ?instance.servingQuantity,
  'product_quantity': ?instance.packagingQuantity,
  'selected_images': JsonHelper.selectedImagesToJson(instance.selectedImages),
  'images': JsonHelper.allImagesToJson(instance.images),
  'ingredients': ?JsonHelper.ingredientsToJson(instance.ingredients),
  'ingredients_text': ?instance.ingredientsText,
  'ingredients_text_in_languages': ?LanguageHelper.toJsonStringMap(
    instance.ingredientsTextInLanguages,
  ),
  'ingredients_tags': ?instance.ingredientsTags,
  'ingredients_tags_in_languages': ?LanguageHelper.toJsonStringsListMap(
    instance.ingredientsTagsInLanguages,
  ),
  'imagesFreshnessInLanguages': Product._toJsonFreshness(
    instance.imagesFreshnessInLanguages,
  ),
  'ingredients_analysis_tags': IngredientsAnalysisTags.toJson(
    instance.ingredientsAnalysisTags,
  ),
  'ingredients_analysis_tags_in_languages':
      ?LanguageHelper.toJsonStringsListMap(
        instance.ingredientsAnalysisTagsInLanguages,
      ),
  'additives_tags': ?Additives.additivesToJson(instance.additives),
  'additives_tags_in_languages': ?LanguageHelper.toJsonStringsListMap(
    instance.additivesTagsInLanguages,
  ),
  'allergens_tags': ?Allergens.allergensToJson(instance.allergens),
  'allergens_tags_in_languages': ?LanguageHelper.toJsonStringsListMap(
    instance.allergensTagsInLanguages,
  ),
  'nutrient_levels': ?NutrientLevels.toJson(instance.nutrientLevels),
  'nutriment_energy_unit': ?instance.nutrimentEnergyUnit,
  'nutrition_data': JsonHelper.checkboxToJSON(instance.nutritionData),
  'nutrition_data_per': ?instance.nutrimentDataPer,
  'nutrition_grade_fr': ?instance.nutriscore,
  'compared_to_category': ?instance.comparedToCategory,
  'categories': ?instance.categories,
  'categories_tags': ?instance.categoriesTags,
  'categories_tags_in_languages': ?LanguageHelper.toJsonStringsListMap(
    instance.categoriesTagsInLanguages,
  ),
  'labels': ?instance.labels,
  'labels_tags': ?instance.labelsTags,
  'labels_tags_in_languages': ?LanguageHelper.toJsonStringsListMap(
    instance.labelsTagsInLanguages,
  ),
  'packaging': ?instance.packaging,
  'packagings': ?JsonHelper.productPackagingsToJson(instance.packagings),
  'packagings_complete': JsonHelper.boolToJSON(instance.packagingsComplete),
  'packaging_tags': ?instance.packagingTags,
  'packaging_text_in_languages': ?LanguageHelper.toJsonStringMap(
    instance.packagingTextInLanguages,
  ),
  'misc_tags': ?instance.miscTags,
  'misc_tags_in_languages': ?LanguageHelper.toJsonStringsListMap(
    instance.miscTagsInLanguages,
  ),
  'states_tags': ?instance.statesTags,
  'states_tags_in_languages': ?LanguageHelper.toJsonStringsListMap(
    instance.statesTagsInLanguages,
  ),
  'traces_tags': ?instance.tracesTags,
  'traces_tags_in_languages': ?LanguageHelper.toJsonStringsListMap(
    instance.tracesTagsInLanguages,
  ),
  'traces': ?instance.traces,
  'stores_tags': ?instance.storesTags,
  'stores_tags_in_languages': ?LanguageHelper.toJsonStringsListMap(
    instance.storesTagsInLanguages,
  ),
  'stores': ?instance.stores,
  'attribute_groups': ?JsonHelper.attributeGroupsToJson(
    instance.attributeGroups,
  ),
  'last_modified_t': ?JsonHelper.dateToTimestamp(instance.lastModified),
  'last_modified_by': ?instance.lastModifiedBy,
  'last_image_t': ?JsonHelper.dateToTimestamp(instance.lastImage),
  'last_editor': ?instance.lastEditor,
  'entry_dates_tags': ?instance.entryDates,
  'last_check_dates_tags': ?instance.lastCheckDates,
  'last_edit_dates_tags': ?instance.lastEditDates,
  'last_image_dates_tags': ?instance.lastImageDates,
  'last_checked_t': ?JsonHelper.dateToTimestamp(instance.lastChecked),
  'last_checker': ?instance.lastChecker,
  'created_t': ?JsonHelper.dateToTimestamp(instance.created),
  'creator': ?instance.creator,
  'editors_tags': ?instance.editors,
  'ecoscore_grade': ?instance.ecoscoreGrade,
  'ecoscore_score': ?instance.ecoscoreScore,
  'ecoscore_data': ?EcoscoreData.toJsonHelper(instance.ecoscoreData),
  'knowledge_panels': ?KnowledgePanels.toJsonHelper(instance.knowledgePanels),
  'emb_codes': ?instance.embCodes,
  'manufacturing_places': ?instance.manufacturingPlaces,
  'origins': ?instance.origins,
  'nova_group': ?instance.novaGroup,
  'link': ?instance.website,
  'data_quality_tags': ?instance.dataQualityTags,
  'data_quality_bugs_tags': ?instance.dataQualityBugsTags,
  'data_quality_errors_tags': ?instance.dataQualityErrorsTags,
  'data_quality_info_tags': ?instance.dataQualityInfoTags,
  'data_quality_warnings_tags': ?instance.dataQualityWarningsTags,
  'obsolete': JsonHelper.checkboxToJSON(instance.obsolete),
  'owner_fields': ?instance.ownerFields,
  'owner': ?instance.owner,
  'expiration_date': ?instance.expirationDate,
  'no_nutrition_data': JsonHelper.checkboxToJSON(instance.noNutritionData),
  'nutriments': Nutriments.toJsonHelper(instance.nutriments),
};

const _$ProductTypeEnumMap = {
  ProductType.food: 'food',
  ProductType.beauty: 'beauty',
  ProductType.petFood: 'petfood',
  ProductType.product: 'product',
};
