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
