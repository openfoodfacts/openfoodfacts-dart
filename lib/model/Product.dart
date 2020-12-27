import 'package:openfoodfacts/interface/JsonObject.dart';
import 'package:openfoodfacts/model/ProductImage.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/model/Additives.dart';
import 'package:openfoodfacts/model/Allergens.dart';
import 'package:openfoodfacts/model/EnvironmentImpactLevels.dart';
import 'package:openfoodfacts/model/Ingredient.dart';
import 'package:openfoodfacts/model/IngredientsAnalysisTags.dart';
import 'package:openfoodfacts/model/NutrientLevels.dart';
import 'package:openfoodfacts/model/Nutriments.dart';
import 'package:openfoodfacts/model/AttributeGroup.dart';
import 'package:openfoodfacts/utils/JsonHelper.dart';

class Product extends JsonObject {
  Product({
    this.barcode,
    this.productName,
    this.productNameDE,
    this.productNameEN,
    this.productNameFR,
    this.brands,
    this.lang,
    this.quantity,
    this.imgSmallUrl,
    this.ingredientsText,
    this.ingredientsTextDE,
    this.ingredientsTextEN,
    this.ingredientsTextFR,
    this.categories,
    this.nutrimentEnergyUnit,
    this.nutrimentDataPer,
    this.nutriscore,
    this.nutriments,
    this.additives,
    this.nutrientLevels,
    this.servingSize,
    this.servingQuantity,
    this.brandsTags,
    this.packagingQuantity,
    this.selectedImages,
    this.images,
    this.ingredients,
    this.environmentImpactLevels,
    this.allergens,
    this.ingredientsAnalysisTags,
    this.categoriesTags,
    this.categoriesTagsTranslated,
    this.labelsTags,
    this.labelsTagsTranslated,
    this.miscTags,
    this.statesTags,
    this.tracesTags,
    this.storesTags,
    this.attributeGroups,
    this.lastModified,
    this.ecoscoreGrade,
  });

