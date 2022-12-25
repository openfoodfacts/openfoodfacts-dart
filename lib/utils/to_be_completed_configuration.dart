import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/abstract_query_configuration.dart';
import 'package:openfoodfacts/utils/country_helper.dart';

/// Query Configuration for all the to-be-completed products.
// TODO: deprecated from 2022-08-03; remove when old enough
@Deprecated(
    'Use ProductSearchQueryConfiguration with StatesTagsParameter instead')
class ToBeCompletedQueryConfiguration extends AbstractQueryConfiguration {
  ToBeCompletedQueryConfiguration({
    final OpenFoodFactsLanguage? language,
    final List<OpenFoodFactsLanguage> languages =
        const <OpenFoodFactsLanguage>[],
    final OpenFoodFactsCountry? country,
    final List<ProductField>? fields,
    final int? pageNumber,
    final int? pageSize,
  }) : super(
          language: language,
          languages: languages,
          country: country,
          fields: fields,
          additionalParameters: _convertToParametersList(pageNumber, pageSize),
        );

  static List<Parameter> _convertToParametersList(
    int? page,
    int? pageSize,
  ) {
    final List<Parameter> result = <Parameter>[];
    if (page != null) {
      result.add(PageNumber(page: page));
    }
    if (pageSize != null) {
      result.add(PageSize(size: pageSize));
    }
    return result;
  }

  @override
  Map<String, String> getParametersMap() {
    final Map<String, String> parameters = super.getParametersMap();
    parameters['states_tags'] = 'en:to-be-completed';
    return parameters;
  }

  @override
  String getUriPath() => '/api/v2/search';
}
