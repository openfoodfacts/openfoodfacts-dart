import 'package:openfoodfacts/model/Nutriments.dart';

enum NormalizedEnergyUnit { kCal, kJ, undefined }

class NutrimentsHelper {
  /// normalize the energy unit as it is pretty fragmented.
  /// Removed as now energy is always in kJ
  /*static NormalizedEnergyUnit normalizeEnergyUnit(String unit) {
    var unitLowerCase = unit != null ? unit.toLowerCase() : null;
    switch (unitLowerCase) {
      case "kj":
        return NormalizedEnergyUnit.kJ;
        break;
      case "kcal":
        return NormalizedEnergyUnit.kCal;
        break;
      default:
        return NormalizedEnergyUnit.undefined;
        break;
    }
  }*/

  /// get the energy value converted in kCal.
  static double getEnergyAsKCal(Nutriments nutriments) {
    return (nutriments.energy * 0.2388);
  }

  /// get the energy value converted in kJ if necessary.
  /// Removed as now energy is always in kJ
  /*static double getEnergyAsKJ(Nutriments nutriments) {
    switch (normalizeEnergyUnit(nutriments.energyUnit)) {
      case NormalizedEnergyUnit.kCal:
        return (nutriments.energy * 4.1868);
        break;
      case NormalizedEnergyUnit.kJ:
        return nutriments.energy;
        break;
      case NormalizedEnergyUnit.undefined:
        return null;
        break;
      default:
        return null;
        break;
    }
  }*/

  /// calculates the energy for 100g in kJ.
  /// ! should be used cautiously (might not be displayed to the end user) !
  /// source : https://en.wikipedia.org/wiki/Food_energy
  static double calculateEnergy(Nutriments nutriments) {
    double fat = nutriments.fat;
    double carbs = nutriments.carbohydrates;
    double proteins = nutriments.proteins;
    double fiber = nutriments.fiber;

    if (fat == null || carbs == null || proteins == null || fiber == null)
      return null;

    return (fat * 37 + carbs * 17 + proteins * 17 + fiber * 8);
  }

  /// check if the stated energy value is within a margin of error
  /// a use case for this is before saving a product, check if the values aren't
  /// uncoherent.
  static bool checkEnergyCoherence(
      Nutriments nutriments, double marginPercentage) {
    double statedEnergy = nutriments.energy;

    double lowLimit =
        statedEnergy - (statedEnergy * (marginPercentage / 100.0));
    double highLimit =
        statedEnergy + (statedEnergy * (marginPercentage / 100.0));

    double calculatedEnergy = calculateEnergy(nutriments);

    return (calculatedEnergy >= lowLimit && calculatedEnergy <= highLimit);
  }
}
