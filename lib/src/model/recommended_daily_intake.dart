import '../utils/recommended_daily_intake_helper.dart';
import '../utils/unit_helper.dart';

// TODO(x): Refactor to Nutrients

/// Recommended daily intake amounts
class RecommendedDailyIntake {
  RecommendedDailyIntake(
      this.energyKcal,
      this.energyKj,
      this.fat,
      this.saturatedFat,
      this.carbohydrates,
      this.sugars,
      this.proteins,
      this.sodium,
      this.vitaminA,
      this.vitaminD,
      this.vitaminE,
      this.vitaminK,
      this.vitaminC,
      this.vitaminB1,
      this.vitaminB2,
      this.vitaminB3,
      this.vitaminB6,
      this.vitaminB9,
      this.vitaminB12,
      this.biotin,
      this.pantothenicAcid,
      this.potassium,
      this.chloride,
      this.calcium,
      this.phosphorus,
      this.magnesium,
      this.iron,
      this.zinc,
      this.copper,
      this.manganese,
      this.fluoride,
      this.selenium,
      this.chromium,
      this.molybdenum,
      this.iodine);

  factory RecommendedDailyIntake.fromJson(Map<String, dynamic> parsedJson) {
    return RecommendedDailyIntake(
        IntakeRecommendation(parsedJson['energy_kcal']),
        IntakeRecommendation(parsedJson['energy_kJ']),
        IntakeRecommendation(parsedJson['fat']),
        IntakeRecommendation(parsedJson['saturated-fat']),
        IntakeRecommendation(parsedJson['carbohydrates']),
        IntakeRecommendation(parsedJson['sugars']),
        IntakeRecommendation(parsedJson['proteins']),
        IntakeRecommendation(parsedJson['sodium']),
        IntakeRecommendation(parsedJson['vitamin-a']),
        IntakeRecommendation(parsedJson['vitamin-d']),
        IntakeRecommendation(parsedJson['vitamin-e']),
        IntakeRecommendation(parsedJson['vitamin-k']),
        IntakeRecommendation(parsedJson['vitamin-c']),
        IntakeRecommendation(parsedJson['vitamin-b1']),
        IntakeRecommendation(parsedJson['vitamin-b2']),
        IntakeRecommendation(parsedJson['vitamin-b3']),
        IntakeRecommendation(parsedJson['vitamin-b6']),
        IntakeRecommendation(parsedJson['vitamin-b9']),
        IntakeRecommendation(parsedJson['vitamin-b12']),
        IntakeRecommendation(parsedJson['biotin']),
        IntakeRecommendation(parsedJson['pantothenic-acid']),
        IntakeRecommendation(parsedJson['potassium']),
        IntakeRecommendation(parsedJson['chloride']),
        IntakeRecommendation(parsedJson['calcium']),
        IntakeRecommendation(parsedJson['phosphorus']),
        IntakeRecommendation(parsedJson['magnesium']),
        IntakeRecommendation(parsedJson['iron']),
        IntakeRecommendation(parsedJson['zinc']),
        IntakeRecommendation(parsedJson['copper']),
        IntakeRecommendation(parsedJson['manganese']),
        IntakeRecommendation(parsedJson['fluoride']),
        IntakeRecommendation(parsedJson['selenium']),
        IntakeRecommendation(parsedJson['chromium']),
        IntakeRecommendation(parsedJson['molybdenum']),
        IntakeRecommendation(parsedJson['iodine']));
  }

  final IntakeRecommendation energyKcal;
  final IntakeRecommendation energyKj;
  final IntakeRecommendation fat;
  final IntakeRecommendation saturatedFat;
  final IntakeRecommendation carbohydrates;
  final IntakeRecommendation sugars;
  final IntakeRecommendation proteins;
  final IntakeRecommendation sodium;
  final IntakeRecommendation vitaminA;
  final IntakeRecommendation vitaminD;
  final IntakeRecommendation vitaminE;
  final IntakeRecommendation vitaminK;
  final IntakeRecommendation vitaminC;
  final IntakeRecommendation vitaminB1;
  final IntakeRecommendation vitaminB2;
  final IntakeRecommendation vitaminB3;
  final IntakeRecommendation vitaminB6;
  final IntakeRecommendation vitaminB9;
  final IntakeRecommendation vitaminB12;
  final IntakeRecommendation biotin;
  final IntakeRecommendation pantothenicAcid;
  final IntakeRecommendation potassium;
  final IntakeRecommendation chloride;
  final IntakeRecommendation calcium;
  final IntakeRecommendation phosphorus;
  final IntakeRecommendation magnesium;
  final IntakeRecommendation iron;
  final IntakeRecommendation zinc;
  final IntakeRecommendation copper;
  final IntakeRecommendation manganese;
  final IntakeRecommendation fluoride;
  final IntakeRecommendation selenium;
  final IntakeRecommendation chromium;
  final IntakeRecommendation molybdenum;
  final IntakeRecommendation iodine;

  // The plugin is unable to access the assets/json/recommended_daily_intakes_source _eu.json file. Looking for a fix.
  /*static Future<Map<String, dynamic>> _loadRecommendationAsset() async {
    String jsonString = await rootBundle.loadString('assets/json/recommended_daily_intakes_source _eu.json');
    return await json.decode(jsonString);
  }*/

  /// Returns the by the EU recommended intake amount of nutrients
  ///
  /// ```dart
  ///   IntakeRecommendation vitB12 =
  ///       RecommendedDailyIntake.getRecommendedDailyIntakes().vitaminB12;
  ///   print(vitB12.value); // 2.5
  ///   print(vitB12.unit); // Micro g
  /// ```
  ///
  static RecommendedDailyIntake getRecommendedDailyIntakes() {
    //return RecommendedDailyIntake.fromJson(await _loadRecommendationAsset());
    return RecommendedDailyIntake.fromJson(
        RecommendedDailyIntakeHelper.getEURecommendationsJson());
  }
}

class IntakeRecommendation {
  IntakeRecommendation(Map<String, dynamic> json) {
    unit = UnitHelper.stringToUnit(json['unit']);
    value = json['value'] is double
        ? json['value']
        : (json['value'] as int).toDouble();
  }

  Unit? unit;
  double? value;
}
