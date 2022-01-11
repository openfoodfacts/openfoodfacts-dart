import 'dart:convert';
import 'package:openfoodfacts/model/OrderedNutrient.dart';
import 'package:openfoodfacts/model/OrderedNutrients.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/CountryHelper.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

/// Tests related to [OrderedNutrient] and [OrderedNutrients]
void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;

  // Very long list, experimentally created from the 3 initial URLs.
  // Don't hesitate to edit this list if you have clear functional ideas
  // about which nutrients should actually be there.
  const Set<String> _expectedNutrients = {
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

  OrderedNutrient? _findOrderedNutrient(
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
          _findOrderedNutrient(item.subNutrients, nutrientId);
      if (found != null) {
        return found;
      }
    }
    return null;
  }

  void _checkNutrients(
    final OrderedNutrients orderedNutrients,
    final OpenFoodFactsCountry country,
  ) {
    for (final String expectedNutrient in _expectedNutrients) {
      expect(
        _findOrderedNutrient(orderedNutrients.nutrients, expectedNutrient),
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
        _checkNutrients(
          await OpenFoodAPIClient.getOrderedNutrients(
            cc: country.iso2Code,
            language: language,
          ),
          country,
        );
        _checkNutrients(
          OrderedNutrients.fromJson(
            jsonDecode(
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
      const Set<String> countries = {'us', 'it', 'br'};
      for (final OpenFoodFactsLanguage language in energies.keys) {
        for (final String country in countries) {
          final OrderedNutrients orderedNutrients =
              await OpenFoodAPIClient.getOrderedNutrients(
            cc: country,
            language: language,
          );
          final OrderedNutrient? found =
              _findOrderedNutrient(orderedNutrients.nutrients, nutrientId);
          expect(found, isNotNull);
          expect(found!.name, energies[language]);
        }
      }
    });
  });
}
