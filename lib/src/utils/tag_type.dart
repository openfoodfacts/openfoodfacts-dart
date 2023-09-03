import '../model/off_tagged.dart';

enum TagType implements OffTagged {
  STATES(offTag: 'states'),
  LANGUAGES(offTag: 'languages'),
  LABELS(offTag: 'labels'),
  CATEGORIES(offTag: 'categories'),
  COUNTRIES(offTag: 'countries'),
  INGREDIENTS(offTag: 'ingredients'),
  TRACES(offTag: 'traces'),
  ADDITIVES(offTag: 'additives'),
  ALLERGENS(offTag: 'allergens'),
  PACKAGING(offTag: 'packaging'),
  ORIGINS(offTag: 'origins'),
  PACKAGING_SHAPES(offTag: 'packaging_shapes'),
  PACKAGING_MATERIALS(offTag: 'packaging_materials'),
  PACKAGING_RECYCLING(offTag: 'packaging_recycling'),
  NOVA(offTag: 'nova_groups'),
  EMB_CODES(offTag: 'emb_codes');

  const TagType({
    required this.offTag,
  });

  @override
  final String offTag;

  /// Returns the first [TagType] that matches the [offTag].
  static TagType? fromOffTag(final String? offTag) =>
      OffTagged.fromOffTag(offTag, TagType.values) as TagType?;
}
