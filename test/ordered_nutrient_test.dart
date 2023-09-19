import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Tests related to [OrderedNutrient] and [OrderedNutrients]
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;

  // Very long list, experimentally created from the 3 initial URLs.
  // Don't hesitate to edit this list if you have clear functional ideas
  // about which nutrients should actually be there.
  const Set<String> expectedNutrients = {
    'alcohol',
    'alpha-linolenic-acid',
    'arachidic-acid',
    'arachidonic-acid',
    'behenic-acid',
    'beta-carotene',
    'bicarbonate',
    'biotin',
    'butyric-acid',
    'caffeine',
    'calcium',
    'capric-acid',
    'caproic-acid',
    'caprylic-acid',
    'carbohydrates',
    'carbon-footprint',
    'carbon-footprint-from-meat-or-fish',
    'casein',
    'cerotic-acid',
    'chloride',
    'chlorophyl',
    'cholesterol',
    'chromium',
    'cocoa',
    'collagen-meat-protein-ratio',
    'copper',
    'dihomo-gamma-linolenic-acid',
    'docosahexaenoic-acid',
    'eicosapentaenoic-acid',
    'elaidic-acid',
    'energy',
    'energy-from-fat',
    'energy-kcal',
    'erucic-acid',
    'fat',
    'fiber',
    'fluoride',
    'folates',
    'fructose',
    'fruits-vegetables-nuts',
    'fruits-vegetables-nuts-dried',
    'fruits-vegetables-nuts-estimate',
    'gamma-linolenic-acid',
    'glucose',
    'glycemic-index',
    'gondoic-acid',
    'insoluble-fiber',
    'iodine',
    'iron',
    'lactose',
    'lauric-acid',
    'lignoceric-acid',
    'linoleic-acid',
    'magnesium',
    'maltodextrins',
    'maltose',
    'manganese',
    'mead-acid',
    'melissic-acid',
    'molybdenum',
    'monounsaturated-fat',
    'montanic-acid',
    'myristic-acid',
    'nervonic-acid',
    'nucleotides',
    'nutrition-score-fr',
    'nutrition-score-uk',
    'oleic-acid',
    'omega-3-fat',
    'omega-6-fat',
    'omega-9-fat',
    'palmitic-acid',
    'pantothenic-acid',
    'ph',
    'phosphorus',
    'polyols',
    'polyunsaturated-fat',
    'potassium',
    'proteins',
    'salt',
    'saturated-fat',
    'selenium',
    'serum-proteins',
    'silica',
    'sodium',
    'soluble-fiber',
    'starch',
    'stearic-acid',
    'sucrose',
    'sugars',
    'taurine',
    'trans-fat',
    'vitamin-a',
    'vitamin-b1',
    'vitamin-b12',
    'vitamin-b2',
    'vitamin-b6',
    'vitamin-b9',
    'vitamin-c',
    'vitamin-d',
    'vitamin-e',
    'vitamin-k',
    'vitamin-pp',
    'water-hardness',
    'zinc',
  };

  OrderedNutrient? findOrderedNutrient(
    final List<OrderedNutrient>? list,
    final String nutrientId,
  ) {
    if (list == null) {
      return null;
    }
    for (final OrderedNutrient item in list) {
      if (item.id == nutrientId) {
        return item;
      }
      final OrderedNutrient? found =
          findOrderedNutrient(item.subNutrients, nutrientId);
      if (found != null) {
        return found;
      }
    }
    return null;
  }

  void checkNutrients(
    final OrderedNutrients orderedNutrients,
    final OpenFoodFactsCountry country,
  ) {
    for (final String expectedNutrient in expectedNutrients) {
      expect(
        findOrderedNutrient(orderedNutrients.nutrients, expectedNutrient),
        isNotNull,
        reason:
            'Could not find nutrient $expectedNutrient for country $country',
      );
    }
  }

  group('$OpenFoodAPIClient ordered nutrients', () {
    test('find expected nutrients', () async {
      const Set<OpenFoodFactsCountry> countries = {
        OpenFoodFactsCountry.FRANCE,
        OpenFoodFactsCountry.BRAZIL,
        OpenFoodFactsCountry.USA,
      };
      const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.AFRIKAANS;
      for (final OpenFoodFactsCountry country in countries) {
        checkNutrients(
          await OpenFoodAPIClient.getOrderedNutrients(
            country: country,
            language: language,
          ),
          country,
        );
        checkNutrients(
          OrderedNutrients.fromJson(
            HttpHelper().jsonDecode(
              await OpenFoodAPIClient.getOrderedNutrientsJsonString(
                country: country,
                language: language,
              ),
            ),
          ),
          country,
        );
      }
    });

    test('check localized "energy"', () async {
      const String nutrientId = 'energy';
      const Map<OpenFoodFactsLanguage, String> energies = {
        OpenFoodFactsLanguage.FRENCH: 'Énergie',
        OpenFoodFactsLanguage.SPANISH: 'Energía',
        OpenFoodFactsLanguage.ENGLISH: 'Energy',
        OpenFoodFactsLanguage.PORTUGUESE: 'Energia',
      };
      const Set<OpenFoodFactsCountry> countries = {
        OpenFoodFactsCountry.USA,
        OpenFoodFactsCountry.ITALY,
        OpenFoodFactsCountry.BRAZIL,
      };
      for (final OpenFoodFactsLanguage language in energies.keys) {
        for (final OpenFoodFactsCountry country in countries) {
          final OrderedNutrients orderedNutrients =
              await OpenFoodAPIClient.getOrderedNutrients(
            country: country,
            language: language,
          );
          final OrderedNutrient? found =
              findOrderedNutrient(orderedNutrients.nutrients, nutrientId);
          expect(found, isNotNull);
          expect(found!.name, energies[language]);
        }
      }
    });
  });
}
