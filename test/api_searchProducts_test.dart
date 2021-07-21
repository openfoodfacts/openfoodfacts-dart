import 'package:openfoodfacts/interface/Parameter.dart';
import 'package:openfoodfacts/model/parameter/SearchTerms.dart';
import 'package:openfoodfacts/model/parameter/TagFilter.dart';
import 'package:openfoodfacts/model/parameter/WithoutAdditives.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/model/SearchResult.dart';
import 'package:openfoodfacts/model/parameter/PnnsGroup2Filter.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/PnnsGroups.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';
import 'package:openfoodfacts/utils/ProductListQueryConfiguration.dart';
import 'package:openfoodfacts/utils/ProductSearchQueryConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  group('$OpenFoodAPIClient search products', () {
    test('search favorite products', () async {
      var parameters = <Parameter>[
        const Page(page: 1),
        const PageSize(size: 10),
        const SortBy(option: SortOption.POPULARITY)
      ];

      ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
              parametersList: parameters,
              fields: [ProductField.ALL],
              language: OpenFoodFactsLanguage.GERMAN);

      SearchResult result = await OpenFoodAPIClient.searchProducts(
          TestConstants.TEST_USER, configuration,
          queryType: QueryType.TEST);

      expect(result.page, 1);
      expect(result.pageSize, 10);
      expect(result.products != null, true);
      expect(result.products!.length, 10);
      expect(result.products![0].runtimeType, Product);
      expect(result.count! > 30000, true);
    });

    test('search favorite products EN', () async {
      var parameters = <Parameter>[
        const Page(page: 14),
        const PageSize(size: 3),
        const SortBy(option: SortOption.EDIT)
      ];

      ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
              parametersList: parameters,
              fields: [ProductField.ALL],
              language: OpenFoodFactsLanguage.ENGLISH);

      SearchResult result = await OpenFoodAPIClient.searchProducts(
          TestConstants.TEST_USER, configuration,
          queryType: QueryType.TEST);

      expect(result.page, 14);
      expect(result.pageSize, 3);
      expect(result.products != null, true);
      expect(result.products!.length, 3);
      expect(result.products![0].runtimeType, Product);
      expect(result.count! > 30000, true);
    });

    test('type bug : ingredient percent int vs String ', () async {
      var parameters = <Parameter>[
        const Page(page: 16),
        const PageSize(size: 5),
        const SortBy(option: SortOption.POPULARITY)
      ];

      ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
              parametersList: parameters,
              fields: [ProductField.ALL],
              language: OpenFoodFactsLanguage.GERMAN);

      SearchResult result = await OpenFoodAPIClient.searchProducts(
          TestConstants.TEST_USER, configuration,
          queryType: QueryType.TEST);

      expect(result.page, 16);
      expect(result.pageSize, 5);
      expect(result.products != null, true);
      expect(result.products!.length, 5);
      expect(result.products![0].runtimeType, Product);
      expect(result.count! > 30000, true);
    });

    /*test('search products by keywords', () async {
      var parameters = <Parameter>[
        const OutputFormat(format: Format.JSON),
        const Page(page: 2),
        const PageSize(size: 10),
        const SearchSimple(active: true),
        const SortBy(option: SortOption.PRODUCT_NAME),
        const SearchTerms(terms: ["Fruit"])
      ];

      ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
              parametersList: parameters,
              fields: [ProductField.ALL],
              language: OpenFoodFactsLanguage.FRENCH);

      //For this query we will use the PROD bcs on the TEST DB the query take
      // more then 30 sec and this lead to a timeout
      SearchResult result = await OpenFoodAPIClient.searchProducts(
          TestConstants.PROD_USER, configuration,
          queryType: QueryType.PROD);

      expect(result != null, true);
      expect(result.page, 2);
      expect(result.pageSize, 10);
      expect(result.products != null, true);
      expect(result.products.length, 10);
      expect(result.products[0].runtimeType, Product);
      expect(result.count > 30000, true);
    });*/

    test('search products filter additives', () async {
      var parameters = <Parameter>[
        const Page(page: 5),
        const PageSize(size: 10),
        const SortBy(option: SortOption.PRODUCT_NAME),
        const SearchTerms(terms: ['Fruit à coques']),
      ];

      ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
              parametersList: parameters,
              fields: [ProductField.ALL],
              language: OpenFoodFactsLanguage.FRENCH);

      SearchResult result = await OpenFoodAPIClient.searchProducts(
          TestConstants.TEST_USER, configuration,
          queryType: QueryType.TEST);

      int totalCount = result.count!;

      parameters = <Parameter>[
        const Page(page: 5),
        const PageSize(size: 10),
        const SortBy(option: SortOption.PRODUCT_NAME),
        const SearchTerms(terms: ['Fruit à coques']),
        const WithoutAdditives(),
      ];

      configuration = ProductSearchQueryConfiguration(
          parametersList: parameters,
          fields: [ProductField.ALL],
          language: OpenFoodFactsLanguage.FRENCH);

      result = await OpenFoodAPIClient.searchProducts(
          TestConstants.TEST_USER, configuration,
          queryType: QueryType.TEST);

      expect(result.count! < totalCount, true);
    });

    test('search products with filter on tags', () async {
      var parameters = <Parameter>[
        const Page(page: 5),
        const PageSize(size: 10),
        const SortBy(option: SortOption.PRODUCT_NAME),
        const TagFilter(
            tagType: 'categories',
            contains: true,
            tagName: 'breakfast_cereals'),
        const TagFilter(
            tagType: 'nutrition_grades', contains: true, tagName: 'A')
      ];

      ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
              parametersList: parameters,
              fields: [ProductField.ALL],
              language: OpenFoodFactsLanguage.FRENCH);

      SearchResult result = await OpenFoodAPIClient.searchProducts(
          TestConstants.TEST_USER, configuration,
          queryType: QueryType.TEST);

      expect(result.page, 5);
      expect(result.pageSize, 10);
      expect(result.products != null, true);
      expect(result.products!.length, 10);
      expect(result.products![0].runtimeType, Product);
      expect(
          result.products![0].categoriesTags!.contains('en:breakfast-cereals'),
          true);
      expect(result.products![0].nutriscore!.toUpperCase() == 'A', true);
    });

    test('search products with quotes', () async {
      String barcode = '2222222222223';
      Product product = Product(
          barcode: barcode,
          productName: 'Quoted Coca "cola"',
          lang: OpenFoodFactsLanguage.GERMAN,
          brands: 'Quoted Coca "Cola"');

      await OpenFoodAPIClient.saveProduct(TestConstants.TEST_USER, product,
          queryType: QueryType.TEST);

      var parameters = <Parameter>[
        const Page(page: 1),
        const SearchTerms(terms: ['Quoted Coca "Cola"']),
      ];

      ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
              parametersList: parameters,
              fields: [ProductField.ALL],
              language: OpenFoodFactsLanguage.GERMAN);

      SearchResult result = await OpenFoodAPIClient.searchProducts(
          TestConstants.TEST_USER, configuration,
          queryType: QueryType.TEST);

      expect(result.products!.length, 1);
      expect(result.products![0].productName, equals('Quoted Coca "cola"'));
      expect(result.products![0].brands, equals('Quoted Coca "Cola"'));
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

      SearchResult result = await OpenFoodAPIClient.getProductList(
        TestConstants.PROD_USER,
        configuration,
        queryType: QueryType.PROD,
      );

      expect(result.page, 1);
      expect(result.pageSize, 24);
      expect(result.count, BARCODES.length - 1);
      expect(result.products != null, true);
      expect(result.products!.length, BARCODES.length - 1);
      for (final Product product in result.products!) {
        final String barcode = product.barcode!;
        expect(BARCODES.contains(barcode), barcode != UNKNOWN_BARCODE);
      }
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
        queryType: QueryType.TEST,
      );

      expect(result.page, 3);
      expect(result.pageSize, 24);
      expect(result.products != null, true);
      expect(result.products!.length, 24);
      expect(result.products![0].runtimeType, Product);
      expect(result.count! > 1500, true);
    });
  });
}
