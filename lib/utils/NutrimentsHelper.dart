import 'package:openfoodfacts/model/Nutrient.dart';
import 'package:openfoodfacts/model/Nutriments.dart';
import 'package:openfoodfacts/model/PerSize.dart';

/// Energy units
@Deprecated('Use Unit instead')
enum NormalizedEnergyUnit { kCal, kJ, undefined }

// TODO: rename as NormalizedEnergyHelper or fix typo as NutrientHelper
/// Helper class for energy computations and checks
class NutrimentsHelper {
  static const double _kcalToKJFactor = 4.1868;

  static double fromKCalToKJ(final double kCal) => kCal * _kcalToKJFactor;

  static double fromKJtoKCal(final double kJ) => kJ / _kcalToKJFactor;

  /// Gets the energy value (stored in kJ) converted in kCal.
  @Deprecated(
      'Use nutriments.energyKCal or fromKJtoKCal and nutriments.energyKJ instead')
  static double getEnergyAsKCal(Nutriments nutriments) =>
      fromKJtoKCal(nutriments.energy!);

  /// Calculates the energy for 100g in kJ.
  /// ! should be used cautiously (might not be displayed to the end user) !
  /// source : https://en.wikipedia.org/wiki/Food_energy
  static double? calculateEnergy(
    Nutriments nutriments, {
    PerSize perSize = PerSize.oneHundredGrams,
  }) {
    double? fat = nutriments.getValue(Nutrient.fat, perSize);
    double? carbs = nutriments.getValue(Nutrient.carbohydrates, perSize);
    double? proteins = nutriments.getValue(Nutrient.proteins, perSize);
    double? fiber = nutriments.getValue(Nutrient.fiber, perSize);

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
