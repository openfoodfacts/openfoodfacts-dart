import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/model/AttributeGroup.dart';
import 'package:openfoodfacts/model/ProductImage.dart';
import 'package:openfoodfacts/utils/JsonHelper.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import '../interface/JsonObject.dart';
import 'Additives.dart';
import 'Allergens.dart';
import 'EcoscoreData.dart';
import 'EnvironmentImpactLevels.dart';
import 'Ingredient.dart';
import 'IngredientsAnalysisTags.dart';
import 'NutrientLevels.dart';
import 'Nutriments.dart';

part 'Product.g.dart';

@JsonSerializable()
class Product extends JsonObject {
  @JsonKey(name: 'code')
  String? barcode;
  @JsonKey(name: 'product_name', includeIfNull: false)
  String? productName;
  @JsonKey(name: 'product_name_de', includeIfNull: false)
  String? productNameDE;
  @JsonKey(name: 'product_name_en', includeIfNull: false)
  String? productNameEN;
  @JsonKey(name: 'product_name_fr', includeIfNull: false)
  String? productNameFR;
  String? brands;
  @JsonKey(name: 'brands_tags', includeIfNull: false)
  List<String>? brandsTags;
  @JsonKey(name: 'countries', includeIfNull: false)
  String? countries;
  @JsonKey(name: 'countries_tags', includeIfNull: false)
  List<String>? countriesTags;
  @JsonKey(
      name: 'lang',
      toJson: LanguageHelper.toJson,
      fromJson: LanguageHelper.fromJson,
      includeIfNull: false)
  OpenFoodFactsLanguage? lang;
  @JsonKey(includeIfNull: false)
  String? quantity;

  // Images

  // imgSmallUrl is deprecated, use imageFrontSmallUrl instead
  @JsonKey(name: 'image_small_url', includeIfNull: false)
  @deprecated
  String? imgSmallUrl;

  @JsonKey(name: 'image_front_url', includeIfNull: false)
  String? imageFrontUrl;
  @JsonKey(name: 'image_front_small_url', includeIfNull: false)
  String? imageFrontSmallUrl;

  @JsonKey(name: 'image_ingredients_url', includeIfNull: false)
  String? imageIngredientsUrl;
  @JsonKey(name: 'image_ingredients_small_url', includeIfNull: false)
  String? imageIngredientsSmallUrl;

  @JsonKey(name: 'image_nutrition_url', includeIfNull: false)
  String? imageNutritionUrl;
  @JsonKey(name: 'image_nutrition_small_url', includeIfNull: false)
  String? imageNutritionSmallUrl;

  @JsonKey(name: 'image_packaging_url', includeIfNull: false)
  String? imagePackagingUrl;
  @JsonKey(name: 'image_packaging_small_url', includeIfNull: false)
  String? imagePackagingSmallUrl;

  @JsonKey(name: 'serving_size', includeIfNull: false)
  String? servingSize;
  @JsonKey(
      name: 'serving_quantity',
      fromJson: JsonHelper.servingQuantityFromJson,
      includeIfNull: false)
  double? servingQuantity;
  @JsonKey(name: 'product_quantity', includeIfNull: false)
  dynamic packagingQuantity;

  /// cause nesting is sooo cool ;)
  @JsonKey(
      name: 'selected_images',
      includeIfNull: false,
      fromJson: JsonHelper.selectedImagesFromJson,
      toJson: JsonHelper.selectedImagesToJson)
  List<ProductImage>? selectedImages;

  @JsonKey(
      name: 'images',
      includeIfNull: false,
      fromJson: JsonHelper.imagesFromJson,
      toJson: JsonHelper.imagesToJson)
  List<ProductImage>? images;

  @JsonKey(includeIfNull: false, toJson: JsonHelper.ingredientsToJson)
  List<Ingredient>? ingredients;

  @JsonKey(includeIfNull: false, toJson: Nutriments.toJsonHelper)
  Nutriments? nutriments;

  @JsonKey(
      name: 'additives_tags',
      includeIfNull: false,
      fromJson: Additives.additivesFromJson,
      toJson: Additives.additivesToJson)
  Additives? additives;

  @JsonKey(
      name: 'environment_impact_level_tags',
      includeIfNull: false,
      fromJson: EnvironmentImpactLevels.fromJson,
      toJson: EnvironmentImpactLevels.toJson)
  EnvironmentImpactLevels? environmentImpactLevels;

  @JsonKey(
      name: 'allergens_tags',
      includeIfNull: false,
      fromJson: Allergens.allergensFromJson,
      toJson: Allergens.allergensToJson)
  Allergens? allergens;

