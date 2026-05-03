import 'package:json_annotation/json_annotation.dart';

import '../interface/json_object.dart';
import '../utils/json_helper.dart';
import '../utils/language_helper.dart';
import '../utils/product_fields.dart';
import 'additives.dart';
import 'allergens.dart';
import 'attribute.dart';
import 'attribute_group.dart';
import 'ecoscore_data.dart';
import 'ingredient.dart';
import 'ingredients_analysis_tags.dart';
import 'knowledge_panels.dart';
import 'nutrient_levels.dart';
import 'nutriments.dart';
import 'owner_field.dart';
import 'product_image.dart';
import 'product_packaging.dart';
import 'product_type.dart';

part 'product.g.dart';

/// Possible improvements on a [Product] given its current data
enum ProductImprovement {
  /// Possible message:
  /// “The Eco-Score takes into account the origins of the ingredients.
  /// Please take them into a photo (ingredient list and/or any geographic claim
  /// or edit the product so that they can be taken into account. If it is not
  /// clear, you can contact the food producer.”
  ORIGINS_TO_BE_COMPLETED(category: ProductImprovementCategory.ECO_SCORE),

  /// We could not compute an Nutri-Score for this product. It might be that the
  /// category is an exception. If you believe this is an error,
  /// you can email contact@thenameofyourapp.org
  /// List of exceptions:
  /// https://www.santepubliquefrance.fr/content/download/150262/file/QR_scientifique_technique_150421.pdf
  /// You can get states with
  /// https://world.openfoodfacts.org/api/v0/product/3414280980209.json?fields=ecoscore_grade,states_tags
  /// Add a message if we have a category but no nutrition
  CATEGORIES_BUT_NO_NUTRISCORE(
    category: ProductImprovementCategory.NUTRI_SCORE,
  ),

  /// Possible message: “Add nutrition facts to compute the Nutri-Score”
  /// Add a one-click option to indicate no nutrition facts on the packaging
  /// This product doesn't have nutrition facts
  /// Add a message if we have nutrition but no category
  ADD_NUTRITION_FACTS(category: ProductImprovementCategory.NUTRI_SCORE),

  /// Possible message: “Add a category to compute the Nutri-Score”
  /// Help the user add the category if it is missing
  /// You can use our Robotoff API to get your users to validate a prediction
  /// Robotoff Questions
  /// Add a message if we have no category and no nutrition
  ADD_CATEGORY(category: ProductImprovementCategory.NUTRI_SCORE),

  /// Prompt: “Add nutrition facts and a category to compute the Nutri-Score”
  /// Add a one-click option to indicate no nutrition facts on the packaging
  /// This product doesn't have nutrition facts
  /// Add a message if the nutrition image is missing
  ADD_NUTRITION_FACTS_AND_CATEGORY(
    category: ProductImprovementCategory.NUTRI_SCORE,
  ),

  /// Add a message if the nutrition image is obsolete using the image refresh API
  /// https://github.com/openfoodfacts/api-documentation/issues/15
  OBSOLETE_NUTRITION_IMAGE(category: ProductImprovementCategory.NUTRI_SCORE);

  const ProductImprovement({required this.category});

  final ProductImprovementCategory category;
}

/// Category: what would this [ProductImprovement] help compute?
enum ProductImprovementCategory {
  /// Eco-Score category
  ECO_SCORE,

  /// Nutri-Score category
  NUTRI_SCORE,
}

// TODO(monsieurtanuki): define and implement a strategy for all classes regarding "includeIfNull: false"
/// This class contains most of the data about a specific product.
///
/// Please read the language mechanics explanation if you intend to display
/// or update data in specific language: https://github.com/openfoodfacts/openfoodfacts-dart/blob/master/DOCUMENTATION.md#about-languages-mechanics
@JsonSerializable(includeIfNull: false)
class Product extends JsonObject {
  /// Barcode of the product. Will very very very often be not null.
  @JsonKey(name: 'code', includeIfNull: true)
  String? barcode;

  /// Type of the product (e.g. "pet food").
  @JsonKey(name: 'product_type')
  ProductType? productType;

  /// Server schema version (e.g. "999" for API V3).
  @JsonKey(name: 'schema_version')
  int? schemaVersion;

  /// Product name, either set directly or taken from one of the localizations.
  ///
  /// Rather use [productNameInLanguages] instead.
  @JsonKey(name: 'product_name')
  String? productName;

  /// Localized product name.
  @JsonKey(
    name: 'product_name_in_languages',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
  )
  Map<OpenFoodFactsLanguage, String>? productNameInLanguages;

  /// Localized conservation conditions.
  @JsonKey(
    name: 'conservation_conditions_in_languages',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
  )
  Map<OpenFoodFactsLanguage, String>? conservationConditionsInLanguages;

  /// Localized customer service information.
  @JsonKey(
    name: 'customer_service_in_languages',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
  )
  Map<OpenFoodFactsLanguage, String>? customerServiceInLanguages;

  /// Common name. Example: "Chocolate bar with milk and hazelnuts".
  @JsonKey(name: 'generic_name')
  String? genericName;

