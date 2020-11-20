enum Unit { KCAL, KJ, G, MILLI_G, MICRO_G, MILLI_L, L, PERCENT, UNKNOWN }

class UnitHelper {
  static Unit stringToUnit(String s) {
    if (s == null || s.isEmpty) {
      return null;
    }

    if (s[0] == String.fromCharCode(0x03BC)) {
      String newS = s.substring(1);
      switch (newS) {
        case 'g':
          return Unit.MICRO_G;
          break;
        default:
          return Unit.UNKNOWN;
          break;
      }
    }

    switch (s) {
      case 'kcal':
        return Unit.KCAL;
        break;
      case 'kCal':
        return Unit.KCAL;
        break;
      case 'KCal':
        return Unit.KCAL;
        break;
      case 'kj':
        return Unit.KJ;
        break;
      case 'Kj':
        return Unit.KJ;
        break;
      case 'kJ':
        return Unit.KJ;
        break;
      case 'KJ':
        return Unit.KJ;
        break;
      case 'g':
        return Unit.G;
        break;
      case 'G':
        return Unit.G;
        break;
      case 'mg':
        return Unit.MILLI_G;
        break;
      case 'milli-gram':
        return Unit.MILLI_G;
        break;
      case 'mG':
        return Unit.MILLI_G;
        break;
      case 'micro-gram':
        return Unit.MICRO_G;
        break;
      case 'ml':
        return Unit.MILLI_L;
        break;
      case 'mL':
        return Unit.MILLI_L;
        break;
      case 'Ml':
        return Unit.MILLI_L;
        break;
      case 'ML':
        return Unit.MILLI_L;
        break;
      case 'milli-liter':
        return Unit.MILLI_L;
        break;
      case 'liter':
        return Unit.L;
        break;
      case 'L':
        return Unit.L;
        break;
      case 'l':
        return Unit.L;
        break;
      case '%':
        return Unit.PERCENT;
        break;
      case 'per cent':
        return Unit.PERCENT;
        break;
      case 'percent':
        return Unit.PERCENT;
        break;
      default:
        return Unit.UNKNOWN;
        break;
    }
  }
}
