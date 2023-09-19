import 'dart:async';

import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

class _SuggestionManagerTest extends SuggestionManager {
  _SuggestionManagerTest(
    super.taxonomyType, {
    required super.language,
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
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;

  const TagType tagType = TagType.COUNTRIES;
  const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.FRENCH;

  const int millisecondsWait = 3000;

  const String input1 = 'f';
  const String input2 = 'fr';

  Future<List<String>> getSlowSuggestions(
    final TagType tagType, {
    required final int milliseconds,
    required final OpenFoodFactsLanguage language,
    required final String input,
  }) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
    return OpenFoodAPIClient.getSuggestions(
      tagType,
      language: language,
      input: input,
    );
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
    test('countries', () async {
      final SuggestionManager manager = SuggestionManager(
        tagType,
        language: language,
      );
      final List<String> countries1 = await manager.getSuggestions(input1);
      final List<String> countries2 = await manager.getSuggestions(input2);
      expect(countries1, isNot(equals(countries2)));

      // Here we have the second call that takes longer (at least starts later).
      final SuggestionManager fastThenSlowManager = _SuggestionManagerTest(
        tagType,
        language: language,
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
      final SuggestionManager slowThenFastManager = _SuggestionManagerTest(
        tagType,
        language: language,
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
            tagType,
            language: language,
            input: input1,
            milliseconds: millisecondsWait,
          ),
          OpenFoodAPIClient.getSuggestions(
            tagType,
            language: language,
            input: input2,
          ),
        ],
      );
      expect(countriesNormal, countries1);
    });
  });
}
