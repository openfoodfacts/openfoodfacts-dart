import '../model/off_tagged.dart';

/// Taxonomy Name for Elastic Search API.
///
/// cf. https://github.com/openfoodfacts/search-a-licious/blob/main/data/config/openfoodfacts.yml
enum TaxonomyName implements OffTagged {
  category(offTag: 'category'),
  label(offTag: 'label'),
  additive(offTag: 'additive'),
  allergen(offTag: 'allergen'),
  aminoAcid(offTag: 'amino_acid'),
  country(offTag: 'country'),
  dataQuality(offTag: 'data_quality'),
  foodGroup(offTag: 'food_group'),
  improvement(offTag: 'improvement'),
  ingredient(offTag: 'ingredient'),
  ingredientAnalysis(offTag: 'ingredients_analysis'),
  ingredientProcessing(offTag: 'ingredients_processing'),
  language(offTag: 'language'),
  mineral(offTag: 'mineral'),
  misc(offTag: 'misc'),
  novaGroup(offTag: 'nova_group'),
  nucleotide(offTag: 'nucleotide'),
  nutrient(offTag: 'nutrient'),
  origin(offTag: 'origin'),
  otherNutritionalSubstance(offTag: 'other_nutritional_substance'),
  packagingMaterial(offTag: 'packaging_material'),
  packagingRecycling(offTag: 'packaging_recycling'),
  packagingShape(offTag: 'packaging_shape'),
  periodsAfterOpening(offTag: 'periods_after_opening'),
  preservation(offTag: 'preservation'),
  state(offTag: 'state'),
  vitamin(offTag: 'vitamin'),
  brand(offTag: 'brand');

  const TaxonomyName({
    required this.offTag,
  });

  @override
  final String offTag;

  /// Returns the [TaxonomyName] that matches the [offTag].
  static TaxonomyName? fromOffTag(String? offTag) =>
      OffTagged.fromOffTag(offTag, TaxonomyName.values) as TaxonomyName?;
}
