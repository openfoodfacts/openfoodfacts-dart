/// Interface that provides autocomplete suggestions.
abstract class Autocompleter {
  Future<List<String>> getSuggestions(String input);
}
