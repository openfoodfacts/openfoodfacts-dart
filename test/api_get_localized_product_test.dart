import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;

  group('$OpenFoodAPIClient get localized product fields', () {
    test('get packaging text in languages (Coca-Cola)', () async {
      const String barcode = '5449000000996';
      const List<OpenFoodFactsLanguage> languages = [
        OpenFoodFactsLanguage.ENGLISH,
        OpenFoodFactsLanguage.FRENCH,
      ];

      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(
        barcode,
        languages: languages,
        fields: [ProductField.PACKAGING_TEXT_IN_LANGUAGES],
        version: ProductQueryVersion.v3,
      );
      final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
      );
      expect(result.status, ProductResultV3.statusSuccess);
      expect(result.product, isNotNull);
      expect(result.product!.packagingTextInLanguages, isNotNull);
      for (final OpenFoodFactsLanguage language in languages) {
        expect(result.product!.packagingTextInLanguages![language], isNotNull);
      }
    });

    test('get images freshness', () async {
      const BARCODE_DANISH_BUTTER_COOKIES = '5701184005007';
      const List<OpenFoodFactsLanguage> languages = [
        OpenFoodFactsLanguage.ENGLISH,
        OpenFoodFactsLanguage.RUSSIAN,
        OpenFoodFactsLanguage.GERMAN,
        OpenFoodFactsLanguage.FRENCH,
      ];

      final ProductResultV3 productResult =
          await OpenFoodAPIClient.getProductV3(
        ProductQueryConfiguration(
          BARCODE_DANISH_BUTTER_COOKIES,
          languages: languages,
          fields: [ProductField.IMAGES_FRESHNESS_IN_LANGUAGES],
          version: ProductQueryVersion.v3,
        ),
      );
      final Product product = productResult.product!;
      const int TEN_YEARS = 10 * 365 * 24 * 3600;
      for (final OpenFoodFactsLanguage language in languages) {
        final Map<ImageField, int> freshnesses =
            product.imagesFreshnessInLanguages![language]!;
        for (final ImageField imageField in ImageField.values) {
          final int? freshness = freshnesses[imageField];
          if (freshness != null) {
            expect(freshness >= 0, isTrue);
            expect(freshness < TEN_YEARS, isTrue);
          }
        }
      }
    });

    test('get all "tags in languages" (List<String>)', () async {
      const String barcode = '5449000000996';
      const List<OpenFoodFactsLanguage> languages = [
        OpenFoodFactsLanguage.ENGLISH,
        OpenFoodFactsLanguage.FRENCH,
      ];

      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(
        barcode,
        languages: languages,
        fields: [
          // tags in languages
          ProductField.CATEGORIES_TAGS_IN_LANGUAGES,
          ProductField.TRACES_TAGS_IN_LANGUAGES,
          ProductField.STORES_TAGS_IN_LANGUAGES,
          ProductField.STATES_TAGS_IN_LANGUAGES,
          ProductField.BRANDS_TAGS_IN_LANGUAGES,
          ProductField.MISC_TAGS_IN_LANGUAGES,
          ProductField.INGREDIENTS_ANALYSIS_TAGS_IN_LANGUAGES,
          ProductField.LABELS_TAGS_IN_LANGUAGES,
          ProductField.COUNTRIES_TAGS_IN_LANGUAGES,
          ProductField.INGREDIENTS_TAGS_IN_LANGUAGES,
          // tags
          ProductField.CATEGORIES_TAGS,
          ProductField.TRACES_TAGS,
          ProductField.STORES_TAGS,
          ProductField.STATES_TAGS,
          ProductField.BRANDS_TAGS,
          ProductField.MISC_TAGS,
          ProductField.INGREDIENTS_ANALYSIS_TAGS,
          ProductField.LABELS_TAGS,
          ProductField.COUNTRIES_TAGS,
          ProductField.INGREDIENTS_TAGS,
        ],
        version: ProductQueryVersion.v3,
      );
      final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
      );
      expect(result.status, ProductResultV3.statusSuccess);
      expect(result.product, isNotNull);
      final Product product = result.product!;

      void check(
        final List<dynamic>? tags,
        final Map<OpenFoodFactsLanguage, List<String>>? tagsInLanguages,
        final ProductField productField,
      ) {
        expect(
          tags,
          isNotNull,
          reason: productField.offTag,
        );
        expect(
          tagsInLanguages,
          isNotNull,
          reason: productField.offTag,
        );
        expect(
          tagsInLanguages,
          isNotEmpty,
          reason: productField.offTag,
        );
        final int count = tags!.length;

        for (final OpenFoodFactsLanguage language in languages) {
          expect(
            tagsInLanguages![language],
            isNotNull,
            reason: productField.offTag,
          );
          expect(
            tagsInLanguages[language]!.length,
            count,
            reason: productField.offTag,
          );
        }
      }

      void checkIngredientAnaysisTags(
        final IngredientsAnalysisTags? tags,
        final Map<OpenFoodFactsLanguage, List<String>>? tagsInLanguages,
        final ProductField productField,
      ) {
        expect(
          tags,
          isNotNull,
          reason: productField.offTag,
        );
        expect(
          tagsInLanguages,
          isNotNull,
          reason: productField.offTag,
        );
        expect(
          tagsInLanguages,
          isNotEmpty,
          reason: productField.offTag,
        );
        final int count = 3; // vegetarian, vegan, palm-oil

        for (final OpenFoodFactsLanguage language in languages) {
          expect(
            tagsInLanguages![language],
            isNotNull,
            reason: productField.offTag,
          );
          expect(
            tagsInLanguages[language]!.length,
            count,
            reason: productField.offTag,
          );
        }
      }

      check(
        product.categoriesTags,
        product.categoriesTagsInLanguages,
        ProductField.CATEGORIES_TAGS_IN_LANGUAGES,
      );
      check(
        product.tracesTags,
        product.tracesTagsInLanguages,
        ProductField.TRACES_TAGS_IN_LANGUAGES,
      );
      check(
        product.storesTags,
        product.storesTagsInLanguages,
        ProductField.STORES_TAGS_IN_LANGUAGES,
      );
      check(
        product.statesTags,
        product.statesTagsInLanguages,
        ProductField.STATES_TAGS_IN_LANGUAGES,
      );
      check(
        product.brandsTags,
        product.brandsTagsInLanguages,
        ProductField.BRANDS_TAGS_IN_LANGUAGES,
      );
      check(
        product.miscTags,
        product.miscTagsInLanguages,
        ProductField.MISC_TAGS_IN_LANGUAGES,
      );
      checkIngredientAnaysisTags(
        product.ingredientsAnalysisTags,
        product.ingredientsAnalysisTagsInLanguages,
        ProductField.INGREDIENTS_ANALYSIS_TAGS_IN_LANGUAGES,
      );
      check(
        product.labelsTags,
        product.labelsTagsInLanguages,
        ProductField.LABELS_TAGS_IN_LANGUAGES,
      );
      check(
        product.countriesTags,
        product.countriesTagsInLanguages,
        ProductField.COUNTRIES_TAGS_IN_LANGUAGES,
      );
      check(
        product.ingredientsTags,
        product.ingredientsTagsInLanguages,
        ProductField.INGREDIENTS_TEXT_IN_LANGUAGES,
      );
    });

    test('get all "tags in languages" (Map<ImageField, int>)', () async {
      const String barcode = '5449000000996';
      const List<OpenFoodFactsLanguage> languages = [
        OpenFoodFactsLanguage.ENGLISH,
        OpenFoodFactsLanguage.FRENCH,
      ];

      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(
        barcode,
        languages: languages,
        fields: [
          ProductField.IMAGES_FRESHNESS_IN_LANGUAGES,
        ],
        version: ProductQueryVersion.v3,
      );
      final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
      );
      expect(result.status, ProductResultV3.statusSuccess);
      expect(result.product, isNotNull);
      final Product product = result.product!;

      void check(
        final Map<OpenFoodFactsLanguage, Map<ImageField, int>>? tagsInLanguages,
        final ProductField productField,
      ) {
        expect(
          tagsInLanguages,
          isNotNull,
          reason: productField.offTag,
        );
        expect(
          tagsInLanguages,
          isNotEmpty,
          reason: productField.offTag,
        );

        for (final OpenFoodFactsLanguage language in languages) {
          expect(
            tagsInLanguages![language],
            isNotNull,
            reason: productField.offTag,
          );
          expect(
            tagsInLanguages[language],
            isNotEmpty,
            reason: productField.offTag,
          );
        }
      }

      check(
        product.imagesFreshnessInLanguages,
        ProductField.IMAGES_FRESHNESS_IN_LANGUAGES,
      );
    });

    test('get all "tags all languages" (String)', () async {
      const String barcode = '5449000000996';
      const List<OpenFoodFactsLanguage> languages = [
        OpenFoodFactsLanguage.ENGLISH,
        OpenFoodFactsLanguage.FRENCH,
      ];

      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(
        barcode,
        languages: languages,
        fields: [
          ProductField.NAME_IN_LANGUAGES,
          ProductField.INGREDIENTS_TEXT_IN_LANGUAGES,
          ProductField.PACKAGING_TEXT_IN_LANGUAGES,
        ],
        version: ProductQueryVersion.v3,
      );
      final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
      );
      expect(result.status, ProductResultV3.statusSuccess);
      expect(result.product, isNotNull);
      final Product product = result.product!;

      void check(
        final Map<OpenFoodFactsLanguage, String>? tagsInLanguages,
        final ProductField productField,
      ) {
        expect(
          tagsInLanguages,
          isNotNull,
          reason: productField.offTag,
        );
        expect(
          tagsInLanguages,
          isNotEmpty,
          reason: productField.offTag,
        );

        for (final OpenFoodFactsLanguage language in languages) {
          expect(
            tagsInLanguages![language],
            isNotNull,
            reason: productField.offTag,
          );
          expect(
            tagsInLanguages[language],
            isNotEmpty,
            reason: productField.offTag,
          );
        }
      }

      check(
        product.productNameInLanguages,
        ProductField.NAME_IN_LANGUAGES,
      );
      check(
        product.ingredientsTextInLanguages,
        ProductField.INGREDIENTS_TEXT_IN_LANGUAGES,
      );
      check(
        product.packagingTextInLanguages,
        ProductField.PACKAGING_TEXT_IN_LANGUAGES,
      );
    });

    test('get all "tags in languages" (List<String>)', () async {
      const String barcode = '5449000000996';
      const List<OpenFoodFactsLanguage> languages = [
        OpenFoodFactsLanguage.ENGLISH,
        OpenFoodFactsLanguage.FRENCH,
      ];

      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(
        barcode,
        languages: languages,
        fields: [
          ProductField.INGREDIENTS_TEXT_ALL_LANGUAGES,
          ProductField.PACKAGING_TEXT_ALL_LANGUAGES,
          ProductField.NAME_ALL_LANGUAGES,
          ProductField.INGREDIENTS_TEXT_IN_LANGUAGES,
          ProductField.PACKAGING_TEXT_IN_LANGUAGES,
          ProductField.NAME_IN_LANGUAGES,
        ],
        version: ProductQueryVersion.v3,
      );
      final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
      );
      expect(result.status, ProductResultV3.statusSuccess);
      expect(result.product, isNotNull);
      final Product product = result.product!;

      void check(
        final Map<OpenFoodFactsLanguage, String>? tagsInLanguages,
        final ProductField productField,
      ) {
        expect(
          tagsInLanguages,
          isNotNull,
          reason: productField.offTag,
        );
        expect(
          tagsInLanguages,
          isNotEmpty,
          reason: productField.offTag,
        );
      }

      check(
        product.ingredientsTextInLanguages,
        ProductField.INGREDIENTS_TEXT_ALL_LANGUAGES,
      );
      check(
        product.packagingTextInLanguages,
        ProductField.PACKAGING_TEXT_ALL_LANGUAGES,
      );
      check(
        product.productNameInLanguages,
        ProductField.NAME_ALL_LANGUAGES,
      );
    });

    test('get all "tags in+all languages" (List<String>)', () async {
      const String barcode = '5449000000996';

      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(
        barcode,
        fields: [
          // tags all languages
          ProductField.INGREDIENTS_TEXT_ALL_LANGUAGES,
          ProductField.PACKAGING_TEXT_ALL_LANGUAGES,
          ProductField.NAME_ALL_LANGUAGES,
        ],
        version: ProductQueryVersion.v3,
      );
      final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
        configurations,
      );
      expect(result.status, ProductResultV3.statusSuccess);
      expect(result.product, isNotNull);
      final Product product = result.product!;

      void check(
        final Map<OpenFoodFactsLanguage, String>? tagsInLanguages,
        final ProductField productField,
      ) {
        expect(
          tagsInLanguages,
          isNotNull,
          reason: productField.offTag,
        );
        expect(
          tagsInLanguages,
          isNotEmpty,
          reason: productField.offTag,
        );
      }

      check(
        product.ingredientsTextInLanguages,
        ProductField.INGREDIENTS_TEXT_ALL_LANGUAGES,
      );
      check(
        product.packagingTextInLanguages,
        ProductField.PACKAGING_TEXT_ALL_LANGUAGES,
      );
      check(
        product.productNameInLanguages,
        ProductField.NAME_ALL_LANGUAGES,
      );
    });
  });
}
