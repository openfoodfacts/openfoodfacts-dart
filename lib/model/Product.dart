import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/model/AttributeGroup.dart';
import 'package:openfoodfacts/model/Attribute.dart';
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
  @JsonKey(name: 'product_name_translated', includeIfNull: false)
  String? productNameTranslated;

  /// Deprecated: please use productNameTranslated
  @JsonKey(name: 'product_name_de', includeIfNull: false)
  @deprecated
  String? productNameDE;

  /// Deprecated: please use productNameTranslated
  @JsonKey(name: 'product_name_en', includeIfNull: false)
  @deprecated
  String? productNameEN;

  /// Deprecated: please use productNameTranslated
  @JsonKey(name: 'product_name_fr', includeIfNull: false)
  @deprecated
  String? productNameFR;

  @JsonKey(name: 'brands', includeIfNull: false)
  String? brands;
  @JsonKey(name: 'brands_tags', includeIfNull: false)
  List<String>? brandsTags;

  @JsonKey(name: 'countries', includeIfNull: false)
  String? countries;
  @JsonKey(name: 'countries_tags', includeIfNull: false)
  List<String>? countriesTags;
  @JsonKey(name: 'countries_tags_translated', includeIfNull: false)
  List<String>? countriesTagsTranslated;

  @JsonKey(
      name: 'lang',
      toJson: LanguageHelper.toJson,
      fromJson: LanguageHelper.fromJson,
      includeIfNull: false)
  OpenFoodFactsLanguage? lang;

  @JsonKey(name: 'quantity', includeIfNull: false)
  String? quantity;

  // Images

  /// imgSmallUrl is deprecated, use imageFrontSmallUrl instead
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

  @JsonKey(
      name: 'ingredients',
      includeIfNull: false,
      toJson: JsonHelper.ingredientsToJson)
  List<Ingredient>? ingredients;

  @JsonKey(name: 'ingredients_text', includeIfNull: false)
  String? ingredientsText;
  @JsonKey(name: 'ingredients_text_translated', includeIfNull: false)
  String? ingredientsTextTranslated;

  @JsonKey(name: 'ingredients_tags', includeIfNull: false)
  List<String>? ingredientsTags;
  @JsonKey(name: 'ingredients_tags_translated', includeIfNull: false)
  List<String>? ingredientsTagsTranslated;

  /// Deprecated: please use ingredientsTextTranslated
  @JsonKey(name: 'ingredients_text_de', includeIfNull: false)
  @deprecated
  String? ingredientsTextDE;

  /// Deprecated: please use ingredientsTextTranslated
  @JsonKey(name: 'ingredients_text_en', includeIfNull: false)
  @deprecated
  String? ingredientsTextEN;

  /// Deprecated: please use ingredientsTextTranslated
  @JsonKey(name: 'ingredients_text_fr', includeIfNull: false)
  @deprecated
  String? ingredientsTextFR;

  @JsonKey(
      name: 'ingredients_analysis_tags',
      includeIfNull: false,
      fromJson: IngredientsAnalysisTags.fromJson,
      toJson: IngredientsAnalysisTags.toJson)
  IngredientsAnalysisTags? ingredientsAnalysisTags;

  @JsonKey(
      name: 'nutriments', includeIfNull: false, toJson: Nutriments.toJsonHelper)
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

  @JsonKey(name: 'nutriment_energy_unit', includeIfNull: false)
  String? nutrimentEnergyUnit;
  @JsonKey(name: 'nutrition_data_per', includeIfNull: false)
  String? nutrimentDataPer;
  @JsonKey(name: 'nutrition_grade_fr', includeIfNull: false)
  String? nutriscore;

  @JsonKey(name: 'categories', includeIfNull: false)
  String? categories;
  @JsonKey(name: 'categories_tags', includeIfNull: false)
  List<String>? categoriesTags;
  @JsonKey(name: 'categories_tags_translated', includeIfNull: false)
  List<String>? categoriesTagsTranslated;

  @JsonKey(name: 'labels', includeIfNull: false)
  String? labels;
  @JsonKey(name: 'labels_tags', includeIfNull: false)
  List<String>? labelsTags;
  @JsonKey(name: 'labels_tags_translated', includeIfNull: false)
  List<String>? labelsTagsTranslated;

  @JsonKey(name: 'packaging', includeIfNull: false)
  String? packaging;
  @JsonKey(name: 'packaging_tags', includeIfNull: false)
  List<String>? packagingTags;

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
      this.productNameTranslated,
      this.productNameDE,
      this.productNameEN,
      this.productNameFR,
      this.brands,
      this.brandsTags,
      this.countries,
      this.countriesTags,
      this.countriesTagsTranslated,
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
      this.servingSize,
      this.servingQuantity,
      this.packagingQuantity,
      this.selectedImages,
      this.images,
      this.ingredients,
      this.ingredientsText,
      this.ingredientsTextTranslated,
      this.ingredientsTags,
      this.ingredientsTagsTranslated,
      this.ingredientsTextDE,
      this.ingredientsTextEN,
      this.ingredientsTextFR,
      this.ingredientsAnalysisTags,
      this.nutriments,
      this.additives,
      this.environmentImpactLevels,
      this.allergens,
      this.nutrientLevels,
      this.nutrimentEnergyUnit,
      this.nutrimentDataPer,
      this.nutriscore,
      this.categories,
      this.categoriesTags,
      this.categoriesTagsTranslated,
      this.labels,
      this.labelsTags,
      this.labelsTagsTranslated,
      this.packaging,
      this.packagingTags,
      this.miscTags,
      this.statesTags,
      this.tracesTags,
      this.storesTags,
      this.attributeGroups,
      this.lastModified,
      this.ecoscoreGrade,
      this.ecoscoreScore,
      this.ecoscoreData});

  factory Product.fromJson(Map<String, dynamic> json) {
    final Product result = _$ProductFromJson(json);
    for (final String key in json.keys) {
      if (key.contains('debug')) {
        continue;
      } else if (key.startsWith('product_name_')) {
        result.productNameTranslated = json[key];
      } else if (key.startsWith('categories_tags_')) {
        result.categoriesTagsTranslated = _jsonValueToList(json[key]);
      } else if (key.startsWith('ingredients_tags_')) {
        result.ingredientsTagsTranslated = _jsonValueToList(json[key]);
      } else if (key.startsWith('labels_tags_')) {
        result.labelsTagsTranslated = _jsonValueToList(json[key]);
      } else if (key.startsWith('countries_tags_')) {
        result.countriesTagsTranslated = _jsonValueToList(json[key]);
      } else if (key.startsWith('ingredients_text_')) {
        result.ingredientsTextTranslated = json[key];
      }
    }
    return result;
  }

  static List<String>? _jsonValueToList(dynamic value) {
    return (value as List?)?.map((e) => e as String).toList();
  }

  Map<String, String> toServerData(String? lc) {
    final data = super.toData();

    lc ??= lang?.code;

    // Defensive keys copy to modify map while iterating
    final keys = data.keys.toList();

    for (final key in keys) {
      // NOTE: '_tags_translated' are not supported because tags translation
      // is done automatically on the server.
      if (key.endsWith('_translated')) {
        if (lc == null) {
          throw StateError('Cannot send translated field without language');
        }
        if (key.endsWith('_tags_translated')) {
          throw StateError(
              'Fields "SOMENAME_tags_translated" cannot be sent to the server. '
              'Please send translated values either by "SOMENAME_translated" field '
              'if it exists, or by "SOMENAME" field and '
              'prepending language code to values, e.g.: '
              '{"categories": "en:nuts, en:peanut"}');
        }
        final value = data[key];
        data.remove(key);
        final keyUntranslated = key.substring(0, key.indexOf('_translated'));
        final realKey = '${keyUntranslated}_$lc';
        data[realKey] = value!;
      }
    }
    return data;
  }

  @override
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  /// Returns all existing product attributes matching a list of attribute ids
  Map<String, Attribute> getAttributes(
    final List<String> attributeIds,
  ) {
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
}
