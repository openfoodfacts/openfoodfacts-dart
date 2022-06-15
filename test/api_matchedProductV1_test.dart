import 'package:http/http.dart' as http;
import 'package:openfoodfacts/model/Attribute.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/personalized_search/available_attribute_groups.dart';
import 'package:openfoodfacts/personalized_search/available_preference_importances.dart';
import 'package:openfoodfacts/personalized_search/available_product_preferences.dart';
import 'package:openfoodfacts/personalized_search/matched_product.dart';
import 'package:openfoodfacts/personalized_search/preference_importance.dart';
import 'package:openfoodfacts/personalized_search/product_preferences_manager.dart';
import 'package:openfoodfacts/personalized_search/product_preferences_selection.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  const int HTTP_OK = 200;

  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;

  /// Tests around Matched Product v1.
  group('$OpenFoodAPIClient matched product v1', () {
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
      const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.ENGLISH;
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
      expect(refreshCounter, 0);

      const String barcode = '0028400047685';
      final ProductQueryConfiguration configurations =
          ProductQueryConfiguration(
        barcode,
        language: language,
        fields: [
          ProductField.BARCODE,
          ProductField.NAME,
          ProductField.ATTRIBUTE_GROUPS,
        ],
      );
      final ProductResult result = await OpenFoodAPIClient.getProduct(
        configurations,
        user: TestConstants.TEST_USER,
      );
      expect(result.status, 1);
      expect(result.barcode, barcode);

      final String attributeId1 = Attribute.ATTRIBUTE_NUTRISCORE;
      final String attributeId2 = Attribute.ATTRIBUTE_FOREST_FOOTPRINT;
      final String importanceId1 = PreferenceImportance.ID_MANDATORY;
      final String importanceId2 = PreferenceImportance.ID_IMPORTANT;
      await manager.setImportance(attributeId1, importanceId1);
      expect(
          manager.getImportanceIdForAttributeId(attributeId1), importanceId1);
      expect(refreshCounter, 1);
      await manager.setImportance(attributeId2, importanceId2);
      expect(
          manager.getImportanceIdForAttributeId(attributeId2), importanceId2);
      expect(refreshCounter, 2);
      MatchedProduct matchedProduct;

      matchedProduct = MatchedProduct(result.product!, manager);
      expect(matchedProduct.score, greaterThan(151));
      expect(matchedProduct.status, MatchedProductStatus.YES);

      await manager.setImportance(attributeId1, importanceId2);
      expect(
          manager.getImportanceIdForAttributeId(attributeId1), importanceId2);
      expect(refreshCounter, 3);
      await manager.setImportance(attributeId2, importanceId1);
      expect(
          manager.getImportanceIdForAttributeId(attributeId2), importanceId1);
      expect(refreshCounter, 4);

      matchedProduct = MatchedProduct(result.product!, manager);
      expect(matchedProduct.score, greaterThan(37.5));
      expect(
          matchedProduct.status,
          MatchedProductStatus
              .YES); // because the score for FOREST is not good enough

      await manager.clearImportances(); // no attribute parameters at all
      expect(refreshCounter, 5);

      matchedProduct = MatchedProduct(result.product!, manager);
      expect(matchedProduct.score, 0.0);
      expect(matchedProduct.status, MatchedProductStatus.YES);
    });
  });
}