  factory Product.fromJson(dynamic json) => Product(
        barcode: json[_JSON_TAG_CODE] as String,
        productName: json[_JSON_TAG_PRODUCT_NAME] as String,
        productNameDE: json[_JSON_TAG_PRODUCT_NAME_DE] as String,
        productNameEN: json[_JSON_TAG_PRODUCT_NAME_EN] as String,
        productNameFR: json[_JSON_TAG_PRODUCT_NAME_FR] as String,
        brands: json[_JSON_TAG_BRANDS] as String,
        lang: LanguageHelper.fromJson(json[_JSON_TAG_LANG] as String),
        quantity: json[_JSON_TAG_QUANTITY] as String,
        imgSmallUrl: json[_JSON_TAG_IMAGE_SMALL_URL] as String,
        ingredientsText: json[_JSON_TAG_INGREDIENTS_TEXT] as String,
        ingredientsTextDE: json[_JSON_TAG_INGREDIENTS_TEXT_DE] as String,
        ingredientsTextEN: json[_JSON_TAG_INGREDIENTS_TEXT_EN] as String,
        ingredientsTextFR: json[_JSON_TAG_INGREDIENTS_TEXT_FR] as String,
        categories: json[_JSON_TAG_CATEGORIES] as String,
        nutrimentEnergyUnit: json[_JSON_TAG_NUTRIENT_ENERGY_UNIT] as String,
        nutrimentDataPer: json[_JSON_TAG_NUTRITION_DATA_PER] as String,
        nutriscore: json[_JSON_TAG_NUTRITION_GRADE_FR] as String,
        nutriments: json[_JSON_TAG_NUTRIENTS] == null
            ? null
            : Nutriments.fromJson(
                json[_JSON_TAG_NUTRIENTS] as Map<String, dynamic>),
        additives: Additives.additivesFromJson(
            json[_JSON_TAG_ADDITIVES_TAGS] as List<dynamic>),
        nutrientLevels: NutrientLevels.fromJson(
            json[_JSON_TAG_NUTRIENTS_LEVELS] as Map<String, dynamic>),
        servingSize: json[_JSON_TAG_SERVING_SIZE] as String,
        servingQuantity: JsonHelper.servingQuantityFromJson(
            json[_JSON_TAG_SERVING_QUANTITY]),
        brandsTags: JsonHelper.getStringListHelper(json[_JSON_TAG_BRANDS_TAGS]),
        packagingQuantity: json[_JSON_TAG_PRODUCT_QUANTITY],
        selectedImages: JsonHelper.selectedImagesFromJson(
            json[_JSON_TAG_SELECTED_IMAGES] as Map<String, dynamic>),
        images: JsonHelper.imagesFromJson(
            json[_JSON_TAG_IMAGES] as Map<String, dynamic>),
        ingredients: (json[_JSON_TAG_INGREDIENTS] as List<dynamic>)
            ?.map((dynamic e) => e == null
                ? null
                : Ingredient.fromJson(e as Map<String, dynamic>))
            ?.toList(),
        environmentImpactLevels: EnvironmentImpactLevels.fromJson(
            json[_JSON_TAG_ENVIRONMENT_IMPACT_LEVELS] as List<dynamic>),
        allergens: Allergens.allergensFromJson(
            json[_JSON_TAG_ALLERGENS_TAGS] as List<dynamic>),
        ingredientsAnalysisTags: IngredientsAnalysisTags.fromJson(
            json[_JSON_TAG_INGREDIENTS_ANALYSIS_TAGS] as List<dynamic>),
        categoriesTags:
            JsonHelper.getStringListHelper(json[_JSON_TAG_CATEGORIES_TAGS]),
        categoriesTagsTranslated: JsonHelper.getStringListHelper(
            json[_JSON_TAG_CATEGORIES_TAGS_TRANSLATED]),
        labelsTags: JsonHelper.getStringListHelper(json[_JSON_TAG_LABELS_TAGS]),
        labelsTagsTranslated: JsonHelper.getStringListHelper(
            json[_JSON_TAG_LABELS_TAGS_TRANSLATED]),
        miscTags: JsonHelper.getStringListHelper(json[_JSON_TAG_MISC]),
        statesTags: JsonHelper.getStringListHelper(json[_JSON_TAG_STATES_TAGS]),
        tracesTags: JsonHelper.getStringListHelper(json[_JSON_TAG_TRACES_TAGS]),
        storesTags: JsonHelper.getStringListHelper(json[_JSON_TAG_STORES_TAGS]),
        attributeGroups: _attributeGroupsFromJson(json),
        lastModified: JsonHelper.timestampToDate(json[_JSON_TAG_LAST_MODIFIED]),
        ecoscoreGrade: json[_JSON_TAG_ECOSCORE_GRADE] as String,
      );

