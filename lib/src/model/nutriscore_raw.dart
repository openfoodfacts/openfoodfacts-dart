import '../interface/json_object.dart';

/// Raw model representing Nutri-Score details, including grade, score,
/// and calculation data.
class NutriScoreRaw {
  final String? grade;
  final int? score;
  final NutriScoreDataRaw? data;
  final String? notApplicableCategory;
  final bool categoryAvailable;
  final bool nutrientsAvailable;

  NutriScoreRaw.fromJson(Map<String, dynamic> json)
      : grade = json['grade'] as String?,
        score = json['score'] as int?,
        categoryAvailable = JsonObject.parseBool(json['category_available']),
        nutrientsAvailable = JsonObject.parseBool(json['nutrients_available']),
        notApplicableCategory = json['not_applicable_category'] as String?,
        data = json['data'] != null
            ? NutriScoreDataRaw.fromJson(json['data'])
            : null;

  @override
  String toString() => 'Nutri-Score(grade: $grade, score: $score, $data)';
}

/// Raw model for additional data used in Nutri-Score 2021/2023 calculation,
/// indicating specific product characteristics.
class NutriScoreDataRaw {
  final bool isBeverage;
  final bool isCheese;
  final bool isFat; // 2021
  final bool isFatOilNutsSeeds; // 2023
  final bool isRedMeatProduct; // 2023
  final bool isWater;

  NutriScoreDataRaw.fromJson(Map<String, dynamic> json)
      : isBeverage = JsonObject.parseBool(json['is_beverage']),
        isCheese = JsonObject.parseBool(json['is_cheese']),
        isFat = JsonObject.parseBool(json['is_fat']),
        isFatOilNutsSeeds = JsonObject.parseBool(json['is_fat_oil_nuts_seeds']),
        isRedMeatProduct = JsonObject.parseBool(json['is_red_meat_product']),
        isWater = JsonObject.parseBool(json['is_water']);

  @override
  String toString() {
    final flags = <String>[
      if (isBeverage) 'isBeverage',
      if (isCheese) 'isCheese',
      if (isFat) 'isFat', // 2021
      if (isFatOilNutsSeeds) 'isFatOilNutsSeeds', // 2023
      if (isRedMeatProduct) 'isRedMeatProduct', // 2023
      if (isWater) 'isWater',
    ];

    return 'data(${flags.join(', ')})';
  }
}