  /// Localized common name.
  @JsonKey(
    name: 'generic_name_in_languages',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
  )
  Map<OpenFoodFactsLanguage, String>? genericNameInLanguages;

  /// Abbreviated product name.
  @JsonKey(name: 'abbreviated_product_name')
  String? abbreviatedName;

  /// Localized abbreviated product name.
  @JsonKey(
    name: 'abbreviated_product_name_in_languages',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
  )
  Map<OpenFoodFactsLanguage, String>? abbreviatedNameInLanguages;

  @JsonKey(name: 'brands')
  String? brands;
  @JsonKey(name: 'brands_tags')
  List<String>? brandsTags;
  @JsonKey(
    name: 'brands_tags_in_languages',
    toJson: LanguageHelper.toJsonStringsListMap,
    fromJson: LanguageHelper.fromJsonStringsListMap,
  )
  Map<OpenFoodFactsLanguage, List<String>>? brandsTagsInLanguages;

  @JsonKey(name: 'countries')
  String? countries;
  @JsonKey(name: 'countries_tags')
  List<String>? countriesTags;
  @JsonKey(
    name: 'countries_tags_in_languages',
    toJson: LanguageHelper.toJsonStringsListMap,
    fromJson: LanguageHelper.fromJsonStringsListMap,
  )
  Map<OpenFoodFactsLanguage, List<String>>? countriesTagsInLanguages;

  @JsonKey(
    name: 'lang',
    toJson: LanguageHelper.toJson,
    fromJson: LanguageHelper.fromJson,
  )
  OpenFoodFactsLanguage? lang;

  @JsonKey(name: 'quantity')
  String? quantity;

  // Images
  @JsonKey(name: 'image_front_url')
  String? imageFrontUrl;
  @JsonKey(name: 'image_front_small_url')
  String? imageFrontSmallUrl;

  @JsonKey(name: 'image_ingredients_url')
  String? imageIngredientsUrl;
  @JsonKey(name: 'image_ingredients_small_url')
  String? imageIngredientsSmallUrl;

  @JsonKey(name: 'image_nutrition_url')
  String? imageNutritionUrl;
  @JsonKey(name: 'image_nutrition_small_url')
  String? imageNutritionSmallUrl;

  @JsonKey(name: 'image_packaging_url')
  String? imagePackagingUrl;
  @JsonKey(name: 'image_packaging_small_url')
  String? imagePackagingSmallUrl;

  @JsonKey(name: 'serving_size')
  String? servingSize;

  @JsonKey(name: 'serving_quantity', fromJson: JsonHelper.quantityFromJson)
  double? servingQuantity;

  @JsonKey(name: 'product_quantity', fromJson: JsonHelper.quantityFromJson)
  double? packagingQuantity;

  /// cause nesting is sooo cool ;)
  @JsonKey(
    name: 'selected_images',
    fromJson: JsonHelper.selectedImagesFromJson,
    toJson: JsonHelper.selectedImagesToJson,
  )
  List<ProductImage>? selectedImages;

  @JsonKey(
    name: 'images',
    fromJson: JsonHelper.allImagesFromJson,
    toJson: JsonHelper.allImagesToJson,
  )
  /// All images in bulk. Will include "main" images and "raw" images.
  ///
  /// See also [getRawImages] and [getMainImages].
  List<ProductImage>? images;

  /// "Raw" (uploaded) images: for example "picture 12" resized to "400" size.
  List<ProductImage>? getRawImages() => _getImageSubset(false);

  /// "Main" images: the selected images for certain criteria.
  ///
  /// For example the "front" picture in "French"
  /// Images may be returned in multiple sizes
  List<ProductImage>? getMainImages() => _getImageSubset(true);

  bool? isImageLocked(
    final ImageField imageField,
    final OpenFoodFactsLanguage language,
  ) {
    if (owner == null) {
      return null;
    }
    final ProductImage? localizedImage = getLocalizedImage(
      imageField,
      language,
    );
    final String? imageId = localizedImage?.imgid;
    if (imageId == null) {
      return null;
    }
    final ProductImage? rawImage = getRawImage(imageId);
    if (rawImage == null) {
      return null;
    }
    return rawImage.contributor == owner;
  }

  ProductImage? getLocalizedImage(
    final ImageField imageField,
    final OpenFoodFactsLanguage language,
  ) {
    if (images == null) {
      return null;
    }
    for (final ProductImage productImage in images!) {
      if (productImage.field == imageField &&
          productImage.language == language) {
        if (productImage.rev == null) {
          return null;
        }
        return productImage;
      }
    }
    return null;
  }

  ProductImage? getRawImage(final String imageId) {
    if (images == null) {
      return null;
    }
    for (final ProductImage productImage in images!) {
      if (!productImage.isMain) {
        if (productImage.imgid == imageId) {
          return productImage;
        }
      }
    }
    return null;
  }

  List<ProductImage>? _getImageSubset(final bool isMain) {
    if (images == null) {
      return null;
    }
    final List<ProductImage> result = <ProductImage>[];
    for (final ProductImage productImage in images!) {
      if (productImage.isMain == isMain) {
        result.add(productImage);
      }
    }
    return result;
  }

