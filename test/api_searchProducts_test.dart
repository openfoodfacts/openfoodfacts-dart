import 'package:openfoodfacts/model/ProductFreshness.dart';
import 'package:openfoodfacts/model/parameter/PnnsGroup2Filter.dart';
import 'package:openfoodfacts/model/parameter/SearchTerms.dart';
import 'package:openfoodfacts/model/parameter/TagFilter.dart';
import 'package:openfoodfacts/model/parameter/WithoutAdditives.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/CountryHelper.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/PnnsGroups.dart';
import 'package:openfoodfacts/utils/ProductListQueryConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;

  group('$OpenFoodAPIClient search products', () {
    test('search favorite products', () async {
      final parameters = <Parameter>[
        const Page(page: 1),
        const PageSize(size: 10),
        const SortBy(option: SortOption.POPULARITY)
      ];

      final ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
              parametersList: parameters,
              fields: [ProductField.ALL],
              language: OpenFoodFactsLanguage.GERMAN);

      final SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.TEST_USER,
        configuration,
      );

      expect(result.page, 1);
      expect(result.pageSize, 10);
      expect(result.products, isNotNull);
      expect(result.products!.length, 10);
      expect(result.products![0].runtimeType, Product);
      expect(result.count, greaterThan(30000));
    });

    test('search favorite products EN', () async {
      final parameters = <Parameter>[
        const Page(page: 14),
        const PageSize(size: 3),
        const SortBy(option: SortOption.EDIT)
      ];

      final ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
              parametersList: parameters,
              fields: [ProductField.ALL],
              language: OpenFoodFactsLanguage.ENGLISH);

      final SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.TEST_USER,
        configuration,
      );

      expect(result.page, 14);
      expect(result.pageSize, 3);
      expect(result.products, isNotNull);
      expect(result.products!.length, 3);
      expect(result.products![0].runtimeType, Product);
      expect(result.count, greaterThan(30000));
    });

    test('type bug : ingredient percent int vs String ', () async {
      final parameters = <Parameter>[
        const Page(page: 16),
        const PageSize(size: 5),
        const SortBy(option: SortOption.POPULARITY)
      ];

      final ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
              parametersList: parameters,
              fields: [ProductField.ALL],
              language: OpenFoodFactsLanguage.GERMAN);

      final SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.TEST_USER,
        configuration,
      );

      expect(result.page, 16);
      expect(result.pageSize, 5);
      expect(result.products, isNotNull);
      expect(result.products!.length, 5);
      expect(result.products![0].runtimeType, Product);
      expect(result.count, greaterThan(30000));
    });

    test('search products by keywords', () async {
      final List<Parameter> parameters = <Parameter>[
        const Page(page: 2),
        const PageSize(size: 10),
        const SearchTerms(terms: ['Kiwi'])
      ];

      final ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
              parametersList: parameters,
              fields: [ProductField.BARCODE],
              language: OpenFoodFactsLanguage.FRENCH);

      final SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.TEST_USER,
        configuration,
      );

      expect(result.page, 2);
      expect(result.pageSize, 10);
      expect(result.products, isNotNull);
      expect(result.products!.length, 10);
      expect(result.products![0].runtimeType, Product);
      expect(result.count, greaterThan(900));
    });

    test('search products filter additives', () async {
      final Map<bool, int> counts = {};
      const bool WITHOUT_ADDITIVES = true;
      const bool ADDITIVE_AGNOSTIC = false;
      for (int i = 0; i < 2; i++) {
        final bool withoutAdditives = i == 1;

        final List<Parameter> parameters = <Parameter>[
          const SearchTerms(terms: ['Moules marinières']),
        ];
        if (withoutAdditives) {
          parameters.add(WithoutAdditives());
        }

        final ProductSearchQueryConfiguration configuration =
            ProductSearchQueryConfiguration(
          parametersList: parameters,
          fields: [ProductField.BARCODE],
          language: OpenFoodFactsLanguage.FRENCH,
        );

        final SearchResult result = await OpenFoodAPIClient.searchProducts(
          TestConstants.TEST_USER,
          configuration,
        );

        counts[withoutAdditives] = result.count!;
      }

      expect(counts[WITHOUT_ADDITIVES], lessThan(counts[ADDITIVE_AGNOSTIC]!));
    });

    test('search products with filter on tags', () async {
      final parameters = <Parameter>[
        const Page(page: 5),
        const PageSize(size: 10),
        const SortBy(option: SortOption.PRODUCT_NAME),
        TagFilter.fromType(
          tagFilterType: TagFilterType.CATEGORIES,
          contains: true,
          tagName: 'breakfast_cereals',
        ),
        TagFilter.fromType(
          tagFilterType: TagFilterType.NUTRITION_GRADES,
          contains: true,
          tagName: 'A',
        ),
      ];

      final ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
              parametersList: parameters,
              fields: [ProductField.ALL],
              language: OpenFoodFactsLanguage.FRENCH);

      final SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.TEST_USER,
        configuration,
      );

      expect(result.page, 5);
      expect(result.pageSize, 10);
      expect(result.products, isNotNull);
      expect(result.products!.length, 10);
      expect(result.products![0].runtimeType, Product);
      expect(
          result.products![0].categoriesTags, contains('en:breakfast-cereals'));
      expect(result.products![0].nutriscore!.toUpperCase(), 'A');
    });

    test('search products with filter on all tags (part 1)', () async {
      const String brands = 'Bjorg';
      const String categories = 'en:breakfast-cereals';
      const String packaging = 'fr:Sachet';
      const String labels = 'en:organic';
      const String origins = 'en:european-union-and-non-european-union';
      const String manufacturingPlaces = 'Allemagne';
      const String purchasePlaces = 'france';
      const String stores = 'franprix';
      const String countries = 'en:france';
      const String allergens = 'en:gluten';
      const String traces = 'en:nuts';
      const String nutritionGrades = 'A';
      const String states = 'en:nutrition-facts-completed';
      const String ingredients = 'en:cereal';
      const int novaGroup = 1;
      const String languages = 'ar';
      const String creator = 'sebleouf';
      const String editors = 'foodrepo';
      const String lang = 'fr';

      final parameters = <Parameter>[
        TagFilter.fromType(
            tagFilterType: TagFilterType.BRANDS, tagName: brands),
        TagFilter.fromType(
            tagFilterType: TagFilterType.CATEGORIES, tagName: categories),
        TagFilter.fromType(
            tagFilterType: TagFilterType.PACKAGING, tagName: packaging),
        TagFilter.fromType(
            tagFilterType: TagFilterType.LABELS, tagName: labels),
        TagFilter.fromType(
            tagFilterType: TagFilterType.ORIGINS, tagName: origins),
        TagFilter.fromType(
            tagFilterType: TagFilterType.MANUFACTURING_PLACES,
            tagName: manufacturingPlaces),
        TagFilter.fromType(
            tagFilterType: TagFilterType.PURCHASE_PLACES,
            tagName: purchasePlaces),
        TagFilter.fromType(
            tagFilterType: TagFilterType.STORES, tagName: stores),
        TagFilter.fromType(
            tagFilterType: TagFilterType.COUNTRIES, tagName: countries),
        TagFilter.fromType(
            tagFilterType: TagFilterType.ALLERGENS, tagName: allergens),
        TagFilter.fromType(
            tagFilterType: TagFilterType.TRACES, tagName: traces),
        TagFilter.fromType(
            tagFilterType: TagFilterType.NUTRITION_GRADES,
            tagName: nutritionGrades),
        TagFilter.fromType(
            tagFilterType: TagFilterType.STATES, tagName: states),
        TagFilter.fromType(
            tagFilterType: TagFilterType.INGREDIENTS, tagName: ingredients),
        TagFilter.fromType(
            tagFilterType: TagFilterType.NOVA_GROUPS, tagName: '$novaGroup'),
        TagFilter.fromType(
            tagFilterType: TagFilterType.LANGUAGES, tagName: languages),
        TagFilter.fromType(
            tagFilterType: TagFilterType.CREATOR, tagName: creator),
        TagFilter.fromType(
            tagFilterType: TagFilterType.EDITORS, tagName: editors),
        TagFilter.fromType(tagFilterType: TagFilterType.LANG, tagName: lang),
      ];

      final ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
        parametersList: parameters,
        fields: [ProductField.ALL],
        language: OpenFoodFactsLanguage.FRENCH,
      );

      final SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.TEST_USER,
        configuration,
      );

      expect(result.products, isNotNull);
      expect(result.products!.length, greaterThan(0));
      for (final Product product in result.products!) {
        expect(product.brands!, brands);
        expect(product.categoriesTags, contains(categories));
        expect(product.packaging, contains(packaging));
        expect(product.labelsTags, contains(labels));
        expect(product.storesTags, contains(stores));
        expect(product.countriesTags, contains(countries));
        expect(product.allergens!.ids, contains(allergens));
        expect(product.tracesTags, contains(traces));
        expect(product.nutriscore!.toUpperCase(), nutritionGrades);
        expect(product.statesTags, contains(states));
        expect(product.ingredientsTags, contains(ingredients));
        expect(product.nutriments!.novaGroup, novaGroup);
        expect(product.lang.code, lang);
        // TODO(monsieurtanuki): extract the origins, manufactoringPlaces, purchasePlaces, languages, creator and editors from the product, and compare them to expected values
      }
    });

    test('search products with filter on all tags (part 2)', () async {
      const String embCodes = 'emb-01451a';
      const String additives = 'en:e415';

      final parameters = <Parameter>[
        TagFilter.fromType(
          tagFilterType: TagFilterType.EMB_CODES,
          contains: true,
          tagName: embCodes,
        ),
        TagFilter.fromType(
          tagFilterType: TagFilterType.ADDITIVES,
          contains: true,
          tagName: additives,
        ),
      ];

      final ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
        parametersList: parameters,
        fields: [ProductField.ALL],
        language: OpenFoodFactsLanguage.FRENCH,
      );

      final SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.TEST_USER,
        configuration,
      );

      expect(result.products!.length, greaterThan(0));

      expect(result.products, isNotNull);
      for (final Product product in result.products!) {
        expect(product.additives!.ids, contains(additives));
        // TODO(monsieurtanuki): extract the emb_codes from the product, and compare it to the expected value
      }
    });

    test('search products with quotes', () async {
      const String barcode = '2222222222223';
      final Product product = Product(
          barcode: barcode,
          productName: 'Quoted Coca "cola"',
          lang: OpenFoodFactsLanguage.GERMAN,
          brands: 'Quoted Coca "Cola"');

      await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        product,
      );

      final parameters = <Parameter>[
        const Page(page: 1),
        const SearchTerms(terms: ['Quoted Coca "Cola"']),
      ];

      final ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
              parametersList: parameters,
              fields: [ProductField.ALL],
              language: OpenFoodFactsLanguage.GERMAN);

      final SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.TEST_USER,
        configuration,
      );

      expect(result.products!.length, 1);
      expect(result.products![0].productName, 'Quoted Coca "cola"');
      expect(result.products![0].brands, 'Quoted Coca "Cola"');
    });

    test('multiple products', () async {
      const String UNKNOWN_BARCODE = '1111111111111111111111111111111';
      const List<String> BARCODES = [
        '8024884500403',
        '3263855093192',
        '3045320001570',
        '3021762383344',
        '4008400402222',
        '3330720237255',
        '3608580823513',
        '3700278403936',
        '3302747010029',
        '3608580823490',
        '3250391660995',
        '3760020506605',
        '8722700202387',
        '3330720237330',
        '3535800940005',
        '20000691',
        '3270190127512',
        UNKNOWN_BARCODE,
      ];

      final ProductListQueryConfiguration configuration =
          ProductListQueryConfiguration(
        BARCODES,
        fields: [ProductField.BARCODE, ProductField.NAME],
        language: OpenFoodFactsLanguage.FRENCH,
      );

      final SearchResult result = await OpenFoodAPIClient.getProductList(
        TestConstants.PROD_USER,
        configuration,
        queryType: QueryType.PROD,
      );

      expect(result.page, 1);
      expect(result.pageSize, 24);
      expect(result.count, BARCODES.length - 1);
      expect(result.products, isNotNull);
      expect(result.products!.length, BARCODES.length - 1);
      for (final Product product in result.products!) {
        final String barcode = product.barcode!;
        expect(BARCODES.contains(barcode), barcode != UNKNOWN_BARCODE);
      }
    });

    test('product freshness', () async {
      const String UNKNOWN_BARCODE = '1111111111111111111111111111111';
      const List<String> BARCODES = [
        '8024884500403',
        '3263855093192',
        '3045320001570',
        '3021762383344',
        '4008400402222',
        '3330720237255',
        '3608580823513',
        '3700278403936',
        '3302747010029',
        '3608580823490',
        '3250391660995',
        '3760020506605',
        '8722700202387',
        '3330720237330',
        '3535800940005',
        '20000691',
        '3270190127512',
        UNKNOWN_BARCODE,
      ];

      final Map<String, ProductFreshness> result =
          await OpenFoodAPIClient.getProductFreshness(
        barcodes: BARCODES,
        user: TestConstants.PROD_USER,
        language: OpenFoodFactsLanguage.FRENCH,
        country: OpenFoodFactsCountry.FRANCE,
        queryType: QueryType.PROD,
      );

      int count = 0;
      for (final MapEntry<String, ProductFreshness> entry in result.entries) {
        count++;
        expect(entry.key == UNKNOWN_BARCODE, false);
        expect(entry.key, isIn(BARCODES));
        expect(entry.value.lastModified, isNotNull);
      }
      expect(count, BARCODES.length - 1);
    });

    test('multiple products and pagination', () async {
      const BARCODES = [
        '8024884500403',
        '3263855093192',
        '3045320001570',
        '3021762383344',
        '4008400402222',
        '3330720237255',
        '3608580823513',
        '3700278403936',
        '3302747010029',
        '3608580823490',
        '3250391660995',
        '3760020506605',
        '8722700202387',
        '3330720237330',
        '3535800940005',
        '20000691',
        '3270190127512',
      ];

      final obtainedBarcodes = <String>[];
      var page = 1;
      while (true) {
        final configuration = ProductListQueryConfiguration(
          BARCODES,
          fields: [ProductField.BARCODE, ProductField.NAME],
          language: OpenFoodFactsLanguage.FRENCH,
          page: page,
          pageSize: 5,
          sortOption: SortOption.PRODUCT_NAME,
        );

        final result = await OpenFoodAPIClient.getProductList(
            TestConstants.PROD_USER, configuration);
        if (result.products == null || result.products!.isEmpty) {
          break;
        }
        final newBarcodes = result.products!.map((e) => e.barcode!);
        expect(newBarcodes.any(obtainedBarcodes.contains), isFalse);
        obtainedBarcodes.addAll(newBarcodes);
        page += 1;
      }
      // We want to test pagination mechanism so we expect >1 pages
      expect(page, greaterThan(1));
      expect(obtainedBarcodes.toSet(), BARCODES.toSet());
    });

    test('query potatoes products', () async {
      final ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
        language: OpenFoodFactsLanguage.ENGLISH,
        fields: [ProductField.ALL],
        parametersList: [
          PnnsGroup2Filter(pnnsGroup2: PnnsGroup2.POTATOES),
          Page(page: 3),
        ],
      );

      final SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.TEST_USER,
        configuration,
      );

      expect(result.page, 3);
      expect(result.pageSize, 24);
      expect(result.products, isNotNull);
      expect(result.products!.length, 24);
      expect(result.products![0].runtimeType, Product);
      expect(result.count, greaterThan(1500));
    });
  });
}
