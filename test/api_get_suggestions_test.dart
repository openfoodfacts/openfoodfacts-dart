import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration tests about the V3 suggestions.
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;

  /// Checks if at least one item contains the [substring].
  void listContains(final List<String> list, final String substring) {
    expect(list, isNotEmpty);
    for (final String item in list) {
      if (item.toString().toLowerCase().contains(substring)) {
        return;
      }
    }
    fail('no item contains $substring');
  }

  /// Checks if a list is not sorted alphabetically.
  ///
  /// Which is the case for shapes and materials, where the results are sorted
  /// by relevancy.
  void checkNotSortedList(final List<String> list) {
    final List<String> sorted = List<String>.from(list);
    sorted.sort();
    expect(list, isNot(orderedEquals(sorted)));
  }

  group('$OpenFoodAPIClient Suggestions and autocompletion V3 (packaging)', () {
    test('Suggestions for packaging_shapes', () async {
      final List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.PACKAGING_SHAPES,
        language: OpenFoodFactsLanguage.ENGLISH,
        input: '',
        country: OpenFoodFactsCountry.USA,
        categories: 'Pizza',
      );
      expect(result, contains('Box'));
      checkNotSortedList(result);
    });

    test('Suggestions for packaging_materials', () async {
      final List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.PACKAGING_MATERIALS,
        language: OpenFoodFactsLanguage.ENGLISH,
        input: 's',
        country: OpenFoodFactsCountry.UNITED_KINGDOM,
        categories: 'Beer',
        shape: 'Bottle',
      );
      expect(result, contains('Glass'));
      checkNotSortedList(result);
    });
  });

  group('$OpenFoodAPIClient Suggestions and autocompletion V3', () {
    test('Suggestions for countries and origins', () async {
      late List<String> result;

      final List<TagType> tagTypes = <TagType>[
        TagType.COUNTRIES,
        TagType.ORIGINS,
      ];
      for (final TagType tagType in tagTypes) {
        result = await OpenFoodAPIClient.getSuggestions(
          tagType,
          language: OpenFoodFactsLanguage.FRENCH,
          input: 't',
        );
        listContains(result, 't');

        result = await OpenFoodAPIClient.getSuggestions(
          tagType,
          language: OpenFoodFactsLanguage.FRENCH,
          input: 'TUN',
        );
        listContains(result, 'tun');

        result = await OpenFoodAPIClient.getSuggestions(
          tagType,
          language: OpenFoodFactsLanguage.ENGLISH,
          input: 'TUN',
        );
        listContains(result, 'tun');

        result = await OpenFoodAPIClient.getSuggestions(
          tagType,
          language: OpenFoodFactsLanguage.ARABIC,
          input: 'تو',
        );
        listContains(result, 'تو');

        result = await OpenFoodAPIClient.getSuggestions(
          tagType,
          language: OpenFoodFactsLanguage.GEORGIAN,
          input: 'TUN',
        );
        expect(result, isEmpty);

        expect(
            await OpenFoodAPIClient.getSuggestions(
              tagType,
              language: OpenFoodFactsLanguage.FRENCH,
              input: 'TUN',
            ),
            await OpenFoodAPIClient.getSuggestions(
              tagType,
              language: OpenFoodFactsLanguage.FRENCH,
              input: 'tun',
            ));
      }
    });

    test('Suggestions for countries only', () async {
      late List<String> result;

      result = await OpenFoodAPIClient.getSuggestions(
        TagType.COUNTRIES,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'provence',
      );
      expect(result, isEmpty); // "provence" is not a country
    });

    test('Suggestions for origins only', () async {
      late List<String> result;

      result = await OpenFoodAPIClient.getSuggestions(
        TagType.ORIGINS,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'provence',
      );
      expect(result, isNotEmpty);

      result = await OpenFoodAPIClient.getSuggestions(
        TagType.ORIGINS,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'prove',
      );
      expect(result, isNotEmpty);

      result = await OpenFoodAPIClient.getSuggestions(
        TagType.ORIGINS,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'pyré',
      );
      expect(result, isNotEmpty); // something about Pyrénées
    });

    test('Suggestions for state', () async {
      List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.STATES,
        input: 'b',
        language: OpenFoodFactsLanguage.FRENCH,
      );

      listContains(result, 'b');

      result = await OpenFoodAPIClient.getSuggestions(
        TagType.STATES,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'compléter',
      );

      listContains(result, 'compléter');

      result = await OpenFoodAPIClient.getSuggestions(
        TagType.STATES,
        language: OpenFoodFactsLanguage.ENGLISH,
        input: 'h',
      );

      listContains(result, 'h');

      result = await OpenFoodAPIClient.getSuggestions(
        TagType.STATES,
        language: OpenFoodFactsLanguage.ARABIC,
        input: 'غ',
      );

      expect(result.isEmpty, true);

      result = await OpenFoodAPIClient.getSuggestions(
        TagType.STATES,
        language: OpenFoodFactsLanguage.GEORGIAN,
        input: 'M',
      );

      expect(result.isEmpty, true);

      expect(
          await OpenFoodAPIClient.getSuggestions(
            TagType.STATES,
            language: OpenFoodFactsLanguage.ENGLISH,
            input: 'O',
          ),
          await OpenFoodAPIClient.getSuggestions(
            TagType.STATES,
            language: OpenFoodFactsLanguage.ENGLISH,
            input: 'o',
          ));
    });
    test('Suggestions for language', () async {
      List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.LANGUAGES,
        language: OpenFoodFactsLanguage.GERMAN,
        input: 'bA',
      );

      listContains(result, 'ba');
    });
    test('Suggestions for label', () async {
      List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.LABELS,
        language: OpenFoodFactsLanguage.GERMAN,
        input: 'm',
      );

      listContains(result, 'm');
    });
    test('Suggestions for categories', () async {
      List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.CATEGORIES,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'compo',
      );

      listContains(result, 'compo');

      result = await OpenFoodAPIClient.getSuggestions(
        TagType.CATEGORIES,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'soja',
        limit: 1000,
      );
      expect(result.length, greaterThan(40)); // 20220626: 51 items
      listContains(result, 'soja');
    });
    test('Suggestions for ingredients', () async {
      List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.INGREDIENTS,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'vian',
      );

      listContains(result, 'vian');
    });
    test('Suggestions for traces', () async {
      List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.TRACES,
        language: OpenFoodFactsLanguage.ENGLISH,
        input: 'e',
      );

      listContains(result, 'e');
    });
    test('Suggestions for additives', () async {
      List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.ADDITIVES,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'e9',
      );

      listContains(result, 'e9');
    });
    test('Suggestions for allergens', () async {
      List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.ALLERGENS,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'fRu',
      );

      listContains(result, 'fru');
    });
    test('Suggestions for packaging', () async {
      final List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.PACKAGING,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'briq',
      );

      listContains(result, 'briq');
    });
    test('Suggestions for packaging_shapes', () async {
      final List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.PACKAGING_SHAPES,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'bido',
      );
      listContains(result, 'bidon');
    });
    test('Suggestions for packaging_materials', () async {
      final List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.PACKAGING_MATERIALS,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'carto',
      );
      listContains(result, 'carton');
    });
    test('Suggestions for packaging_recycling', () async {
      final List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.PACKAGING_RECYCLING,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'conten',
      );
      listContains(result, 'conteneur');
    });
    test('Suggestions for emb_code', () async {
      List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.EMB_CODES,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'fR',
      );

      listContains(result, 'fr');

      result = await OpenFoodAPIClient.getSuggestions(
        TagType.EMB_CODES,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'R',
      );

      listContains(result, 'r');

      expect(
          await OpenFoodAPIClient.getSuggestions(
            TagType.EMB_CODES,
            language: OpenFoodFactsLanguage.ITALIAN,
            input: 'U',
          ),
          await OpenFoodAPIClient.getSuggestions(
            TagType.EMB_CODES,
            language: OpenFoodFactsLanguage.FRENCH,
            input: 'U',
          ));

      expect(
          await OpenFoodAPIClient.getSuggestions(
            TagType.EMB_CODES,
            language: OpenFoodFactsLanguage.GERMAN,
            input: 'C',
          ),
          await OpenFoodAPIClient.getSuggestions(
            TagType.EMB_CODES,
            language: OpenFoodFactsLanguage.ENGLISH,
            input: 'C',
          ));

      expect(
          await OpenFoodAPIClient.getSuggestions(
            TagType.EMB_CODES,
            language: OpenFoodFactsLanguage.JAPANESE,
            input: 'd',
          ),
          await OpenFoodAPIClient.getSuggestions(
            TagType.EMB_CODES,
            language: OpenFoodFactsLanguage.UKRAINIAN,
            input: 'D',
          ));
    });
    test('Suggestions empty fields', () async {
      List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.ALLERGENS,
        language: OpenFoodFactsLanguage.FRENCH,
      );

      expect(result, contains('Céleri'));

      result = await OpenFoodAPIClient.getSuggestions(
        TagType.TRACES,
        language: OpenFoodFactsLanguage.ENGLISH,
      );

      expect(result, contains('Celery'));

      result = await OpenFoodAPIClient.getSuggestions(
        TagType.INGREDIENTS,
        language: OpenFoodFactsLanguage.ENGLISH,
      );

      expect(result, contains('Absinthe'));
    });
  });
}
