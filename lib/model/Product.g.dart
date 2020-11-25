// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    barcode: json['code'] as String,
    productName: json['product_name'] as String,
    productNameDE: json['product_name_de'] as String,
    productNameEN: json['product_name_en'] as String,
    brands: json['brands'] as String,
    lang: LanguageHelper.fromJson(json['lang'] as String),
    quantity: json['quantity'] as String,
    imgSmallUrl: json['image_small_url'] as String,
    ingredientsText: json['ingredients_text'] as String,
    ingredientsTextDE: json['ingredients_text_de'] as String,
    ingredientsTextEN: json['ingredients_text_en'] as String,
    categories: json['categories'] as String,
    nutrimentEnergyUnit: json['nutriment_energy_unit'] as String,
    nutrimentDataPer: json['nutrition_data_per'] as String,
    nutriscore: json['nutrition_grade_fr'] as String,
    nutriments: json['nutriments'] == null
        ? null
        : Nutriments.fromJson(json['nutriments'] as Map<String, dynamic>),
    additives: Additives.additivesFromJson(json['additives_tags'] as List),
    nutrientLevels: NutrientLevels.fromJson(
        json['nutrient_levels'] as Map<String, dynamic>),
    servingSize: json['serving_size'] as String,
    servingQuantity:
        JsonHelper.servingQuantityFromJson(json['serving_quantity']),
    ecoscoreGrade: json['ecoscore_grade'] as String,
  )
    ..productNameFR = json['product_name_fr'] as String
    ..brandsTags =
        (json['brands_tags'] as List)?.map((e) => e as String)?.toList()
    ..packagingQuantity = json['product_quantity']
    ..selectedImages = JsonHelper.selectedImagesFromJson(
        json['selected_images'] as Map<String, dynamic>)
    ..images = JsonHelper.imagesFromJson(json['images'] as Map<String, dynamic>)
    ..ingredients = (json['ingredients'] as List)
        ?.map((e) =>
            e == null ? null : Ingredient.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..environmentImpactLevels = EnvironmentImpactLevels.fromJson(
        json['environment_impact_level_tags'] as List)
    ..allergens = Allergens.allergensFromJson(json['allergens_tags'] as List)
    ..ingredientsTextFR = json['ingredients_text_fr'] as String
    ..ingredientsAnalysisTags = IngredientsAnalysisTags.fromJson(
        json['ingredients_analysis_tags'] as List)
    ..categoriesTags =
        (json['categories_tags'] as List)?.map((e) => e as String)?.toList()
    ..categoriesTagsTranslated = (json['categories_tags_translated'] as List)
        ?.map((e) => e as String)
        ?.toList()
    ..labelsTags =
        (json['labels_tags'] as List)?.map((e) => e as String)?.toList()
    ..labelsTagsTranslated = (json['labels_tags_translated'] as List)
        ?.map((e) => e as String)
        ?.toList()
    ..miscTags = (json['misc'] as List)?.map((e) => e as String)?.toList()
    ..statesTags =
        (json['states_tags'] as List)?.map((e) => e as String)?.toList()
    ..tracesTags =
        (json['traces_tags'] as List)?.map((e) => e as String)?.toList()
    ..storesTags =
        (json['stores_tags'] as List)?.map((e) => e as String)?.toList()
    ..attributeGroups =
        AttributeGroups.fromJson(json['attribute_groups'] as List)
    ..lastModified = JsonHelper.timestampToDate(json['last_modified_t']);
}

Map<String, dynamic> _$ProductToJson(Product instance) {
  final val = <String, dynamic>{
    'code': instance.barcode,
    'product_name': instance.productName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('product_name_de', instance.productNameDE);
  writeNotNull('product_name_en', instance.productNameEN);
  writeNotNull('product_name_fr', instance.productNameFR);
  val['brands'] = instance.brands;
  writeNotNull('brands_tags', instance.brandsTags);
  writeNotNull('lang', LanguageHelper.toJson(instance.lang));
  writeNotNull('quantity', instance.quantity);
  writeNotNull('image_small_url', instance.imgSmallUrl);
  writeNotNull('serving_size', instance.servingSize);
  writeNotNull('serving_quantity', instance.servingQuantity);
  writeNotNull('product_quantity', instance.packagingQuantity);
  writeNotNull('selected_images',
      JsonHelper.selectedImagesToJson(instance.selectedImages));
  writeNotNull('images', JsonHelper.imagesToJson(instance.images));
  writeNotNull(
      'ingredients', JsonHelper.ingredientsToJson(instance.ingredients));
  writeNotNull('nutriments', Nutriments.toJsonHelper(instance.nutriments));
  writeNotNull('additives_tags', Additives.additivesToJson(instance.additives));
  writeNotNull('environment_impact_level_tags',
      EnvironmentImpactLevels.toJson(instance.environmentImpactLevels));
  writeNotNull('allergens_tags', Allergens.allergensToJson(instance.allergens));
  writeNotNull(
      'nutrient_levels', NutrientLevels.toJson(instance.nutrientLevels));
  writeNotNull('ingredients_text', instance.ingredientsText);
  writeNotNull('ingredients_text_de', instance.ingredientsTextDE);
  writeNotNull('ingredients_text_en', instance.ingredientsTextEN);
  writeNotNull('ingredients_text_fr', instance.ingredientsTextFR);
  writeNotNull('ingredients_analysis_tags',
      IngredientsAnalysisTags.toJson(instance.ingredientsAnalysisTags));
  writeNotNull('nutriment_energy_unit', instance.nutrimentEnergyUnit);
  writeNotNull('nutrition_data_per', instance.nutrimentDataPer);
  writeNotNull('nutrition_grade_fr', instance.nutriscore);
  writeNotNull('categories', instance.categories);
  writeNotNull('categories_tags', instance.categoriesTags);
  writeNotNull('categories_tags_translated', instance.categoriesTagsTranslated);
  writeNotNull('labels_tags', instance.labelsTags);
  writeNotNull('labels_tags_translated', instance.labelsTagsTranslated);
  writeNotNull('misc', instance.miscTags);
  writeNotNull('states_tags', instance.statesTags);
  writeNotNull('traces_tags', instance.tracesTags);
  writeNotNull('stores_tags', instance.storesTags);
  writeNotNull(
      'attribute_groups', AttributeGroups.toJson(instance.attributeGroups));
  writeNotNull(
      'last_modified_t', JsonHelper.dateToTimestamp(instance.lastModified));
  writeNotNull('ecoscore_grade', instance.ecoscoreGrade);
  return val;
}
