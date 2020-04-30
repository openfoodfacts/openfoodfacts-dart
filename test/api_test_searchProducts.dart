import 'package:flutter_test/flutter_test.dart';
import 'package:openfoodfacts/interface/Parameter.dart';
import 'package:openfoodfacts/model/parameter/ContainsAdditives.dart';
import 'package:openfoodfacts/model/parameter/SearchTerms.dart';
import 'package:openfoodfacts/model/parameter/TagFilter.dart';
import 'package:openfoodfacts/utils/HttpHelper.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/model/SearchResult.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';
import 'package:openfoodfacts/utils/ProductSearchQueryConfiguration.dart';

import 'test_constants.dart';

void main() {
  setUpAll(() async {
    new HttpHelper().isTestMode = true;
  });

  group('$OpenFoodAPIClient search products', () {
    test('search favorite products', () async {
      var parameters = <Parameter>[
        const OutputFormat(format: Format.JSON),
        const Page(page: 1),
        const PageSize(size: 10),
        const SearchSimple(active: true),
        const SortBy(option: SortOption.POPULARITY)
      ];

      ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
              parametersList: parameters,
              fields: [ProductField.ALL],
              language: OpenFoodFactsLanguage.GERMAN);

      SearchResult result = await OpenFoodAPIClient.searchProducts(
          TestConstants.TEST_USER, configuration);

      expect(result != null, true);
      expect(result.page, 1);
      expect(result.pageSize, 10);
      expect(result.products != null, true);
      expect(result.products.length, 10);
      expect(result.products[0].runtimeType, Product);
      expect(result.count > 30000, true);

      print(result.products[2].toData().toString());
      result.products[3].ingredients.forEach((i) => print(i.text));
    });

    test('search favorite products EN', () async {
      var parameters = <Parameter>[
        const OutputFormat(format: Format.JSON),
        const Page(page: 14),
        const PageSize(size: 3),
        const SearchSimple(active: true),
        const SortBy(option: SortOption.EDIT)
      ];

      ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
              parametersList: parameters,
              fields: [ProductField.ALL],
              language: OpenFoodFactsLanguage.ENGLISH);

      SearchResult result = await OpenFoodAPIClient.searchProducts(
          TestConstants.TEST_USER, configuration);

      expect(result != null, true);
      expect(result.page, 14);
      expect(result.pageSize, 3);
      expect(result.products != null, true);
      expect(result.products.length, 3);
      expect(result.products[0].runtimeType, Product);
      expect(result.count > 30000, true);

      print(result.products[0].toData().toString());
    });

    test('type bug : ingredient percent int vs String ', () async {
      var parameters = <Parameter>[
        const OutputFormat(format: Format.JSON),
        const Page(page: 16),
        const PageSize(size: 5),
        const SearchSimple(active: true),
        const SortBy(option: SortOption.POPULARITY)
      ];

      ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
              parametersList: parameters,
              fields: [ProductField.ALL],
              language: OpenFoodFactsLanguage.GERMAN);

      SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.TEST_USER,
        configuration,
      );

      print(result);

      expect(result != null, true);
      expect(result.page, 16);
      expect(result.pageSize, 5);
      expect(result.products != null, true);
      expect(result.products.length, 5);
      expect(result.products[0].runtimeType, Product);
      expect(result.count > 30000, true);

      print(result.products[0].toData().toString());
      result.products[0].ingredients
          ?.forEach((i) => print(i.percent?.toString()));

      print(result.products[1].toData().toString());
      result.products[1].ingredients
          ?.forEach((i) => print(i.percent?.toString()));

      print(result.products[2].toData().toString());
      result.products[2].ingredients
          ?.forEach((i) => print(i.percent?.toString()));

      print(result.products[3].toData().toString());
      result.products[3].ingredients
          ?.forEach((i) => print(i.percent?.toString()));

      print(result.products[4].toData().toString());
      result.products[4].ingredients
          ?.forEach((i) => print(i.percent?.toString()));
    });

    test('search products by keywords', () async {
      var parameters = <Parameter>[
        const OutputFormat(format: Format.JSON),
        const Page(page: 5),
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

      SearchResult result = await OpenFoodAPIClient.searchProducts(
          TestConstants.TEST_USER, configuration);

      expect(result != null, true);
      expect(result.page, 5);
      expect(result.pageSize, 10);
      expect(result.products != null, true);
      expect(result.products.length, 10);
      expect(result.products[0].runtimeType, Product);
      expect(result.count > 30000, true);
    });

    test('search products filter additives', () async {
      var parameters = <Parameter>[
        const OutputFormat(format: Format.JSON),
        const Page(page: 5),
        const PageSize(size: 10),
        const SearchSimple(active: true),
        const SortBy(option: SortOption.PRODUCT_NAME),
        const SearchTerms(terms: ["Fruit à coques"]),
        const ContainsAdditives(filter: false)
      ];

      ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
              parametersList: parameters,
              fields: [ProductField.ALL],
              language: OpenFoodFactsLanguage.FRENCH);

      SearchResult result = await OpenFoodAPIClient.searchProducts(
          TestConstants.TEST_USER, configuration);

      int totalCount = result.count;

      parameters = <Parameter>[
        const OutputFormat(format: Format.JSON),
        const Page(page: 5),
        const PageSize(size: 10),
        const SearchSimple(active: true),
        const SortBy(option: SortOption.PRODUCT_NAME),
        const SearchTerms(terms: ["Fruit à coques"]),
        const ContainsAdditives(filter: true)
      ];

      configuration = ProductSearchQueryConfiguration(
          parametersList: parameters,
          fields: [ProductField.ALL],
          language: OpenFoodFactsLanguage.FRENCH);

      result = await OpenFoodAPIClient.searchProducts(
          TestConstants.TEST_USER, configuration);

      print(
          "Total product count : $totalCount; Filtered count : ${result.count}");
      expect(result.count < totalCount, true);
    });

    test('search products with filter on tags', () async {
      var parameters = <Parameter>[
        const OutputFormat(format: Format.JSON),
        const Page(page: 5),
        const PageSize(size: 10),
        const SearchSimple(active: true),
        const SortBy(option: SortOption.PRODUCT_NAME),
        const TagFilter(
            tagType: "categories",
            contains: true,
            tagName: "breakfast_cereals"),
        const TagFilter(
            tagType: "nutrition_grades", contains: true, tagName: "A")
      ];

      ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
              parametersList: parameters,
              fields: [ProductField.ALL],
              language: OpenFoodFactsLanguage.FRENCH);

      SearchResult result = await OpenFoodAPIClient.searchProducts(
          TestConstants.TEST_USER, configuration);

      expect(result != null, true);
      expect(result.page, 5);
      expect(result.pageSize, 10);
      expect(result.products != null, true);
      expect(result.products.length, 10);
      expect(result.products[0].runtimeType, Product);
      expect(result.products[0].categoriesTags.contains("en:breakfast-cereals"),
          true);
      expect(result.products[0].nutriscore.toUpperCase() == 'A', true);

      print(result.products[0].toData().toString());
    });
  });
}
