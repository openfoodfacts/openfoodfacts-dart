import '../../interface/parameter.dart';

/// Sort search API parameter
class SortBy extends Parameter {
  static const Map<SortOption, String> _VALUES = {
    SortOption.PRODUCT_NAME: 'product_name',
    SortOption.CREATED: 'created_t',
    SortOption.EDIT: 'last_modified_t',
    SortOption.POPULARITY: 'unique_scans_n',
    SortOption.NOTHING: 'nothing',
    SortOption.ECOSCORE: 'ecoscore_score',
    SortOption.NUTRISCORE: 'nutriscore_score',
  };

  @override
  String getName() => 'sort_by';

  @override
  String getValue() => _VALUES[option] ?? 'unique_scans_n';

  final SortOption? option;

  const SortBy({required this.option});
}

/// Possible sort options for search API
enum SortOption {
  POPULARITY,
  PRODUCT_NAME,
  CREATED,
  EDIT,
  NOTHING,
  ECOSCORE,
  NUTRISCORE,
}
