/// States of a [Product]. To be used in search API, with [StatesTagsParameter].
///
/// Provides tags for [State] and its status: completed or to-be-completed.
enum State {
  CHECKED(completedTag: 'en:checked', toBeCompletedTag: 'en:to-be-checked'),
  COMPLETED(
      completedTag: 'en:complete', toBeCompletedTag: 'en:to-be-completed'),
  NUTRITION_FACTS_COMPLETED.completed(tag: 'en:nutrition-facts'),
  INGREDIENTS_COMPLETED.completed(tag: 'en:ingredients'),
  EXPIRATION_DATE_COMPLETED.completed(tag: 'en:expiration-date'),
  PACKAGING_CODE_COMPLETED.completed(tag: 'en:packaging-code'),
  CHARACTERISTICS_COMPLETED.completed(tag: 'en:characteristics'),
  ORIGINS_COMPLETED.completed(tag: 'en:origins'),
  CATEGORIES_COMPLETED.completed(tag: 'en:categories'),
  BRANDS_COMPLETED.completed(tag: 'en:brands'),
  PACKAGING_COMPLETED.completed(tag: 'en:packaging'),
  QUANTITY_COMPLETED.completed(tag: 'en:quantity'),
  PRODUCT_NAME_COMPLETED.completed(tag: 'en:product-name'),
  PHOTOS_VALIDATED.simple(tag: 'en:photos', action: 'validated'),
  PACKAGING_PHOTO_SELECTED.selected(tag: 'en:packaging-photo'),
  NUTRITION_PHOTO_SELECTED.selected(tag: 'en:nutrition-photo'),
  INGREDIENTS_PHOTO_SELECTED.selected(tag: 'en:ingredients-photo'),
  FRONT_PHOTO_SELECTED.selected(tag: 'en:front-photo'),
  PHOTOS_UPLOADED.simple(tag: 'en:photos', action: 'uploaded');

  /// Special case where we need the tag values as we cannot build them.
  const State({
    required this.completedTag,
    required this.toBeCompletedTag,
  });

  /// Simple case where we can build the tag values.
  const State.simple({
    required final String tag,
    required final String action,
  }) : this(
          completedTag: '$tag-$action',
          toBeCompletedTag: '$tag-to-be-$action',
        );

  /// Simple case where we can build the tag values, for 'completed'.
  const State.completed({required final String tag})
      : this.simple(tag: tag, action: 'completed');

  /// Simple case where we can build the tag values, for 'selected'.
  const State.selected({required final String tag})
      : this.simple(tag: tag, action: 'selected');

  final String completedTag;
  final String toBeCompletedTag;
}
