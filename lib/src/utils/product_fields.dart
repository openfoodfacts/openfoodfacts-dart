import '../model/off_tagged.dart';
import 'language_helper.dart';

/// Fields of a [Product]
enum ProductField implements OffTagged {
  BARCODE(offTag: 'code'),
  PRODUCT_TYPE(offTag: 'product_type'),
  SCHEMA_VERSION(offTag: 'schema_version'),
  NAME(
    offTag: 'product_name',
    inLanguagesProductField: ProductField.NAME_IN_LANGUAGES,
  ),
  NAME_IN_LANGUAGES(offTag: 'product_name_', isInLanguages: true),
  NAME_ALL_LANGUAGES(
    offTag: 'product_name_languages',
    inLanguagesProductField: ProductField.NAME_IN_LANGUAGES,
    isAllLanguages: true,
  ),
  CONSERVATION_CONDITIONS_ALL_LANGUAGES(
    offTag: 'conservation_conditions_languages',
    isAllLanguages: true,
  ),
  CUSTOMER_SERVICE_ALL_LANGUAGES(
    offTag: 'customer_service_languages',
    isAllLanguages: true,
  ),
  GENERIC_NAME(
    offTag: 'generic_name',
    inLanguagesProductField: ProductField.GENERIC_NAME_IN_LANGUAGES,
  ),
  GENERIC_NAME_IN_LANGUAGES(offTag: 'generic_name_', isInLanguages: true),
  GENERIC_NAME_ALL_LANGUAGES(
    offTag: 'generic_name_languages',
    inLanguagesProductField: ProductField.GENERIC_NAME_IN_LANGUAGES,
    isAllLanguages: true,
  ),
  ABBREVIATED_NAME(
    offTag: 'abbreviated_product_name',
    inLanguagesProductField: ProductField.ABBREVIATED_NAME_IN_LANGUAGES,
  ),
  ABBREVIATED_NAME_IN_LANGUAGES(
    offTag: 'abbreviated_product_name_',
    isInLanguages: true,
  ),
  ABBREVIATED_NAME_ALL_LANGUAGES(
    offTag: 'abbreviated_product_name_languages',
    inLanguagesProductField: ProductField.ABBREVIATED_NAME_IN_LANGUAGES,
    isAllLanguages: true,
  ),
  BRANDS(offTag: 'brands'),
  BRANDS_TAGS(
    offTag: 'brands_tags',
    inLanguagesProductField: ProductField.BRANDS_TAGS_IN_LANGUAGES,
  ),
  BRANDS_TAGS_IN_LANGUAGES(offTag: 'brands_tags_', isInLanguages: true),
  COUNTRIES(offTag: 'countries'),
  COUNTRIES_TAGS(
    offTag: 'countries_tags',
    inLanguagesProductField: ProductField.COUNTRIES_TAGS_IN_LANGUAGES,
  ),
  COUNTRIES_TAGS_IN_LANGUAGES(offTag: 'countries_tags_', isInLanguages: true),
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
  INGREDIENTS_TAGS(
    offTag: 'ingredients_tags',
    inLanguagesProductField: ProductField.INGREDIENTS_TAGS_IN_LANGUAGES,
  ),
  INGREDIENTS_TAGS_IN_LANGUAGES(
    offTag: 'ingredients_tags_',
    isInLanguages: true,
  ),
  IMAGES_FRESHNESS_IN_LANGUAGES(
    offTag: 'images_to_update_',
    isInLanguages: true,
  ),
  NO_NUTRITION_DATA(offTag: 'no_nutrition_data'),
  NUTRIMENTS(offTag: 'nutriments'),
  ADDITIVES(
    offTag: 'additives_tags',
    inLanguagesProductField: ProductField.ADDITIVES_TAGS_IN_LANGUAGES,
  ),
  ADDITIVES_TAGS_IN_LANGUAGES(offTag: 'additives_tags_', isInLanguages: true),
  NUTRIENT_LEVELS(offTag: 'nutrient_levels'),
  INGREDIENTS_TEXT(
    offTag: 'ingredients_text',
    inLanguagesProductField: ProductField.INGREDIENTS_TEXT_IN_LANGUAGES,
  ),
  INGREDIENTS_TEXT_IN_LANGUAGES(
    offTag: 'ingredients_text_',
    isInLanguages: true,
  ),
  INGREDIENTS_TEXT_ALL_LANGUAGES(
    offTag: 'ingredients_text_languages',
    inLanguagesProductField: ProductField.INGREDIENTS_TEXT_IN_LANGUAGES,
    isAllLanguages: true,
  ),
  NUTRIMENT_ENERGY_UNIT(offTag: 'nutriment_energy_unit'),
  NUTRIMENT_DATA_PER(offTag: 'nutrition_data_per'),
  NUTRITION_DATA(offTag: 'nutrition_data'),
  NUTRISCORE(offTag: 'nutrition_grade_fr'),
  COMPARED_TO_CATEGORY(offTag: 'compared_to_category'),
  CATEGORIES(offTag: 'categories'),
  CATEGORIES_TAGS(
    offTag: 'categories_tags',
    inLanguagesProductField: ProductField.CATEGORIES_TAGS_IN_LANGUAGES,
  ),
  CATEGORIES_TAGS_IN_LANGUAGES(offTag: 'categories_tags_', isInLanguages: true),
  LABELS(offTag: 'labels'),
  LABELS_TAGS(
    offTag: 'labels_tags',
    inLanguagesProductField: ProductField.LABELS_TAGS_IN_LANGUAGES,
  ),
  LABELS_TAGS_IN_LANGUAGES(offTag: 'labels_tags_', isInLanguages: true),
  PACKAGING(offTag: 'packaging'),
  PACKAGINGS(offTag: 'packagings'),
  PACKAGINGS_COMPLETE(offTag: 'packagings_complete'),
  PACKAGING_TAGS(offTag: 'packaging_tags'),
  PACKAGING_TEXT_IN_LANGUAGES(offTag: 'packaging_text_', isInLanguages: true),
  PACKAGING_TEXT_ALL_LANGUAGES(
    offTag: 'packaging_text_languages',
    inLanguagesProductField: ProductField.PACKAGING_TEXT_IN_LANGUAGES,
    isAllLanguages: true,
  ),
  MISC_TAGS(
    offTag: 'misc_tags',
    inLanguagesProductField: ProductField.MISC_TAGS_IN_LANGUAGES,
  ),
  MISC_TAGS_IN_LANGUAGES(offTag: 'misc_tags_', isInLanguages: true),
  STATES_TAGS(
    offTag: 'states_tags',
    inLanguagesProductField: ProductField.STATES_TAGS_IN_LANGUAGES,
  ),
  STATES_TAGS_IN_LANGUAGES(offTag: 'states_tags_', isInLanguages: true),
  TRACES_TAGS(
    offTag: 'traces_tags',
    inLanguagesProductField: ProductField.TRACES_TAGS_IN_LANGUAGES,
  ),
  TRACES_TAGS_IN_LANGUAGES(offTag: 'traces_tags_', isInLanguages: true),
  TRACES(offTag: 'traces'),
  STORES_TAGS(
    offTag: 'stores_tags',
    inLanguagesProductField: ProductField.STORES_TAGS_IN_LANGUAGES,
  ),
  STORES_TAGS_IN_LANGUAGES(offTag: 'stores_tags_', isInLanguages: true),
  STORES(offTag: 'stores'),
  INGREDIENTS_ANALYSIS_TAGS(
    offTag: 'ingredients_analysis_tags',
    inLanguagesProductField:
        ProductField.INGREDIENTS_ANALYSIS_TAGS_IN_LANGUAGES,
  ),
  INGREDIENTS_ANALYSIS_TAGS_IN_LANGUAGES(
    offTag: 'ingredients_analysis_tags_',
    isInLanguages: true,
  ),
  ALLERGENS(
    offTag: 'allergens_tags',
    inLanguagesProductField: ProductField.ALLERGENS_TAGS_IN_LANGUAGES,
  ),
  ALLERGENS_TAGS_IN_LANGUAGES(offTag: 'allergens_tags_', isInLanguages: true),
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
  EXPIRATION_DATE(offTag: 'expiration_date'),
  OBSOLETE(offTag: 'obsolete'),
  OWNER_FIELDS(offTag: 'owner_fields'),
  OWNER(offTag: 'owner'),
  DATA_QUALITY_TAGS(offTag: 'data_quality_tags'),
  DATA_QUALITY_BUGS_TAGS(offTag: 'data_quality_bugs_tags'),
  DATA_QUALITY_ERRORS_TAGS(offTag: 'data_quality_errors_tags'),
  DATA_QUALITY_INFO_TAGS(offTag: 'data_quality_info_tags'),
  DATA_QUALITY_WARNINGS_TAGS(offTag: 'data_quality_warnings_tags'),

