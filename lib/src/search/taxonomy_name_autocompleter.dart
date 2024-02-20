import 'dart:async';

import '../model/user.dart';
import '../open_food_search_api_client.dart';
import '../utils/autocompleter.dart';
import '../utils/language_helper.dart';
import '../utils/open_food_api_configuration.dart';
import '../utils/uri_helper.dart';
import 'autocomplete_search_result.dart';
import 'autocomplete_single_result.dart';
import 'fuzziness.dart';
import 'taxonomy_name.dart';

/// Autocomplete suggestions for [TaxonomyName]s.
class TaxonomyNameAutocompleter implements Autocompleter {
  const TaxonomyNameAutocompleter({
    required this.taxonomyNames,
    required this.language,
    this.limit = 25,
    this.uriHelper = uriHelperFoodProd,
    this.user,
    this.fuzziness = Fuzziness.none,
  });

  final List<TaxonomyName> taxonomyNames;
  final OpenFoodFactsLanguage language;
  final int limit;
  final UriProductHelper uriHelper;
  final User? user;
  final Fuzziness fuzziness;

  @override
  Future<List<String>> getSuggestions(
    final String input,
  ) async {
    final AutocompleteSearchResult results =
        await OpenFoodSearchAPIClient.autocomplete(
      language: language,
      query: input,
      taxonomyNames: taxonomyNames,
      size: limit,
      user: user,
      uriHelper: uriHelper,
      fuzziness: fuzziness,
    );
    final List<String> result = <String>[];
    if (results.options == null) {
      return result;
    }
    for (final AutocompleteSingleResult item in results.options!) {
      result.add(item.text);
    }
    return result;
  }
}
