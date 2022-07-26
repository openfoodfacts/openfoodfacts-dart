/// States of a [Product]. To be used in search API, with [StatesTagsParameter].
enum State {
  CHECKED,
  COMPLETED,
  NUTRITION_FACTS_COMPLETED,
  INGREDIENTS_COMPLETED,
  EXPIRATION_DATE_COMPLETED,
  PACKAGING_CODE_COMPLETED,
  CHARACTERISTICS_COMPLETED,
  ORIGINS_COMPLETED,
  CATEGORIES_COMPLETED,
  BRANDS_COMPLETED,
  PACKAGING_COMPLETED,
  QUANTITY_COMPLETED,
  PRODUCT_NAME_COMPLETED,
  PHOTOS_VALIDATED,
  PACKAGING_PHOTO_SELECTED,
  NUTRITION_PHOTO_SELECTED,
  INGREDIENTS_PHOTO_SELECTED,
  FRONT_PHOTO_SELECTED,
  PHOTOS_UPLOADED,
}

/// Provides tags for [State] and its status: completed or to-be-completed.
extension StateExtension on State {
  static const Map<State, String> _completed = <State, String>{
    State.CHECKED: 'en:checked',
    State.COMPLETED: 'en:complete',
    State.NUTRITION_FACTS_COMPLETED: 'en:nutrition-facts-completed',
    State.INGREDIENTS_COMPLETED: 'en:ingredients-completed',
    State.EXPIRATION_DATE_COMPLETED: 'en:expiration-date-completed',
    State.PACKAGING_CODE_COMPLETED: 'en:packaging-code-completed',
    State.CHARACTERISTICS_COMPLETED: 'en:characteristics-completed',
    State.ORIGINS_COMPLETED: 'en:origins-completed',
    State.CATEGORIES_COMPLETED: 'en:categories-completed',
    State.BRANDS_COMPLETED: 'en:brands-completed',
    State.PACKAGING_COMPLETED: 'en:packaging-completed',
    State.QUANTITY_COMPLETED: 'en:quantity-completed',
    State.PRODUCT_NAME_COMPLETED: 'en:product-name-completed',
    State.PHOTOS_VALIDATED: 'en:photos-validated',
    State.PACKAGING_PHOTO_SELECTED: 'en:packaging-photo-selected',
    State.NUTRITION_PHOTO_SELECTED: 'en:nutrition-photo-selected',
    State.INGREDIENTS_PHOTO_SELECTED: 'en:ingredients-photo-selected',
    State.FRONT_PHOTO_SELECTED: 'en:front-photo-selected',
    State.PHOTOS_UPLOADED: 'en:photos-uploaded',
  };
  static const Map<State, String> _toBeCompleted = <State, String>{
    State.CHECKED: 'en:to-be-checked',
    State.COMPLETED: 'en:to-be-completed',
    State.NUTRITION_FACTS_COMPLETED: 'en:nutrition-facts-to-be-completed',
    State.INGREDIENTS_COMPLETED: 'en:ingredients-to-be-completed',
    State.EXPIRATION_DATE_COMPLETED: 'en:expiration-date-to-be-completed',
    State.PACKAGING_CODE_COMPLETED: 'en:packaging-code-to-be-completed',
    State.CHARACTERISTICS_COMPLETED: 'en:characteristics-to-be-completed',
    State.ORIGINS_COMPLETED: 'en:origins-to-be-completed',
    State.CATEGORIES_COMPLETED: 'en:categories-to-be-completed',
    State.BRANDS_COMPLETED: 'en:brands-to-be-completed',
    State.PACKAGING_COMPLETED: 'en:packaging-to-be-completed',
    State.QUANTITY_COMPLETED: 'en:quantity-to-be-completed',
    State.PRODUCT_NAME_COMPLETED: 'en:product-name-to-be-completed',
    State.PHOTOS_VALIDATED: 'en:photos-to-be-validated',
    State.PACKAGING_PHOTO_SELECTED: 'en:packaging-photo-to-be-selected',
    State.NUTRITION_PHOTO_SELECTED: 'en:nutrition-photo-to-be-selected',
    State.INGREDIENTS_PHOTO_SELECTED: 'en:ingredients-photo-to-be-selected',
    State.FRONT_PHOTO_SELECTED: 'en:front-photo-to-be-selected',
    State.PHOTOS_UPLOADED: 'en:photos-to-be-uploaded',
  };

  String get completedTag => _completed[this]!;

  String get toBeCompletedTag => _toBeCompleted[this]!;
}
