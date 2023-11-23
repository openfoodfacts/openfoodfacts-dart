import '../model/off_tagged.dart';

/// Taxonomy Name for Elastic Search API.
enum TaxonomyName implements OffTagged {
  // TODO(monsieurtanuki): add other values when available.
  category(offTag: 'category');

  const TaxonomyName({
    required this.offTag,
  });

  @override
  final String offTag;

  /// Returns the [TaxonomyName] that matches the [offTag].
  static TaxonomyName? fromOffTag(String? offTag) =>
      OffTagged.fromOffTag(offTag, TaxonomyName.values) as TaxonomyName?;
}
