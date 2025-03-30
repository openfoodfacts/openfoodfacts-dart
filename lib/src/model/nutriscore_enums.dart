enum NutriScoreStatus { unknown, notApplicable, computed, invalid }

enum NutriScoreGrade { A, B, C, D, E }

enum NutriScoreInput { category, nutrients, ingredients }

enum NutriScoreVersion {
  v2021,
  v2023;

  /// Returns the name of the NutriScore version.
  String get name => switch (this) {
        NutriScoreVersion.v2021 => '2021',
        NutriScoreVersion.v2023 => '2023',
      };

  /// Parses a Nutri-Score version from a string such as '2021' or '2023'.
  ///
  /// Returns `null` if the string does not match any known version.
  static NutriScoreVersion? tryParse(String? value) {
    return switch (value?.toLowerCase()) {
      '2021' => NutriScoreVersion.v2021,
      '2023' => NutriScoreVersion.v2023,
      _ => null,
    };
  }
}

enum NutriScoreCategory2021 {
  general,
  cheese,
  fat,
  beverage,
  water,
}

enum NutriScoreCategory2023 {
  general,
  cheese,
  redMeatProduct,
  fatOilNutsSeeds,
  beverage,
  water,
}

extension NutriScoreCategoryExtension2021 on NutriScoreCategory2021 {
  bool get isWater => this == NutriScoreCategory2021.water;
  bool get isBeverage => this == NutriScoreCategory2021.beverage;
  bool get isFat => this == NutriScoreCategory2021.fat;
  bool get isCheese => this == NutriScoreCategory2021.cheese;
  bool get isGeneral => this == NutriScoreCategory2021.general;
}

extension NutriScoreCategoryExtension2023 on NutriScoreCategory2023 {
  bool get isWater => this == NutriScoreCategory2023.water;
  bool get isBeverage => this == NutriScoreCategory2023.beverage;
  bool get isFatOilNutsSeeds => this == NutriScoreCategory2023.fatOilNutsSeeds;
  bool get isCheese => this == NutriScoreCategory2023.cheese;
  bool get isRedMeatProduct => this == NutriScoreCategory2023.redMeatProduct;
  bool get isGeneral => this == NutriScoreCategory2023.general;
}
