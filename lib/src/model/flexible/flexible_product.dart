import 'package:meta/meta.dart';

import 'flexible_map.dart';
import '../additives.dart';
import '../attribute_group.dart';
import '../ingredient.dart';
import '../knowledge_panels.dart';
import '../nutriments.dart';
import '../product_image.dart';
import '../product_packaging.dart';
import '../product_type.dart';
import '../../utils/json_helper.dart';
import '../../utils/language_helper.dart';
import '../../utils/product_fields.dart';
import '../../utils/uri_helper.dart';

/// Product without predefined structure, relying mainly on the json.
///
/// The typical use case would be "extending" this class in order to control
/// brand new field values.
/// The current field list matches what is used in Smoothie.
@experimental
class FlexibleProduct extends FlexibleMap {
  FlexibleProduct(super.json);

  FlexibleProduct.fromServer(
    super.json, {
    required final UriProductHelper uriHelper,
  }) {
    json['image_url_base'] = uriHelper.getImageUrlBase();
  }

  // mandatory for images
  String get imageUrlBase => json['image_url_base'];

  String? get barcode => json['code'];

  ProductType? get productType => ProductType.fromOffTag(json['product_type']);

  int? get schemaVersion => json['schema_version'];

  String? get abbreviatedName => json['abbreviated_product_name'];

  Additives? get additives =>
      Additives.additivesFromJson(json['additives_tags'] as List?);

  Iterable<AttributeGroup>? get attributeGroups =>
      (json['attribute_groups'] as List<dynamic>?)
          ?.map(AttributeGroup.fromJson);

  String? get brands => json['brands'] as String?;

  String? get categories => json['categories'] as String?;

  Iterable<String>? get categoriesTags =>
      (json['categories_tags'] as List<dynamic>?)?.map(
        (e) => e as String,
      );

  Map<OpenFoodFactsLanguage, List<String>>? get categoriesTagsInLanguages =>
      LanguageHelper.fromJsonStringsListMapWithPrefix(
        json,
        inProductField: ProductField.CATEGORIES_TAGS_IN_LANGUAGES,
      );

  String? get comparedToCategory => json['compared_to_category'] as String?;

  String? get countries => json['countries'] as String?;

  Map<OpenFoodFactsLanguage, List<String>>? get countriesTagsInLanguages =>
      LanguageHelper.fromJsonStringsListMapWithPrefix(
        json,
        inProductField: ProductField.COUNTRIES_TAGS_IN_LANGUAGES,
      );

  String? get embCodes => json['emb_codes'] as String?;

  String? get genericName => json['generic_name'] as String?;

  String? get imageFrontUrl => json['image_front_url'] as String?;

  String? get imageFrontSmallUrl => json['image_front_small_url'] as String?;

  String? get imageIngredientsUrl => json['image_ingredients_url'] as String?;

  String? get imageIngredientsSmallUrl =>
      json['image_ingredients_small_url'] as String?;

  String? get imageNutritionUrl => json['image_nutrition_url'] as String?;

  String? get imageNutritionSmallUrl =>
      json['image_nutrition_small_url'] as String?;

  String? get imagePackagingUrl => json['image_packaging_url'] as String?;

  String? get imagePackagingSmallUrl =>
      json['image_packaging_small_url'] as String?;

  List<ProductImage>? get images =>
      JsonHelper.allImagesFromJson(json['images'] as Map?);

  Iterable<Ingredient>? get ingredients =>
      (json['ingredients'] as List<dynamic>?)
          ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>));

  String? get ingredientsText => json['ingredients_text'] as String?;

  Map<OpenFoodFactsLanguage, String>? get ingredientsTextInLanguages =>
      LanguageHelper.fromJsonStringMapWithPrefix(
        json,
        inProductField: ProductField.INGREDIENTS_TEXT_IN_LANGUAGES,
        allProductField: ProductField.INGREDIENTS_TEXT_ALL_LANGUAGES,
      );

  KnowledgePanels? get knowledgePanels =>
      KnowledgePanels.fromJsonHelper(json['knowledge_panels'] as Map?);

  String? get labels => json['labels'] as String?;

  Map<OpenFoodFactsLanguage, List<String>>? get labelsTagsInLanguages =>
      LanguageHelper.fromJsonStringsListMapWithPrefix(
        json,
        inProductField: ProductField.LABELS_TAGS_IN_LANGUAGES,
      );

  OpenFoodFactsLanguage? get lang =>
      LanguageHelper.fromJson(json['lang'] as String?);

  DateTime? get lastImage => JsonHelper.timestampToDate(json['last_image_t']);

  Iterable<String>? get lastImageDates =>
      (json['last_image_dates_tags'] as List<dynamic>?)
          ?.map((e) => e as String);

  bool? get noNutritionData =>
      JsonHelper.checkboxFromJSON(json['no_nutrition_data']);

  String? get nutrimentDataPer => json['nutrition_data_per'] as String?;

  Nutriments? get nutriments => noNutritionData == true
      ? null
      : json['nutriments'] == null
          ? null
          : Nutriments.fromJson(json['nutriments'] as Map<String, dynamic>);

  bool? get obsolete => JsonHelper.checkboxFromJSON(json['obsolete']);

  String? get origins => json['origins'] as String?;

  Map<String, int>? get ownerFields =>
      (json['owner_fields'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      );

  Iterable<ProductPackaging>? get packagings =>
      (json['packagings'] as List<dynamic>?)?.map(ProductPackaging.fromJson);

  bool? get packagingsComplete =>
      JsonHelper.boolFromJSON(json['packagings_complete']);

  Map<OpenFoodFactsLanguage, String>? get packagingTextInLanguages =>
      LanguageHelper.fromJsonStringMapWithPrefix(
        json,
        inProductField: ProductField.PACKAGING_TEXT_IN_LANGUAGES,
        allProductField: ProductField.PACKAGING_TEXT_ALL_LANGUAGES,
      );

  String? get productName => json['product_name'] as String?;

  Map<OpenFoodFactsLanguage, String>? get productNameInLanguages =>
      LanguageHelper.fromJsonStringMapWithPrefix(
        json,
        inProductField: ProductField.NAME_IN_LANGUAGES,
        allProductField: ProductField.NAME_ALL_LANGUAGES,
      );

  String? get quantity => json['quantity'] as String?;

  List<ProductImage>? get selectedImages =>
      JsonHelper.selectedImagesFromJson(json['selected_images'] as Map?);

  String? get servingSize => json['serving_size'] as String?;

  Iterable<String>? get statesTags =>
      (json['states_tags'] as List<dynamic>?)?.map((e) => e as String);

  String? get stores => json['stores'] as String?;

  String? get website => json['link'] as String?;
}
