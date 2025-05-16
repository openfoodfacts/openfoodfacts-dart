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

/// Private base class for NutriScore.
/// It is used to define the common properties and methods for both
/// NutriScore 2021 and NutriScore 2023.
class _NutriScore<T extends Enum> {
  final NutriScoreGrade? grade;
  final int? score;
  final String? notApplicableCategory;
  final List<NutriScoreInput> missingData;
  final T? category;

  _NutriScore({
    this.grade,
    this.category,
    this.score,
    this.notApplicableCategory,
    this.missingData = const [],
  }) : assert(
          (grade != null && score != null && category != null) ||
              (grade == null && (notApplicableCategory?.isNotEmpty ?? false)) ||
              (grade == null && missingData.isNotEmpty),
          'Either NutriScore is computed or not applicable or unknown',
        );

  bool get isComputed => grade != null;
  bool get isNotApplicable => notApplicableCategory?.isNotEmpty ?? false;
  bool get isUnknown => missingData.isNotEmpty;
}

NutriScoreGrade? _parseGrade(String? grade) {
  switch (grade?.toLowerCase()) {
    case 'a':
      return NutriScoreGrade.A;
    case 'b':
      return NutriScoreGrade.B;
    case 'c':
      return NutriScoreGrade.C;
    case 'd':
      return NutriScoreGrade.D;
    case 'e':
      return NutriScoreGrade.E;
    default:
      return null;
  }
}

List<NutriScoreInput> _missingData(bool? hasCategory, bool? hasNutrients) => [
      if (hasCategory != true) NutriScoreInput.category,
      if (hasNutrients != true) NutriScoreInput.nutrients,
    ];

extension NutriScoreDetails2021Ext on NutriScoreDetails {
  /// Returns the NutriScore 2021 as domain model.
  NutriScore2021? get2021() {
    if (nutriScore2021 == null) return null;

    return NutriScore2021(
      category: nutriScore2021?.data?.category,
      grade: _parseGrade(nutriScore2021?.grade),
      score: nutriScore2021?.score,
      notApplicableCategory: nutriScore2021?.notApplicableCategory,
      missingData: _missingData(
        nutriScore2021?.categoryAvailable,
        nutriScore2021?.nutrientsAvailable,
      ),
    );
  }

  /// Returns the NutriScore 2023 as domain model.
  NutriScore2023? get2023() {
    if (nutriScore2023 == null) return null;

    return NutriScore2023(
      category: nutriScore2023?.data?.category,
      grade: _parseGrade(nutriScore2023?.grade),
      score: nutriScore2023?.score,
      notApplicableCategory: nutriScore2023?.notApplicableCategory,
      missingData: _missingData(
        nutriScore2023?.categoryAvailable,
        nutriScore2023?.nutrientsAvailable,
      ),
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