  @JsonKey(name: 'ingredients', toJson: JsonHelper.ingredientsToJson)
  List<Ingredient>? ingredients;

  /// Ingredients, either set directly or taken from one of the localizations.
  ///
  /// Rather use [ingredientsTextInLanguages] instead.
  @JsonKey(name: 'ingredients_text')
  String? ingredientsText;

  /// Localized ingredients.
  @JsonKey(
    name: 'ingredients_text_in_languages',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
  )
  Map<OpenFoodFactsLanguage, String>? ingredientsTextInLanguages;

  @JsonKey(name: 'ingredients_tags')
  List<String>? ingredientsTags;
  @JsonKey(
    name: 'ingredients_tags_in_languages',
    toJson: LanguageHelper.toJsonStringsListMap,
    fromJson: LanguageHelper.fromJsonStringsListMap,
  )
  Map<OpenFoodFactsLanguage, List<String>>? ingredientsTagsInLanguages;

  /// Images Freshness in seconds
  ///
  /// 0 seconds means we don't have the picture at all.
  /// Read-only
  /// cf. https://github.com/openfoodfacts/openfoodfacts-dart/issues/104
  @JsonKey(includeIfNull: true)
  Map<OpenFoodFactsLanguage, Map<ImageField, int>>? imagesFreshnessInLanguages;

  @JsonKey(
    name: 'ingredients_analysis_tags',
    fromJson: IngredientsAnalysisTags.fromJson,
    toJson: IngredientsAnalysisTags.toJson,
  )
  IngredientsAnalysisTags? ingredientsAnalysisTags;
  @JsonKey(
    name: 'ingredients_analysis_tags_in_languages',
    toJson: LanguageHelper.toJsonStringsListMap,
    fromJson: LanguageHelper.fromJsonStringsListMap,
  )
  Map<OpenFoodFactsLanguage, List<String>>? ingredientsAnalysisTagsInLanguages;

  /// When no nutrition data is true, nutriments are always null.
  ///
  /// This logic is handled by the getters/setters of [noNutritionData] and
  /// [nutriments].
  /// This field is therefore not populated directly by json.
  bool? _noNutritionData;

  /// When nutriments are not null, no nutrition data can't be true.
  ///
  /// This logic is handled by the getters/setters of [noNutritionData] and
  /// [nutriments]
  /// This field is therefore not populated directly by json.
  Nutriments? _nutriments;

  @JsonKey(
    name: 'additives_tags',
    fromJson: Additives.additivesFromJson,
    toJson: Additives.additivesToJson,
  )
  Additives? additives;
  @JsonKey(
    name: 'additives_tags_in_languages',
    toJson: LanguageHelper.toJsonStringsListMap,
    fromJson: LanguageHelper.fromJsonStringsListMap,
  )
  Map<OpenFoodFactsLanguage, List<String>>? additivesTagsInLanguages;

  @JsonKey(
    name: 'allergens_tags',
    fromJson: Allergens.allergensFromJson,
    toJson: Allergens.allergensToJson,
  )
  Allergens? allergens;
  @JsonKey(
    name: 'allergens_tags_in_languages',
    toJson: LanguageHelper.toJsonStringsListMap,
    fromJson: LanguageHelper.fromJsonStringsListMap,
  )
  Map<OpenFoodFactsLanguage, List<String>>? allergensTagsInLanguages;

  @JsonKey(
    name: 'nutrient_levels',
    fromJson: NutrientLevels.fromJson,
    toJson: NutrientLevels.toJson,
  )
  NutrientLevels? nutrientLevels;

  @JsonKey(name: 'nutriment_energy_unit')
  String? nutrimentEnergyUnit;

  /// Is the "nutrition data for product as sold" in the nutriment fields?
  ///
  /// Most of the time, it will be true, e.g. if we type in nutrient data
  /// reading the product packaging.
  @JsonKey(
    name: 'nutrition_data',
    toJson: JsonHelper.checkboxToJSON,
    fromJson: JsonHelper.checkboxFromJSON,
    includeIfNull: true,
  )
  bool? nutritionData;

  /// Size of the product sample for "nutrition data for product as sold".
  ///
  /// Typical values taken from [PerSize].
  @JsonKey(name: 'nutrition_data_per')
  String? nutrimentDataPer;
  @JsonKey(name: 'nutrition_grade_fr')
  String? nutriscore;

  @JsonKey(name: 'compared_to_category')
  String? comparedToCategory;
  @JsonKey(name: 'categories')
  String? categories;
  @JsonKey(name: 'categories_tags')
  List<String>? categoriesTags;
  @JsonKey(
    name: 'categories_tags_in_languages',
    toJson: LanguageHelper.toJsonStringsListMap,
    fromJson: LanguageHelper.fromJsonStringsListMap,
  )
  Map<OpenFoodFactsLanguage, List<String>>? categoriesTagsInLanguages;

  @JsonKey(name: 'labels')
  String? labels;
  @JsonKey(name: 'labels_tags')
  List<String>? labelsTags;
  @JsonKey(
    name: 'labels_tags_in_languages',
    toJson: LanguageHelper.toJsonStringsListMap,
    fromJson: LanguageHelper.fromJsonStringsListMap,
  )
  Map<OpenFoodFactsLanguage, List<String>>? labelsTagsInLanguages;

