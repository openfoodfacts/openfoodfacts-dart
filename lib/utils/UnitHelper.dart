
enum Unit {
  KCAL,
  KJ,
  G,
  MILLI_G,
  MICRO_G,
  UNKNOWN
}

class UnitHelper {

  static Unit stringToUnit(String s) {

    if(s == null) {
      return null;
    }

    if(s[0] == String.fromCharCode(0x03BC)) {
      String newS = s.substring(1);
      switch(newS) {
        case 'g':
          return Unit.MICRO_G;
          break;
        default:
          return Unit.UNKNOWN;
          break;
      }
    }

    switch(s) {
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
      default:
        return Unit.UNKNOWN;
        break;
    }
  }

}