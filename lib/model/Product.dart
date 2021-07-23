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

/// This class contains most of the data about a specific product.
///
/// Please read the language mechanics explanation if you intend to display
/// or update data in specific language: https://github.com/openfoodfacts/openfoodfacts-dart/blob/master/DOCUMENTATION.md#about-languages-mechanics
@JsonSerializable()
class Product extends JsonObject {
  @JsonKey(name: 'code')
  String? barcode;

  @JsonKey(name: 'product_name', includeIfNull: false)
  String? productName;
  @JsonKey(
      name: 'product_name_in_languages',
      fromJson: LanguageHelper.fromJsonStringMap,
      toJson: LanguageHelper.toJsonStringMap,
      includeIfNull: false)
  Map<OpenFoodFactsLanguage, String>? productNameInLanguages;

  @JsonKey(name: 'brands', includeIfNull: false)
  String? brands;
  @JsonKey(name: 'brands_tags', includeIfNull: false)
  List<String>? brandsTags;

  @JsonKey(name: 'countries', includeIfNull: false)
  String? countries;
  @JsonKey(name: 'countries_tags', includeIfNull: false)
  List<String>? countriesTags;
  @JsonKey(
      name: 'countries_tags_in_languages',
      toJson: LanguageHelper.toJsonStringsListMap,
      fromJson: LanguageHelper.fromJsonStringsListMap,
      includeIfNull: false)
  Map<OpenFoodFactsLanguage, List<String>>? countriesTagsInLanguages;

  @JsonKey(
      name: 'lang',
      toJson: LanguageHelper.toJson,
      fromJson: LanguageHelper.fromJson,
      includeIfNull: false)
  OpenFoodFactsLanguage? lang;

  @JsonKey(name: 'quantity', includeIfNull: false)
  String? quantity;

  // Images
  @JsonKey(name: 'image_small_url', includeIfNull: false)
  // TODO: deprecated from 2021-04-06 (#152); remove when old enough
  @Deprecated('Use imageFrontSmallUrl instead')
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
  @JsonKey(
      name: 'ingredients_text_in_languages',
      fromJson: LanguageHelper.fromJsonStringMap,
      toJson: LanguageHelper.toJsonStringMap,
      includeIfNull: false)
  Map<OpenFoodFactsLanguage, String>? ingredientsTextInLanguages;

  @JsonKey(name: 'ingredients_tags', includeIfNull: false)
  List<String>? ingredientsTags;
  @JsonKey(
      name: 'ingredients_tags_in_languages',
      toJson: LanguageHelper.toJsonStringsListMap,
      fromJson: LanguageHelper.fromJsonStringsListMap,
      includeIfNull: false)
  Map<OpenFoodFactsLanguage, List<String>>? ingredientsTagsInLanguages;

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
  @JsonKey(
      name: 'categories_tags_in_languages',
      toJson: LanguageHelper.toJsonStringsListMap,
      fromJson: LanguageHelper.fromJsonStringsListMap,
      includeIfNull: false)
  Map<OpenFoodFactsLanguage, List<String>>? categoriesTagsInLanguages;

  @JsonKey(name: 'labels', includeIfNull: false)
  String? labels;
  @JsonKey(name: 'labels_tags', includeIfNull: false)
  List<String>? labelsTags;
  @JsonKey(
      name: 'labels_tags_in_languages',
      toJson: LanguageHelper.toJsonStringsListMap,
      fromJson: LanguageHelper.fromJsonStringsListMap,
      includeIfNull: false)
  Map<OpenFoodFactsLanguage, List<String>>? labelsTagsInLanguages;

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
      this.productNameInLanguages,
      this.brands,
      this.brandsTags,
      this.countries,
      this.countriesTags,
      this.countriesTagsInLanguages,
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
      this.ingredientsTextInLanguages,
      this.ingredientsTags,
      this.ingredientsTagsInLanguages,
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
      } else {
        // If the key ends with _[2 characters], it might be a language specific
        // field.
        RegExp regexp = RegExp(r'_(\w\w)$');
        if (regexp.hasMatch((key))) {
          if (key.startsWith('product_name_')) {
            OpenFoodFactsLanguage lang = _langFrom(key, 'product_name_');
            if (lang != OpenFoodFactsLanguage.UNDEFINED) {
              result.productNameInLanguages ??= {};
              result.productNameInLanguages![lang] = json[key];
            }
          } else if (key.startsWith('categories_tags_')) {
            OpenFoodFactsLanguage lang = _langFrom(key, 'categories_tags_');
            final values = _jsonValueToList(json[key]);
            if (lang != OpenFoodFactsLanguage.UNDEFINED && values != null) {
              result.categoriesTagsInLanguages ??= {};
              result.categoriesTagsInLanguages![lang] = values;
            }
          } else if (key.startsWith('ingredients_tags_')) {
            OpenFoodFactsLanguage lang = _langFrom(key, 'ingredients_tags_');
            final values = _jsonValueToList(json[key]);
            if (lang != OpenFoodFactsLanguage.UNDEFINED && values != null) {
              result.ingredientsTagsInLanguages ??= {};
              result.ingredientsTagsInLanguages![lang] = values;
            }
          } else if (key.startsWith('labels_tags_')) {
            OpenFoodFactsLanguage lang = _langFrom(key, 'labels_tags_');
            final values = _jsonValueToList(json[key]);
            if (lang != OpenFoodFactsLanguage.UNDEFINED && values != null) {
              result.labelsTagsInLanguages ??= {};
              result.labelsTagsInLanguages![lang] = values;
            }
          } else if (key.startsWith('countries_tags_')) {
            OpenFoodFactsLanguage lang = _langFrom(key, 'countries_tags_');
            final values = _jsonValueToList(json[key]);
            if (lang != OpenFoodFactsLanguage.UNDEFINED && values != null) {
              result.countriesTagsInLanguages ??= {};
              result.countriesTagsInLanguages![lang] = values;
            }
          } else if (key.startsWith('ingredients_text_')) {
            OpenFoodFactsLanguage lang = _langFrom(key, 'ingredients_text_');
            if (lang != OpenFoodFactsLanguage.UNDEFINED) {
              result.ingredientsTextInLanguages ??= {};
              result.ingredientsTextInLanguages![lang] = json[key];
            }
          }
        }
      }
    }
    return result;
  }

  static OpenFoodFactsLanguage _langFrom(String key, String prefix) {
    return LanguageHelper.fromJson(key.substring(prefix.length));
  }

  static List<String>? _jsonValueToList(dynamic value) {
    return (value as List?)?.map((e) => e as String).toList();
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
            throw StateError('Cannot send localized field without '
                'a proper language. Received: $langKey');
          }
          final keyNoLangs = key.substring(0, key.indexOf('_in_languages'));
          final realKey = '${keyNoLangs}_${lang.code}';
          json[realKey] = entry.value;
        }
      }
    }

    return json;
  }

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
