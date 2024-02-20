import 'dart:async';

import '../model/user.dart';
import 'autocomplete_manager.dart';
import 'autocompleter.dart';
import 'country_helper.dart';
import 'language_helper.dart';
import 'open_food_api_configuration.dart';
import 'uri_helper.dart';
import 'tag_type.dart';
import 'tag_type_autocompleter.dart';

/// Manager that returns the suggestions for the latest input.
///
/// Typical use case: the user types one character (which triggers a call to
/// suggestions), then another character (which triggers another call).
/// What if the second call is much faster than the first one, for server or
/// connection reasons? The autocomplete widget will get the second suggestions,
/// then the first suggestions will override them.
/// And the user should get the suggestions that match the latest input.
// TODO: deprecated from 2023-12-06; remove when old enough
@Deprecated('Use TagTypeAutocompleter and AutocompleteManager instead')
class SuggestionManager implements Autocompleter {
  SuggestionManager(
    final TagType taxonomyType, {
    required final OpenFoodFactsLanguage language,
    final OpenFoodFactsCountry? country,
    final String? categories,
    final String? shape,
    final int limit = 25,
    final UriProductHelper uriHelper = uriHelperFoodProd,
    final User? user,
  }) : manager = AutocompleteManager(
          TagTypeAutocompleter(
            tagType: taxonomyType,
            language: language,
            country: country,
            categories: categories,
            shape: shape,
            limit: limit,
            uriHelper: uriHelper,
            user: user,
          ),
        );

  final AutocompleteManager manager;

  @override
  Future<List<String>> getSuggestions(
    final String input,
  ) async =>
      manager.getSuggestions(input);
}
