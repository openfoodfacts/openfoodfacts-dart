import 'language_helper.dart';
import '../model/off_tagged.dart';

/// Fields of a [Product]
enum ProductField implements OffTagged {
  BARCODE(offTag: 'code'),
  NAME(offTag: 'product_name'),
  NAME_IN_LANGUAGES(offTag: 'product_name_'),
  NAME_ALL_LANGUAGES(offTag: 'product_name_languages'),
  GENERIC_NAME(offTag: 'generic_name'),
  GENERIC_NAME_IN_LANGUAGES(offTag: 'generic_name_'),
  GENERIC_NAME_ALL_LANGUAGES(offTag: 'generic_name_languages'),
  ABBREVIATED_NAME(offTag: 'abbreviated_product_name'),
  ABBREVIATED_NAME_IN_LANGUAGES(offTag: 'abbreviated_product_name_'),
  ABBREVIATED_NAME_ALL_LANGUAGES(offTag: 'abbreviated_product_name_languages'),
  BRANDS(offTag: 'brands'),
  BRANDS_TAGS(offTag: 'brands_tags'),
  BRANDS_TAGS_IN_LANGUAGES(offTag: 'brands_tags_'),
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
  PACKAGINGS(offTag: 'packagings'),
  PACKAGINGS_COMPLETE(offTag: 'packagings_complete'),
  PACKAGING_TAGS(offTag: 'packaging_tags'),
  PACKAGING_TEXT_IN_LANGUAGES(offTag: 'packaging_text_'),
  PACKAGING_TEXT_ALL_LANGUAGES(offTag: 'packaging_text_languages'),
  MISC_TAGS(offTag: 'misc_tags'),
  MISC_TAGS_IN_LANGUAGES(offTag: 'misc_tags_'),
  STATES_TAGS(offTag: 'states_tags'),
  STATES_TAGS_IN_LANGUAGES(offTag: 'states_tags_'),
  TRACES_TAGS(offTag: 'traces_tags'),
  TRACES_TAGS_IN_LANGUAGES(offTag: 'traces_tags_'),
  STORES_TAGS(offTag: 'stores_tags'),
  STORES_TAGS_IN_LANGUAGES(offTag: 'stores_tags_'),
  STORES(offTag: 'stores'),
  INGREDIENTS_ANALYSIS_TAGS(offTag: 'ingredients_analysis_tags'),
  INGREDIENTS_ANALYSIS_TAGS_IN_LANGUAGES(offTag: 'ingredients_analysis_tags_'),
  ALLERGENS(offTag: 'allergens_tags'),
  ATTRIBUTE_GROUPS(offTag: 'attribute_groups'),
  LAST_MODIFIED(offTag: 'last_modified_t'),
  LAST_MODIFIER(offTag: 'last_modified_by'),
  LAST_CHECKED(offTag: 'last_checked_t'),
  LAST_CHECKER(offTag: 'last_checker'),
  LAST_EDITOR(offTag: 'last_editor'),
  LAST_IMAGE(offTag: 'last_image_t'),
  ENTRY_DATES(offTag: 'entry_dates_tags'),
  LAST_CHECK_DATES(offTag: 'last_check_dates_tags'),
  LAST_EDIT_DATES(offTag: 'last_edit_dates_tags'),
  LAST_IMAGE_DATES(offTag: 'last_image_dates_tags'),
  CREATED(offTag: 'created_t'),
  CREATOR(offTag: 'creator'),
  EDITORS(offTag: 'editors_tags'),
  ECOSCORE_GRADE(offTag: 'ecoscore_grade'),
  ECOSCORE_SCORE(offTag: 'ecoscore_score'),
  ECOSCORE_DATA(offTag: 'ecoscore_data'),
  KNOWLEDGE_PANELS(offTag: 'knowledge_panels'),
  EMB_CODES(offTag: 'emb_codes'),
  MANUFACTURING_PLACES(offTag: 'manufacturing_places'),
  ORIGINS(offTag: 'origins'),
  NOVA_GROUP(offTag: 'nova_group'),
  WEBSITE(offTag: 'link'),
  OBSOLETE(offTag: 'obsolete'),

  /// All data as RAW from the server. E.g. packagings are only Strings there.
  RAW(offTag: 'raw'),
  ALL(offTag: '');

  const ProductField({
    required this.offTag,
  });

  @override
  final String offTag;
}

const Set<ProductField> fieldsInLanguages = {
  ProductField.NAME_IN_LANGUAGES,
  ProductField.GENERIC_NAME_IN_LANGUAGES,
  ProductField.ABBREVIATED_NAME_IN_LANGUAGES,
  ProductField.INGREDIENTS_TEXT_IN_LANGUAGES,
  ProductField.PACKAGING_TEXT_IN_LANGUAGES,
  ProductField.CATEGORIES_TAGS_IN_LANGUAGES,
  ProductField.TRACES_TAGS_IN_LANGUAGES,
  ProductField.STORES_TAGS_IN_LANGUAGES,
  ProductField.STATES_TAGS_IN_LANGUAGES,
  ProductField.BRANDS_TAGS_IN_LANGUAGES,
  ProductField.MISC_TAGS_IN_LANGUAGES,
  ProductField.INGREDIENTS_ANALYSIS_TAGS_IN_LANGUAGES,
  ProductField.LABELS_TAGS_IN_LANGUAGES,
  ProductField.COUNTRIES_TAGS_IN_LANGUAGES,
  ProductField.INGREDIENTS_TAGS_IN_LANGUAGES,
  ProductField.IMAGES_FRESHNESS_IN_LANGUAGES,
};

const Set<ProductField> fieldsAllLanguages = {
  ProductField.NAME_ALL_LANGUAGES,
  ProductField.GENERIC_NAME_ALL_LANGUAGES,
  ProductField.ABBREVIATED_NAME_ALL_LANGUAGES,
  ProductField.INGREDIENTS_TEXT_ALL_LANGUAGES,
  ProductField.PACKAGING_TEXT_ALL_LANGUAGES,
};

/// NOTE: if one of the fields is IN_LANGUAGES and [languages] is empty -
/// the function will throw.
List<String> convertFieldsToStrings(
    List<ProductField> fields, List<OpenFoodFactsLanguage> languages) {
  final fieldsStrings = <String>[];

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