  @JsonKey(name: 'packaging')
  String? packaging;

  @JsonKey(name: 'packagings', toJson: JsonHelper.productPackagingsToJson)
  List<ProductPackaging>? packagings;

  /// Is the "packagings" complete?
  @JsonKey(
    name: 'packagings_complete',
    toJson: JsonHelper.boolToJSON,
    fromJson: JsonHelper.boolFromJSON,
    includeIfNull: true,
  )
  bool? packagingsComplete;

  @JsonKey(name: 'packaging_tags')
  List<String>? packagingTags;
  @JsonKey(
    name: 'packaging_text_in_languages',
    fromJson: LanguageHelper.fromJsonStringMap,
    toJson: LanguageHelper.toJsonStringMap,
  )
  Map<OpenFoodFactsLanguage, String>? packagingTextInLanguages;

  @JsonKey(name: 'misc_tags')
  List<String>? miscTags;
  @JsonKey(
    name: 'misc_tags_in_languages',
    toJson: LanguageHelper.toJsonStringsListMap,
    fromJson: LanguageHelper.fromJsonStringsListMap,
  )
  Map<OpenFoodFactsLanguage, List<String>>? miscTagsInLanguages;

  @JsonKey(name: 'states_tags')
  List<String>? statesTags;
  @JsonKey(
    name: 'states_tags_in_languages',
    toJson: LanguageHelper.toJsonStringsListMap,
    fromJson: LanguageHelper.fromJsonStringsListMap,
  )
  Map<OpenFoodFactsLanguage, List<String>>? statesTagsInLanguages;

  @JsonKey(name: 'traces_tags')
  List<String>? tracesTags;
  @JsonKey(
    name: 'traces_tags_in_languages',
    toJson: LanguageHelper.toJsonStringsListMap,
    fromJson: LanguageHelper.fromJsonStringsListMap,
  )
  Map<OpenFoodFactsLanguage, List<String>>? tracesTagsInLanguages;
  @JsonKey(name: 'traces')
  String? traces;

  @JsonKey(name: 'stores_tags')
  List<String>? storesTags;
  @JsonKey(
    name: 'stores_tags_in_languages',
    toJson: LanguageHelper.toJsonStringsListMap,
    fromJson: LanguageHelper.fromJsonStringsListMap,
  )
  Map<OpenFoodFactsLanguage, List<String>>? storesTagsInLanguages;
  @JsonKey(name: 'stores')
  String? stores;

  @JsonKey(name: 'attribute_groups', toJson: JsonHelper.attributeGroupsToJson)
  List<AttributeGroup>? attributeGroups;

  /// Latest modification timestamp. Read-only.
  @JsonKey(
    name: 'last_modified_t',
    fromJson: JsonHelper.timestampToDate,
    toJson: JsonHelper.dateToTimestamp,
  )
  DateTime? lastModified;

  /// Latest modification user id. Read-only.
  @JsonKey(name: 'last_modified_by')
  String? lastModifiedBy;

  /// Last image timestamp. Read-only.
  @JsonKey(
    name: 'last_image_t',
    fromJson: JsonHelper.timestampToDate,
    toJson: JsonHelper.dateToTimestamp,
  )
  DateTime? lastImage;

  /// Last editor id. Read-only.
  @JsonKey(name: 'last_editor')
  String? lastEditor;

  /// Entry dates tags. Read-only.
  @JsonKey(name: 'entry_dates_tags')
  List<String>? entryDates;

  /// Last check dates tags. Read-only.
  @JsonKey(name: 'last_check_dates_tags')
  List<String>? lastCheckDates;

  /// Last edit dates tags. Read-only.
  @JsonKey(name: 'last_edit_dates_tags')
  List<String>? lastEditDates;

  /// Last image dates tags. Read-only.
  @JsonKey(name: 'last_image_dates_tags')
  List<String>? lastImageDates;

  /// Last check timestamp. Read-only.
  @JsonKey(
    name: 'last_checked_t',
    fromJson: JsonHelper.timestampToDate,
    toJson: JsonHelper.dateToTimestamp,
  )
  DateTime? lastChecked;

  /// Last check user id. Read-only.
  @JsonKey(name: 'last_checker')
  String? lastChecker;

  /// Creation timestamp. Read-only.
  @JsonKey(
    name: 'created_t',
    fromJson: JsonHelper.timestampToDate,
    toJson: JsonHelper.dateToTimestamp,
  )
  DateTime? created;

  /// Creation user id. Read-only.
  @JsonKey()
  String? creator;

  /// Editors. Read-only.
  @JsonKey(name: 'editors_tags')
  List<String>? editors;

  @JsonKey(name: 'ecoscore_grade')
  String? ecoscoreGrade;
  @JsonKey(name: 'ecoscore_score', fromJson: JsonObject.parseDouble)
  double? ecoscoreScore;
  @JsonKey(name: 'ecoscore_data', toJson: EcoscoreData.toJsonHelper)
  EcoscoreData? ecoscoreData;

