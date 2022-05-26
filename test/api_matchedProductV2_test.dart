import 'package:http/http.dart' as http;
import 'package:openfoodfacts/model/Attribute.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/personalized_search/available_attribute_groups.dart';
import 'package:openfoodfacts/personalized_search/available_preference_importances.dart';
import 'package:openfoodfacts/personalized_search/available_product_preferences.dart';
import 'package:openfoodfacts/personalized_search/matched_product_v2.dart';
import 'package:openfoodfacts/personalized_search/preference_importance.dart';
import 'package:openfoodfacts/personalized_search/product_preferences_manager.dart';
import 'package:openfoodfacts/personalized_search/product_preferences_selection.dart';
import 'package:openfoodfacts/utils/CountryHelper.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/ProductListQueryConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
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
  OpenFoodAPIConfiguration.globalQueryType = QueryType.PROD;
  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  OpenFoodAPIConfiguration.globalLanguages = <OpenFoodFactsLanguage>[language];

  const String BARCODE_KNACKI = '7613035937420';
  const String BARCODE_CORDONBLEU = '4000405005026';
  const String BARCODE_ORIENTALES = '4032277007211';
  const String BARCODE_HACK = '7613037672756';
  const String BARCODE_SCHNITZEL = '4061458069878';
  const String BARCODE_CHIPOLATA = '3770016162098';
  const String BARCODE_FLEISCHWURST = '4003171036379';
  const String BARCODE_POULET = '40897837';
  const String BARCODE_SAUCISSON = '20045456';
  const String BARCODE_PIZZA = '4260414150470';
  const String BARCODE_ARDECHE = '20712570';
  const String BARCODE_CHORIZO = '8480000591074';

  /// Tests around Matched Product v2.
  group('$OpenFoodAPIClient matched product v2', () {
    test('matched product', () async {
      final Map<String, String> attributeImportances = {};
      int refreshCounter = 0;
      final ProductPreferencesManager manager = ProductPreferencesManager(
        ProductPreferencesSelection(
          setImportance: (String attributeId, String importanceIndex) async {
            attributeImportances[attributeId] = importanceIndex;
          },
          getImportance: (String attributeId) =>
              attributeImportances[attributeId] ??
              PreferenceImportance.ID_NOT_IMPORTANT,
          notify: () => refreshCounter++,
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
        BARCODE_CORDONBLEU:
            _Score(100, MatchedProductStatusV2.VERY_GOOD_MATCH),
        BARCODE_ORIENTALES:
            _Score(100, MatchedProductStatusV2.VERY_GOOD_MATCH),
        BARCODE_HACK: _Score(100, MatchedProductStatusV2.VERY_GOOD_MATCH),
        BARCODE_SCHNITZEL: _Score(100, MatchedProductStatusV2.VERY_GOOD_MATCH),
        BARCODE_CHIPOLATA: _Score(50, MatchedProductStatusV2.MAY_NOT_MATCH),
        BARCODE_FLEISCHWURST: _Score(0, MatchedProductStatusV2.UNKNOWN_MATCH),
        BARCODE_POULET: _Score(0, MatchedProductStatusV2.UNKNOWN_MATCH),
        BARCODE_SAUCISSON: _Score(0, MatchedProductStatusV2.DOES_NOT_MATCH),
        BARCODE_PIZZA: _Score(0, MatchedProductStatusV2.DOES_NOT_MATCH),
        BARCODE_ARDECHE: _Score(0, MatchedProductStatusV2.DOES_NOT_MATCH),
        BARCODE_CHORIZO: _Score(0, MatchedProductStatusV2.DOES_NOT_MATCH),
      };
      final List<String> expectedBarcodeOrder = <String>[
        BARCODE_KNACKI,
        BARCODE_CORDONBLEU,
        BARCODE_ORIENTALES,
        BARCODE_HACK,
        BARCODE_SCHNITZEL,
        BARCODE_CHIPOLATA,
        BARCODE_FLEISCHWURST,
        BARCODE_POULET,
        BARCODE_SAUCISSON,
        BARCODE_PIZZA,
        BARCODE_ARDECHE,
        BARCODE_CHORIZO,
      ];

      final SearchResult result = await OpenFoodAPIClient.getProductList(
        OpenFoodAPIConfiguration.globalUser,
        ProductListQueryConfiguration(
          inputBarcodes,
          language: language,
          fields: [ProductField.BARCODE, ProductField.ATTRIBUTE_GROUPS],
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

      final List<MatchedProductV2> actuals =
          MatchedProductV2.sort(products, manager);
      expect(actuals.length, expectedBarcodeOrder.length);
      for (int i = 0; i < actuals.length; i++) {
        final MatchedProductV2 matchedProduct = actuals[i];
        final String barcode = expectedBarcodeOrder[i];
        expect(matchedProduct.product.barcode, barcode);
        expect(expectedScores[barcode], isNotNull);
        final _Score score = expectedScores[barcode]!;
        expect(matchedProduct.status, score.status);
        expect(matchedProduct.score, score.score);
      }
    });
  });
}
