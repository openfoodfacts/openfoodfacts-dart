enum ProductField {
  BARCODE,
  NAME,
  GENERIC_NAME,
  BRANDS,
  BRANDS_TAGS,
  COUNTRIES,
  COUNTRIES_TAGS,
  LANGUAGE,
  QUANTITY,
  SERVING_SIZE,
  PACKAGING_QUANTITY,
  FRONT_IMAGE,
  SELECTED_IMAGE,
  IMAGES,
  INGREDIENTS,
  NUTRIMENTS,
  ADDITIVES,
  NUTRIENT_LEVELS,
  INGREDIENTS_TEXT,
  NUTRIMENT_ENERGY_UNIT,
  NUTRIMENT_DATA_PER,
  NUTRISCORE,
  CATEGORIES,
  CATEGORIES_TAGS,
  CATEGORIES_TAGS_TRANSLATED,
  LABELS_TAGS,
  LABELS_TAGS_TRANSLATED,
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
  String get key {
    switch (this) {
      case ProductField.BARCODE:
        return 'code';
      case ProductField.NAME:
        return 'product_name';
      case ProductField.GENERIC_NAME:
        return 'generic_name';
      case ProductField.BRANDS:
        return 'brands';
      case ProductField.BRANDS_TAGS:
        return 'brands_tags';
      case ProductField.COUNTRIES:
        return 'countries';
      case ProductField.COUNTRIES_TAGS:
        return 'countries_tags';
      case ProductField.LANGUAGE:
        return 'lang';
      case ProductField.QUANTITY:
        return 'quantity';
      case ProductField.SERVING_SIZE:
        return 'serving_size';
      case ProductField.PACKAGING_QUANTITY:
        return 'product_quantity';
      case ProductField.FRONT_IMAGE:
        return 'image_small_url';
      case ProductField.SELECTED_IMAGE:
        return 'selected_images';
      case ProductField.IMAGES:
        return 'images';
      case ProductField.INGREDIENTS:
        return 'ingredients';
      case ProductField.NUTRIMENTS:
        return 'nutriments';
      case ProductField.ADDITIVES:
        return 'additives_tags';
      case ProductField.NUTRIENT_LEVELS:
        return 'nutrient_levels';
      case ProductField.INGREDIENTS_TEXT:
        return 'ingredients_text';
      case ProductField.NUTRIMENT_ENERGY_UNIT:
        return 'nutriment_energy_unit';
      case ProductField.NUTRIMENT_DATA_PER:
        return 'nutrition_data_per';
      case ProductField.NUTRISCORE:
        return 'nutrition_grade_fr';
      case ProductField.CATEGORIES:
        return 'categories';
      case ProductField.CATEGORIES_TAGS:
        return 'categories_tags';
      case ProductField.CATEGORIES_TAGS_TRANSLATED:
        return 'categories_tags_';
      case ProductField.LABELS_TAGS:
        return 'labels_tags';
      case ProductField.LABELS_TAGS_TRANSLATED:
        return 'labels_tags_';
      case ProductField.MISC_TAGS:
        return 'misc';
      case ProductField.STATES_TAGS:
        return 'states_tags';
      case ProductField.TRACES_TAGS:
        return 'traces_tags';
      case ProductField.INGREDIENTS_ANALYSIS_TAGS:
        return 'ingredients_analysis_tags';
      case ProductField.ALLERGENS:
        return 'allergens_tags';
      case ProductField.ENVIRONMENT_IMPACT_LEVELS:
        return 'environment_impact_level_tags';
      case ProductField.ATTRIBUTE_GROUPS:
        return 'attribute_groups';
      case ProductField.ECOSCORE_GRADE:
        return 'ecoscore_grade';
      case ProductField.ECOSCORE_SCORE:
        return 'ecoscore_score';
      case ProductField.ECOSCORE_DATA:
        return 'ecoscore_data';
      default:
        return '';
    }
  }
}
