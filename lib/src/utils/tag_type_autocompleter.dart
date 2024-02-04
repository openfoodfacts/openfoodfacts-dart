import 'dart:async';

import '../model/user.dart';
import '../open_food_api_client.dart';
import 'autocompleter.dart';
import 'country_helper.dart';
import 'language_helper.dart';
import 'open_food_api_configuration.dart';
import 'uri_helper.dart';
import 'tag_type.dart';

/// Autocomplete suggestions for [TagType].
class TagTypeAutocompleter implements Autocompleter {
  const TagTypeAutocompleter({
    required this.tagType,
    required this.language,
    this.country,
    this.categories,
    this.shape,
    this.limit = 25,
    this.uriHelper = uriHelperFoodProd,
    this.user,
  });

  final TagType tagType;
  final OpenFoodFactsLanguage language;
  final OpenFoodFactsCountry? country;
  final String? categories;
  final String? shape;
  final int limit;
  final UriProductHelper uriHelper;
  final User? user;

  @override
  Future<List<String>> getSuggestions(
    final String input,
  ) async =>
      OpenFoodAPIClient.getSuggestions(
        tagType,
        input: input,
        language: language,
        country: country,
        categories: categories,
        shape: shape,
        limit: limit,
        uriHelper: uriHelper,
        user: user,
      );
}