  @JsonKey(
      name: 'nutrient_levels',
      includeIfNull: false,
      fromJson: NutrientLevels.fromJson,
      toJson: NutrientLevels.toJson)
  NutrientLevels? nutrientLevels;

  @JsonKey(name: 'ingredients_text', includeIfNull: false)
  String? ingredientsText;
  @JsonKey(name: 'ingredients_text_de', includeIfNull: false)
  String? ingredientsTextDE;
  @JsonKey(name: 'ingredients_text_en', includeIfNull: false)
  String? ingredientsTextEN;
  @JsonKey(name: 'ingredients_text_fr', includeIfNull: false)
  String? ingredientsTextFR;

  @JsonKey(
      name: 'ingredients_analysis_tags',
      includeIfNull: false,
      fromJson: IngredientsAnalysisTags.fromJson,
      toJson: IngredientsAnalysisTags.toJson)
  IngredientsAnalysisTags? ingredientsAnalysisTags;

  @JsonKey(name: 'nutriment_energy_unit', includeIfNull: false)
  String? nutrimentEnergyUnit;
  @JsonKey(name: 'nutrition_data_per', includeIfNull: false)
  String? nutrimentDataPer;
  @JsonKey(name: 'nutrition_grade_fr', includeIfNull: false)
  String? nutriscore;

  @JsonKey(includeIfNull: false)
  String? categories;

  @JsonKey(name: 'categories_tags', includeIfNull: false)
  List<String>? categoriesTags;
  @JsonKey(name: 'categories_tags_translated', includeIfNull: false)
  List<String>? categoriesTagsTranslated;
  @JsonKey(name: 'labels_tags', includeIfNull: false)
  List<String>? labelsTags;
  @JsonKey(name: 'labels_tags_translated', includeIfNull: false)
  List<String>? labelsTagsTranslated;
  @JsonKey(name: 'misc', includeIfNull: false)
  List<String>? miscTags;
  @JsonKey(name: 'states_tags', includeIfNull: false)
  List<String>? statesTags;
  @JsonKey(name: 'traces_tags', includeIfNull: false)
  List<String>? tracesTags;
  @JsonKey(name: 'stores_tags', includeIfNull: false)
  List<String>? storesTags;

  @JsonKey(
      name: 'attribute_groups',
      includeIfNull: false,
      toJson: JsonHelper.attributeGroupsToJson)
  List<AttributeGroup>? attributeGroups;

  @JsonKey(
      name: 'last_modified_t',
      includeIfNull: false,
      fromJson: JsonHelper.timestampToDate,
      toJson: JsonHelper.dateToTimestamp)
  DateTime? lastModified;

  @JsonKey(name: 'ecoscore_grade', includeIfNull: false)
  String? ecoscoreGrade;
  @JsonKey(
      name: 'ecoscore_score',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? ecoscoreScore;
  @JsonKey(
      name: 'ecoscore_data',
      includeIfNull: false,
      toJson: EcoscoreData.toJsonHelper)
  EcoscoreData? ecoscoreData;

  Product(
      {this.barcode,
      this.productName,
      this.productNameDE,
      this.productNameEN,
      this.productNameFR,
      this.brands,
      this.countries,
      this.countriesTags,
      this.lang,
      this.quantity,
      this.imgSmallUrl,
      this.imageFrontUrl,
      this.imageFrontSmallUrl,
      this.imageIngredientsUrl,
      this.imageIngredientsSmallUrl,
      this.imageNutritionUrl,
      this.imageNutritionSmallUrl,
      this.imagePackagingUrl,
      this.imagePackagingSmallUrl,
      this.ingredientsText,
      this.ingredientsTextDE,
      this.ingredientsTextEN,
      this.categories,
      this.nutrimentEnergyUnit,
      this.nutrimentDataPer,
      this.nutriscore,
      this.nutriments,
      this.additives,
      this.nutrientLevels,
      this.servingSize,
      this.servingQuantity,
      this.ecoscoreGrade,
      this.ecoscoreScore});

  factory Product.fromJson(Map<String, dynamic> json) {
    final Product result = _$ProductFromJson(json);
    for (final String key in json.keys) {
      if (key.startsWith('categories_tags_')) {
        result.categoriesTagsTranslated =
            (json[key] as List?)?.map((e) => e as String).toList();
      }
      if (key.startsWith('labels_tags_')) {
        result.labelsTagsTranslated =
            (json[key] as List?)?.map((e) => e as String).toList();
      }
    }
    return result;
  }

  @override
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
