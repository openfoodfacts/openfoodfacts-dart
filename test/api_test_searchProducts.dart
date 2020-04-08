import 'package:flutter_test/flutter_test.dart';
import 'package:openfoodfacts/interface/Parameter.dart';
import 'package:openfoodfacts/model/Additives.dart';
import 'package:openfoodfacts/model/parameter/ContainsAdditives.dart';
import 'package:openfoodfacts/model/parameter/SearchTerms.dart';
import 'package:openfoodfacts/model/parameter/TagFilter.dart';
import 'package:openfoodfacts/utils/HttpHelper.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/model/SearchResult.dart';
import 'package:openfoodfacts/model/User.dart';

import 'test_constants.dart';

void main() {
  setUpAll(() async {
    new HttpHelper().isTestMode = true;
  });

  group('$OpenFoodAPIClient search products', () {
    test('search favorite products', () async {
      var parameterList = <Parameter>[
        const OutputFormat(format: Format.JSON),
        const Page(page: 1),
        const PageSize(size: 10),
        const SearchSimple(active: true),
        const SortBy(option: SortOption.POPULARITY)
      ];

      SearchResult result = await OpenFoodAPIClient.searchProducts(
          TestConstants.TEST_USER,
          parameterList,
          lang: User.LANGUAGE_DE);

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
      var parameterList = <Parameter>[
        const OutputFormat(format: Format.JSON),
        const Page(page: 14),
        const PageSize(size: 3),
        const SearchSimple(active: true),
        const SortBy(option: SortOption.EDIT)
      ];

      SearchResult result = await OpenFoodAPIClient.searchProducts(
          TestConstants.TEST_USER,
          parameterList,
          lang: User.LANGUAGE_EN);

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
      var parameterList = <Parameter>[
        const OutputFormat(format: Format.JSON),
        const Page(page: 16),
        const PageSize(size: 5),
        const SearchSimple(active: true),
        const SortBy(option: SortOption.POPULARITY)
      ];

      SearchResult result = await OpenFoodAPIClient.searchProducts(
          TestConstants.TEST_USER,
          parameterList,
          lang: User.LANGUAGE_DE);

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
      var parameterList = <Parameter>[
        const OutputFormat(format: Format.JSON),
        const Page(page: 5),
        const PageSize(size: 10),
        const SearchSimple(active: true),
        const SortBy(option: SortOption.PRODUCT_NAME),
        const SearchTerms(terms: ["Fruit"])
      ];

      SearchResult result = await OpenFoodAPIClient.searchProducts(
          TestConstants.TEST_USER,
          parameterList,
          lang: User.LANGUAGE_FR);

      expect(result != null, true);
      expect(result.page, 5);
      expect(result.pageSize, 10);
      expect(result.products != null, true);
      expect(result.products.length, 10);
      expect(result.products[0].runtimeType, Product);
      expect(result.count > 30000, true);
    });

    test('search products filter additives', () async {
      var parameterList = <Parameter>[
        const OutputFormat(format: Format.JSON),
        const Page(page: 5),
        const PageSize(size: 10),
        const SearchSimple(active: true),
        const SortBy(option: SortOption.PRODUCT_NAME),
        const SearchTerms(terms: ["Fruit à coques"]),
        const ContainsAdditives(filter: false)
      ];

      SearchResult result = await OpenFoodAPIClient.searchProducts(
          TestConstants.TEST_USER,
          parameterList,
          lang: User.LANGUAGE_FR);

      int totalCount = result.count;

      parameterList = <Parameter>[
        const OutputFormat(format: Format.JSON),
        const Page(page: 5),
        const PageSize(size: 10),
        const SearchSimple(active: true),
        const SortBy(option: SortOption.PRODUCT_NAME),
        const SearchTerms(terms: ["Fruit à coques"]),
        const ContainsAdditives(filter: true)
      ];

      result = await OpenFoodAPIClient.searchProducts(
          TestConstants.TEST_USER,
          parameterList,
          lang: User.LANGUAGE_FR);

      print(
          "Total product count : $totalCount; Filtered count : ${result.count}");
      expect(result.count < totalCount, true);
    });

    test('search products with filter on tags', () async {
      var parameterList = <Parameter>[
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

      SearchResult result = await OpenFoodAPIClient.searchProducts(
          TestConstants.TEST_USER,
          parameterList,
          lang: User.LANGUAGE_FR);

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
