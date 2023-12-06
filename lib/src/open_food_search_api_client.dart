import 'dart:convert';

import 'package:http/http.dart';

import 'model/user.dart';
import 'utils/http_helper.dart';
import 'utils/language_helper.dart';
import 'utils/open_food_api_configuration.dart';
import 'search/autocomplete_search_result.dart';
import 'search/fuzziness.dart';
import 'search/taxonomy_name.dart';
import 'utils/uri_helper.dart';

/// Client calls of the Open Food Facts Elastic Search API.
class OpenFoodSearchAPIClient {
  OpenFoodSearchAPIClient._();

  /// Subdomain of the Elastic Search API.
  static const String _subdomain = 'search';

  /// Host of the Elastic Search API.
  static String _getHost(final UriProductHelper uriHelper) =>
      uriHelper.getHost(_subdomain);

  /// Returns a list of suggestions.
  ///
  /// /!\ For brands, language must be English.
  static Future<AutocompleteSearchResult> autocomplete({
    required String query,
    required final List<TaxonomyName> taxonomyNames,
    required final OpenFoodFactsLanguage language,
    final User? user,
    final int size = 10,
    final Fuzziness fuzziness = Fuzziness.none,
    final UriProductHelper uriHelper = uriHelperFoodProd,
  }) async {
    query = query.trim();
    if (query.isEmpty) {
      throw Exception('Query cannot be empty!');
    }
    final List<String> taxonomyTags = <String>[];
    for (final TaxonomyName taxonomyName in taxonomyNames) {
      taxonomyTags.add(taxonomyName.offTag);
    }
    if (taxonomyTags.isEmpty) {
      throw Exception('Taxonomies cannot be empty!');
    }
    final Uri uri = uriHelper.getUri(
      path: '/autocomplete',
      forcedHost: _getHost(uriHelper),
      queryParameters: <String, dynamic>{
        'q': query,
        'taxonomy_names': taxonomyTags.join(','),
        'lang': language.offTag,
        'size': size.toString(),
        'fuzziness': fuzziness.offTag,
      },
    );
    final Response response = await HttpHelper().doGetRequest(
      uri,
      user: user,
      uriHelper: uriHelper,
    );
    return AutocompleteSearchResult.fromJson(
      HttpHelper().jsonDecode(utf8.decode(response.bodyBytes)),
    );
  }
}
