import 'package:openfoodfacts/model/OffTagged.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';

/// Fields of a [Product]
enum ProductField implements OffTagged {
  BARCODE(offTag: 'code'),
  NAME(offTag: 'product_name'),
  NAME_IN_LANGUAGES(offTag: 'product_name_'),
  NAME_ALL_LANGUAGES(offTag: 'product_name_languages'),
  GENERIC_NAME(offTag: 'generic_name'),
  BRANDS(offTag: 'brands'),
  BRANDS_TAGS(offTag: 'brands_tags'),
  COUNTRIES(offTag: 'countries'),
  COUNTRIES_TAGS(offTag: 'countries_tags'),
  COUNTRIES_TAGS_IN_LANGUAGES(offTag: 'countries_tags_'),
  LANGUAGE(offTag: 'lang'),
  QUANTITY(offTag: 'quantity'),
  SERVING_SIZE(offTag: 'serving_size'),
  SERVING_QUANTITY(offTag: 'serving_quantity'),
  PACKAGING_QUANTITY(offTag: 'product_quantity'),
  FRONT_IMAGE(offTag: 'image_small_url'),
  SELECTED_IMAGE(offTag: 'selected_images'),
  IMAGE_FRONT_URL(offTag: 'image_front_url'),
  IMAGE_FRONT_SMALL_URL(offTag: 'image_front_small_url'),
  IMAGE_INGREDIENTS_URL(offTag: 'image_ingredients_url'),
  IMAGE_INGREDIENTS_SMALL_URL(offTag: 'image_ingredients_small_url'),
  IMAGE_NUTRITION_URL(offTag: 'image_nutrition_url'),
  IMAGE_NUTRITION_SMALL_URL(offTag: 'image_nutrition_small_url'),
  IMAGE_PACKAGING_URL(offTag: 'image_packaging_url'),
  IMAGE_PACKAGING_SMALL_URL(offTag: 'image_packaging_small_url'),
  IMAGES(offTag: 'images'),
  INGREDIENTS(offTag: 'ingredients'),
  INGREDIENTS_TAGS(offTag: 'ingredients_tags'),
  INGREDIENTS_TAGS_IN_LANGUAGES(offTag: 'ingredients_tags_'),
  IMAGES_FRESHNESS_IN_LANGUAGES(offTag: 'images_to_update_'),
  NO_NUTRITION_DATA(offTag: 'no_nutrition_data'),
  NUTRIMENTS(offTag: 'nutriments'),
  ADDITIVES(offTag: 'additives_tags'),
  NUTRIENT_LEVELS(offTag: 'nutrient_levels'),
  INGREDIENTS_TEXT(offTag: 'ingredients_text'),
  INGREDIENTS_TEXT_IN_LANGUAGES(offTag: 'ingredients_text_'),
  INGREDIENTS_TEXT_ALL_LANGUAGES(offTag: 'ingredients_text_languages'),
  NUTRIMENT_ENERGY_UNIT(offTag: 'nutriment_energy_unit'),
  NUTRIMENT_DATA_PER(offTag: 'nutrition_data_per'),
  NUTRITION_DATA(offTag: 'nutrition_data'),
  NUTRISCORE(offTag: 'nutrition_grade_fr'),
  COMPARED_TO_CATEGORY(offTag: 'compared_to_category'),
  CATEGORIES(offTag: 'categories'),
  CATEGORIES_TAGS(offTag: 'categories_tags'),
  CATEGORIES_TAGS_IN_LANGUAGES(offTag: 'categories_tags_'),
  LABELS(offTag: 'labels'),
  LABELS_TAGS(offTag: 'labels_tags'),
  LABELS_TAGS_IN_LANGUAGES(offTag: 'labels_tags_'),
  PACKAGING(offTag: 'packaging'),
  PACKAGING_TAGS(offTag: 'packaging_tags'),
  PACKAGING_TEXT_IN_LANGUAGES(offTag: 'packaging_text_'),
  PACKAGING_TEXT_ALL_LANGUAGES(offTag: 'packaging_text_languages'),
  MISC_TAGS(offTag: 'misc'),
  STATES_TAGS(offTag: 'states_tags'),
  TRACES_TAGS(offTag: 'traces_tags'),
  STORES_TAGS(offTag: 'stores_tags'),
  STORES(offTag: 'stores'),
  INGREDIENTS_ANALYSIS_TAGS(offTag: 'ingredients_analysis_tags'),
  ALLERGENS(offTag: 'allergens_tags'),
  // TODO: deprecated from 2022-10-25; remove when old enough
  @Deprecated('Use ecoscore fields instead')
  ENVIRONMENT_IMPACT_LEVELS(offTag: 'environment_impact_level_tags'),
  ATTRIBUTE_GROUPS(offTag: 'attribute_groups'),
  LAST_MODIFIED(offTag: 'last_modified_t'),
  ECOSCORE_GRADE(offTag: 'ecoscore_grade'),
  ECOSCORE_SCORE(offTag: 'ecoscore_score'),
  ECOSCORE_DATA(offTag: 'ecoscore_data'),
  KNOWLEDGE_PANELS(offTag: 'knowledge_panels'),
  // TODO: deprecated from 2022-10-25; remove when old enough
  @Deprecated('Use ecoscore fields instead')
  ENVIRONMENT_INFOCARD(offTag: 'environment_infocard'),
  EMB_CODES(offTag: 'emb_codes'),
  MANUFACTURING_PLACES(offTag: 'manufacturing_places'),
  ORIGINS(offTag: 'origins'),
  NOVA_GROUP(offTag: 'nova_group'),
  WEBSITE(offTag: 'link'),
  ALL(offTag: '');

  const ProductField({
    required this.offTag,
  });

  @override
  final String offTag;

  // TODO: deprecated from 2022-10-19; remove when old enough
  @Deprecated('Use offTag instead')
  String get key => offTag;
}

/// NOTE: if one of the fields is IN_LANGUAGES and [languages] is empty -
/// the function will throw.
List<String> convertFieldsToStrings(
    List<ProductField> fields, List<OpenFoodFactsLanguage> languages) {
  final fieldsStrings = <String>[];

  const fieldsInLanguages = [
    ProductField.CATEGORIES_TAGS_IN_LANGUAGES,
    ProductField.LABELS_TAGS_IN_LANGUAGES,
    ProductField.NAME_IN_LANGUAGES,
    ProductField.COUNTRIES_TAGS_IN_LANGUAGES,
    ProductField.INGREDIENTS_TEXT_IN_LANGUAGES,
    ProductField.PACKAGING_TEXT_IN_LANGUAGES,
    ProductField.INGREDIENTS_TAGS_IN_LANGUAGES,
    ProductField.IMAGES_FRESHNESS_IN_LANGUAGES,
  ];

  for (final field in fields) {
    if (fieldsInLanguages.contains(field)) {
      if (languages.isEmpty) {
        throw ArgumentError(
            'Cannot request in-lang field $field without language');
      }
      for (final language in languages) {
        fieldsStrings.add('${field.offTag}${language.offTag}');
      }
    } else {
      fieldsStrings.add(field.offTag);
    }
  }

  return fieldsStrings;
}
