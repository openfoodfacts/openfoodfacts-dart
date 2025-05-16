import 'package:openfoodfacts/openfoodfacts.dart';

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

enum NutriScoreGrade { A, B, C, D, E }

enum NutriScoreInput { category, nutrients, ingredients }

typedef NutriScore2021 = _NutriScore<NutriScoreCategory2021>;
typedef NutriScore2023 = _NutriScore<NutriScoreCategory2023>;

class _NutriScore<T extends Enum> {
  final NutriScoreGrade? grade;
  final int? score;
  final String? notApplicableCategory;
  final List<NutriScoreInput> missingData;
  final T? category;

  _NutriScore({
    String? grade,
    this.category,
    this.score,
    this.notApplicableCategory,
    bool hasCategory = false,
    bool hasNutrients = false,
  })  : grade = parseGrade(grade ?? ''),
        missingData = [
          if (!hasCategory) NutriScoreInput.category,
          if (!hasNutrients) NutriScoreInput.nutrients,
        ];

  bool get isComputed => grade != null;
  bool get isNotApplicable => grade == null && notApplicableCategory != null;
  bool get isUnknown => grade == null && missingData.isNotEmpty;

  static NutriScoreGrade? parseGrade(String grade) {
    return switch (grade.toLowerCase()) {
      'a' => NutriScoreGrade.A,
      'b' => NutriScoreGrade.B,
      'c' => NutriScoreGrade.C,
      'd' => NutriScoreGrade.D,
      'e' => NutriScoreGrade.E,
      _ => null,
    };
  }
}

extension NutriScoreDetails2021Ext on NutriScoreDetails {
  NutriScore2021? get2021() {
    if (nutriScore2021 == null) return null;

    return NutriScore2021(
      category: nutriScore2021?.data?.category,
      grade: nutriScore2021?.grade,
      score: nutriScore2021?.score,
      notApplicableCategory: nutriScore2021?.notApplicableCategory,
      hasCategory: nutriScore2021?.categoryAvailable == true,
      hasNutrients: nutriScore2021?.nutrientsAvailable == true,
    );
  }

  NutriScore2023? get2023() {
    if (nutriScore2023 == null) return null;

    return NutriScore2023(
      category: nutriScore2023?.data?.category,
      grade: nutriScore2023?.grade,
      score: nutriScore2023?.score,
      notApplicableCategory: nutriScore2023?.notApplicableCategory,
      hasCategory: nutriScore2023?.categoryAvailable == true,
      hasNutrients: nutriScore2023?.nutrientsAvailable == true,
    );
  }
}

/// Extension to infer [NutriScoreCategory2021] from boolean flags.
extension NutriScoreData2021Ext on NutriScoreData2021 {
  NutriScoreCategory2021 get category {
    // water must be checked first to avoid beverage+water conflict
    if (isWater == true) return NutriScoreCategory2021.water;
    if (isBeverage == true) return NutriScoreCategory2021.beverage;
    if (isFat == true) return NutriScoreCategory2021.fat;
    if (isCheese == true) return NutriScoreCategory2021.cheese;
    return NutriScoreCategory2021.general;
  }
}

/// Extension to infer [NutriScoreCategory2023] from boolean flags.
extension NutriScoreData2023Ext on NutriScoreData2023 {
  NutriScoreCategory2023 get category {
    // water must be checked first to avoid beverage+water conflict
    if (isWater == true) return NutriScoreCategory2023.water;
    if (isBeverage == true) return NutriScoreCategory2023.beverage;
    if (isFatOilNutsSeeds == true)
      return NutriScoreCategory2023.fatOilNutsSeeds;
    if (isCheese == true) return NutriScoreCategory2023.cheese;
    if (isRedMeatProduct == true) return NutriScoreCategory2023.redMeatProduct;
    return NutriScoreCategory2023.general;
  }
}
