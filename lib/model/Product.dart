import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/model/Attribute.dart';
import 'package:openfoodfacts/model/AttributeGroup.dart';
import 'package:openfoodfacts/model/KnowledgePanels.dart';
import 'package:openfoodfacts/model/ProductImage.dart';
import 'package:openfoodfacts/utils/JsonHelper.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';

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

/// Possible improvements on a [Product] given its current data
enum ProductImprovement {
  /// Possible message:
  /// “The Eco-Score takes into account the origins of the ingredients.
  /// Please take them into a photo (ingredient list and/or any geographic claim
  /// or edit the product so that they can be taken into account. If it is not
  /// clear, you can contact the food producer.”
  ORIGINS_TO_BE_COMPLETED,

  /// We could not compute an Nutri-Score for this product. It might be that the
  /// category is an exception. If you believe this is an error,
  /// you can email contact@thenameofyourapp.org
  /// List of exceptions:
  /// https://www.santepubliquefrance.fr/content/download/150262/file/QR_scientifique_technique_150421.pdf
  /// You can get states with
  /// https://world.openfoodfacts.org/api/v0/product/3414280980209.json?fields=ecoscore_grade,states_tags
  /// Add a message if we have a category but no nutrition
  CATEGORIES_BUT_NO_NUTRISCORE,

  /// Possible message: “Add nutrition facts to compute the Nutri-Score”
  /// Add a one-click option to indicate no nutrition facts on the packaging
  /// This product doesn't have nutrition facts
  /// Add a message if we have nutrition but no category
  ADD_NUTRITION_FACTS,

  /// Possible message: “Add a category to compute the Nutri-Score”
  /// Help the user add the category if it is missing
  /// You can use our Robotoff API to get your users to validate a prediction
  /// Robotoff Questions
  /// Add a message if we have no category and no nutrition
  ADD_CATEGORY,

  /// Prompt: “Add nutrition facts and a category to compute the Nutri-Score”
  /// Add a one-click option to indicate no nutrition facts on the packaging
  /// This product doesn't have nutrition facts
  /// Add a message if the nutrition image is missing
  ADD_NUTRITION_FACTS_AND_CATEGORY,

  /// Add a message if the nutrition image is obsolete using the image refresh API
  /// https://github.com/openfoodfacts/api-documentation/issues/15
  OBSOLETE_NUTRITION_IMAGE,
}

/// Category: what would this [ProductImprovement] help compute?
enum ProductImprovementCategory {
  /// Eco-Score category
  ECO_SCORE,

  /// Nutri-Score category
  NUTRI_SCORE,
}

