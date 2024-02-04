/// Interface that provides autocomplete suggestions.
abstract class Autocompleter {
  Future<List<String>> getSuggestions(final String input);
}