  @JsonKey(
    name: 'knowledge_panels',
    fromJson: KnowledgePanels.fromJsonHelper,
    toJson: KnowledgePanels.toJsonHelper,
  )
  KnowledgePanels? knowledgePanels;

  @JsonKey(name: 'emb_codes')
  String? embCodes;

  @JsonKey(name: 'manufacturing_places')
  String? manufacturingPlaces;

  @JsonKey(name: 'origins')
  String? origins;

  @JsonKey(name: 'nova_group')
  int? novaGroup;

  /// Link to the product page on the official site of the producer
  @JsonKey(name: 'link')
  String? website;

  @JsonKey(name: 'data_quality_tags')
  List<String>? dataQualityTags;

  @JsonKey(name: 'data_quality_bugs_tags')
  List<String>? dataQualityBugsTags;

  @JsonKey(name: 'data_quality_errors_tags')
  List<String>? dataQualityErrorsTags;

  @JsonKey(name: 'data_quality_info_tags')
  List<String>? dataQualityInfoTags;

  @JsonKey(name: 'data_quality_warnings_tags')
  List<String>? dataQualityWarningsTags;

  /// Is the product obsolete?
  @JsonKey(
    toJson: JsonHelper.checkboxToJSON,
    fromJson: JsonHelper.checkboxFromJSON,
    includeIfNull: true,
  )
  bool? obsolete;

  /// Timestamps of owner_fields, in seconds.
  ///
  /// Typically used to say "Was that field set by the owner?".
  /// Read-only.
  /// See also [getOwnerFieldTimestamp].
  @JsonKey(name: 'owner_fields')
  Map<String, int>? ownerFields;

  @JsonKey()
  String? owner;

  /// Expiration date / best before. Just a string, no format control.
  @JsonKey(name: 'expiration_date')
  String? expirationDate;

  // TODO(monsieurtanuki): remove all the "this" constructor fields, except maybe "barcode"
  Product({
    this.barcode,
    this.productName,
    this.productNameInLanguages,
    this.genericName,
    this.brands,
    this.brandsTags,
    this.countries,
    this.countriesTags,
    this.countriesTagsInLanguages,
    this.lang,
    this.quantity,
    this.imageFrontUrl,
    this.imageFrontSmallUrl,
    this.imageIngredientsUrl,
    this.imageIngredientsSmallUrl,
    this.imageNutritionUrl,
    this.imageNutritionSmallUrl,
    this.imagePackagingUrl,
    this.imagePackagingSmallUrl,
    this.servingSize,
    this.servingQuantity,
    this.packagingQuantity,
    this.selectedImages,
    this.images,
    this.ingredients,
    this.ingredientsText,
    this.ingredientsTextInLanguages,
    this.ingredientsTags,
    this.ingredientsTagsInLanguages,
    this.ingredientsAnalysisTags,
    this.additives,
    this.allergens,
    this.nutrientLevels,
    this.nutrimentEnergyUnit,
    this.nutrimentDataPer,
    this.nutriscore,
    this.categories,
    this.categoriesTags,
    this.categoriesTagsInLanguages,
    this.labels,
    this.labelsTags,
    this.labelsTagsInLanguages,
    this.packaging,
    this.packagingTags,
    this.miscTags,
    this.statesTags,
    this.tracesTags,
    this.storesTags,
    this.stores,
    this.attributeGroups,
    this.lastModified,
    this.ecoscoreGrade,
    this.ecoscoreScore,
    this.ecoscoreData,
    Nutriments? nutriments,
    bool? noNutritionData,
  }) : _nutriments = nutriments,
       _noNutritionData = noNutritionData;

