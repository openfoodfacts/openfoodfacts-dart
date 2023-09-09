import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  const int HTTP_OK = 200;

  const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.FRENCH;
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalCountry = OpenFoodFactsCountry.FRANCE;
  OpenFoodAPIConfiguration.globalUser = TestConstants.PROD_USER;
  OpenFoodAPIConfiguration.globalLanguages = <OpenFoodFactsLanguage>[language];

  /// Tests around Product Preferences.
  group('$OpenFoodAPIClient product preferences', () {
    test('random check of getAttributeIdsWithImportance', () async {
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
      expect(refreshCounter, 0);

      const List<String> allAttributes = <String>[
        Attribute.ATTRIBUTE_NUTRISCORE,
        Attribute.ATTRIBUTE_LOW_SALT,
        Attribute.ATTRIBUTE_LOW_SUGARS,
        Attribute.ATTRIBUTE_LOW_FAT,
        Attribute.ATTRIBUTE_LOW_SATURATED_FAT,
        Attribute.ATTRIBUTE_NOVA,
        Attribute.ATTRIBUTE_ADDITIVES,
        Attribute.ATTRIBUTE_ALLERGENS_NO_GLUTEN,
        Attribute.ATTRIBUTE_ALLERGENS_NO_MILK,
        Attribute.ATTRIBUTE_ALLERGENS_NO_EGGS,
        Attribute.ATTRIBUTE_ALLERGENS_NO_NUTS,
        Attribute.ATTRIBUTE_ALLERGENS_NO_PEANUTS,
        Attribute.ATTRIBUTE_ALLERGENS_NO_SESAME_SEEDS,
        Attribute.ATTRIBUTE_ALLERGENS_NO_SOYBEANS,
        Attribute.ATTRIBUTE_ALLERGENS_NO_CELERY,
        Attribute.ATTRIBUTE_ALLERGENS_NO_MUSTARD,
        Attribute.ATTRIBUTE_ALLERGENS_NO_LUPIN,
        Attribute.ATTRIBUTE_ALLERGENS_NO_FISH,
        Attribute.ATTRIBUTE_ALLERGENS_NO_CRUSTACEANS,
        Attribute.ATTRIBUTE_ALLERGENS_NO_MOLLUSCS,
        Attribute.ATTRIBUTE_ALLERGENS_NO_SULPHUR_DIOXIDE_AND_SULPHITES,
        Attribute.ATTRIBUTE_VEGETARIAN,
        Attribute.ATTRIBUTE_VEGAN,
        Attribute.ATTRIBUTE_PALM_OIL_FREE,
        Attribute.ATTRIBUTE_LABELS_ORGANIC,
        Attribute.ATTRIBUTE_LABELS_FAIR_TRADE,
        Attribute.ATTRIBUTE_ECOSCORE,
        Attribute.ATTRIBUTE_FOREST_FOOTPRINT,
      ];
      final List<String> importances = <String>[
        PreferenceImportance.ID_NOT_IMPORTANT,
        PreferenceImportance.ID_IMPORTANT,
        PreferenceImportance.ID_VERY_IMPORTANT,
        PreferenceImportance.ID_MANDATORY,
      ];
      final Map<String, String> importanceForAttributes = <String, String>{};
      final Random random = Random();
      int i = refreshCounter;
      for (final String attribute in allAttributes) {
        final int index = random.nextInt(importances.length);
        final String importance = importances[index];
        importanceForAttributes[attribute] = importance;
        await manager.setImportance(attribute, importance);
        expect(refreshCounter, ++i);
      }

      int count = 0;
      for (final String importance in importances) {
        final List<String> attributes =
            manager.getAttributeIdsWithImportance(importance);
        for (final String attribute in attributes) {
          expect(importanceForAttributes[attribute], isNotNull);
          expect(importanceForAttributes[attribute], importance);
          count++;
        }
      }
      expect(count, allAttributes.length);
    });
  });
}
