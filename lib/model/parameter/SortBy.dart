import 'package:openfoodfacts/interface/Parameter.dart';

/// Sort search API parameter
class SortBy extends Parameter {
  static const Map<SortOption, String> _VALUES = {
    SortOption.PRODUCT_NAME: 'product_name',
    SortOption.CREATED: 'created_t',
    SortOption.EDIT: 'last_modified_t',
    SortOption.POPULARITY: 'unique_scans_n',
    SortOption.NOTHING: 'nothing',
  };

  @override
  String getName() => 'sort_by';

  @override
  String getValue() => _VALUES[option] ?? 'unique_scans_n';

  final SortOption? option;

  const SortBy({this.option});
}

/// Possible sort options for search API
enum SortOption {
  POPULARITY,
  PRODUCT_NAME,
  CREATED,
  EDIT,
  NOTHING,
}
