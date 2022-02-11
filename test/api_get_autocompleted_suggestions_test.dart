import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:openfoodfacts/utils/TagType.dart';
import 'package:test/test.dart';

void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;

  void _listContains(List<dynamic> result, String match) {
    expect(result, isNotEmpty);
    for (dynamic e in result) {
      expect(e.toString().toLowerCase(), contains(match));
    }
  }

  group('$OpenFoodAPIClient Suggestions and autocompletion', () {
    test('Suggestions for countries', () async {
      List<dynamic> result =
          await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.COUNTRIES,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 't',
      );

      _listContains(result, 't');

      result = await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.COUNTRIES,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'TUN',
      );

      _listContains(result, 'tun');

      result = await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.COUNTRIES,
        language: OpenFoodFactsLanguage.ENGLISH,
        input: 'TUN',
      );

      _listContains(result, 'tun');

      result = await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.COUNTRIES,
        language: OpenFoodFactsLanguage.ARABIC,
        input: 'تو',
      );

      _listContains(result, 'تو');

      result = await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.COUNTRIES,
        language: OpenFoodFactsLanguage.GEORGIAN,
        input: 'TUN',
      );

      expect(result.isEmpty, true);

      expect(
          await OpenFoodAPIClient.getAutocompletedSuggestions(
            TagType.COUNTRIES,
            language: OpenFoodFactsLanguage.FRENCH,
            input: 'TUN',
          ),
          await OpenFoodAPIClient.getAutocompletedSuggestions(
            TagType.COUNTRIES,
            language: OpenFoodFactsLanguage.FRENCH,
            input: 'tun',
          ));
    });

    test('Suggestions for state', () async {
      List<dynamic> result =
          await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.STATES,
        input: 'b',
        language: OpenFoodFactsLanguage.FRENCH,
      );

      _listContains(result, 'b');

      result = await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.STATES,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'compléter',
      );

      _listContains(result, 'compléter');

      result = await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.STATES,
        language: OpenFoodFactsLanguage.ENGLISH,
        input: 'h',
      );

      _listContains(result, 'h');

      result = await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.STATES,
        language: OpenFoodFactsLanguage.ARABIC,
        input: 'غ',
      );

      expect(result.isEmpty, true);

      result = await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.STATES,
        language: OpenFoodFactsLanguage.GEORGIAN,
        input: 'M',
      );

      expect(result.isEmpty, true);

      expect(
          await OpenFoodAPIClient.getAutocompletedSuggestions(
            TagType.STATES,
            language: OpenFoodFactsLanguage.ENGLISH,
            input: 'O',
          ),
          await OpenFoodAPIClient.getAutocompletedSuggestions(
            TagType.STATES,
            language: OpenFoodFactsLanguage.ENGLISH,
            input: 'o',
          ));
    });
    test('Suggestions for language', () async {
      List<dynamic> result =
          await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.LANGUAGES,
        language: OpenFoodFactsLanguage.GERMAN,
        input: 'bA',
      );

      _listContains(result, 'ba');
    });
    test('Suggestions for label', () async {
      List<dynamic> result =
          await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.LABELS,
        language: OpenFoodFactsLanguage.GERMAN,
        input: 'm',
      );

      _listContains(result, 'm');
    });
    test('Suggestions for categories', () async {
      List<dynamic> result =
          await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.CATEGORIES,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'compo',
      );

      _listContains(result, 'compo');
    });
    test('Suggestions for ingredients', () async {
      List<dynamic> result =
          await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.INGREDIENTS,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'vian',
      );

      _listContains(result, 'vian');
    });
    test('Suggestions for traces', () async {
      List<dynamic> result =
          await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.TRACES,
        language: OpenFoodFactsLanguage.ENGLISH,
        input: 'e',
      );

      _listContains(result, 'e');
    });
    test('Suggestions for additives', () async {
      List<dynamic> result =
          await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.ADDITIVES,
        language: OpenFoodFactsLanguage.RUSSIAN,
        input: 'e9',
      );

      _listContains(result, 'e9');
    });
    test('Suggestions for allergens', () async {
      List<dynamic> result =
          await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.ALLERGENS,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'fRu',
      );

      _listContains(result, 'fru');
    });
    test('Suggestions for packaging', () async {
      final List<dynamic> result =
          await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.PACKAGING,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'briq',
      );

      _listContains(result, 'briq');
    });
    test('Suggestions for emb_code', () async {
      List<dynamic> result =
          await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.EMB_CODES,
        input: 'fR',
      );

      _listContains(result, 'fr');

      result = await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.EMB_CODES,
        input: 'R',
      );

      _listContains(result, 'r');

      expect(
          await OpenFoodAPIClient.getAutocompletedSuggestions(
            TagType.EMB_CODES,
            language: OpenFoodFactsLanguage.ITALIAN,
            input: 'U',
          ),
          await OpenFoodAPIClient.getAutocompletedSuggestions(
            TagType.EMB_CODES,
            language: OpenFoodFactsLanguage.FRENCH,
            input: 'U',
          ));

      expect(
          await OpenFoodAPIClient.getAutocompletedSuggestions(
            TagType.EMB_CODES,
            language: OpenFoodFactsLanguage.GERMAN,
            input: 'C',
          ),
          await OpenFoodAPIClient.getAutocompletedSuggestions(
            TagType.EMB_CODES,
            language: OpenFoodFactsLanguage.ENGLISH,
            input: 'C',
          ));

      expect(
          await OpenFoodAPIClient.getAutocompletedSuggestions(
            TagType.EMB_CODES,
            language: OpenFoodFactsLanguage.JAPANESE,
            input: 'd',
          ),
          await OpenFoodAPIClient.getAutocompletedSuggestions(
            TagType.EMB_CODES,
            language: OpenFoodFactsLanguage.UKRAINIAN,
            input: 'D',
          ));
    });
    test('Suggestions empty fields', () async {
      List<dynamic> result =
          await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.ALLERGENS,
        language: OpenFoodFactsLanguage.FRENCH,
      );

      expect(result, contains('Céleri'));

      result = await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.TRACES,
        language: OpenFoodFactsLanguage.ENGLISH,
      );

      expect(result, contains('Celery'));

      result = await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.INGREDIENTS,
        language: OpenFoodFactsLanguage.ENGLISH,
      );

      expect(
          result,
          contains(
            'Absinthe',
          ));

      result = await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.INGREDIENTS,
        language: OpenFoodFactsLanguage.ENGLISH,
      );

      expect(
          await OpenFoodAPIClient.getAutocompletedSuggestions(
            TagType.INGREDIENTS,
            language: OpenFoodFactsLanguage.ENGLISH,
          ),
          await OpenFoodAPIClient.getAutocompletedSuggestions(
            TagType.INGREDIENTS,
          ));
    });
  });
}
