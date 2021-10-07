import 'package:openfoodfacts/interface/JsonObject.dart';
import 'package:openfoodfacts/utils/TaxonomyType.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';

/// Abstract query configuration for taxonomies.
///
/// The type parameter "T" is the JsonObject that represents the Taxonomy (i.e.
/// [Category]) and the type parameter "F" is the type enum that goes with that
/// taxonomy (i.e. [CategoryType]).
///
/// See also [OpenFoodAPIClient.getTaxonomy], which takes this kind of query.
///
/// Individual Taxonomies should implement a concrete subclass of this class to
/// allow creating of the result data from json (See
/// [CategoryQueryConfiguration] for an example).
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

  /// The country code for this query, if any.
  final String? cc;

  /// The desired taxonomy fields to retrieve. If empty, retrieve all fields.
  final List<F> fields;

  /// The tags to request.
  ///
  /// If empty, no results will be returned.
  final List<String> tags;

  /// The desired taxonomy fields to retrieve. If empty, retrieve all fields.
  final bool includeChildren;

  /// Additional parameters to add the to query.
  final List<Parameter> additionalParameters;

  /// The type of taxonomy that this query should request.
  final TaxonomyType taxonomyType;

  /// Allows subclasses to create a [TaxonomyQueryConfiguration] from the
  /// supplied parameters.
  TaxonomyQueryConfiguration(
    this.taxonomyType,
    this.tags, {
    List<OpenFoodFactsLanguage>? languages,
    this.cc,
    this.includeChildren = false,
    this.fields = const [],
    this.additionalParameters = const [],
  }) : languages = languages ??
            OpenFoodAPIConfiguration.globalLanguages ??
            const <OpenFoodFactsLanguage>[];

  /// Returns the corresponding API URI parameter map, including
  /// [additionalParameters].
  Map<String, String> getParametersMap() {
    final Map<String, String> result = {};

    result['type'] = taxonomyType.key;
    result['tags'] = tags.join(',');
    result['include_children'] = includeChildren ? '1' : '0';

    if (languages.isNotEmpty) {
      result.putIfAbsent('lc',
          () => languages.map<String>((language) => language.code).join(','));
    }

    result.putIfAbsent('cc', () => cc ?? OpenFoodAPIConfiguration.globalCC!);

    if (fields.isNotEmpty) {
      final Iterable<String> fieldsStrings = convertFieldsToStrings(fields);
      result.putIfAbsent('fields', () => fieldsStrings.join(','));
    }

    for (final parameter in additionalParameters) {
      result.putIfAbsent(parameter.getName(), () => parameter.getValue());
    }
    return result;
  }

  /// Returns the set of fields to ignore if specified in the [fields] parameter.
  ///
  /// This typically includes the `ALL` field, and any others that have a meta
  /// meaning that shouldn't be requested directly.
  Set<F> get ignoredFields => <F>{};

  /// Creates a map of the correct taxonomy type from the raw JSON data.
  ///
  /// Subclasses must implement this to return concrete taxonomy objects.
  Map<String, T> createFromJson(dynamic jsonData);

  /// Converts the given list of fields to their corresponding query string
  /// values.
  Iterable<String> convertFieldsToStrings(Iterable<F> fields);
}
