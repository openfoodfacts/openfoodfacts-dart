import 'dart:async';

import 'package:meta/meta.dart';

import '../model/user.dart';
import '../open_food_api_client.dart';
import 'country_helper.dart';
import 'language_helper.dart';
import 'query_type.dart';
import 'tag_type.dart';

/// Manager that returns the suggestions for the latest input.
///
/// Typical use case: the user types one character (which triggers a call to
/// suggestions), then another character (which triggers another call).
/// What if the second call is much faster than the first one, for server or
/// connection reasons? The autocomplete widget will get the second suggestions,
/// then the first suggestions will override them.
/// And the user should get the suggestions that match the latest input.
class SuggestionManager {
  SuggestionManager(
    this.taxonomyType, {
    required this.language,
    this.country,
    this.categories,
    this.shape,
    this.limit = 25,
    this.queryType,
    this.user,
  });

  final TagType taxonomyType;
  final OpenFoodFactsLanguage language;
  final OpenFoodFactsCountry? country;
  final String? categories;
  final String? shape;
  final int limit;
  final QueryType? queryType;
  final User? user;

  final List<String> _inputs = <String>[];
  final Map<String, List<String>> _cache = <String, List<String>>{};

  /// Returns suggestions about the latest input.
  Future<List<String>> getSuggestions(
    final String input,
  ) async {
    _inputs.add(input);
    final List<String>? cached = _cache[input];
    if (cached != null) {
      return cached;
    }
    await waitForTestPurpose();
    _cache[input] = await OpenFoodAPIClient.getSuggestions(
      taxonomyType,
      input: input,
      language: language,
      country: country,
      categories: categories,
      shape: shape,
      limit: limit,
      queryType: queryType,
      user: user,
    );
    // meanwhile there might have been some calls to this method, adding inputs.
    for (final String latestInput in _inputs.reversed) {
      final List<String>? cached = _cache[latestInput];
      if (cached != null) {
        return cached;
      }
    }
    // not supposed to happen, as we should have downloaded for "input".
    return <String>[];
  }

  @protected
  @visibleForTesting
  Future<void> waitForTestPurpose() async {}
}
