import '../model/off_tagged.dart';

/// Possible needed contribute actions.
///
/// cf. [KnowledgePanelActionElement.actions].
enum KnowledgePanelAction implements OffTagged {
  /// Action: add categories.
  addCategories(offTag: 'add_categories'),

  /// Action: add ingredients text.
  addIngredientsText(offTag: 'add_ingredients_text'),

  /// Action: add ingredients image.
  addIngredientsImage(offTag: 'add_ingredients_image'),

  /// Action: add packaging image.
  addPackagingImage(offTag: 'add_packaging_image'),

  /// Action: add packaging text.
  addPackagingText(offTag: 'add_packaging_text'),

  /// Action: add nutrition facts.
  addNutritionFacts(offTag: 'add_nutrition_facts'),

  /// Action: add origins.
  addOrigins(offTag: 'add_origins'),

  /// Action: add stores.
  addStores(offTag: 'add_stores'),

  /// Action: add labels.
  addLabels(offTag: 'add_labels'),

  /// Action: add countries.
  addCountries(offTag: 'add_countries');

  const KnowledgePanelAction({
    required this.offTag,
  });

  @override
  final String offTag;

  /// Returns the first [KnowledgePanelAction] that matches the [offTag].
  static KnowledgePanelAction? fromOffTag(final String? offTag) =>
      OffTagged.fromOffTag(offTag, KnowledgePanelAction.values)
          as KnowledgePanelAction?;
}
