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
  EMB_CODES
}

extension TagTypeExtension on TagType {
  static const Map<TagType, String> _TAGS = {
    TagType.STATES: 'states',
    TagType.LABELS: 'labels',
    TagType.CATEGORIES: 'categories',
    TagType.COUNTRIES: 'countries',
    TagType.INGREDIENTS: 'ingredients',
    TagType.TRACES: 'traces',
    TagType.ADDITIVES: 'additives',
    TagType.ALLERGENS: 'allergens',
    TagType.LANGUAGES: 'languages',
    TagType.EMB_CODES: 'emb_codes',
  };
  String get key => _TAGS[this] ?? '';
}
