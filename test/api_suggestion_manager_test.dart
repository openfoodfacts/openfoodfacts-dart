import 'dart:async';

import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

class _SuggestionManagerTest extends AutocompleteManager {
  _SuggestionManagerTest(super.autocompleter, {required this.milliSecondWaits});

  final List<int> milliSecondWaits;
  int _index = 0;

  @override
  Future<void> waitForTestPurpose() async => Future.delayed(
    Duration(
      milliseconds: milliSecondWaits[(_index++) % milliSecondWaits.length],
    ),
  );
}

void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.TEST_USER;

  const int millisecondsWait = 3000;

  const String input1 = 'f';
  const String input2 = 'fr';

  Future<List<String>> getSlowSuggestions(
    final Autocompleter autoCompleter, {
    required final int milliseconds,
    required final String input,
  }) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
    return autoCompleter.getSuggestions(input);
  }

  /// Returns the result of the longest future.
  ///
  /// Based on [Future.any].
  Future<T> last<T>(Iterable<Future<T>> futures) {
    final completer = Completer<T>();
    int completedSoFar = 0;

    void onValue(T value) {
      completedSoFar++;
      if (completedSoFar == futures.length) {
        completer.complete(value);
      }
    }

    for (var future in futures) {
      future.then(onValue);
    }
    return completer.future;
  }

  group('$OpenFoodAPIClient suggestion manager', () {
    Future<void> testSpeed(final Autocompleter autocompleter) async {
      final AutocompleteManager manager = AutocompleteManager(autocompleter);
      final List<String> suggestions1 = await manager.getSuggestions(input1);
      final List<String> suggestions2 = await manager.getSuggestions(input2);
      expect(suggestions1, isNot(equals(suggestions2)));

      // Here we have the second call that takes longer (at least starts later).
      final AutocompleteManager fastThenSlowManager = _SuggestionManagerTest(
        autocompleter,
        // the second will start later
        milliSecondWaits: <int>[0, millisecondsWait],
      );
      final List<String> suggestionsFastThenSlow = await last([
        fastThenSlowManager.getSuggestions(input1),
        fastThenSlowManager.getSuggestions(input2),
      ]);
      expect(suggestionsFastThenSlow, suggestions2);

      // Here we have the first call that takes longer (at least starts later).
      final AutocompleteManager slowThenFastManager = _SuggestionManagerTest(
        autocompleter,
        // the first will start later
        milliSecondWaits: <int>[millisecondsWait, 0],
      );
      final List<String> suggestionsSlowThenFast = await last([
        slowThenFastManager.getSuggestions(input1),
        slowThenFastManager.getSuggestions(input2),
      ]);
      // regardless, we expect the suggestion for the latest input.
      expect(suggestionsSlowThenFast, suggestions2);

      // without the manager, we always get the slower result.
      final List<String> suggestionsNormal = await last([
        getSlowSuggestions(
          autocompleter,
          input: input1,
          milliseconds: millisecondsWait,
        ),
        autocompleter.getSuggestions(input2),
      ]);
      expect(suggestionsNormal, suggestions1);
    }

    test(
      'countries as TagType',
      () async => testSpeed(
        TagTypeAutocompleter(
          tagType: TagType.COUNTRIES,
          language: OpenFoodFactsLanguage.FRENCH,
          uriHelper: uriHelperFoodTest,
        ),
      ),
    );

    test(
      'brands as TaxonomyName',
      () async => testSpeed(
        TaxonomyNameAutocompleter(
          taxonomyNames: <TaxonomyName>[TaxonomyName.brand],
          // for brands, language must be English
          language: OpenFoodFactsLanguage.ENGLISH,
          uriHelper: uriHelperFoodProd,
        ),
      ),
    );
  });
}
