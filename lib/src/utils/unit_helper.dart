import '../model/off_tagged.dart';

/// Unit of measurement for nutrients
///
/// cf. get_unit_options_for_nutrient in
/// https://github.com/openfoodfacts/openfoodfacts-server/blob/main/lib/ProductOpener/Nutrition.pm
enum Unit implements OffTagged {
  KCAL('kcal'),
  KJ('kJ'),
  G('g'),
  MILLI_G('mg'),
  MICRO_G('µg'),
  MILLI_L('ml'),
  L('liter'),
  PERCENT('%'),
  // actually we don't expect a specific offTag for "unknown".
  UNKNOWN('unknown'),
  PERCENT_VOL('% vol'),
  G_PER_KG('g/kg'),
  PERCENT_DV('% DV'),
  IU('IU');

  const Unit(this.offTag);

  @override
  final String offTag;
}

/// Helper class for conversions to/from [Unit]
class UnitHelper {
  /// Maps alternate unit spellings to a [Unit]
  static const Map<String, Unit> _ALTERNATE_UNITS = {
    'kCal': Unit.KCAL,
    'KCal': Unit.KCAL,
    'Kj': Unit.KJ,
    'kj': Unit.KJ,
    'KJ': Unit.KJ,
    'G': Unit.G,
    'milli-gram': Unit.MILLI_G,
    'mG': Unit.MILLI_G,
    'mcg': Unit.MICRO_G,
    '&#181;g': Unit.MICRO_G,
    '&micro;g': Unit.MICRO_G,
    '&#xb5;g': Unit.MICRO_G,
    'mL': Unit.MILLI_L,
    'Ml': Unit.MILLI_L,
    'ML': Unit.MILLI_L,
    'milli-liter': Unit.MILLI_L,
    'L': Unit.L,
    'l': Unit.L,
    'percent': Unit.PERCENT,
    'per cent': Unit.PERCENT,
    'μg': Unit.MICRO_G,
  };

  /// Returns a unit spelling corresponding to the type of [unit]
  static String? unitToString(Unit? unit) => unit?.offTag;

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

    return OffTagged.fromOffTag(s, Unit.values) as Unit? ??
        _ALTERNATE_UNITS[s] ??
        Unit.UNKNOWN;
  }
}
