enum TaxonomyType {
  STATES,
  LANGUAGES,
  LABELS,
  CATEGORIES,
  COUNTRIES,
  INGREDIENTS,
  TRACES,
  ADDITIVES,
  ALLERGENS,
  EMB_CODES
}

extension TaxonomyTypeExtension on TaxonomyType {
  static const Map<TaxonomyType, String> _TAXONOMIES = {
    TaxonomyType.STATES: 'states',
    TaxonomyType.LABELS: 'labels',
    TaxonomyType.CATEGORIES: 'categories',
    TaxonomyType.COUNTRIES: 'countries',
    TaxonomyType.INGREDIENTS: 'ingredients',
    TaxonomyType.TRACES: 'traces',
    TaxonomyType.ADDITIVES: 'additives',
    TaxonomyType.ALLERGENS: 'allergens',
    TaxonomyType.LANGUAGES: 'languages',
    TaxonomyType.EMB_CODES: 'emb_codes',
  };
  String get key => _TAXONOMIES[this] ?? '';
}
