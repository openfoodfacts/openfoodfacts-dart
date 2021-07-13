/// Unit of measurement for nutrients
enum Unit { KCAL, KJ, G, MILLI_G, MICRO_G, MILLI_L, L, PERCENT, UNKNOWN }

/// Helper class for conversions to/from [Unit]
class UnitHelper {
  /// Returns the [Unit] described by [s]
  static Unit? stringToUnit(String? s) {
    if (s == null || s.isEmpty) {
      return null;
    }

    if (s[0] == String.fromCharCode(0x03BC)) {
      String newS = s.substring(1);
      switch (newS) {
        case 'g':
          return Unit.MICRO_G;
        default:
          return Unit.UNKNOWN;
      }
    }

    switch (s) {
      case 'kcal':
        return Unit.KCAL;
      case 'kCal':
        return Unit.KCAL;
      case 'KCal':
        return Unit.KCAL;
      case 'kj':
        return Unit.KJ;
      case 'Kj':
        return Unit.KJ;
      case 'kJ':
        return Unit.KJ;
      case 'KJ':
        return Unit.KJ;
      case 'g':
        return Unit.G;
      case 'G':
        return Unit.G;
      case 'mg':
        return Unit.MILLI_G;
      case 'milli-gram':
        return Unit.MILLI_G;
      case 'mG':
        return Unit.MILLI_G;
      case 'micro-gram':
        return Unit.MICRO_G;
      case 'ml':
        return Unit.MILLI_L;
      case 'mL':
        return Unit.MILLI_L;
      case 'Ml':
        return Unit.MILLI_L;
      case 'ML':
        return Unit.MILLI_L;
      case 'milli-liter':
        return Unit.MILLI_L;
      case 'liter':
        return Unit.L;
      case 'L':
        return Unit.L;
      case 'l':
        return Unit.L;
      case '%':
        return Unit.PERCENT;
      case 'per cent':
        return Unit.PERCENT;
      case 'percent':
        return Unit.PERCENT;
      default:
        return Unit.UNKNOWN;
    }
  }
}