  static const String _JSON_TAG_CODE = 'code';
  static const String _JSON_TAG_PRODUCT_NAME = 'product_name';
  static const String _JSON_TAG_PRODUCT_NAME_DE = 'product_name_de';
  static const String _JSON_TAG_PRODUCT_NAME_EN = 'product_name_en';
  static const String _JSON_TAG_PRODUCT_NAME_FR = 'product_name_fr';
  static const String _JSON_TAG_BRANDS = 'brands';
  static const String _JSON_TAG_LANG = 'lang';
  static const String _JSON_TAG_QUANTITY = 'quantity';
  static const String _JSON_TAG_IMAGE_SMALL_URL = 'image_small_url';
  static const String _JSON_TAG_INGREDIENTS_TEXT = 'ingredients_text';
  static const String _JSON_TAG_INGREDIENTS_TEXT_DE = 'ingredients_text_de';
  static const String _JSON_TAG_INGREDIENTS_TEXT_EN = 'ingredients_text_en';
  static const String _JSON_TAG_INGREDIENTS_TEXT_FR = 'ingredients_text_fr';
  static const String _JSON_TAG_CATEGORIES = 'categories';
  static const String _JSON_TAG_NUTRIENT_ENERGY_UNIT = 'nutriment_energy_unit';
  static const String _JSON_TAG_NUTRITION_DATA_PER = 'nutrition_data_per';
  static const String _JSON_TAG_NUTRITION_GRADE_FR = 'nutrition_grade_fr';
  static const String _JSON_TAG_NUTRIENTS = 'nutriments';
  static const String _JSON_TAG_ADDITIVES_TAGS = 'additives_tags';
  static const String _JSON_TAG_NUTRIENTS_LEVELS = 'nutrient_levels';
  static const String _JSON_TAG_SERVING_SIZE = 'serving_size';
  static const String _JSON_TAG_SERVING_QUANTITY = 'serving_quantity';
  static const String _JSON_TAG_BRANDS_TAGS = 'brands_tags';
  static const String _JSON_TAG_PRODUCT_QUANTITY = 'product_quantity';
  static const String _JSON_TAG_SELECTED_IMAGES = 'selected_images';
  static const String _JSON_TAG_IMAGES = 'images';
  static const String _JSON_TAG_INGREDIENTS = 'ingredients';
  static const String _JSON_TAG_ENVIRONMENT_IMPACT_LEVELS =
      'environment_impact_level_tags';
  static const String _JSON_TAG_ALLERGENS_TAGS = 'allergens_tags';
  static const String _JSON_TAG_INGREDIENTS_ANALYSIS_TAGS =
      'ingredients_analysis_tags';
  static const String _JSON_TAG_CATEGORIES_TAGS = 'categories_tags';
  static const String _JSON_TAG_CATEGORIES_TAGS_TRANSLATED =
      'categories_tags_translated';
  static const String _JSON_TAG_LABELS_TAGS = 'labels_tags';
  static const String _JSON_TAG_LABELS_TAGS_TRANSLATED =
      'labels_tags_translated';
  static const String _JSON_TAG_MISC = 'misc';
  static const String _JSON_TAG_STATES_TAGS = 'states_tags';
  static const String _JSON_TAG_TRACES_TAGS = 'traces_tags';
  static const String _JSON_TAG_STORES_TAGS = 'stores_tags';
  static const String _JSON_TAG_ATTRIBUTE_GROUPS = 'attribute_groups';
  static const String _JSON_TAG_LAST_MODIFIED = 'last_modified_t';
  static const String _JSON_TAG_ECOSCORE_GRADE = 'ecoscore_grade';

  final String barcode;
  final String productName;
  final String productNameDE;
  final String productNameEN;
  final String productNameFR;
  final String brands;
  final OpenFoodFactsLanguage lang;
  final String quantity;
  final String imgSmallUrl;
  final String ingredientsText;
  final String ingredientsTextDE;
  final String ingredientsTextEN;
  final String ingredientsTextFR;
  final String categories;
  final String nutrimentEnergyUnit;
  final String nutrimentDataPer;
  final String nutriscore;
  final Nutriments nutriments;
  final Additives additives;
  final NutrientLevels nutrientLevels;
  final String servingSize;
  final double servingQuantity;
  final List<String> brandsTags;
  final dynamic packagingQuantity;
  final List<ProductImage> selectedImages;
  final List<ProductImage> images;
  final List<Ingredient> ingredients;
  final EnvironmentImpactLevels environmentImpactLevels;
  final Allergens allergens;
  final IngredientsAnalysisTags ingredientsAnalysisTags;
  final List<String> categoriesTags;
  List<String> categoriesTagsTranslated;
  final List<String> labelsTags;
  List<String> labelsTagsTranslated;
  final List<String> miscTags;
  final List<String> statesTags;
  final List<String> tracesTags;
  final List<String> storesTags;
  final Map<String, AttributeGroup> attributeGroups;
  final DateTime lastModified;
  final String ecoscoreGrade;

