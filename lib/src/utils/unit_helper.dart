/// Unit of measurement for nutrients
enum Unit { KCAL, KJ, G, MILLI_G, MICRO_G, MILLI_L, L, PERCENT, UNKNOWN }

/// Helper class for conversions to/from [Unit]
class UnitHelper {
  /// Maps a unit spelling to a [Unit]
  static const Map<String, Unit> _UNITS = {
    'kcal': Unit.KCAL,
    'kCal': Unit.KCAL,
    'KCal': Unit.KCAL,
    'kj': Unit.KJ,
    'Kj': Unit.KJ,
    'kJ': Unit.KJ,
    'KJ': Unit.KJ,
    'g': Unit.G,
    'G': Unit.G,
    'mg': Unit.MILLI_G,
    'milli-gram': Unit.MILLI_G,
    'mG': Unit.MILLI_G,
    'mcg': Unit.MICRO_G,
    'µg': Unit.MICRO_G,
    '&#181;g': Unit.MICRO_G,
    '&micro;g': Unit.MICRO_G,
    '&#xb5;g': Unit.MICRO_G,
    'ml': Unit.MILLI_L,
    'mL': Unit.MILLI_L,
    'Ml': Unit.MILLI_L,
    'ML': Unit.MILLI_L,
    'milli-liter': Unit.MILLI_L,
    'liter': Unit.L,
    'L': Unit.L,
    'l': Unit.L,
    '%': Unit.PERCENT,
    'per cent': Unit.PERCENT,
    'percent': Unit.PERCENT,
    'μg': Unit.MICRO_G,
  };

  /// Maps a [Unit] to a unit spelling recognised by the write API
  static const _POSSIBLE_SPELLINGS = {
    Unit.KCAL: 'kcal',
    Unit.KJ: 'kj',
    Unit.G: 'g',
    Unit.MILLI_G: 'mg',
    Unit.MICRO_G: 'mcg',
    Unit.MILLI_L: 'ml',
    Unit.L: 'liter',
    Unit.PERCENT: 'percent',
  };

  /// Returns a unit spelling corresponding to the type of [unit]
  static String? unitToString(Unit? unit) => _POSSIBLE_SPELLINGS[unit];

  /// Returns the [Unit] described by [s]
  static Unit? stringToUnit(String? s) {
    if (s == null || s.isEmpty) {
      return null;
    }

    if (s[0] == String.fromCharCode(0x03BC)) {
      // greek letter mu
      if (s.length > 1 && s.substring(1) == 'g') {
        return Unit.MICRO_G;
      }
      return Unit.UNKNOWN;
    }

    return _UNITS[s] ?? Unit.UNKNOWN;
  }
}
