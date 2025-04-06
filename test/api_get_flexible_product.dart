import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;

  const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.FRENCH;
  const String barcode = '7300400481588';

  // cf. https://github.com/openfoodfacts/openfoodfacts-server/issues/11745
  void expectNonNullProduct(
    final FlexibleProduct product, {
    required final bool directSearch,
  }) {
    expect(product.imageUrlBase, isNotNull);
    expect(product.barcode, isNotNull);
    expect(product.productType, isNotNull);
    expect(product.schemaVersion, isNotNull);
    expect(product.abbreviatedName, isNotNull);
    expect(product.additives, isNotNull);
    expect(product.attributeGroups, isNotNull);
    expect(product.brands, isNotNull);
    expect(product.categories, isNotNull);
    expect(product.categoriesTags, isNotNull);
    expect(product.categoriesTagsInLanguages, isNotNull);
    expect(product.comparedToCategory, isNotNull);
    expect(product.countries, isNotNull);
    expect(product.countriesTagsInLanguages, isNotNull);
    expect(product.embCodes, isNotNull);
    expect(product.genericName, isNotNull);
    expect(product.imageFrontUrl, isNotNull);
    expect(product.imageFrontSmallUrl, isNotNull);
    if (directSearch) {
      expect(product.imageIngredientsUrl, isNotNull);
      expect(product.imageIngredientsSmallUrl, isNotNull);
      expect(product.imageNutritionUrl, isNotNull);
      expect(product.imageNutritionSmallUrl, isNotNull);
      expect(product.imagePackagingUrl, isNotNull);
      expect(product.imagePackagingSmallUrl, isNotNull);
    }
    expect(product.images, isNotNull);
    expect(product.ingredients, isNotNull);
    expect(product.ingredientsText, isNotNull);
    expect(product.ingredientsTextInLanguages, isNotNull);
    expect(product.knowledgePanels, isNotNull);
    expect(product.labels, isNotNull);
    expect(product.labelsTagsInLanguages, isNotNull);
    expect(product.lang, isNotNull);
    expect(product.lastImage, isNotNull);
    expect(product.lastImageDates, isNotNull);
    expect(product.noNutritionData, isNotNull);
    expect(product.nutrimentDataPer, isNotNull);
    expect(product.nutriments, isNotNull);
    expect(product.obsolete, isNotNull);
    expect(product.origins, isNotNull);
    expect(product.ownerFields, isNotNull);
    expect(product.packagings, isNotNull);
    expect(product.packagingsComplete, isNotNull);
    expect(product.packagingTextInLanguages, isNotNull);
    expect(product.productName, isNotNull);
    expect(product.productNameInLanguages, isNotNull);
    expect(product.quantity, isNotNull);
    expect(product.selectedImages, isNotNull);
    expect(product.servingSize, isNotNull);
    expect(product.statesTags, isNotNull);
    expect(product.stores, isNotNull);
    expect(product.website, isNotNull);
  }

  // Smoothie fields as of 2025-04-04
  const List<ProductField> fields = <ProductField>[
    ProductField.NAME,
    ProductField.NAME_ALL_LANGUAGES,
    ProductField.BRANDS,
    ProductField.BARCODE,
    ProductField.PRODUCT_TYPE,
    ProductField.NUTRISCORE,
    ProductField.FRONT_IMAGE,
    ProductField.IMAGE_FRONT_URL,
    ProductField.IMAGE_INGREDIENTS_URL,
    ProductField.IMAGE_NUTRITION_URL,
    ProductField.IMAGE_PACKAGING_URL,
    ProductField.IMAGES,
    ProductField.SELECTED_IMAGE,
    ProductField.QUANTITY,
    ProductField.SERVING_SIZE,
    ProductField.STORES,
    ProductField.PACKAGING_QUANTITY,
    ProductField.PACKAGING,
    ProductField.PACKAGINGS,
    ProductField.PACKAGINGS_COMPLETE,
    ProductField.PACKAGING_TAGS,
    ProductField.PACKAGING_TEXT_ALL_LANGUAGES,
    ProductField.NO_NUTRITION_DATA,
    ProductField.NUTRIMENT_DATA_PER,
    ProductField.NUTRITION_DATA,
    ProductField.NUTRIMENTS,
    ProductField.NUTRIENT_LEVELS,
    ProductField.NUTRIMENT_ENERGY_UNIT,
    ProductField.ADDITIVES,
    ProductField.INGREDIENTS_ANALYSIS_TAGS,
    ProductField.INGREDIENTS_TEXT,
    ProductField.INGREDIENTS_TEXT_ALL_LANGUAGES,
    ProductField.LABELS_TAGS,
    ProductField.LABELS_TAGS_IN_LANGUAGES,
    ProductField.COMPARED_TO_CATEGORY,
    ProductField.CATEGORIES_TAGS,
    ProductField.CATEGORIES_TAGS_IN_LANGUAGES,
    ProductField.LANGUAGE,
    ProductField.ATTRIBUTE_GROUPS,
    ProductField.STATES_TAGS,
    ProductField.ECOSCORE_DATA,
    ProductField.ECOSCORE_GRADE,
    ProductField.ECOSCORE_SCORE,
    ProductField.KNOWLEDGE_PANELS,
    ProductField.COUNTRIES,
    ProductField.COUNTRIES_TAGS,
    ProductField.COUNTRIES_TAGS_IN_LANGUAGES,
    ProductField.EMB_CODES,
    ProductField.ORIGINS,
    ProductField.WEBSITE,
    ProductField.OBSOLETE,
    ProductField.OWNER_FIELDS,
    ProductField.OWNER,
    // The following fields are not queried by Smoothie, but needed, curiously.
    ProductField.ABBREVIATED_NAME,
    ProductField.GENERIC_NAME,
    ProductField.IMAGE_FRONT_SMALL_URL,
    ProductField.IMAGE_INGREDIENTS_SMALL_URL,
    ProductField.IMAGE_NUTRITION_SMALL_URL,
    ProductField.IMAGE_PACKAGING_SMALL_URL,
    ProductField.INGREDIENTS,
    ProductField.LABELS,
    ProductField.LAST_IMAGE,
    ProductField.LAST_IMAGE_DATES,
    ProductField.CATEGORIES,
  ];

  Future<FlexibleProductResult> getFlexibleProductInProd(
    ProductQueryConfiguration configuration,
  ) async {
    await getProductTooManyRequestsManager.waitIfNeeded();
    return OpenFoodAPIClient.getFlexibleProductResult(configuration);
  }

  Future<FlexibleSearchResult> searchFlexibleProductsInProd(
    final AbstractQueryConfiguration configuration,
  ) async {
    await searchProductsTooManyRequestsManager.waitIfNeeded();
    return OpenFoodAPIClient.searchFlexibleProducts(
      TestConstants.PROD_USER,
      configuration,
    );
  }

  final Map<num, int> schemaVersions = <num, int>{
    3: 999,
    3.1: 1000,
    3.2: 1001,
  };

  group('$OpenFoodAPIClient get flexible product', () {
    test('check schema version numbers', () async {
      for (final MapEntry<num, int> entry in schemaVersions.entries) {
        final num apiVersion = entry.key;
        final int expectedSchemaVersion = entry.value;

        final ProductQueryConfiguration configurations =
            ProductQueryConfiguration(
          barcode,
          language: language,
          fields: [ProductField.BARCODE],
          version: ProductQueryVersion(apiVersion),
        );
        final FlexibleProductResult result = await getFlexibleProductInProd(
          configurations,
        );
        expect(result.status, ProductResultV3.statusSuccess);
        final FlexibleProduct? product = result.product;
        expect(product, isNotNull);
        expect(product!.schemaVersion, expectedSchemaVersion);
      }
    });

    test('check brands in api 3.2', () async {
      for (final MapEntry<num, int> entry in schemaVersions.entries) {
        final num apiVersion = entry.key;
        final int expectedSchemaVersion = entry.value;

        final ProductQueryConfiguration configurations =
            ProductQueryConfiguration(
          barcode,
          language: language,
          fields: [ProductField.BRANDS],
          version: ProductQueryVersion(apiVersion),
        );
        final FlexibleProductResult result = await getFlexibleProductInProd(
          configurations,
        );
        expect(result.status, ProductResultV3.statusSuccess);
        final FlexibleProduct? product = result.product;
        expect(product, isNotNull);
        expect(product!.schemaVersion, expectedSchemaVersion);
        expect(product.brands, 'Wasa');
        if (apiVersion >= 3.2) {
          expect(product.json['brands_hierarchy'], ["xx:Wasa"]);
          expect(product.json['brands_lc'], 'xx');
          expect(product.json['brands_tags'], ["xx:wasa"]);
        } else {
          expect(product.json['brands_hierarchy'], isNull);
          expect(product.json['brands_lc'], isNull);
          expect(product.json['brands_tags'], isNull);
        }
      }
    });

    test('check all "Smoothie" fields in api 3', () async {
      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(
        barcode,
        language: language,
        fields: fields,
        version: ProductQueryVersion(3),
      );
      final FlexibleProductResult result = await getFlexibleProductInProd(
        configurations,
      );
      expect(result.status, ProductResultV3.statusSuccess);
      final FlexibleProduct? product = result.product;
      expect(product, isNotNull);
      expectNonNullProduct(
        product!,
        directSearch: true,
      );
    });
  });

  group('$OpenFoodAPIClient search flexible products', () {
    test('check wasa products in api 3', () async {
      final ProductSearchQueryConfiguration configurations =
          ProductSearchQueryConfiguration(
        parametersList: [
          BarcodeParameter(barcode),
        ],
        fields: fields,
        language: language,
        version: ProductQueryVersion(3),
      );
      await OpenFoodAPIClient.searchFlexibleProducts(
        TestConstants.PROD_USER,
        configurations,
      );
      final FlexibleSearchResult result = await searchFlexibleProductsInProd(
        configurations,
      );
      expect(result.count, 1);
      final Iterable<FlexibleProduct>? products = result.products;
      expect(products, isNotNull);
      for (final FlexibleProduct product in result.products!) {
        expectNonNullProduct(product, directSearch: false);
      }
    });
  });
}
