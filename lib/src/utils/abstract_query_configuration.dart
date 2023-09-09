import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../interface/parameter.dart';
import '../model/parameter/tag_filter.dart';
import '../model/user.dart';
import 'country_helper.dart';
import 'http_helper.dart';
import 'language_helper.dart';
import 'open_food_api_configuration.dart';
import 'product_fields.dart';
import 'uri_helper.dart';

/// Abstract Query Configuration, that helps build API URI
abstract class AbstractQueryConfiguration {
  /// Use to set the desired product language. Cannot be used together with
  /// the [languages] field.
  /// See also the comment to the [languages] field.
  OpenFoodFactsLanguage? language;

  /// The [languages] field should be used when a product is requested
  /// with fields in multiple languages. I.e.:
  /// - when some of the `IN_LANGUAGES` fields are used
  ///   (e.g. [ProductField.NAME_IN_LANGUAGES]).
  /// - when Product's text fields are wanted to be filled with either
  ///   of several languages in prioritized manner
  ///
  /// However, the `IN_LANGUAGES` fields are also compatible with the [language]
  /// field - if only 1 language is needed, [language] can be used.
  ///
  /// Please see https://github.com/openfoodfacts/openfoodfacts-dart/blob/master/DOCUMENTATION.md#about-languages-mechanics
  /// for detailed explanation on how to work with multiple languages.
  List<OpenFoodFactsLanguage>? languages;

  /// The country for this query, if any.
  final OpenFoodFactsCountry? country;

  /// Defines which [ProductField]s are retrieved.
  ///
  /// All not mentioned fields will be null in [Product].
  /// Not specifying anything returns all available data (except
  /// Knowledge Panels).
  /// It's highly recommended to populate this field. This results in faster
  /// response times and less data usage.
  ///
  /// ```dart
  ///    ProductQueryConfiguration config = ProductQueryConfiguration(
  ///     '5449000131805',
  ///     fields: [ProductField.ALL],
  ///   );
  ///   ProductResultV3 product = await OpenFoodAPIClient.getProductV3(config);
  ///
  ///   print(product.product?.productName); // Coca Cola Zero
  ///   print(product.product?.brands); // Coca-Cola
  ///
  ///   ProductQueryConfiguration config = ProductQueryConfiguration(
  ///     '5449000131805',
  ///     fields: [ProductField.BRANDS],
  ///   );
  ///   ProductResultV3 product = await OpenFoodAPIClient.getProductV3(config);
  ///
  ///   print(product.product?.productName); // null
  ///   print(product.product?.brands); // Coca-Cola
  ///
  List<ProductField>? fields;

  List<Parameter> additionalParameters;

  AbstractQueryConfiguration({
    this.language,
    this.languages,
    this.country,
    this.fields,
    this.additionalParameters = const [],
  }) {
    fields ??= [ProductField.ALL];
    if (languages != null) {
      if (language != null && languages!.isNotEmpty) {
        throw ArgumentError(
            '[languages] cannot be used together with [language]');
      }
    }
  }

  /// Returns the corresponding API URI parameter map
  Map<String, String> getParametersMap() {
    final Map<String, String> result = {};

    //the languages added to the query parameters, not named languages to avoid confusion
    late final List<OpenFoodFactsLanguage> queryLanguages;

    if (language != null) {
      queryLanguages = [language!];
    } else if (languages != null) {
      queryLanguages = languages!.toList();
    } else if (OpenFoodAPIConfiguration.globalLanguages != null) {
      queryLanguages = OpenFoodAPIConfiguration.globalLanguages!;
    } else {
      queryLanguages = const <OpenFoodFactsLanguage>[];
    }

    if (queryLanguages.isNotEmpty) {
      result.putIfAbsent(
          'lc', () => queryLanguages.map((e) => e.offTag).join(','));
      // the result looks like crap if we put several languages
      result.putIfAbsent('tags_lc', () => queryLanguages.first.offTag);
    }

    final String? countryCode = computeCountryCode();
    if (countryCode != null) {
      result.putIfAbsent('cc', () => countryCode);
    }

    if (fields != null) {
      final bool ignoreFieldsFilter = fields!.any(
        (field) => field == ProductField.ALL,
      );
      if (!ignoreFieldsFilter) {
        final fieldsStrings = convertFieldsToStrings(fields!, queryLanguages);
        result.putIfAbsent('fields', () => fieldsStrings.join(','));
      }
    }

    int filterTagCount = 0;
    for (final p in additionalParameters) {
      if (p is TagFilter) {
        TagFilter tf = p;
        result.putIfAbsent('tagtype_$filterTagCount', () => tf.getTagType());
        result.putIfAbsent(
            'tag_contains_$filterTagCount', () => tf.getContains());
        result.putIfAbsent('tag_$filterTagCount', () => tf.getTagName());
        filterTagCount++;
      } else {
        result.putIfAbsent(p.getName(), () => p.getValue());
      }
    }

    return result;
  }

  String? computeCountryCode() =>
      OpenFoodAPIConfiguration.computeCountryCode(country, null);

  @protected
  String getUriPath();

  /// Performs the query, do not use directly please use
  /// dedicates methods in [OpenFoodAPIClient]
  Future<Response> getResponse(
    final User? user,
    final UriProductHelper uriHelper,
  ) async =>
      HttpHelper().doPostRequest(
        uriHelper.getPostUri(
          path: getUriPath(),
        ),
        getParametersMap(),
        user,
        uriHelper: uriHelper,
        addCredentialsToBody: false,
      );
}
