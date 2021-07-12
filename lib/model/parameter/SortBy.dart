import 'package:openfoodfacts/interface/Parameter.dart';

/// Sort search API parameter
class SortBy extends Parameter {
  @override
  String getName() => 'sort_by';

  @override
  String getValue() {
    switch (option) {
      case SortOption.PRODUCT_NAME:
        return 'product_name';

      case SortOption.CREATED:
        return 'created_t';

      case SortOption.EDIT:
        return 'last_modified_t';

      case SortOption.POPULARITY:
      default:
        return 'unique_scans_n';
    }
  }

  final SortOption? option;

  const SortBy({this.option});
}

/// Possible sort options for search API
enum SortOption {
  POPULARITY,
  PRODUCT_NAME,
  CREATED,
  EDIT,
}
