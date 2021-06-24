enum TagType {
  STATES,
  LANGUAGES,
  LABELS,
  CATEGORIES,
  COUNTRIES,
  INGREDIENTS,
  TRACES,
  ADDITIVES,
  ALLERGENS
}

extension TagTypeExtension on TagType {
  String get key {
    switch (this) {
      case TagType.STATES:
        return 'states';
      case TagType.LABELS:
        return 'labels';
      case TagType.CATEGORIES:
        return 'categories';
      case TagType.COUNTRIES:
        return 'countries';
      case TagType.INGREDIENTS:
        return 'ingredients';
      case TagType.TRACES:
        return 'traces';
      case TagType.ADDITIVES:
        return 'additives';
      case TagType.ALLERGENS:
        return 'allergens';
      case TagType.LANGUAGES:
        return 'languages';
      default:
        return '';
    }
  }
}
