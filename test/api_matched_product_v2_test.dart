import 'package:http/http.dart' as http;
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

class _Score {
  _Score(this.score, this.status);

  final double score;
  final MatchedProductStatusV2 status;
}

void main() {
  const int HTTP_OK = 200;

  const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.FRENCH;
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  OpenFoodAPIConfiguration.globalLanguages = <OpenFoodFactsLanguage>[language];

  const String BARCODE_KNACKI = '7613035937420';
  const String BARCODE_CORDONBLEU = '4000405005026';
  const String BARCODE_ORIENTALES = '4032277007211';
  const String BARCODE_HACK = '7613037672756';
  const String BARCODE_SCHNITZEL = '4061458069878';
  const String BARCODE_CHIPOLATA = '3770016162098';
  const String BARCODE_FLEISCHWURST = '4003171036379'; // now veggie!
  const String BARCODE_POULET = '40897837';
  const String BARCODE_SAUCISSON = '20045456';
  const String BARCODE_PIZZA = '4260414150470';
  const String BARCODE_ARDECHE = '20712570';
  const String BARCODE_CHORIZO = '8480000591074';

  final List<String> inputBarcodes = <String>[
    BARCODE_CHIPOLATA,
    BARCODE_FLEISCHWURST,
    BARCODE_KNACKI,
    BARCODE_CORDONBLEU,
    BARCODE_SAUCISSON,
    BARCODE_PIZZA,
    BARCODE_ORIENTALES,
    BARCODE_ARDECHE,
    BARCODE_HACK,
    BARCODE_CHORIZO,
    BARCODE_SCHNITZEL,
    BARCODE_POULET,
  ];
  final Map<String, _Score> expectedScores = <String, _Score>{
    BARCODE_KNACKI: _Score(100, MatchedProductStatusV2.VERY_GOOD_MATCH),
    BARCODE_CORDONBLEU: _Score(100, MatchedProductStatusV2.VERY_GOOD_MATCH),
    BARCODE_ORIENTALES: _Score(100, MatchedProductStatusV2.VERY_GOOD_MATCH),
    BARCODE_HACK: _Score(100, MatchedProductStatusV2.VERY_GOOD_MATCH),
    BARCODE_SCHNITZEL: _Score(100, MatchedProductStatusV2.VERY_GOOD_MATCH),
    BARCODE_CHIPOLATA: _Score(100, MatchedProductStatusV2.VERY_GOOD_MATCH),
    BARCODE_FLEISCHWURST: _Score(100, MatchedProductStatusV2.VERY_GOOD_MATCH),
    BARCODE_POULET: _Score(0, MatchedProductStatusV2.UNKNOWN_MATCH),
    BARCODE_SAUCISSON: _Score(0, MatchedProductStatusV2.UNKNOWN_MATCH),
    BARCODE_PIZZA: _Score(0, MatchedProductStatusV2.DOES_NOT_MATCH),
    BARCODE_ARDECHE: _Score(0, MatchedProductStatusV2.DOES_NOT_MATCH),
    BARCODE_CHORIZO: _Score(0, MatchedProductStatusV2.DOES_NOT_MATCH),
  };
  final List<String> expectedBarcodeOrder = <String>[
    BARCODE_CHIPOLATA,
    BARCODE_FLEISCHWURST,
    BARCODE_KNACKI,
    BARCODE_CORDONBLEU,
    BARCODE_ORIENTALES,
    BARCODE_HACK,
    BARCODE_SCHNITZEL,
    BARCODE_SAUCISSON,
    BARCODE_POULET,
    BARCODE_PIZZA,
    BARCODE_ARDECHE,
    BARCODE_CHORIZO,
  ];

  Future<List<Product>> downloadProducts() async {
    final SearchResult result = await OpenFoodAPIClient.searchProducts(
      OpenFoodAPIConfiguration.globalUser,
      ProductSearchQueryConfiguration(
        parametersList: [BarcodeParameter.list(inputBarcodes)],
        language: language,
        fields: [ProductField.BARCODE, ProductField.ATTRIBUTE_GROUPS],
        version: ProductQueryVersion.v3,
      ),
    );
    expect(result.count, expectedScores.keys.length);
    expect(result.page, 1);
    expect(result.products, isNotNull);
    final List<Product> products = result.products!;
    // sorting them again by the input order
    products.sort(
      (final Product a, final Product b) => inputBarcodes
          .indexOf(a.barcode!)
          .compareTo(inputBarcodes.indexOf(b.barcode!)),
    );
    expect(products.length, inputBarcodes.length);
    return products;
  }

  Future<ProductPreferencesManager> getManager() async {
    final Map<String, String> attributeImportances = {};
    final ProductPreferencesManager manager = ProductPreferencesManager(
      ProductPreferencesSelection(
        setImportance: (String attributeId, String importanceIndex) async {
          attributeImportances[attributeId] = importanceIndex;
        },
        getImportance: (String attributeId) =>
            attributeImportances[attributeId] ??
            PreferenceImportance.ID_NOT_IMPORTANT,
      ),
    );
    final String languageCode = language.code;
    final String importanceUrl =
        AvailablePreferenceImportances.getUrl(languageCode);
    final String attributeGroupUrl =
        AvailableAttributeGroups.getUrl(languageCode);
    http.Response response;
    response = await http.get(Uri.parse(importanceUrl));
    expect(response.statusCode, HTTP_OK);
    final String preferenceImportancesString = response.body;
    response = await http.get(Uri.parse(attributeGroupUrl));
    expect(response.statusCode, HTTP_OK);
    final String attributeGroupsString = response.body;
    manager.availableProductPreferences =
        AvailableProductPreferences.loadFromJSONStrings(
      preferenceImportancesString: preferenceImportancesString,
      attributeGroupsString: attributeGroupsString,
    );
    await manager.setImportance(
      Attribute.ATTRIBUTE_VEGETARIAN,
      PreferenceImportance.ID_MANDATORY,
    );
    return manager;
  }

  /// Tests around Matched Product v2.
  group('$OpenFoodAPIClient matched product v2', () {
    test('matched product', () async {
      final ProductPreferencesManager manager = await getManager();

      final List<Product> products = await downloadProducts();

      final List<MatchedProductV2> actuals =
          MatchedProductV2.sort(products, manager);

      expect(actuals.length, expectedBarcodeOrder.length);
      for (int i = 0; i < actuals.length; i++) {
        final MatchedProductV2 matched = actuals[i];
        final String barcode = expectedBarcodeOrder[i];
        expect(matched.product.barcode, barcode);
        expect(matched.barcode, barcode);
        expect(expectedScores[barcode], isNotNull);
        final _Score score = expectedScores[barcode]!;
        expect(matched.status, score.status);
        expect(matched.score, score.score);
      }
    });

    test('matched score', () async {
      final ProductPreferencesManager manager = await getManager();

      final List<Product> products = await downloadProducts();

      final List<MatchedScoreV2> actuals = <MatchedScoreV2>[];
      for (final Product product in products) {
        actuals.add(MatchedScoreV2(product, manager));
      }
      MatchedScoreV2.sort(actuals);

      expect(actuals.length, expectedBarcodeOrder.length);
      for (int i = 0; i < actuals.length; i++) {
        final MatchedScoreV2 matched = actuals[i];
        final String barcode = expectedBarcodeOrder[i];
        expect(matched.barcode, barcode);
        expect(expectedScores[barcode], isNotNull);
        final _Score score = expectedScores[barcode]!;
        expect(matched.status, score.status);
        expect(matched.score, score.score);
      }
    });
  });
}
