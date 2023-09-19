import '../interface/json_object.dart';
import '../interface/parameter.dart';
import 'country_helper.dart';
import 'language_helper.dart';
import 'tag_type.dart';
import 'open_food_api_configuration.dart';
import 'uri_helper.dart';

/// Abstract query configuration for taxonomies.
///
/// The type parameter "T" is the JsonObject that represents the Taxonomy (i.e.
/// [TaxonomyCategory]) and the type parameter "F" is the type enum that goes with that
/// taxonomy (i.e. [CategoryType]).
///
/// See also [OpenFoodAPIClient.getTaxonomy], which takes this kind of query.
///
/// Individual Taxonomies should implement a concrete subclass of this class to
/// allow creating of the result data from json (See
/// [TaxonomyCategoryQueryConfiguration] for an example).
abstract class TaxonomyQueryConfiguration<T extends JsonObject,
    F extends Enum> {
  /// The [languages] field should be used to set the desired taxonomy
  /// language(s) when a taxonomy is requested with fields in one or more
  /// languages. The taxonomy's text fields should be filled with the requested
  /// languages in a prioritized manner based on the order supplied.
  ///
  /// Please see https://github.com/openfoodfacts/openfoodfacts-dart/blob/master/DOCUMENTATION.md#about-languages-mechanics
  /// for detailed explanation on how to work with multiple languages.
  final List<OpenFoodFactsLanguage> languages;

  /// The country for this query, if any.
  final OpenFoodFactsCountry? country;

  /// The desired taxonomy fields to retrieve. If empty, retrieve all fields.
  final List<F> fields;

  /// The tags to request.
  ///
  /// If empty, no results will be returned. This field is ignored if
  /// [TaxonomyQueryConfiguration.roots] is used to create the configuration.
  final List<String> tags;

  /// If true, include the children of the requested tag in the results.
  ///
  /// Defaults to false.
  final bool includeChildren;

  /// Additional parameters to add the to query.
  final List<Parameter> additionalParameters;

  /// The type of tags that this query should request a taxonomy for.
  final TagType tagType;

  // True if created via TaxonomyQueryConfiguration.roots.
  final bool _isRootConfiguration;

  /// Allows subclasses to create a [TaxonomyQueryConfiguration] from the
  /// supplied parameters.
  TaxonomyQueryConfiguration(
    this.tagType,
    this.tags, {
    List<OpenFoodFactsLanguage>? languages,
    this.country,
    this.includeChildren = false,
    this.fields = const [],
    this.additionalParameters = const [],
  })  : _isRootConfiguration = false,
        languages = languages ??
            OpenFoodAPIConfiguration.globalLanguages ??
            const <OpenFoodFactsLanguage>[];

  TaxonomyQueryConfiguration.roots(
    this.tagType, {
    List<OpenFoodFactsLanguage>? languages,
    this.country,
    this.includeChildren = false,
    this.fields = const [],
    this.additionalParameters = const [],
  })  : _isRootConfiguration = true,
        tags = const <String>[],
        languages = languages ??
            OpenFoodAPIConfiguration.globalLanguages ??
            const <OpenFoodFactsLanguage>[];

  /// Returns the corresponding API URI parameter map, including
  /// [additionalParameters].
  Map<String, String> getParametersMap() {
    final Map<String, String> result = {};

    result['tagtype'] = tagType.offTag;
    if (_isRootConfiguration) {
      result['include_root_entries'] = '1';
    } else {
      if (tags.isNotEmpty) {
        result['tags'] = tags.join(',');
      }
    }
    result['include_children'] = includeChildren ? '1' : '0';

    if (languages.isNotEmpty) {
      result.putIfAbsent('lc',
          () => languages.map<String>((language) => language.offTag).join(','));
    }

    result.putIfAbsent('cc',
        () => OpenFoodAPIConfiguration.computeCountryCode(country, null)!);

    if (fields.isNotEmpty) {
      final Iterable<String> fieldsStrings = convertFieldsToStrings(fields);
      result.putIfAbsent('fields', () => fieldsStrings.join(','));
    }

    for (final parameter in additionalParameters) {
      result.putIfAbsent(parameter.getName(), () => parameter.getValue());
    }
    return result;
  }

  Uri getPostUri(final UriProductHelper uriHelper) => uriHelper.getPostUri(
        path: 'api/v2/taxonomy',
      );

  /// Returns the set of fields to ignore if specified in the [fields] parameter.
  ///
  /// This typically includes the `ALL` field, and any others that have a meta
  /// meaning that shouldn't be requested directly.
  Set<F> get ignoredFields => <F>{};

  /// Creates a map of the correct taxonomy type from the raw JSON data.
  ///
  /// Subclasses must implement this to return concrete taxonomy objects.
  Map<String, T> convertResults(dynamic jsonData);

  /// Converts the given list of fields to their corresponding query string
  /// values.
  Iterable<String> convertFieldsToStrings(Iterable<F> fields);
}
