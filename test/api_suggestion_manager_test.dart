import 'dart:async';

import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

class _SuggestionManagerTest extends AutocompleteManager {
  _SuggestionManagerTest(
    super.autocompleter, {
    required this.milliSecondWaits,
  });

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

  const TagType tagType = TagType.COUNTRIES;
  const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.FRENCH;

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
    Future<void> testToto(final Autocompleter autocompleter) async {
      final AutocompleteManager manager = AutocompleteManager(autocompleter);
      final List<String> countries1 = await manager.getSuggestions(input1);
      final List<String> countries2 = await manager.getSuggestions(input2);
      expect(countries1, isNot(equals(countries2)));

      // Here we have the second call that takes longer (at least starts later).
      final AutocompleteManager fastThenSlowManager = _SuggestionManagerTest(
        autocompleter,
        // the second will start later
        milliSecondWaits: <int>[0, millisecondsWait],
      );
      final List<String> countriesFastThenSlow = await last(
        [
          fastThenSlowManager.getSuggestions(input1),
          fastThenSlowManager.getSuggestions(input2),
        ],
      );
      expect(countriesFastThenSlow, countries2);

      // Here we have the first call that takes longer (at least starts later).
      final AutocompleteManager slowThenFastManager = _SuggestionManagerTest(
        autocompleter,
        // the first will start later
        milliSecondWaits: <int>[millisecondsWait, 0],
      );
      final List<String> countriesSlowThenFast = await last(
        [
          slowThenFastManager.getSuggestions(input1),
          slowThenFastManager.getSuggestions(input2),
        ],
      );
      // regardless, we expect the suggestion for the latest input.
      expect(countriesSlowThenFast, countries2);

      // without the manager, we always get the slower result.
      final List<String> countriesNormal = await last(
        [
          getSlowSuggestions(
            autocompleter,
            input: input1,
            milliseconds: millisecondsWait,
          ),
          autocompleter.getSuggestions(input2),
        ],
      );
      expect(countriesNormal, countries1);
    }

    test(
      'countries as TagType',
      () async => testToto(
        TagTypeAutocompleter(
          tagType: tagType,
          language: language,
          uriHelper: uriHelperFoodTest,
        ),
      ),
    );

    test(
      'countries as TaxonomyName',
      () async => testToto(
        TaxonomyNameAutocompleter(
          taxonomyNames: <TaxonomyName>[TaxonomyName.country],
          language: language,
          uriHelper: uriHelperFoodTest,
        ),
      ),
    );
  });
}
