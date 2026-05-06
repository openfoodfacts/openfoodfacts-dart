import '../model/nutrient.dart';
import '../model/nutriments.dart';
import '../model/per_size.dart';

// TODO: rename as NormalizedEnergyHelper or fix typo as NutrientHelper
/// Helper class for energy computations and checks
class NutrimentsHelper {
  static const double _kcalToKJFactor = 4.1868;

  static double fromKCalToKJ(final double kCal) => kCal * _kcalToKJFactor;

  static double fromKJtoKCal(final double kJ) => kJ / _kcalToKJFactor;

  /// Calculates the energy from fat, carbs, proteins and fibers.
  /// ! should be used cautiously (might not be displayed to the end user) !
  /// source : https://en.wikipedia.org/wiki/Food_energy
  static double? calculateEnergy(
    Nutriments nutriments, {
    PerSize perSize = PerSize.oneHundredGrams,
  }) {
    final double? fat = nutriments.getComputedValue(Nutrient.fat, perSize);
    final double? carbs = nutriments.getComputedValue(
      Nutrient.carbohydrates,
      perSize,
    );
    final double? proteins = nutriments.getComputedValue(
      Nutrient.proteins,
      perSize,
    );
    final double? fiber = nutriments.getComputedValue(Nutrient.fiber, perSize);

    if (fat == null || carbs == null || proteins == null || fiber == null) {
      return null;
    }

    return (fat * 37 + carbs * 17 + proteins * 17 + fiber * 8);
  }

  /// Checks if the stated energy value is within a margin of error
  /// a use case for this is before saving a product, check if the values aren't
  /// incoherent.
  static bool checkEnergyCoherence(
    Nutriments nutriments,
    double marginPercentage, {
    PerSize perSize = PerSize.oneHundredGrams,
  }) {
    final double statedEnergy = nutriments.getComputedKJ(perSize)!;

    double lowLimit =
        statedEnergy - (statedEnergy * (marginPercentage / 100.0));
    double highLimit =
        statedEnergy + (statedEnergy * (marginPercentage / 100.0));

    double calculatedEnergy = calculateEnergy(nutriments)!;

    return (calculatedEnergy >= lowLimit && calculatedEnergy <= highLimit);
  }
}
