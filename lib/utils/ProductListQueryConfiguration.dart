import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/AbstractQueryConfiguration.dart';
import 'package:openfoodfacts/utils/CountryHelper.dart';

/// Query Configuration for multiple barcodes
class ProductListQueryConfiguration extends AbstractQueryConfiguration {
  final List<String> barcodes;

  /// See [AbstractQueryConfiguration.languages] for
  /// parameter's description.
  ProductListQueryConfiguration(
    this.barcodes, {
    final OpenFoodFactsLanguage? language,
    final List<OpenFoodFactsLanguage> languages = const [],
    @Deprecated('Use parameters language or languages instead')
        final String? lc,
    @Deprecated('Use parameter country instead') final String? cc,
    final OpenFoodFactsCountry? country,
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
          country: country,
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
