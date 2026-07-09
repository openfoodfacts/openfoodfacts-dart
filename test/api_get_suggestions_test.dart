import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration tests about the V3 suggestions.
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  const uriHelper = uriHelperFoodTest;

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

  group('$OpenFoodAPIClient Suggestions and autocompletion V3 (packaging)', () {
    test('Suggestions for packaging_shapes', () async {
      final List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.PACKAGING_SHAPES,
        language: OpenFoodFactsLanguage.ENGLISH,
        input: '',
        country: OpenFoodFactsCountry.USA,
        categories: 'Pizza',
        uriHelper: uriHelper,
      );
      expect(result, contains('Box'));
    });

    test('Suggestions for packaging_materials', () async {
      final List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.PACKAGING_MATERIALS,
        language: OpenFoodFactsLanguage.ENGLISH,
        input: 'ass',
        country: OpenFoodFactsCountry.UNITED_KINGDOM,
        categories: 'Beer',
        shape: 'Bottle',
        uriHelper: uriHelper,
      );
      expect(result, contains('Glass'));
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
          uriHelper: uriHelper,
        );
        listContains(result, 't');

        result = await OpenFoodAPIClient.getSuggestions(
          tagType,
          language: OpenFoodFactsLanguage.FRENCH,
          input: 'TUN',
          uriHelper: uriHelper,
        );
        listContains(result, 'tun');

        result = await OpenFoodAPIClient.getSuggestions(
          tagType,
          language: OpenFoodFactsLanguage.ENGLISH,
          input: 'TUN',
          uriHelper: uriHelper,
        );
        listContains(result, 'tun');

        result = await OpenFoodAPIClient.getSuggestions(
          tagType,
          language: OpenFoodFactsLanguage.ARABIC,
          input: 'تو',
          uriHelper: uriHelper,
        );
        listContains(result, 'تو');

        result = await OpenFoodAPIClient.getSuggestions(
          tagType,
          language: OpenFoodFactsLanguage.GEORGIAN,
          input: 'TUN',
          uriHelper: uriHelper,
        );
        expect(result, isEmpty);

        expect(
          await OpenFoodAPIClient.getSuggestions(
            tagType,
            language: OpenFoodFactsLanguage.FRENCH,
            input: 'TUN',
            uriHelper: uriHelper,
          ),
          await OpenFoodAPIClient.getSuggestions(
            tagType,
            language: OpenFoodFactsLanguage.FRENCH,
            input: 'tun',
            uriHelper: uriHelper,
          ),
        );
      }
    });

    test('Suggestions for countries only', () async {
      late List<String> result;

      result = await OpenFoodAPIClient.getSuggestions(
        TagType.COUNTRIES,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'provence',
        uriHelper: uriHelper,
      );
      expect(result, isEmpty); // "provence" is not a country
    });

    test('Suggestions for origins only', () async {
      late List<String> result;

      result = await OpenFoodAPIClient.getSuggestions(
        TagType.ORIGINS,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'provence',
        uriHelper: uriHelper,
      );
      expect(result, isNotEmpty);

      result = await OpenFoodAPIClient.getSuggestions(
        TagType.ORIGINS,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'prove',
        uriHelper: uriHelper,
      );
      expect(result, isNotEmpty);

      result = await OpenFoodAPIClient.getSuggestions(
        TagType.ORIGINS,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'pyré',
        uriHelper: uriHelper,
      );
      expect(result, isNotEmpty); // something about Pyrénées
    });

    test('Suggestions for state', () async {
      List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.STATES,
        input: 'b',
        language: OpenFoodFactsLanguage.FRENCH,
        uriHelper: uriHelper,
      );

      listContains(result, 'b');

      result = await OpenFoodAPIClient.getSuggestions(
        TagType.STATES,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'compléter',
        uriHelper: uriHelper,
      );

      listContains(result, 'compléter');

      result = await OpenFoodAPIClient.getSuggestions(
        TagType.STATES,
        language: OpenFoodFactsLanguage.ENGLISH,
        input: 'h',
        uriHelper: uriHelper,
      );

      listContains(result, 'h');

      result = await OpenFoodAPIClient.getSuggestions(
        TagType.STATES,
        language: OpenFoodFactsLanguage.ARABIC,
        input: 'غ',
        uriHelper: uriHelper,
      );

      listContains(result, 'غ');

      result = await OpenFoodAPIClient.getSuggestions(
        TagType.STATES,
        language: OpenFoodFactsLanguage.GEORGIAN,
        input: 'M',
        uriHelper: uriHelper,
      );

      expect(result.isEmpty, true);

      expect(
        await OpenFoodAPIClient.getSuggestions(
          TagType.STATES,
          language: OpenFoodFactsLanguage.ENGLISH,
          input: 'O',
          uriHelper: uriHelper,
        ),
        await OpenFoodAPIClient.getSuggestions(
          TagType.STATES,
          language: OpenFoodFactsLanguage.ENGLISH,
          input: 'o',
          uriHelper: uriHelper,
        ),
      );
    });
    test('Suggestions for language', () async {
      List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.LANGUAGES,
        language: OpenFoodFactsLanguage.GERMAN,
        input: 'bA',
        uriHelper: uriHelper,
      );

      listContains(result, 'ba');
    });
    test('Suggestions for label', () async {
      List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.LABELS,
        language: OpenFoodFactsLanguage.GERMAN,
        input: 'm',
        uriHelper: uriHelper,
      );

      listContains(result, 'm');
    });
    test('Suggestions for categories', () async {
      List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.CATEGORIES,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'compo',
        uriHelper: uriHelper,
      );

      listContains(result, 'compo');

      result = await OpenFoodAPIClient.getSuggestions(
        TagType.CATEGORIES,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'soja',
        limit: 1000,
        uriHelper: uriHelper,
      );
      expect(result.length, greaterThan(40)); // 20220626: 51 items
      listContains(result, 'soja');
    });
    test('Suggestions for ingredients', () async {
      List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.INGREDIENTS,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'vian',
        uriHelper: uriHelper,
      );

      listContains(result, 'vian');
    });
    test('Suggestions for traces', () async {
      List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.TRACES,
        language: OpenFoodFactsLanguage.ENGLISH,
        input: 'e',
        uriHelper: uriHelper,
      );

      listContains(result, 'e');
    });
    test('Suggestions for additives', () async {
      List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.ADDITIVES,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'e9',
        uriHelper: uriHelper,
      );

      listContains(result, 'e9');
    });
    test('Suggestions for allergens', () async {
      List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.ALLERGENS,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'fRu',
        uriHelper: uriHelper,
      );

      listContains(result, 'fru');
    });
    test('Suggestions for packaging', () async {
      final List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.PACKAGING,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'briq',
        uriHelper: uriHelper,
      );

      listContains(result, 'briq');
    });
    test('Suggestions for packaging_shapes', () async {
      final List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.PACKAGING_SHAPES,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'bido',
        uriHelper: uriHelper,
      );
      listContains(result, 'bidon');
    });
    test('Suggestions for packaging_materials', () async {
      final List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.PACKAGING_MATERIALS,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'carto',
        uriHelper: uriHelper,
      );
      listContains(result, 'carton');
    });
    test('Suggestions for packaging_recycling', () async {
      final List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.PACKAGING_RECYCLING,
        language: OpenFoodFactsLanguage.FRENCH,
        input: 'conten',
        uriHelper: uriHelper,
      );
      listContains(result, 'conteneur');
    });
    test(
      'Suggestions for emb_code',
      () async {
        List<String> result = await OpenFoodAPIClient.getSuggestions(
          TagType.EMB_CODES,
          language: OpenFoodFactsLanguage.FRENCH,
          input: 'fR',
          uriHelper: uriHelper,
        );

        listContains(result, 'fr');

        result = await OpenFoodAPIClient.getSuggestions(
          TagType.EMB_CODES,
          language: OpenFoodFactsLanguage.FRENCH,
          input: 'R',
          uriHelper: uriHelper,
        );

        listContains(result, 'r');

        expect(
          await OpenFoodAPIClient.getSuggestions(
            TagType.EMB_CODES,
            language: OpenFoodFactsLanguage.ITALIAN,
            input: 'U',
            uriHelper: uriHelper,
          ),
          await OpenFoodAPIClient.getSuggestions(
            TagType.EMB_CODES,
            language: OpenFoodFactsLanguage.FRENCH,
            input: 'U',
            uriHelper: uriHelper,
          ),
        );

        expect(
          await OpenFoodAPIClient.getSuggestions(
            TagType.EMB_CODES,
            language: OpenFoodFactsLanguage.GERMAN,
            input: 'C',
            uriHelper: uriHelper,
          ),
          await OpenFoodAPIClient.getSuggestions(
            TagType.EMB_CODES,
            language: OpenFoodFactsLanguage.ENGLISH,
            input: 'C',
            uriHelper: uriHelper,
          ),
        );

        expect(
          await OpenFoodAPIClient.getSuggestions(
            TagType.EMB_CODES,
            language: OpenFoodFactsLanguage.JAPANESE,
            input: 'd',
            uriHelper: uriHelper,
          ),
          await OpenFoodAPIClient.getSuggestions(
            TagType.EMB_CODES,
            language: OpenFoodFactsLanguage.UKRAINIAN,
            input: 'D',
            uriHelper: uriHelper,
          ),
        );
      },
      skip: 'Skipping while the issue is not fixed on the server side',
    );
    test('Suggestions empty fields', () async {
      List<String> result = await OpenFoodAPIClient.getSuggestions(
        TagType.ALLERGENS,
        language: OpenFoodFactsLanguage.FRENCH,
        uriHelper: uriHelper,
      );

      expect(result, contains('Céleri'));

      result = await OpenFoodAPIClient.getSuggestions(
        TagType.TRACES,
        language: OpenFoodFactsLanguage.ENGLISH,
        uriHelper: uriHelper,
      );

      expect(result, contains('Celery'));

      result = await OpenFoodAPIClient.getSuggestions(
        TagType.INGREDIENTS,
        language: OpenFoodFactsLanguage.ENGLISH,
        uriHelper: uriHelper,
      );

      expect(result, contains('Absinthe'));
    });
  });
}
