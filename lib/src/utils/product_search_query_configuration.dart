import 'abstract_query_configuration.dart';
import 'product_fields.dart';
import 'product_query_configurations.dart';
import '../interface/parameter.dart';

/// Query Configuration for search parameters
class ProductSearchQueryConfiguration extends AbstractQueryConfiguration {
  /// See [AbstractQueryConfiguration.languages] for
  /// parameter's description.
  ProductSearchQueryConfiguration({
    super.language,
    super.languages,
    super.country,
    super.fields,
    required List<Parameter> parametersList,
    required this.version,
  }) : super(
          additionalParameters: parametersList,
        );

  final ProductQueryVersion version;

  List<String> getFieldsKeys() {
    List<String> result = [];

    for (ProductField field in fields!) {
      result.add(field.offTag);
    }

    return result;
  }

  @override
  Map<String, String> getParametersMap() {
    final Map<String, String> result = super.getParametersMap();
    result.putIfAbsent('search_terms', () => '');
    // explicit json output
    result.putIfAbsent('json', () => '1');
    result.putIfAbsent('api_version', () => '${version.version}');
    return result;
  }

  @override
  String getUriPath() => '/cgi/search.pl';
}
