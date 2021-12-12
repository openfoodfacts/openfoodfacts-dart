import 'package:openfoodfacts/interface/Parameter.dart';

/// Filter types for advanced search parameters
enum TagFilterType {
  BRANDS,
  CATEGORIES,
  PACKAGING,
  LABELS,
  ORIGINS,
  MANUFACTURING_PLACES,
  EMB_CODES,
  PURCHASE_PLACES,
  STORES,
  COUNTRIES,
  ADDITIVES,
  ALLERGENS,
  TRACES,
  NUTRITION_GRADES,
  STATES,
  INGREDIENTS,
  NOVA_GROUPS,
  LANGUAGES,
  CREATOR,
  EDITORS,
  LANG,
}

extension TagFilterTypeExtension on TagFilterType {
  static const Map<TagFilterType, String> _map = <TagFilterType, String>{
    TagFilterType.BRANDS: 'brands',
    TagFilterType.CATEGORIES: 'categories',
    TagFilterType.PACKAGING: 'packaging',
    TagFilterType.LABELS: 'labels',
    TagFilterType.ORIGINS: 'origins',
    TagFilterType.MANUFACTURING_PLACES: 'manufacturing_places',
    TagFilterType.EMB_CODES: 'emb_codes',
    TagFilterType.PURCHASE_PLACES: 'purchase_places',
    TagFilterType.STORES: 'stores',
    TagFilterType.COUNTRIES: 'countries',
    TagFilterType.ADDITIVES: 'additives',
    TagFilterType.ALLERGENS: 'allergens',
    TagFilterType.TRACES: 'traces',
    TagFilterType.NUTRITION_GRADES: 'nutrition_grades',
    TagFilterType.STATES: 'states',
    TagFilterType.INGREDIENTS: 'ingredients',
    TagFilterType.NOVA_GROUPS: 'nova_groups',
    TagFilterType.LANGUAGES: 'languages',
    TagFilterType.CREATOR: 'creator',
    TagFilterType.EDITORS: 'editors',
    TagFilterType.LANG: 'lang',
  };

  String get key => _map[this]!;
}

/// Tag filter ("LIST contains/without ITEM") search API parameter
///
/// Eg. 'nutrition_grades' contains 'A'
class TagFilter extends Parameter {
  // actually not used
  @override
  String getName() => '';

  /// Tag type (e.g. 'nutrition_grades')
  String getTagType() => tagType;

  /// "Contains - Yes/No?" parameter string
  String getContains() => contains ? 'contains' : 'without';

  /// Tag value (e.g. 'A')
  String getTagName() => tagName;

  // actually not used
  @override
  String getValue() => '';

  final String tagType;
  final bool contains;
  final String tagName;

// TODO: deprecated from 2021-12-12 (#307); remove when old enough
  @Deprecated('Use TagFilter.fromType instead')
  const TagFilter({
    required final String tagType,
    required final bool contains,
    required final String tagName,
  }) : this._(
          tagType: tagType,
          contains: contains,
          tagName: tagName,
        );

  const TagFilter._({
    required this.tagType,
    required this.contains,
    required this.tagName,
  });

  TagFilter.fromType({
    required final TagFilterType tagFilterType,
    required final String tagName,
    final bool contains = true,
  }) : this._(
          tagType: tagFilterType.key,
          contains: contains,
          tagName: tagName,
        );
}
