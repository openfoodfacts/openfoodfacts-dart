class RecommendedDailyIntakeHelper {
  // There is an issue where the plugin cannot access the assets/json/recommended_daily_intakes_source _eu.json file. This is used as a replacement while the problem is being fixed.
  static final Map<String, dynamic> _euRecommendations = {
    'energy_kcal': {'unit': 'kcal', 'value': 2000},
    'energy_kJ': {'unit': 'kJ', 'value': 8400},
    'fat': {'unit': 'g', 'value': 70},
    'saturated-fat': {'unit': 'g', 'value': 20},
    'carbohydrates': {'unit': 'g', 'value': 260},
    'sugars': {'unit': 'g', 'value': 90},
    'proteins': {'unit': 'g', 'value': 50},
    'sodium': {'unit': 'g', 'value': 6},
    'vitamin-a': {'unit': 'μg', 'value': 800},
    'vitamin-d': {'unit': 'μg', 'value': 5},
    'vitamin-e': {'unit': 'mg', 'value': 12},
    'vitamin-k': {'unit': 'μg', 'value': 75},
    'vitamin-c': {'unit': 'mg', 'value': 80},
    'vitamin-b1': {'unit': 'mg', 'value': 1.1},
    'vitamin-b2': {'unit': 'mg', 'value': 1.4},
    'vitamin-b3': {'unit': 'mg', 'value': 16},
    'vitamin-b6': {'unit': 'mg', 'value': 1.4},
    'vitamin-b9': {'unit': 'μg', 'value': 200},
    'vitamin-b12': {'unit': 'μg', 'value': 2.5},
    'biotin': {'unit': 'μg', 'value': 50},
    'pantothenic-acid': {'unit': 'mg', 'value': 6},
    'potassium': {'unit': 'mg', 'value': 2000},
    'chloride': {'unit': 'mg', 'value': 800},
    'calcium': {'unit': 'mg', 'value': 800},
    'phosphorus': {'unit': 'mg', 'value': 700},
    'magnesium': {'unit': 'mg', 'value': 375},
    'iron': {'unit': 'mg', 'value': 14},
    'zinc': {'unit': 'mg', 'value': 10},
    'copper': {'unit': 'mg', 'value': 1},
    'manganese': {'unit': 'mg', 'value': 2},
    'fluoride': {'unit': 'mg', 'value': 3.5},
    'selenium': {'unit': 'μg', 'value': 55},
    'chromium': {'unit': 'μg', 'value': 40},
    'molybdenum': {'unit': 'μg', 'value': 50},
    'iodine': {'unit': 'μg', 'value': 150}
  };

  static Map<String, dynamic> getEURecommendationsJson() {
    return _euRecommendations;
  }
}