extension ProductImprovementExtension on ProductImprovement {
  ProductImprovementCategory getCategory() {
    switch (this) {
      case ProductImprovement.ORIGINS_TO_BE_COMPLETED:
        return ProductImprovementCategory.ECO_SCORE;
      case ProductImprovement.CATEGORIES_BUT_NO_NUTRISCORE:
      case ProductImprovement.ADD_NUTRITION_FACTS:
      case ProductImprovement.ADD_CATEGORY:
      case ProductImprovement.ADD_NUTRITION_FACTS_AND_CATEGORY:
      case ProductImprovement.OBSOLETE_NUTRITION_IMAGE:
        return ProductImprovementCategory.NUTRI_SCORE;
    }
  }
}

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

  ///Common name
  ///Example: Chocolate bar with milk and hazelnuts
  @JsonKey(name: 'generic_name', includeIfNull: false)
  String? genericName;

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
    fromJson: JsonHelper.quantityFromJson,
    includeIfNull: false,
  )
  double? servingQuantity;

  @JsonKey(
    name: 'product_quantity',
    fromJson: JsonHelper.quantityFromJson,
    includeIfNull: false,
  )
  double? packagingQuantity;

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

  /// Images Freshness in seconds
  ///
  /// 0 seconds means we don't have the picture at all.
  /// Read-only
  /// cf. https://github.com/openfoodfacts/openfoodfacts-dart/issues/104
  Map<OpenFoodFactsLanguage, Map<ImageField, int>>? imagesFreshnessInLanguages;

  @JsonKey(
      name: 'ingredients_analysis_tags',
      includeIfNull: false,
      fromJson: IngredientsAnalysisTags.fromJson,
      toJson: IngredientsAnalysisTags.toJson)
  IngredientsAnalysisTags? ingredientsAnalysisTags;

  /// When no nutrition data is true, nutriments are always null
  /// This logic is handled by the getters/setters of [noNutritionData] and
  /// [nutriments]
  @JsonKey(ignore: true)
  bool? _noNutritionData;

  /// When nutriments are not null, no nutrition data can't be true
  /// This logic is handled by the getters/setters of [noNutritionData] and
  /// [nutriments]
  @JsonKey(ignore: true)
  Nutriments? _nutriments;

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
  @JsonKey(
      name: 'packaging_text_in_languages',
      fromJson: LanguageHelper.fromJsonStringMap,
      toJson: LanguageHelper.toJsonStringMap,
      includeIfNull: false)
  Map<OpenFoodFactsLanguage, String>? packagingTextInLanguages;

  @JsonKey(name: 'misc', includeIfNull: false)
  List<String>? miscTags;
  @JsonKey(name: 'states_tags', includeIfNull: false)
  List<String>? statesTags;
  @JsonKey(name: 'traces_tags', includeIfNull: false)
  List<String>? tracesTags;
  @JsonKey(name: 'stores_tags', includeIfNull: false)
  List<String>? storesTags;

  @JsonKey(name: 'stores', includeIfNull: false)
  String? stores;

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

  @JsonKey(
      name: 'knowledge_panels',
      includeIfNull: false,
      fromJson: KnowledgePanels.fromJsonHelper,
      toJson: KnowledgePanels.toJsonHelper)
  KnowledgePanels? knowledgePanels;

  @JsonKey(
    name: 'environment_infocard',
    includeIfNull: false,
  )
  String? environmentInfoCard;

  Product(
      {this.barcode,
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
      this.stores,
      this.attributeGroups,
      this.lastModified,
      this.ecoscoreGrade,
      this.ecoscoreScore,
      this.ecoscoreData,
      Nutriments? nutriments,
      bool? noNutritionData})
      : _nutriments = nutriments,
        _noNutritionData = noNutritionData;

  factory Product.fromJson(Map<String, dynamic> json) {
    final Product result = _$ProductFromJson(json);
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
      if (key == ProductField.NAME_ALL_LANGUAGES.key) {
        final Map<OpenFoodFactsLanguage, String>? localized =
            _getLocalizedStrings(json[key]);
        if (localized != null) {
          result.productNameInLanguages ??= {};
          result.productNameInLanguages!.addAll(localized);
        }
      } else if (key == ProductField.INGREDIENTS_TEXT_ALL_LANGUAGES.key) {
        final Map<OpenFoodFactsLanguage, String>? localized =
            _getLocalizedStrings(json[key]);
        if (localized != null) {
          result.ingredientsTextInLanguages ??= {};
          result.ingredientsTextInLanguages!.addAll(localized);
        }
      } else if (key == ProductField.PACKAGING_TEXT_ALL_LANGUAGES.key) {
        final Map<OpenFoodFactsLanguage, String>? localized =
            _getLocalizedStrings(json[key]);
        if (localized != null) {
          result.packagingTextInLanguages ??= {};
          result.packagingTextInLanguages!.addAll(localized);
        }
      } else if (key.startsWith(ProductField.NAME_IN_LANGUAGES.key)) {
        final OpenFoodFactsLanguage lang =
            _langFrom(key, ProductField.NAME_IN_LANGUAGES.key);
        if (lang != OpenFoodFactsLanguage.UNDEFINED) {
          result.productNameInLanguages ??= {};
          result.productNameInLanguages![lang] = json[key];
        }
      } else if (key
          .startsWith(ProductField.CATEGORIES_TAGS_IN_LANGUAGES.key)) {
        final OpenFoodFactsLanguage lang =
            _langFrom(key, ProductField.CATEGORIES_TAGS_IN_LANGUAGES.key);
        final values = _jsonValueToList(json[key]);
        if (lang != OpenFoodFactsLanguage.UNDEFINED && values != null) {
          result.categoriesTagsInLanguages ??= {};
          result.categoriesTagsInLanguages![lang] = values;
        }
      } else if (key
          .startsWith(ProductField.INGREDIENTS_TAGS_IN_LANGUAGES.key)) {
        final OpenFoodFactsLanguage lang =
            _langFrom(key, ProductField.INGREDIENTS_TAGS_IN_LANGUAGES.key);
        final values = _jsonValueToList(json[key]);
        if (lang != OpenFoodFactsLanguage.UNDEFINED && values != null) {
          result.ingredientsTagsInLanguages ??= {};
          result.ingredientsTagsInLanguages![lang] = values;
        }
      } else if (key
          .startsWith(ProductField.IMAGES_FRESHNESS_IN_LANGUAGES.key)) {
        final OpenFoodFactsLanguage lang =
            _langFrom(key, ProductField.IMAGES_FRESHNESS_IN_LANGUAGES.key);
        if (lang != OpenFoodFactsLanguage.UNDEFINED) {
          final Map<ImageField, int> values =
              _jsonValueToImagesFreshness(json[key], lang);
          result.imagesFreshnessInLanguages ??= {};
          result.imagesFreshnessInLanguages![lang] = values;
        }
      } else if (key.startsWith(ProductField.LABELS_TAGS_IN_LANGUAGES.key)) {
        final OpenFoodFactsLanguage lang =
            _langFrom(key, ProductField.LABELS_TAGS_IN_LANGUAGES.key);
        final values = _jsonValueToList(json[key]);
        if (lang != OpenFoodFactsLanguage.UNDEFINED && values != null) {
          result.labelsTagsInLanguages ??= {};
          result.labelsTagsInLanguages![lang] = values;
        }
      } else if (key.startsWith(ProductField.COUNTRIES_TAGS_IN_LANGUAGES.key)) {
        final OpenFoodFactsLanguage lang =
            _langFrom(key, ProductField.COUNTRIES_TAGS_IN_LANGUAGES.key);
        final values = _jsonValueToList(json[key]);
        if (lang != OpenFoodFactsLanguage.UNDEFINED && values != null) {
          result.countriesTagsInLanguages ??= {};
          result.countriesTagsInLanguages![lang] = values;
        }
      } else if (key
          .startsWith(ProductField.INGREDIENTS_TEXT_IN_LANGUAGES.key)) {
        final OpenFoodFactsLanguage lang =
            _langFrom(key, ProductField.INGREDIENTS_TEXT_IN_LANGUAGES.key);
        if (lang != OpenFoodFactsLanguage.UNDEFINED) {
          result.ingredientsTextInLanguages ??= {};
          result.ingredientsTextInLanguages![lang] = json[key];
        }
      } else if (key.startsWith(ProductField.PACKAGING_TEXT_IN_LANGUAGES.key)) {
        final OpenFoodFactsLanguage lang =
            _langFrom(key, ProductField.PACKAGING_TEXT_IN_LANGUAGES.key);
        if (lang != OpenFoodFactsLanguage.UNDEFINED) {
          result.packagingTextInLanguages ??= {};
          result.packagingTextInLanguages![lang] = json[key];
        }
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
      Map value, OpenFoodFactsLanguage language) {
    final Map<ImageField, int> result = {};
    for (final ImageField imageField in ImageField.values) {
      final int? timestamp = value['${imageField.value}_${language.code}'];
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
      name: 'nutriments', includeIfNull: false, toJson: Nutriments.toJsonHelper)
  Nutriments? get nutriments => _noNutritionData == true ? null : _nutriments;

  set nutriments(Nutriments? nutriments) {
    if (nutriments == null) {
      _noNutritionData = true;
    }
    _nutriments = nutriments;
  }
}
