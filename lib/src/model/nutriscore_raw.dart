/// Raw model representing Nutri-Score details, including grade, score, and calculation data.
class NutriScoreRaw {
  final String? grade;
  final int? score;
  final NutriScoreDataRaw? data;
  final String? notApplicableCategory;
  final bool categoryAvailable;
  final bool nutrientsAvailable;

  /// The constructor is private to ensure that the object is created only through the factory method.
  NutriScoreRaw._({
    this.grade,
    this.score,
    this.data,
    this.notApplicableCategory,
    this.categoryAvailable = false,
    this.nutrientsAvailable = false,
  });

  factory NutriScoreRaw.fromJson(Map<String, dynamic> json) {
    return NutriScoreRaw._(
      grade: json['grade'] as String?,
      score: json['score'] as int?,
      categoryAvailable: parseBool(json, 'category_available'),
      nutrientsAvailable: parseBool(json, 'nutrients_available'),
      notApplicableCategory: json['not_applicable_category'] as String?,
      data: json['data'] != null
          ? NutriScoreDataRaw.fromJson(json['data'])
          : null,
    );
  }

  @override
  String toString() {
    return 'Nutri-Score(grade: $grade, score: $score, $data)';
  }
}

/// Raw model for additional data used in Nutri-Score 2021/2023 calculation, indicating specific product characteristics.
class NutriScoreDataRaw {
  final bool isBeverage;
  final bool isCheese;
  final bool isFat; // 2021
  final bool isFatOilNutsSeeds; // 2023
  final bool isRedMeatProduct; // 2023
  final bool isWater;

  /// The constructor is private to ensure that the object is created only through the factory method.
  NutriScoreDataRaw._({
    this.isBeverage = false,
    this.isCheese = false,
    this.isFat = false,
    this.isFatOilNutsSeeds = false,
    this.isRedMeatProduct = false,
    this.isWater = false,
  });

  factory NutriScoreDataRaw.fromJson(Map<String, dynamic> json) {
    return NutriScoreDataRaw._(
      isBeverage: parseBool(json, 'is_beverage'),
      isCheese: parseBool(json, 'is_cheese'),
      isFat: parseBool(json, 'is_fat'), // 2021
      isFatOilNutsSeeds: parseBool(json, 'is_fat_oil_nuts_seeds'), // 2023
      isRedMeatProduct: parseBool(json, 'is_red_meat_product'), // 2023
      isWater: parseBool(json, 'is_water'),
    );
  }

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

bool parseBool(Map<String, dynamic> json, String key) {
  final value = json[key];
  return value == true || value == 1 || value == '1';
}
