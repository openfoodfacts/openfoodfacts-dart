import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/model/parameter/Page.dart';
import 'package:openfoodfacts/model/parameter/PageSize.dart';
import 'package:openfoodfacts/model/parameter/SortBy.dart';
import 'package:openfoodfacts/utils/AbstractQueryConfiguration.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';

/// Query Configuration for multiple barcodes
class ProductListQueryConfiguration extends AbstractQueryConfiguration {
  final List<String> barcodes;

  /// See [AbstractQueryConfiguration.languages] for
  /// parameter's description.
  ProductListQueryConfiguration(
    this.barcodes, {
    final OpenFoodFactsLanguage? language,
    final List<OpenFoodFactsLanguage> languages = const [],
    final String? lc,
    final String? cc,
    final List<ProductField>? fields,
    int? page,
    int? pageSize,
    SortOption? sortOption,
  })  : assert(barcodes.isNotEmpty),
        super(
          language: language,
          languages: languages,
          lc: lc,
          cc: cc,
          fields: fields,
          additionalParameters:
              _convertToParametersList(page, pageSize, sortOption),
        );

  static List<Parameter> _convertToParametersList(
      int? page, int? pageSize, SortOption? sortOption) {
    final result = <Parameter>[];
    if (page != null) {
      result.add(Page(page: page));
    }
    if (pageSize != null) {
      result.add(PageSize(size: pageSize));
    }
    if (sortOption != null) {
      result.add(SortBy(option: sortOption));
    }
    return result;
  }
}
