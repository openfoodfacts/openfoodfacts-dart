import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/abstract_query_configuration.dart';
import 'package:openfoodfacts/utils/country_helper.dart';

/// Query Configuration for multiple barcodes
// TODO: deprecated from 2022-08-03; remove when old enough
@Deprecated('Use ProductSearchQueryConfiguration with Barcodes instead')
class ProductListQueryConfiguration extends AbstractQueryConfiguration {
  final List<String> barcodes;

  /// See [AbstractQueryConfiguration.languages] for
  /// parameter's description.
  ProductListQueryConfiguration(
    this.barcodes, {
    final OpenFoodFactsLanguage? language,
    final List<OpenFoodFactsLanguage> languages = const [],
    final OpenFoodFactsCountry? country,
    final List<ProductField>? fields,
    int? page,
    int? pageSize,
    SortOption? sortOption,
  })  : assert(barcodes.isNotEmpty),
        super(
          language: language,
          languages: languages,
          country: country,
          fields: fields,
          additionalParameters:
              _convertToParametersList(page, pageSize, sortOption),
        );

  static List<Parameter> _convertToParametersList(
      int? page, int? pageSize, SortOption? sortOption) {
    final result = <Parameter>[];
    if (page != null) {
      result.add(PageNumber(page: page));
    }
    if (pageSize != null) {
      result.add(PageSize(size: pageSize));
    }
    if (sortOption != null) {
      result.add(SortBy(option: sortOption));
    }
    return result;
  }

  @override
  Map<String, String> getParametersMap() {
    final Map<String, String> result = super.getParametersMap();

    result['code'] = barcodes.join(',');

    return result;
  }

  @override
  String getUriPath() => 'api/v2/search/';
}