  factory Product.fromJson(Map<String, dynamic> json) {
    final Product result = _$ProductFromJson(json);

    void setLanguageString(
      final ProductField productField,
      final OpenFoodFactsLanguage language,
      final String label,
    ) {
      switch (productField) {
        case ProductField.NAME_IN_LANGUAGES:
        case ProductField.NAME_ALL_LANGUAGES:
          result.productNameInLanguages ??= {};
          result.productNameInLanguages![language] = label;
          break;
        case ProductField.GENERIC_NAME_IN_LANGUAGES:
        case ProductField.GENERIC_NAME_ALL_LANGUAGES:
          result.genericNameInLanguages ??= {};
          result.genericNameInLanguages![language] = label;
          break;
        case ProductField.ABBREVIATED_NAME_IN_LANGUAGES:
        case ProductField.ABBREVIATED_NAME_ALL_LANGUAGES:
          result.abbreviatedNameInLanguages ??= {};
          result.abbreviatedNameInLanguages![language] = label;
          break;
        case ProductField.INGREDIENTS_TEXT_IN_LANGUAGES:
        case ProductField.INGREDIENTS_TEXT_ALL_LANGUAGES:
          result.ingredientsTextInLanguages ??= {};
          result.ingredientsTextInLanguages![language] = label;
          break;
        case ProductField.PACKAGING_TEXT_IN_LANGUAGES:
        case ProductField.PACKAGING_TEXT_ALL_LANGUAGES:
          result.packagingTextInLanguages ??= {};
          result.packagingTextInLanguages![language] = label;
          break;
        case ProductField.CONSERVATION_CONDITIONS_ALL_LANGUAGES:
          result.conservationConditionsInLanguages ??= {};
          result.conservationConditionsInLanguages![language] = label;
          break;
        case ProductField.CUSTOMER_SERVICE_ALL_LANGUAGES:
          result.customerServiceInLanguages ??= {};
          result.customerServiceInLanguages![language] = label;
          break;
        default:
          // not supposed to be called with other ProductField values.
          assert(false);
      }
    }

    void setLanguageListString(
      final ProductField productField,
      final OpenFoodFactsLanguage language,
      final Map<String, dynamic> json,
      final String key,
    ) {
      final List<String>? labels = _jsonValueToList(json[key]);
      if (labels == null) {
        return;
      }
      switch (productField) {
        case ProductField.CATEGORIES_TAGS_IN_LANGUAGES:
          result.categoriesTagsInLanguages ??= {};
          result.categoriesTagsInLanguages![language] = labels;
          break;
        case ProductField.ADDITIVES_TAGS_IN_LANGUAGES:
          result.additivesTagsInLanguages ??= {};
          result.additivesTagsInLanguages![language] = labels;
          break;
        case ProductField.ALLERGENS_TAGS_IN_LANGUAGES:
          result.allergensTagsInLanguages ??= {};
          result.allergensTagsInLanguages![language] = labels;
          break;
        case ProductField.TRACES_TAGS_IN_LANGUAGES:
          result.tracesTagsInLanguages ??= {};
          result.tracesTagsInLanguages![language] = labels;
          break;
        case ProductField.BRANDS_TAGS_IN_LANGUAGES:
          result.brandsTagsInLanguages ??= {};
          result.brandsTagsInLanguages![language] = labels;
          break;
        case ProductField.STATES_TAGS_IN_LANGUAGES:
          result.statesTagsInLanguages ??= {};
          result.statesTagsInLanguages![language] = labels;
          break;
        case ProductField.STORES_TAGS_IN_LANGUAGES:
          result.storesTagsInLanguages ??= {};
          result.storesTagsInLanguages![language] = labels;
          break;
        case ProductField.MISC_TAGS_IN_LANGUAGES:
          result.miscTagsInLanguages ??= {};
          result.miscTagsInLanguages![language] = labels;
          break;
        case ProductField.INGREDIENTS_ANALYSIS_TAGS_IN_LANGUAGES:
          result.ingredientsAnalysisTagsInLanguages ??= {};
          result.ingredientsAnalysisTagsInLanguages![language] = labels;
          break;
        case ProductField.INGREDIENTS_TAGS_IN_LANGUAGES:
          result.ingredientsTagsInLanguages ??= {};
          result.ingredientsTagsInLanguages![language] = labels;
          break;
        case ProductField.LABELS_TAGS_IN_LANGUAGES:
          result.labelsTagsInLanguages ??= {};
          result.labelsTagsInLanguages![language] = labels;
          break;
        case ProductField.COUNTRIES_TAGS_IN_LANGUAGES:
          result.countriesTagsInLanguages ??= {};
          result.countriesTagsInLanguages![language] = labels;
          break;
        default:
          // not supposed to be called with other ProductField values.
          assert(false);
      }
    }

    void addInLanguagesData(
      final ProductField productField,
      final OpenFoodFactsLanguage language,
      final Map<String, dynamic> json,
      final String key,
    ) {
      switch (productField) {
        case ProductField.NAME_IN_LANGUAGES:
        case ProductField.GENERIC_NAME_IN_LANGUAGES:
        case ProductField.ABBREVIATED_NAME_IN_LANGUAGES:
        case ProductField.INGREDIENTS_TEXT_IN_LANGUAGES:
        case ProductField.PACKAGING_TEXT_IN_LANGUAGES:
          setLanguageString(productField, language, json[key]);
          return;
        case ProductField.CATEGORIES_TAGS_IN_LANGUAGES:
        case ProductField.ADDITIVES_TAGS_IN_LANGUAGES:
        case ProductField.ALLERGENS_TAGS_IN_LANGUAGES:
        case ProductField.TRACES_TAGS_IN_LANGUAGES:
        case ProductField.BRANDS_TAGS_IN_LANGUAGES:
        case ProductField.STATES_TAGS_IN_LANGUAGES:
        case ProductField.STORES_TAGS_IN_LANGUAGES:
        case ProductField.MISC_TAGS_IN_LANGUAGES:
        case ProductField.INGREDIENTS_ANALYSIS_TAGS_IN_LANGUAGES:
        case ProductField.INGREDIENTS_TAGS_IN_LANGUAGES:
        case ProductField.LABELS_TAGS_IN_LANGUAGES:
        case ProductField.COUNTRIES_TAGS_IN_LANGUAGES:
          setLanguageListString(productField, language, json, key);
          return;
        case ProductField.IMAGES_FRESHNESS_IN_LANGUAGES:
          final Map<ImageField, int> values = _jsonValueToImagesFreshness(
            json[key],
            language,
          );
          result.imagesFreshnessInLanguages ??= {};
          result.imagesFreshnessInLanguages![language] = values;
          return;
        default:
          if (productField.isInLanguages) {
            throw Exception('Unhandled in-languages case for $productField');
          }
      }
    }

    ProductField? extractProductField(
      final String key,
      final Iterable<ProductField> iterable,
    ) {
      for (final ProductField productField in iterable) {
        if (key.startsWith(productField.offTag)) {
          return productField;
        }
      }
      return null;
    }

    for (final String key in json.keys) {
      if (key.contains('debug')) {
        continue;
      }
      // If the JSON contained *_in_languages fields,
      // _$ProductFromJson(json) already decoded them
      if (key.endsWith('_in_languages')) {
        continue;
      }
      // The OFF API can give values in all available languages for some
      // of the fields ('product_name_languages'), and in a requested list of
      // languages for an additional number of fields
      // (`product_name_[2 letter language code]`).
      // We store those values in a more structured maps like
      // [productNameInLanguages].

      ProductField? productField = extractProductField(
        key,
        ProductField.getAllLanguagesList(),
      );
      if (productField != null) {
        final Map<OpenFoodFactsLanguage, String>? localized =
            _getLocalizedStrings(json[key]);
        if (localized != null) {
          for (final MapEntry<OpenFoodFactsLanguage, String> entry
              in localized.entries) {
            setLanguageString(productField, entry.key, entry.value);
          }
        }
        continue;
      }

      productField = extractProductField(
        key,
        ProductField.getInLanguagesList(),
      );
      if (productField != null) {
        final OpenFoodFactsLanguage language = _langFrom(
          key,
          productField.offTag,
        );
        if (language != OpenFoodFactsLanguage.UNDEFINED) {
          addInLanguagesData(productField, language, json, key);
        }
        continue;
      }
    }
    return result;
  }

