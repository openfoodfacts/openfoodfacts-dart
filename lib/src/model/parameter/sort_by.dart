import '../off_tagged.dart';
import '../../interface/parameter.dart';

/// Sort search API parameter
class SortBy extends Parameter {
  @override
  String getName() => 'sort_by';

  @override
  String getValue() => (option ?? SortOption.POPULARITY).offTag;

  final SortOption? option;

  const SortBy({required this.option});
}

/// Possible sort options for search API
enum SortOption implements OffTagged {
  POPULARITY(offTag: 'unique_scans_n'),
  PRODUCT_NAME(offTag: 'product_name'),
  CREATED(offTag: 'created_t'),
  EDIT(offTag: 'last_modified_t'),
  NOTHING(offTag: 'nothing'),
  ECOSCORE(offTag: 'ecoscore_score'),
  NUTRISCORE(offTag: 'nutriscore_score');

  const SortOption({required this.offTag});

  @override
  final String offTag;
}
