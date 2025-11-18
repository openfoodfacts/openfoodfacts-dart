import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Tests related to [OrderedNutrient] and [OrderedNutrients]
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;

  const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.ENGLISH;

  // Countries with distinct nutrient lists.
  const Set<OpenFoodFactsCountry> countries = {
    OpenFoodFactsCountry.FRANCE,
    OpenFoodFactsCountry.CANADA,
    OpenFoodFactsCountry.RUSSIA,
    OpenFoodFactsCountry.USA,
    OpenFoodFactsCountry.HONG_KONG,
    OpenFoodFactsCountry.JAPAN,
  };

  // Nutrients expected in all countries.
  // Don't hesitate to edit this list if you have clear functional ideas
  // about which nutrients should actually be there.
  const Set<String> expectedNutrients = {
    'alcohol',
    'calcium',
    'carbohydrates',
    'cholesterol',
    'energy-kcal',
    'fat',
    'fiber',
    'iron',
    'monounsaturated-fat',
    'potassium',
    'proteins',
    'salt',
    'saturated-fat',
    'sugars',
    'vitamin-a',
    'vitamin-b1',
    'vitamin-b12',
    'vitamin-b2',
    'vitamin-b6',
    'vitamin-b9',
    'vitamin-c',
    'vitamin-d',
    'vitamin-pp',
  };

  List<String> findMissingNutrients(final List<OrderedNutrient>? list) {
    final List<String> result = [];
    if (list == null) {
      return result;
    }
    for (final OrderedNutrient item in list) {
      final String offTag = item.id;
      if (Nutrient.fromOffTag(offTag) == null) {
        result.add(offTag);
      }
      result.addAll(findMissingNutrients(item.subNutrients));
    }
    return result;
  }

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
      for (final OpenFoodFactsCountry country in countries) {
        checkNutrients(
          await OpenFoodAPIClient.getOrderedNutrients(
            country: country,
            language: language,
          ),
          country,
        );
      }
    });

    test('check localized "energy-kcal"', () async {
      const String nutrientId = 'energy-kcal';
      const Map<OpenFoodFactsLanguage, String> energies = {
        OpenFoodFactsLanguage.FRENCH: 'Énergie (kcal)',
        OpenFoodFactsLanguage.SPANISH: 'Energía (kcal)',
        OpenFoodFactsLanguage.ENGLISH: 'Energy (kcal)',
        OpenFoodFactsLanguage.PORTUGUESE: 'Energia (kcal)',
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

    test('check if nutrients are missing', () async {
      for (final OpenFoodFactsCountry country in countries) {
        final OrderedNutrients orderedNutrients =
            await OpenFoodAPIClient.getOrderedNutrients(
          country: country,
          language: language,
        );
        final List<String> missingNutrients =
            findMissingNutrients(orderedNutrients.nutrients);
        expect(missingNutrients, isEmpty,
            reason: 'For country ${country.name}');
      }
    });
  });
}