  Map<String, dynamic> toJson() => JsonObject.removeNullEntries({
        _JSON_TAG_CODE: barcode,
        _JSON_TAG_PRODUCT_NAME: productName,
        _JSON_TAG_PRODUCT_NAME_DE: productNameDE,
        _JSON_TAG_PRODUCT_NAME_EN: productNameEN,
        _JSON_TAG_PRODUCT_NAME_FR: productNameFR,
        _JSON_TAG_BRANDS: brands,
        _JSON_TAG_LANG: lang.code,
        _JSON_TAG_QUANTITY: quantity,
        _JSON_TAG_IMAGE_SMALL_URL: imgSmallUrl,
        _JSON_TAG_INGREDIENTS_TEXT: ingredientsText,
        _JSON_TAG_INGREDIENTS_TEXT_DE: ingredientsTextDE,
        _JSON_TAG_INGREDIENTS_TEXT_EN: ingredientsTextEN,
        _JSON_TAG_INGREDIENTS_TEXT_FR: ingredientsTextFR,
        _JSON_TAG_CATEGORIES: categories,
        _JSON_TAG_NUTRIENT_ENERGY_UNIT: nutrimentEnergyUnit,
        _JSON_TAG_NUTRITION_DATA_PER: nutrimentDataPer,
        _JSON_TAG_NUTRITION_GRADE_FR: nutriscore,
        _JSON_TAG_NUTRIENTS: Nutriments.toJsonHelper(nutriments),
        _JSON_TAG_ADDITIVES_TAGS: Additives.additivesToJson(additives),
        _JSON_TAG_NUTRIENTS_LEVELS: NutrientLevels.toJson(nutrientLevels),
        _JSON_TAG_SERVING_SIZE: servingSize,
        _JSON_TAG_SERVING_QUANTITY: servingQuantity,
        _JSON_TAG_BRANDS_TAGS: brandsTags,
        _JSON_TAG_PRODUCT_QUANTITY: packagingQuantity,
        _JSON_TAG_SELECTED_IMAGES:
            JsonHelper.selectedImagesToJson(selectedImages),
        _JSON_TAG_IMAGES: JsonHelper.imagesToJson(images),
        _JSON_TAG_INGREDIENTS: JsonHelper.ingredientsToJson(ingredients),
        _JSON_TAG_ENVIRONMENT_IMPACT_LEVELS:
            EnvironmentImpactLevels.toJson(environmentImpactLevels),
        _JSON_TAG_ALLERGENS_TAGS: Allergens.allergensToJson(allergens),
        _JSON_TAG_INGREDIENTS_ANALYSIS_TAGS:
            IngredientsAnalysisTags.toJson(ingredientsAnalysisTags),
        _JSON_TAG_CATEGORIES_TAGS: categoriesTags,
        _JSON_TAG_CATEGORIES_TAGS_TRANSLATED: categoriesTagsTranslated,
        _JSON_TAG_LABELS_TAGS: labelsTags,
        _JSON_TAG_LABELS_TAGS_TRANSLATED: labelsTagsTranslated,
        _JSON_TAG_MISC: miscTags,
        _JSON_TAG_STATES_TAGS: statesTags,
        _JSON_TAG_TRACES_TAGS: tracesTags,
        _JSON_TAG_STORES_TAGS: storesTags,
        _JSON_TAG_ATTRIBUTE_GROUPS: _attributeGroupsToJson(),
        _JSON_TAG_LAST_MODIFIED: JsonHelper.dateToTimestamp(lastModified),
        _JSON_TAG_ECOSCORE_GRADE: ecoscoreGrade,
      });

  @override
  String toString() => 'Product(${toJson()})';

  static Map<String, AttributeGroup> _attributeGroupsFromJson(
      final dynamic json) {
    final List<AttributeGroup> attributeGroups =
        (json[_JSON_TAG_ATTRIBUTE_GROUPS] as List<dynamic>)
            ?.map((dynamic item) => AttributeGroup.fromJson(item))
            ?.toList();
    final Map<String, AttributeGroup> attributeGroupsMap = {};
    attributeGroups?.forEach((final AttributeGroup element) {
      attributeGroupsMap[element.id] = element;
    });
    return attributeGroupsMap;
  }

  List<Map<String, dynamic>> _attributeGroupsToJson() {
    if (attributeGroups == null || attributeGroups.isEmpty) {
      return null;
    }
    final List<Map<String, dynamic>> result = <Map<String, dynamic>>[];
    for (final AttributeGroup item in attributeGroups.values) {
      result.add(item.toJson());
    }
    return result;
  }
}