  static Map<OpenFoodFactsLanguage, String>? _getLocalizedStrings(
    final dynamic langs,
  ) {
    Map<OpenFoodFactsLanguage, String>? result;
    if (langs is! Map<String, dynamic>) {
      return result;
    }
    for (final langValuePair in langs.entries) {
      final lang = LanguageHelper.fromJson(langValuePair.key);
      if (lang == OpenFoodFactsLanguage.UNDEFINED) {
        continue;
      }
      final value = langValuePair.value;
      result ??= <OpenFoodFactsLanguage, String>{};
      result[lang] = value.toString();
    }
    return result;
  }

  static OpenFoodFactsLanguage _langFrom(String key, String prefix) {
    return LanguageHelper.fromJson(key.substring(prefix.length));
  }

  static List<String>? _jsonValueToList(dynamic value) {
    return (value as List?)?.map((e) => e as String).toList();
  }

  static Map<ImageField, int> _jsonValueToImagesFreshness(
    Map value,
    OpenFoodFactsLanguage language,
  ) {
    final Map<ImageField, int> result = {};
    for (final ImageField imageField in ImageField.values) {
      final int? timestamp = value['${imageField.offTag}_${language.offTag}'];
      if (timestamp != null) {
        result[imageField] = timestamp;
      }
    }
    return result;
  }

  Map<String, String> toServerData() {
    final json = toJson();
    return JsonObject.toDataStatic(json);
  }

  @override
  Map<String, dynamic> toJson() {
    final json = _$ProductToJson(this);

    // Defensive keys copy to modify map while iterating
    final keys = json.keys.toList();

    for (final key in keys) {
      // NOTE: '_tags_in_languages' are not supported because tags translation
      // is done automatically on the server.
      if (key.endsWith('_in_languages')) {
        final value = json.remove(key) as Map<String, dynamic>;
        for (final entry in value.entries) {
          final langKey = entry.key;
          final lang = LanguageHelper.fromJson(langKey);
          if (lang == OpenFoodFactsLanguage.UNDEFINED) {
            throw StateError(
              'Cannot send localized field without '
              'a proper language. Received: $langKey',
            );
          }
          final keyNoLangs = key.substring(0, key.indexOf('_in_languages'));
          final realKey = '${keyNoLangs}_${lang.offTag}';
          json[realKey] = entry.value;
        }
      }
    }

    return json;
  }

  /// Returns all existing product attributes matching a list of attribute ids.
  Map<String, Attribute> getAttributes(final List<String> attributeIds) {
    final Map<String, Attribute> result = <String, Attribute>{};
    if (attributeGroups == null) {
      return result;
    }
    for (final AttributeGroup attributeGroup in attributeGroups!) {
      if (attributeGroup.attributes == null) {
        continue;
      }
      for (final Attribute attribute in attributeGroup.attributes!) {
        final String attributeId = attribute.id!;
        if (attributeIds.contains(attributeId)) {
          result[attributeId] = attribute;
        }
      }
    }
    return result;
  }

  /// Returns the product attribute matching an attribute id.
  Attribute? getAttribute(final String attributeId) {
    final Map<String, Attribute> attributes = getAttributes(<String>[
      attributeId,
    ]);
    return attributes[attributeId];
  }

