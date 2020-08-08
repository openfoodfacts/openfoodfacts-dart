enum ProductField {
  BARCODE,
  NAME,
  GENERIC_NAME,
  BRANDS,
  BRANDS_TAGS,
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
  ALL
}

extension ProductFieldExtension on ProductField {
  String get key {
    switch (this) {
      case ProductField.BARCODE:
        return "code";
        break;
      case ProductField.NAME:
        return "product_name";
        break;
      case ProductField.GENERIC_NAME:
        return "generic_name";
        break;
      case ProductField.BRANDS:
        return "brands";
        break;
      case ProductField.BRANDS_TAGS:
        return "brands_tags";
        break;
      case ProductField.LANGUAGE:
        return "lang";
        break;
      case ProductField.QUANTITY:
        return "quantity";
        break;
      case ProductField.SERVING_SIZE:
        return "serving_size";
        break;
      case ProductField.PACKAGING_QUANTITY:
        return "product_quantity";
        break;
      case ProductField.FRONT_IMAGE:
        return "image_small_url";
        break;
      case ProductField.SELECTED_IMAGE:
        return "selected_images";
        break;
      case ProductField.IMAGES:
        return "images";
        break;
      case ProductField.INGREDIENTS:
        return "ingredients";
        break;
      case ProductField.NUTRIMENTS:
        return "nutriments";
        break;
      case ProductField.ADDITIVES:
        return "additives_tags";
        break;
      case ProductField.NUTRIENT_LEVELS:
        return "nutrient_levels";
        break;
      case ProductField.INGREDIENTS_TEXT:
        return "ingredients_text";
        break;
      case ProductField.NUTRIMENT_ENERGY_UNIT:
        return "nutriment_energy_unit";
        break;
      case ProductField.NUTRIMENT_DATA_PER:
        return "nutrition_data_per";
        break;
      case ProductField.NUTRISCORE:
        return "nutrition_grade_fr";
        break;
      case ProductField.CATEGORIES:
        return "categories";
        break;
      case ProductField.CATEGORIES_TAGS:
        return "categories_tags";
        break;
      case ProductField.CATEGORIES_TAGS_TRANSLATED:
        return "categories_tags_";
        break;
      case ProductField.LABELS_TAGS:
        return "labels_tags";
        break;
      case ProductField.LABELS_TAGS_TRANSLATED:
        return "labels_tags_";
        break;
      case ProductField.MISC_TAGS:
        return "misc";
        break;
      case ProductField.STATES_TAGS:
        return "states_tags";
        break;
      case ProductField.TRACES_TAGS:
        return "traces_tags";
        break;
      case ProductField.INGREDIENTS_ANALYSIS_TAGS:
        return "ingredients_analysis_tags";
        break;
      case ProductField.ALLERGENS:
        return "allergens_tags";
        break;
      case ProductField.ENVIRONMENT_IMPACT_LEVELS:
        return "environment_impact_level_tags";
        break;
      default:
        return "";
        break;
    }
  }
}
