import 'dart:convert';

import 'package:openfoodfacts/model/OrderedNutrient.dart';
import 'package:openfoodfacts/model/OrderedNutrients.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:openfoodfacts/utils/HttpHelper.dart';

/// Tests related to [OrderedNutrient] and [OrderedNutrients]
void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;

  group('$OpenFoodAPIClient ordered nutrients', () {
    test('find expected nutrients', () async {
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

      /* debug function
    void displayOrderedNutrients(
      final List<OrderedNutrient>? list,
      final int level, // 0 for OrderedNutrients.subNutrients
    ) {
      if (list == null) {
        return;
      }
      final String prefix = '-' * level;
      for (final OrderedNutrient item in list) {
        print('$prefix${item.id}');
        if (item.subNutrients != null) {
          displayOrderedNutrients(item.subNutrients!, level + 1);
        }
      }
    }
     */

      const List<String> urls = [
        'https://fr.openfoodfacts.org/cgi/nutrients.pl',
        'https://us.openfoodfacts.org/cgi/nutrients.pl',
        'https://us-es.openfoodfacts.org/cgi/nutrients.pl',
      ];
      for (final String url in urls) {
        final http.Response response =
            await HttpHelper().doGetRequest(Uri.parse(url));
        final json = jsonDecode(response.body);
        final OrderedNutrients orderedNutrients =
            OrderedNutrients.fromJson(json);
        for (final String expectedNutrient in expectedNutrients) {
          expect(
            _findOrderedNutrient(
                orderedNutrients.subNutrients, expectedNutrient),
            isNotNull,
            reason: 'Could not find $expectedNutrient in $url',
          );
        }
      }
    });

    test('check localized "energy"', () async {
      const String nutrientId = 'energy';
      const Map<String, String> energies = {
        'https://fr.openfoodfacts.org/cgi/nutrients.pl': 'Énergie',
        'https://us.openfoodfacts.org/cgi/nutrients.pl': 'Energy',
        'https://us-es.openfoodfacts.org/cgi/nutrients.pl': 'Energía',
      };
      for (final String url in energies.keys) {
        final http.Response response =
            await HttpHelper().doGetRequest(Uri.parse(url));
        final json = jsonDecode(response.body);
        final OrderedNutrients orderedNutrients =
            OrderedNutrients.fromJson(json);
        final OrderedNutrient? found =
            _findOrderedNutrient(orderedNutrients.subNutrients, nutrientId);
        expect(found, isNotNull);
        expect(found!.name, energies[url]);
      }
    });
  });
}

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