  /// All data as RAW from the server. E.g. packagings are only Strings there.
  RAW(offTag: 'raw'),
  ALL(offTag: '');

  const ProductField({
    required this.offTag,
    final ProductField? inLanguagesProductField,
    this.isInLanguages = false,
    this.isAllLanguages = false,
  }) : _inLanguagesProductField = inLanguagesProductField;

  @override
  final String offTag;

  final ProductField? _inLanguagesProductField;

  /// Is this field an "in languages" field?
  final bool isInLanguages;

  /// Is this field an "all languages" field?
  final bool isAllLanguages;

  /// Returns the corresponding "in languages" field, if relevant.
  ProductField? get inLanguages =>
      isInLanguages ? this : _inLanguagesProductField;

  static List<ProductField> _inLanguagesList = <ProductField>[];
  static List<ProductField> _allLanguagesList = <ProductField>[];

  /// Returns the list of all "in languages" fields.
  static List<ProductField> getInLanguagesList() {
    if (_inLanguagesList.isEmpty) {
      for (final ProductField productField in ProductField.values) {
        if (productField.isInLanguages) {
          _inLanguagesList.add(productField);
        }
      }
    }
    return _inLanguagesList;
  }

  /// Returns the list of all "all languages" fields.
  static List<ProductField> getAllLanguagesList() {
    if (_allLanguagesList.isEmpty) {
      for (final ProductField productField in ProductField.values) {
        if (productField.isAllLanguages) {
          _allLanguagesList.add(productField);
        }
      }
    }
    return _allLanguagesList;
  }
}

/// NOTE: if one of the fields is IN_LANGUAGES and [languages] is empty -
/// the function will throw.
List<String> convertFieldsToStrings(
  List<ProductField> fields,
  List<OpenFoodFactsLanguage> languages,
) {
  final fieldsStrings = <String>[];

  for (final field in fields) {
    if (field.isInLanguages) {
      if (languages.isEmpty) {
        throw ArgumentError(
          'Cannot request in-lang field $field without language',
        );
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
