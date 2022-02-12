enum TagType {
  STATES,
  LANGUAGES,
  LABELS,
  CATEGORIES,
  COUNTRIES,
  INGREDIENTS,
  TRACES,
  ADDITIVES,
  ALLERGENS,
  PACKAGING,
  EMB_CODES
}

extension TaxonomyTypeExtension on TagType {
  static const Map<TagType, String> _TAXONOMIES = {
    TagType.STATES: 'states',
    TagType.LABELS: 'labels',
    TagType.CATEGORIES: 'categories',
    TagType.COUNTRIES: 'countries',
    TagType.INGREDIENTS: 'ingredients',
    TagType.TRACES: 'traces',
    TagType.ADDITIVES: 'additives',
    TagType.ALLERGENS: 'allergens',
    TagType.PACKAGING: 'packaging',
    TagType.LANGUAGES: 'languages',
    TagType.EMB_CODES: 'emb_codes',
  };
  String get key => _TAXONOMIES[this] ?? '';
}
