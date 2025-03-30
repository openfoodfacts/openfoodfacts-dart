import 'nutriscore_enums.dart';
import 'nutriscore_raw.dart';

/// Represents a product category used in Nutri-Score computation.
///
/// This sealed class wraps version-specific enum values like [NutriScoreCategory2021]
/// or [NutriScoreCategory2023] while providing a unified interface.
sealed class NutriScoreCategory {
  const NutriScoreCategory();

  NutriScoreVersion get version;

  Enum get value;

  String get name => value.name;

  /// Returns the [NutriScoreCategory2021] enum value if this category belongs to version 2021, or null otherwise.
  NutriScoreCategory2021? get as2021 => _getAs<NutriScoreCategory2021>();

  /// Returns the [NutriScoreCategory2023] enum value if this category belongs to version 2023, or null otherwise.
  NutriScoreCategory2023? get as2023 => _getAs<NutriScoreCategory2023>();

  T? _getAs<T extends Enum>() => value is T ? value as T : null;

  /// Derives the [NutriScoreCategory] from [NutriScoreDataRaw] for the given [version].
  ///
  /// Used when parsing raw Nutri-Score API responses.
  static NutriScoreCategory? fromRaw(
    NutriScoreVersion version,
    NutriScoreDataRaw? data,
  ) {
    if (data == null) return null;
    return switch (version) {
      NutriScoreVersion.v2021 => _NutriScoreCategory2021(data.category2021),
      NutriScoreVersion.v2023 => _NutriScoreCategory2023(data.category2023),
    };
  }

  @override
  String toString() => name;
}

/// Internal wrapper for [NutriScoreCategory2021].
/// Used by [NutriScoreCategory] to encapsulate version-specific category types.
class _NutriScoreCategory2021 extends NutriScoreCategory {
  final NutriScoreCategory2021 _value;

  const _NutriScoreCategory2021(this._value);

  @override
  Enum get value => _value;

  @override
  NutriScoreVersion get version => NutriScoreVersion.v2021;
}

/// Internal wrapper for [NutriScoreCategory2023].
/// Used by [NutriScoreCategory] to encapsulate version-specific category types.
class _NutriScoreCategory2023 extends NutriScoreCategory {
  final NutriScoreCategory2023 _value;

  const _NutriScoreCategory2023(this._value);

  @override
  Enum get value => _value;

  @override
  NutriScoreVersion get version => NutriScoreVersion.v2023;
}

/// Extension to infer [NutriScoreCategory2021] or [NutriScoreCategory2023]
/// from raw boolean flags in [NutriScoreDataRaw].
extension NutriScoreDataExtension on NutriScoreDataRaw {
  NutriScoreCategory2021 get category2021 {
    // water must be checked first to avoid beverage+water conflict
    if (isWater) return NutriScoreCategory2021.water;
    if (isBeverage) return NutriScoreCategory2021.beverage;
    if (isFat) return NutriScoreCategory2021.fat;
    if (isCheese) return NutriScoreCategory2021.cheese;
    return NutriScoreCategory2021.general;
  }

  NutriScoreCategory2023 get category2023 {
    // water must be checked first to avoid beverage+water conflict
    if (isWater) return NutriScoreCategory2023.water;
    if (isBeverage) return NutriScoreCategory2023.beverage;
    if (isFatOilNutsSeeds) return NutriScoreCategory2023.fatOilNutsSeeds;
    if (isCheese) return NutriScoreCategory2023.cheese;
    if (isRedMeatProduct) return NutriScoreCategory2023.redMeatProduct;
    return NutriScoreCategory2023.general;
  }
}