  /// Returns all the potential improvements given the quality of the data
  ///
  /// For apps with contribution mode.
  /// A typical use-case is to alert the end-users that they can improve
  /// the quality of the OFF data by taking pictures (or something like that),
  /// when displaying a [Product].
  Set<ProductImprovement> getProductImprovements() {
    final Set<ProductImprovement> result = {};
    if (statesTags == null) {
      return result;
    }
    if (statesTags!.contains('en:origins-to-be-completed')) {
      result.add(ProductImprovement.ORIGINS_TO_BE_COMPLETED);
    }
    if (statesTags!.contains('en:categories-completed')) {
      if (nutriscore == null) {
        result.add(ProductImprovement.CATEGORIES_BUT_NO_NUTRISCORE);
      }
      if (statesTags!.contains('en:nutrition-facts-to-be-completed')) {
        result.add(ProductImprovement.ADD_NUTRITION_FACTS);
      }
    }
    if (statesTags!.contains('en:categories-to-be-completed')) {
      if (statesTags!.contains('en:nutrition-facts-completed')) {
        result.add(ProductImprovement.ADD_CATEGORY);
      }
      if (statesTags!.contains('en:nutrition-facts-to-be-completed')) {
        result.add(ProductImprovement.ADD_NUTRITION_FACTS_AND_CATEGORY);
      }
    }
    if (statesTags!.contains('en:nutrition-photo-to-be-selected') ||
        statesTags!.contains('en:photos-to-be-uploaded')) {
      result.add(ProductImprovement.OBSOLETE_NUTRITION_IMAGE);
    }

    // TODO (Optional) Add Nutri-Score disclaimers cf. https://github.com/openfoodfacts/openfoodfacts-dart/issues/193
    return result;
  }

  @JsonKey(
    name: 'no_nutrition_data',
    toJson: JsonHelper.checkboxToJSON,
    fromJson: JsonHelper.checkboxFromJSON,
    includeIfNull: true,
  )
  bool? get noNutritionData {
    if (_noNutritionData != null) {
      return _noNutritionData!;
    } else if (_nutriments != null) {
      return false;
    } else {
      return null;
    }
  }

  set noNutritionData(bool? noNutritionData) {
    if (_noNutritionData == true) {
      _nutriments = null;
    }
    _noNutritionData = noNutritionData;
  }

  @JsonKey(
    name: 'nutriments',
    includeIfNull: false,
    toJson: Nutriments.toJsonHelper,
  )
  Nutriments? get nutriments => _noNutritionData == true ? null : _nutriments;

  set nutriments(Nutriments? nutriments) {
    if (nutriments == null) {
      _noNutritionData = true;
    }
    _nutriments = nutriments;
  }

  /// Returns the best version of a product name.
  ///
  /// cf. openfoodfacts-server/lib/ProductOpener/Products.pm
  String getBestProductName(final OpenFoodFactsLanguage language) {
    String? tmp;
    if ((tmp = productNameInLanguages?[language])?.isNotEmpty == true) {
      return tmp!;
    }
    if ((tmp = productName)?.isNotEmpty == true) {
      return tmp!;
    }
    if ((tmp = genericNameInLanguages?[language])?.isNotEmpty == true) {
      return tmp!;
    }
    if ((tmp = genericName)?.isNotEmpty == true) {
      return tmp!;
    }
    if ((tmp = abbreviatedNameInLanguages?[language])?.isNotEmpty == true) {
      return tmp!;
    }
    if ((tmp = abbreviatedName)?.isNotEmpty == true) {
      return tmp!;
    }
    return '';
  }

  /// Returns the first of all brands.
  String? getFirstBrand() {
    if (brands == null) {
      return null;
    }
    final List<String> items = brands!.split(',');
    if (items.isEmpty) {
      return null;
    }
    return items.first;
  }

  /// Returns a combo of the best product name and the first brand.
  ///
  /// cf. openfoodfacts-server/lib/ProductOpener/Products.pm
  String getProductNameBrand(
    final OpenFoodFactsLanguage language,
    final String separator,
  ) {
    final String bestProductName = getBestProductName(language);
    final String? firstBrand = getFirstBrand();
    if (firstBrand == null) {
      return bestProductName;
    }
    return '$bestProductName$separator$firstBrand';
  }

  /// Returns a combo of best product name, first brand and quantity.
  ///
  /// cf. openfoodfacts-server/lib/ProductOpener/Products.pm
  String getProductNameBrandQuantity(
    final OpenFoodFactsLanguage language,
    final String separator,
  ) {
    final String productNameBrand = getProductNameBrand(language, separator);
    if (quantity?.isNotEmpty != true) {
      return productNameBrand;
    }
    if (productNameBrand.contains(quantity!)) {
      return productNameBrand;
    }
    // quantity: put non breaking spaces between numbers and units
    return '$productNameBrand$separator${quantity!.replaceAll(' ', '\u{00A0}')}';
  }

  /// Returns the timestamp (in seconds) of the owner field.
  ///
  /// Typically used to check if the field value was set by the product owner
  /// (if the timestamp is not null), which means that the user cannot set a
  /// value.
  int? getOwnerFieldTimestamp(final OwnerField ownerField) =>
      ownerFields?[ownerField.offTag];
}
