import 'dart:math';

import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  const ProductQueryVersion version = ProductQueryVersion.v3;

  // additional parameter for faster response time
  const Parameter optimParameter = SearchTerms(terms: ['pizza']);

  group('$OpenFoodAPIClient search products', () {
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

    /// Checks that all the sort options return different orders but same count.
    ///
    /// We can relatively assume that the top 100 pizzas in France are in
    /// different orders.
    test('search with all sort-by options', () async {
      final Map<SortOption?, List<String>> previousValues =
          <SortOption?, List<String>>{};
      int? checkCount;
      final List<SortOption?> sortOptions = <SortOption?>[];
      sortOptions.addAll(SortOption.values);
      sortOptions.remove(SortOption.NOTHING);
      for (final SortOption? currentOption in sortOptions) {
        final List<Parameter> parameters = <Parameter>[
          const SearchTerms(terms: ['pizza']),
          const PageNumber(page: 1),
          const PageSize(size: 100),
          if (currentOption != null) SortBy(option: currentOption)
        ];

        final SearchResult result = await OpenFoodAPIClient.searchProducts(
          TestConstants.PROD_USER,
          ProductSearchQueryConfiguration(
            parametersList: parameters,
            fields: [ProductField.BARCODE],
            language: OpenFoodFactsLanguage.FRENCH,
            country: OpenFoodFactsCountry.FRANCE,
            version: version,
          ),
        );

        expect(result.products, isNotNull);
        final List<String> barcodes = <String>[];
        for (final Product product in result.products!) {
          barcodes.add(product.barcode!);
        }

        for (final SortOption? previousOption in previousValues.keys) {
          final Matcher matcher = equals(previousValues[previousOption]);
          // special case: NOTHING and EDIT seem to be the same.
          if ((previousOption == SortOption.NOTHING &&
                  currentOption == SortOption.EDIT) ||
              (previousOption == SortOption.EDIT &&
                  currentOption == SortOption.NOTHING)) {
            expect(
              barcodes,
              matcher,
              reason:
                  'Should be identical for $currentOption and $previousOption',
            );
          }
          // special case: POPULARITY and no sort option seem to be the same.
          else if ((previousOption == null &&
                  currentOption == SortOption.POPULARITY) ||
              (previousOption == SortOption.POPULARITY &&
                  currentOption == null)) {
            expect(
              barcodes,
              matcher,
              reason:
                  'Should be identical for $currentOption and $previousOption',
            );
          } else {
            expect(
              barcodes,
              isNot(matcher),
              reason:
                  'Should be different for $currentOption and $previousOption',
            );
          }
        }
        previousValues[currentOption] = barcodes;

        expect(result.count, isNotNull);
        if (checkCount == null) {
          checkCount = result.count; // first value
        } else {
          expect(result.count, checkCount); // check if same value
        }
      }
    },
        timeout: Timeout(
          // some tests can be slow here
          Duration(seconds: 90),
        ));

    test('search favorite products', () async {
      final parameters = <Parameter>[
        const PageNumber(page: 1),
        const PageSize(size: 10),
        const SortBy(option: SortOption.POPULARITY)
      ];

      final ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
        parametersList: parameters,
        fields: [ProductField.ALL],
        language: OpenFoodFactsLanguage.GERMAN,
        version: version,
      );

      final SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.PROD_USER,
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
        const PageNumber(page: 14),
        const PageSize(size: 3),
        const SortBy(option: SortOption.EDIT)
      ];

      final ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
        parametersList: parameters,
        fields: [ProductField.ALL],
        language: OpenFoodFactsLanguage.ENGLISH,
        version: version,
      );

      final SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.PROD_USER,
        configuration,
      );

      expect(result.page, 14);
      expect(result.pageSize, 3);
      expect(result.products, isNotNull);
      expect(result.products!.length, 3);
      expect(result.products![0].runtimeType, Product);
      expect(result.count, greaterThan(30000));
    });

    /// Returns the total number of products, and checks if the statuses match.
    Future<int?> checkIngredientsAnalysis(
      final VeganStatus? veganStatus,
      final VegetarianStatus? vegetarianStatus,
      final PalmOilFreeStatus? palmOilFreeStatus,
    ) async {
      if (veganStatus == null &&
          vegetarianStatus == null &&
          palmOilFreeStatus == null) {
        return null;
      }

      final List<Parameter> parameters = <Parameter>[
        const PageNumber(page: 1),
        const PageSize(size: 100),
        IngredientsAnalysisParameter(
          veganStatus: veganStatus,
          vegetarianStatus: vegetarianStatus,
          palmOilFreeStatus: palmOilFreeStatus,
        ),
        optimParameter,
      ];

      final ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
        parametersList: parameters,
        fields: [
          ProductField.BARCODE,
          ProductField.INGREDIENTS_ANALYSIS_TAGS,
        ],
        language: OpenFoodFactsLanguage.FRENCH,
        country: OpenFoodFactsCountry.FRANCE,
        version: version,
      );

      final SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.PROD_USER,
        configuration,
      );

      expect(result.products, isNotNull);
      if (result.count == null) {
        expect(result.products!.length, 0);
      }
      for (final Product product in result.products!) {
        if (veganStatus != null) {
          expect(
            product.ingredientsAnalysisTags!.veganStatus,
            veganStatus,
          );
        }
        if (vegetarianStatus != null) {
          expect(
            product.ingredientsAnalysisTags!.vegetarianStatus,
            vegetarianStatus,
          );
        }
        if (palmOilFreeStatus != null) {
          expect(
            product.ingredientsAnalysisTags!.palmOilFreeStatus,
            palmOilFreeStatus,
          );
        }
      }
      return result.count ?? 0;
    }

    test('check vegan search', () async {
      for (final VeganStatus status in VeganStatus.values) {
        await checkIngredientsAnalysis(status, null, null);
      }
    },
        timeout: Timeout(
          // some tests can be slow here
          Duration(seconds: 90),
        ));

    test('check vegetarian search', () async {
      for (final VegetarianStatus status in VegetarianStatus.values) {
        await checkIngredientsAnalysis(null, status, null);
      }
    },
        timeout: Timeout(
          // some tests can be slow here
          Duration(seconds: 90),
        ));

    test('check palm oil search', () async {
      for (final PalmOilFreeStatus status in PalmOilFreeStatus.values) {
        await checkIngredientsAnalysis(null, null, status);
      }
    },
        timeout: Timeout(
          // some tests can be slow here
          Duration(seconds: 90),
        ));

    test('check random vegan+vegetarian+palm oil search', () async {
      final Random random = Random();
      final int veganIndex = random.nextInt(VeganStatus.values.length);
      final int vegetarianIndex =
          random.nextInt(VegetarianStatus.values.length);
      final int palmOilFreeIndex =
          random.nextInt(PalmOilFreeStatus.values.length);
      await checkIngredientsAnalysis(
        VeganStatus.values[veganIndex],
        VegetarianStatus.values[vegetarianIndex],
        PalmOilFreeStatus.values[palmOilFreeIndex],
      );
    },
        timeout: Timeout(
          // some tests can be slow here
          Duration(seconds: 90),
        ));

    /// If you know it's not vegetarian, then it can't be vegan at all.
    test('check vegan/vegetarian consistency', () async {
      const VegetarianStatus nonVegetarian = VegetarianStatus.NON_VEGETARIAN;
      expect(
        await checkIngredientsAnalysis(
          VeganStatus.VEGAN,
          nonVegetarian,
          null,
        ),
        0,
      );
      expect(
        await checkIngredientsAnalysis(
          VeganStatus.MAYBE_VEGAN,
          nonVegetarian,
          null,
        ),
        0,
      );
      expect(
        await checkIngredientsAnalysis(
          VeganStatus.VEGAN_STATUS_UNKNOWN,
          nonVegetarian,
          null,
        ),
        0,
      );
    },
        timeout: Timeout(
          // some tests can be slow here
          Duration(seconds: 300),
        ));

    test('type bug : ingredient percent int vs String ', () async {
      final parameters = <Parameter>[
        const PageNumber(page: 16),
        const PageSize(size: 5),
        const SortBy(option: SortOption.POPULARITY)
      ];

      final ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
        parametersList: parameters,
        fields: [ProductField.ALL],
        language: OpenFoodFactsLanguage.GERMAN,
        version: version,
      );

      final SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.PROD_USER,
        configuration,
      );

      expect(result.page, 16);
      expect(result.pageSize, 5);
      expect(result.products, isNotNull);
      expect(result.products!.length, 5);
      expect(result.products![0].runtimeType, Product);
      expect(result.count, greaterThan(30000));
    });

    test('search products by keywords 1', () async {
      final List<Parameter> parameters = <Parameter>[
        const PageNumber(page: 2),
        const PageSize(size: 10),
        const SearchTerms(terms: ['Kiwi'])
      ];

      final ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
        parametersList: parameters,
        fields: [ProductField.BARCODE],
        language: OpenFoodFactsLanguage.FRENCH,
        version: version,
      );

      final SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.PROD_USER,
        configuration,
      );

      expect(result.page, 2);
      expect(result.pageSize, 10);
      expect(result.products, isNotNull);
      expect(result.products!.length, 10);
      expect(result.products![0].runtimeType, Product);
      expect(result.count, greaterThan(900));
    });

    // Additional test with image field for testing [coordinates_image_size] conversion
    // c.f. https://github.com/openfoodfacts/openfoodfacts-dart/issues/440
    test('search products by keywords 2', () async {
      final List<Parameter> parameters = <Parameter>[
        const PageNumber(page: 1),
        const PageSize(size: 10),
        const SortBy(option: SortOption.POPULARITY),
        SearchTerms(terms: ['vitamin']),
      ];

      final ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
        parametersList: parameters,
        language: OpenFoodFactsLanguage.GERMAN,
        fields: <ProductField>[ProductField.IMAGES],
        version: version,
      );

      SearchResult result = await OpenFoodAPIClient.searchProducts(
        null,
        configuration,
      );

      expect(result.products, isNotEmpty);
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
          version: version,
        );

        final SearchResult result = await OpenFoodAPIClient.searchProducts(
          TestConstants.PROD_USER,
          configuration,
        );

        counts[withoutAdditives] = result.count!;
      }

      expect(counts[WITHOUT_ADDITIVES], lessThan(counts[ADDITIVE_AGNOSTIC]!));
    });

    test('search products with filter on tags', () async {
      final parameters = <Parameter>[
        const PageNumber(page: 5),
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
        language: OpenFoodFactsLanguage.FRENCH,
        version: version,
      );

      final SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.PROD_USER,
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
      // the barcode I had in mind is 3229820129488
      const String brands = 'Bjorg';
      const String categories = 'en:breakfast-cereals';
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
      const int novaGroup = 3;
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
        version: version,
      );

      final SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.PROD_USER,
        configuration,
      );

      expect(result.products, isNotNull);
      expect(result.products, isNotEmpty);
      for (final Product product in result.products!) {
        expect(product.brands!, brands);
        expect(product.categoriesTags, contains(categories));
        expect(product.labelsTags, contains(labels));
        expect(product.storesTags, contains(stores));
        expect(product.countriesTags, contains(countries));
        expect(product.allergens!.ids, contains(allergens));
        expect(product.tracesTags, contains(traces));
        expect(product.nutriscore!.toUpperCase(), nutritionGrades);
        expect(product.statesTags, contains(states));
        expect(product.ingredientsTags, contains(ingredients));
        expect(product.lang.code, lang);
        expect(product.novaGroup, novaGroup);
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
        version: version,
      );

      final SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.PROD_USER,
        configuration,
      );

      expect(result.products, isNotNull);
      expect(result.products, isNotEmpty);
      for (final Product product in result.products!) {
        expect(product.additives!.ids, contains(additives));
        // TODO(monsieurtanuki): extract the emb_codes from the product, and compare it to the expected value
      }
    });

    test('search products with filter on all tags (part 3)', () async {
      const String packaging = 'de:plastikflasche';

      final parameters = <Parameter>[
        TagFilter.fromType(
            tagFilterType: TagFilterType.PACKAGING, tagName: packaging),
      ];

      final ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
        parametersList: parameters,
        fields: [ProductField.ALL],
        language: OpenFoodFactsLanguage.GERMAN,
        version: version,
      );

      final SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.PROD_USER,
        configuration,
      );

      expect(result.products, isNotNull);
      expect(result.products, isNotEmpty);
      for (final Product product in result.products!) {
        expect(product.packagingTags, contains(packaging));
      }
    });

    test('search products with quotes', () async {
      // explicitly on TEST
      const String barcode = '2222222222223';
      final Product product = Product(
          barcode: barcode,
          productName: 'Quoted Coca "cola"',
          lang: OpenFoodFactsLanguage.GERMAN,
          brands: 'Quoted Coca "Cola"');

      await OpenFoodAPIClient.saveProduct(
        TestConstants.TEST_USER,
        product,
        uriHelper: uriHelperFoodTest,
      );

      final parameters = <Parameter>[
        const PageNumber(page: 1),
        const SearchTerms(terms: ['Quoted Coca "Cola"']),
      ];

      final ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
        parametersList: parameters,
        fields: [ProductField.ALL],
        language: OpenFoodFactsLanguage.GERMAN,
        version: version,
      );

      final SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.TEST_USER,
        configuration,
        uriHelper: uriHelperFoodTest,
      );

      expect(result.products!.length, 1);
      expect(result.products![0].productName, 'Quoted Coca "cola"');
      expect(result.products![0].brands, 'Quoted Coca "Cola"');
    },
        skip: 'Avoiding tests on TEST env',
        timeout: Timeout(
          // some tests can be slow here
          Duration(seconds: 90),
        ));

    test('multiple products', () async {
      final ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
        parametersList: [BarcodeParameter.list(BARCODES)],
        fields: [ProductField.BARCODE, ProductField.NAME],
        language: OpenFoodFactsLanguage.FRENCH,
        version: version,
      );

      final SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.PROD_USER,
        configuration,
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
      final Map<String, ProductFreshness> result =
          await OpenFoodAPIClient.getProductFreshness(
        barcodes: BARCODES,
        user: TestConstants.PROD_USER,
        language: OpenFoodFactsLanguage.FRENCH,
        country: OpenFoodFactsCountry.FRANCE,
        version: version,
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
      final obtainedBarcodes = <String>[];
      var page = 1;
      while (true) {
        final configuration = ProductSearchQueryConfiguration(
          parametersList: [
            BarcodeParameter.list(BARCODES),
            PageNumber(page: page),
            PageSize(size: 5),
            SortBy(option: SortOption.PRODUCT_NAME),
          ],
          fields: [ProductField.BARCODE, ProductField.NAME],
          language: OpenFoodFactsLanguage.FRENCH,
          version: version,
        );

        final result = await OpenFoodAPIClient.searchProducts(
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
      final Set<String> knownBarcodes = BARCODES.toSet();
      knownBarcodes.remove(UNKNOWN_BARCODE);
      expect(obtainedBarcodes.toSet(), knownBarcodes);
    });

    test('query potatoes products', () async {
      final ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
        language: OpenFoodFactsLanguage.ENGLISH,
        fields: [ProductField.ALL],
        parametersList: [
          PnnsGroup2Filter(pnnsGroup2: PnnsGroup2.POTATOES),
          PageNumber(page: 3),
        ],
        version: version,
      );

      final SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.PROD_USER,
        configuration,
      );

      expect(result.page, 3);
      expect(result.pageSize, 24);
      expect(result.products, isNotNull);
      expect(result.products!.length, 24);
      expect(result.products![0].runtimeType, Product);
      expect(result.count, greaterThan(1500));
    }, skip: 'Temporarily not working (server issue)');

    test('many many products', () async {
      final List<String> manyBarcodes = <String>[];
      // for a GET, the limit seems to be around 8000 characters
      // but here we don't care anymore as now it's a POST
      for (int i = 0; i < 100; i++) {
        manyBarcodes.addAll(BARCODES);
      }

      final ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
        parametersList: [BarcodeParameter.list(manyBarcodes)],
        fields: [ProductField.BARCODE, ProductField.NAME],
        language: OpenFoodFactsLanguage.FRENCH,
        version: version,
      );

      final SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.PROD_USER,
        configuration,
      );

      expect(result.page, 1);
      expect(result.pageSize, 24);
      expect(result.count, BARCODES.length - 1);
      expect(result.products, isNotNull);
      expect(result.products!.length, BARCODES.length - 1);
    });

    test('nova filter', () async {
      const int pageSize = 24;
      // Approximated min counts for FRANCE / Carrefour
      // There were too many results for FRANCE, and that made the server crash.
      // That's why we add a filter on STORES.
      const Map<int, int> novaMinCounts = <int, int>{
        1: 1500, // was 1777 on 2023-08-12
        2: 300, // was 352 on 2023-08-12
        3: 3000, // was 3654 on 2023-08-12
        4: 7000, // was 8558 on 2023-08-12
      };

      // single filters
      for (final int novaGroup in novaMinCounts.keys) {
        final SearchResult result = await OpenFoodAPIClient.searchProducts(
          TestConstants.PROD_USER,
          ProductSearchQueryConfiguration(
            parametersList: <Parameter>[
              TagFilter.fromType(
                tagFilterType: TagFilterType.NOVA_GROUPS,
                tagName: '$novaGroup',
              ),
              TagFilter.fromType(
                tagFilterType: TagFilterType.STORES,
                tagName: 'Carrefour',
              ),
              PageSize(size: pageSize),
            ],
            fields: [ProductField.BARCODE, ProductField.NOVA_GROUP],
            language: OpenFoodFactsLanguage.FRENCH,
            country: OpenFoodFactsCountry.FRANCE,
            version: ProductQueryVersion.v3,
          ),
        );

        expect(result.page, 1);
        expect(result.pageSize, pageSize);
        expect(
          result.count,
          greaterThanOrEqualTo(novaMinCounts[novaGroup]!),
          reason: 'Not enough values for nova group $novaGroup',
        );
        expect(result.products, isNotNull);
        expect(result.products!.length, pageSize);
        for (final Product product in result.products!) {
          expect(product.novaGroup, novaGroup);
        }
      }
    });
  },
      timeout: Timeout(
        // some tests can be slow here
        Duration(seconds: 90),
      ));

  /// Returns random and different int's.
  List<int> getRandomInts({
    required int count,
    required final int max,
  }) {
    final Random random = Random();
    final List<int> result = <int>[];
    if (count > max) {
      count = max;
    }
    for (int i = 0; i < count; i++) {
      int index = random.nextInt(max);
      while (result.contains(index)) {
        index = (index + 1) % max;
      }
      result.add(index);
    }
    return result;
  }

  group('$OpenFoodAPIClient search products with/without allergens', () {
    /// Returns the total number of products, and checks the allergens.
    Future<int> checkAllergens(
      final AllergensParameter allergensParameter,
    ) async {
      final List<Parameter> parameters = <Parameter>[
        const PageNumber(page: 1),
        const PageSize(size: 100),
        allergensParameter,
        optimParameter,
      ];

      final ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
        parametersList: parameters,
        fields: [ProductField.BARCODE, ProductField.ALLERGENS],
        language: OpenFoodFactsLanguage.FRENCH,
        country: OpenFoodFactsCountry.FRANCE,
        version: version,
      );

      final SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.PROD_USER,
        configuration,
      );

      expect(result.products, isNotNull);
      for (final Product product in result.products!) {
        expect(product.allergens, isNotNull);
        expect(product.allergens!.ids, isNotNull);
        for (final MapEntry<AllergensTag, bool> item
            in allergensParameter.map.entries) {
          if (item.value) {
            expect(product.allergens!.ids, contains(item.key.offTag));
          } else {
            expect(product.allergens!.ids, isNot(contains(item.key.offTag)));
          }
        }
      }

      return result.count ?? 0;
    }

    test('check products with allergens', () async {
      for (final AllergensTag tag in AllergensTag.values) {
        final int count = await checkAllergens(
          AllergensParameter(map: {tag: true}),
        );
        expect(count, greaterThan(0));
      }
    });

    test('check products without allergens', () async {
      for (final AllergensTag tag in AllergensTag.values) {
        final int count = await checkAllergens(
          AllergensParameter(map: {tag: false}),
        );
        expect(count, greaterThan(0));
      }
    });

    test('check products with random 2 allergens', () async {
      final List<int> indices = getRandomInts(
        count: 2,
        max: AllergensTag.values.length,
      );
      final AllergensTag tag1 = AllergensTag.values[indices[0]];
      final AllergensTag tag2 = AllergensTag.values[indices[1]];
      final int count1 = await checkAllergens(
        AllergensParameter(map: {tag1: true}),
      );
      final int count2 = await checkAllergens(
        AllergensParameter(map: {tag2: true}),
      );
      final int countBoth = await checkAllergens(
        AllergensParameter(map: {tag1: true, tag2: true}),
      );
      // it's an AND: with both conditions we always get less results.
      expect(countBoth, lessThanOrEqualTo(count1));
      expect(countBoth, lessThanOrEqualTo(count2));
    });

    test('check products with and without random 2 allergens', () async {
      final List<int> indices = getRandomInts(
        count: 2,
        max: AllergensTag.values.length,
      );
      final AllergensTag tag1 = AllergensTag.values[indices[0]];
      final AllergensTag tag2 = AllergensTag.values[indices[1]];
      final int count1 = await checkAllergens(
        AllergensParameter(map: {tag1: true}),
      );
      final int count2 = await checkAllergens(
        AllergensParameter(map: {tag2: false}),
      );
      final int countBoth = await checkAllergens(
        AllergensParameter(map: {tag1: true, tag2: false}),
      );
      // it's an AND: with both conditions we always get less results.
      expect(countBoth, lessThanOrEqualTo(count1));
      expect(countBoth, lessThanOrEqualTo(count2));
    });
  },
      timeout: Timeout(
        // some tests can be slow here
        Duration(seconds: 300),
      ));

  group(
      '$OpenFoodAPIClient search products with completed/to-be-completed states',
      () {
    /// Returns the total number of products, and checks the states.
    Future<int> checkStatesTags(
      final StatesTagsParameter statesTagsParameter,
    ) async {
      final List<Parameter> parameters = <Parameter>[
        const PageNumber(page: 1),
        const PageSize(size: 100),
        statesTagsParameter,
        optimParameter,
      ];

      final ProductSearchQueryConfiguration configuration =
          ProductSearchQueryConfiguration(
        parametersList: parameters,
        fields: [ProductField.BARCODE, ProductField.STATES_TAGS],
        language: OpenFoodFactsLanguage.FRENCH,
        country: OpenFoodFactsCountry.FRANCE,
        version: version,
      );

      final SearchResult result = await OpenFoodAPIClient.searchProducts(
        TestConstants.PROD_USER,
        configuration,
      );

      expect(result.products, isNotNull);
      for (final Product product in result.products!) {
        expect(product.statesTags, isNotNull);
        for (final MapEntry<ProductState, bool> item
            in statesTagsParameter.map.entries) {
          if (item.value) {
            expect(product.statesTags, contains(item.key.completedTag));
          } else {
            expect(product.statesTags, contains(item.key.toBeCompletedTag));
          }
        }
      }

      return result.count ?? 0;
    }

    test('check products with "completed" states tags', () async {
      for (final ProductState state in ProductState.values) {
        final int count = await checkStatesTags(
          StatesTagsParameter(map: {state: true}),
        );
        expect(count, greaterThan(0));
      }
    });

    test('check products with "to-be-completed" states tags', () async {
      for (final ProductState state in ProductState.values) {
        final int count = await checkStatesTags(
          StatesTagsParameter(map: {state: false}),
        );
        expect(count, greaterThan(0));
      }
    });

    test('check products with 2 random states tags', () async {
      Future<void> checkExpectations(
        final ProductState state1,
        final bool completed1,
        final ProductState state2,
        final bool completed2,
      ) async {
        final int count1 = await checkStatesTags(
          StatesTagsParameter(map: {
            state1: completed1,
          }),
        );
        final int count2 = await checkStatesTags(
          StatesTagsParameter(map: {
            state2: completed2,
          }),
        );

        final Map<ProductState, bool> map = <ProductState, bool>{
          state1: completed1,
          state2: completed2,
        };

        final int countBoth = await checkStatesTags(
          StatesTagsParameter(map: map),
        );
        // it's an AND: with both conditions we always get less results.
        expect(countBoth, lessThanOrEqualTo(count1), reason: map.toString());
        expect(countBoth, lessThanOrEqualTo(count2), reason: map.toString());
      }

      final List<int> indices = getRandomInts(
        count: 2,
        max: ProductState.values.length,
      );
      final ProductState state1 = ProductState.values[indices[0]];
      final ProductState state2 = ProductState.values[indices[1]];
      final Random random = Random();
      final bool completed1 = random.nextBool();
      final bool completed2 = random.nextBool();
      // TODO(monsieurtanuki): sometimes fails because of bad luck
      // by the time the second count is retrieved, the first count changed too,
      // if we are unlucky.
      await checkExpectations(state1, completed1, state2, completed2);
    });
  },
      skip: 'Sometimes fails because of bad-luck',
      timeout: Timeout(
        // some tests can be slow here
        Duration(seconds: 300),
      ));
}
