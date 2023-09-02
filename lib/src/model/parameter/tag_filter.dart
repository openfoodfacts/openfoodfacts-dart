import '../../interface/parameter.dart';
import '../off_tagged.dart';

/// Filter types for advanced search parameters
enum TagFilterType implements OffTagged {
  BRANDS(offTag: 'brands'),
  CATEGORIES(offTag: 'categories'),
  PACKAGING(offTag: 'packaging'),
  LABELS(offTag: 'labels'),
  ORIGINS(offTag: 'origins'),
  MANUFACTURING_PLACES(offTag: 'manufacturing_places'),
  EMB_CODES(offTag: 'emb_codes'),
  PURCHASE_PLACES(offTag: 'purchase_places'),
  STORES(offTag: 'stores'),
  COUNTRIES(offTag: 'countries'),
  ADDITIVES(offTag: 'additives'),
  ALLERGENS(offTag: 'allergens'),
  TRACES(offTag: 'traces'),
  NUTRITION_GRADES(offTag: 'nutrition_grades'),
  STATES(offTag: 'states'),
  INGREDIENTS(offTag: 'ingredients'),
  NOVA_GROUPS(offTag: 'nova_groups'),
  LANGUAGES(offTag: 'languages'),

  /// User who created this product
  CREATOR(offTag: 'creator'),
  EDITORS(offTag: 'editors'),

  /// User who photographed for this product
  PHOTOGRAPHERS(offTag: 'photographers'),

  /// Users who contributed to this product
  INFORMERS(offTag: 'informers'),
  LANG(offTag: 'lang');

  const TagFilterType({
    required this.offTag,
  });

  @override
  final String offTag;
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
          tagType: tagFilterType.offTag,
          contains: contains,
          tagName: tagName,
        );
}
