import 'package:openfoodfacts/utils/LanguageHelper.dart';

/// Fields of a [Product]
enum ProductField {
  BARCODE,
  NAME,
  NAME_IN_LANGUAGES,
  NAME_ALL_LANGUAGES,
  GENERIC_NAME,
  BRANDS,
  BRANDS_TAGS,
  COUNTRIES,
  COUNTRIES_TAGS,
  COUNTRIES_TAGS_IN_LANGUAGES,
  LANGUAGE,
  QUANTITY,
  SERVING_SIZE,
  PACKAGING_QUANTITY,
  FRONT_IMAGE,
  SELECTED_IMAGE,
  IMAGE_FRONT_URL,
  IMAGE_FRONT_SMALL_URL,
  IMAGE_INGREDIENTS_URL,
  IMAGE_INGREDIENTS_SMALL_URL,
  IMAGE_NUTRITION_URL,
  IMAGE_NUTRITION_SMALL_URL,
  IMAGE_PACKAGING_URL,
  IMAGE_PACKAGING_SMALL_URL,
  IMAGES,
  INGREDIENTS,
  INGREDIENTS_TAGS,
  INGREDIENTS_TAGS_IN_LANGUAGES,
  NUTRIMENTS,
  ADDITIVES,
  NUTRIENT_LEVELS,
  INGREDIENTS_TEXT,
  INGREDIENTS_TEXT_IN_LANGUAGES,
  INGREDIENTS_TEXT_ALL_LANGUAGES,
  NUTRIMENT_ENERGY_UNIT,
  NUTRIMENT_DATA_PER,
  NUTRISCORE,
  CATEGORIES,
  CATEGORIES_TAGS,
  CATEGORIES_TAGS_IN_LANGUAGES,
  LABELS_TAGS,
  LABELS_TAGS_IN_LANGUAGES,
  MISC_TAGS,
  STATES_TAGS,
  TRACES_TAGS,
  INGREDIENTS_ANALYSIS_TAGS,
  ALLERGENS,
  ENVIRONMENT_IMPACT_LEVELS,
  ATTRIBUTE_GROUPS,
  ECOSCORE_GRADE,
  ECOSCORE_SCORE,
  ECOSCORE_DATA,
  ALL
}

extension ProductFieldExtension on ProductField {
  static const Map<ProductField, String> _KEYS = {
    ProductField.BARCODE: 'code',
    ProductField.NAME: 'product_name',
    ProductField.NAME_IN_LANGUAGES: 'product_name_',
    ProductField.NAME_ALL_LANGUAGES: 'product_name_languages',
    ProductField.GENERIC_NAME: 'generic_name',
    ProductField.BRANDS: 'brands',
    ProductField.BRANDS_TAGS: 'brands_tags',
    ProductField.COUNTRIES: 'countries',
    ProductField.COUNTRIES_TAGS: 'countries_tags',
    ProductField.COUNTRIES_TAGS_IN_LANGUAGES: 'countries_tags_',
    ProductField.LANGUAGE: 'lang',
    ProductField.QUANTITY: 'quantity',
    ProductField.SERVING_SIZE: 'serving_size',
    ProductField.PACKAGING_QUANTITY: 'product_quantity',
    ProductField.FRONT_IMAGE: 'image_small_url',
    ProductField.IMAGE_FRONT_URL: 'image_front_url',
    ProductField.IMAGE_FRONT_SMALL_URL: 'image_front_small_url',
    ProductField.IMAGE_INGREDIENTS_URL: 'image_ingredients_url',
    ProductField.IMAGE_INGREDIENTS_SMALL_URL: 'image_ingredients_small_url',
    ProductField.IMAGE_NUTRITION_URL: 'image_nutrition_url',
    ProductField.IMAGE_NUTRITION_SMALL_URL: 'image_nutrition_small_url',
    ProductField.IMAGE_PACKAGING_URL: 'image_packaging_url',
    ProductField.IMAGE_PACKAGING_SMALL_URL: 'image_packaging_small_url',
    ProductField.SELECTED_IMAGE: 'selected_images',
    ProductField.IMAGES: 'images',
    ProductField.INGREDIENTS: 'ingredients',
    ProductField.INGREDIENTS_TAGS: 'ingredients_tags',
    ProductField.INGREDIENTS_TAGS_IN_LANGUAGES: 'ingredients_tags_',
    ProductField.NUTRIMENTS: 'nutriments',
    ProductField.ADDITIVES: 'additives_tags',
    ProductField.NUTRIENT_LEVELS: 'nutrient_levels',
    ProductField.INGREDIENTS_TEXT: 'ingredients_text',
    ProductField.INGREDIENTS_TEXT_IN_LANGUAGES: 'ingredients_text_',
    ProductField.INGREDIENTS_TEXT_ALL_LANGUAGES: 'ingredients_text_languages',
    ProductField.NUTRIMENT_ENERGY_UNIT: 'nutriment_energy_unit',
    ProductField.NUTRIMENT_DATA_PER: 'nutrition_data_per',
    ProductField.NUTRISCORE: 'nutrition_grade_fr',
    ProductField.CATEGORIES: 'categories',
    ProductField.CATEGORIES_TAGS: 'categories_tags',
    ProductField.CATEGORIES_TAGS_IN_LANGUAGES: 'categories_tags_',
    ProductField.LABELS_TAGS: 'labels_tags',
    ProductField.LABELS_TAGS_IN_LANGUAGES: 'labels_tags_',
    ProductField.MISC_TAGS: 'misc',
    ProductField.STATES_TAGS: 'states_tags',
    ProductField.TRACES_TAGS: 'traces_tags',
    ProductField.INGREDIENTS_ANALYSIS_TAGS: 'ingredients_analysis_tags',
    ProductField.ALLERGENS: 'allergens_tags',
    ProductField.ENVIRONMENT_IMPACT_LEVELS: 'environment_impact_level_tags',
    ProductField.ATTRIBUTE_GROUPS: 'attribute_groups',
    ProductField.ECOSCORE_GRADE: 'ecoscore_grade',
    ProductField.ECOSCORE_SCORE: 'ecoscore_score',
    ProductField.ECOSCORE_DATA: 'ecoscore_data',
  };

  /// Returns the key of the product field
  String get key => _KEYS[this] ?? '';
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
    ProductField.INGREDIENTS_TAGS_IN_LANGUAGES,
  ];

  for (final field in fields) {
    if (fieldsInLanguages.contains(field)) {
      if (languages.isEmpty) {
        throw ArgumentError(
            'Cannot request in-lang field $field without language');
      }
      for (final language in languages) {
        fieldsStrings.add('${field.key}${language.code}');
      }
    } else {
      fieldsStrings.add(field.key);
    }
  }

  return fieldsStrings;
}
