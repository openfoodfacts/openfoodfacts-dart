import 'package:openfoodfacts/utils/UnitHelper.dart';

/// Nutrient
enum Nutrient {
  /// Salt
  salt,

  /// Sodium
  sodium,

  /// Fibers
  fiber,

  /// Sugars
  sugars,

  /// Fats
  fat,

  /// Saturated Fats
  saturatedFat,

  /// Proteins
  proteins,

  /// Energy in kcal
  energyKCal,

  /// Energy in kj
  energyKJ,

  /// Carbohydrates
  carbohydrates,

  /// Caffeine
  caffeine,

  /// Calcium
  calcium,

  /// Iron
  iron,

  /// Vitamin C
  vitaminC,

  /// Magnesium
  magnesium,

  /// Phosphorus
  phosphorus,

  /// Potassium
  potassium,

  /// Zinc
  zinc,

  /// Copper
  copper,

  /// Selenium
  selenium,

  /// Vitamin A
  vitaminA,

  /// Vitamin E
  vitaminE,

  /// Vitamin D
  vitaminD,

  /// Vitamin B1
  vitaminB1,

  /// Vitamin B2
  vitaminB2,

  /// Vitamin PP
  vitaminPP,

  /// Vitamin B6
  vitaminB6,

  /// Vitamin B12
  vitaminB12,

  /// Vitamin B9
  vitaminB9,

  /// Vitamin K
  vitaminK,

  /// Cholesterol
  cholesterol,

  /// Butyric Acid
  butyricAcid,

  /// Caproic Acid
  caproicAcid,

  /// Caprylic Acid
  caprylicAcid,

  /// Capric Acid
  capricAcid,

  /// Lauric Acid
  lauricAcid,

  /// Myristic Acid
  myristicAcid,

  /// Palmitic Acid
  palmiticAcid,

  /// Stearic Acid
  stearicAcid,

  /// Oleic Acid
  oleicAcid,

  /// Linoleic Acid
  linoleicAcid,

  /// Docosahexaenoic Acid
  docosahexaenoicAcid,

  /// Eicosapentaenoic Acid
  eicosapentaenoicAcid,

  /// Erucic Acid
  erucicAcid,

  /// Monounsaturated Fats
  monounsaturatedFat,

  /// Polyunsaturated Fats
  polyunsaturatedFat,

  /// Alcohol
  alcohol, // pct
  /// Pantothenic Acid
  pantothenicAcid,

  /// Biotin
  biotin,

  /// Chloride
  chloride,

  /// Chromium
  chromium,

  /// Fluoride
  fluoride,

  /// Iodine
  iodine,

  /// Manganese
  manganese,

  /// Molybdenum
  molybdenum,

  /// Omega 3
  omega3,

  /// Omega 6
  omega6,

  /// Trans Fats
  transFat,
}

/// Helper class around [Nutrient].
extension NutrientExtension on Nutrient {
  /// Tags for nutrients, in the cases when the labels are different.
  ///
  /// E.g.:
  /// * 'saturated-fat' and [saturatedFat] - not the same, we need an entry here
  /// * 'iron' and [iron] - same label, we don't need an entry here
  static const Map<Nutrient, String> _specialNutrientTags = <Nutrient, String>{
    Nutrient.saturatedFat: 'saturated-fat',
    Nutrient.energyKCal: 'energy-kcal',
    Nutrient.energyKJ: 'energy-kj',
    Nutrient.vitaminC: 'vitamin-c',
    Nutrient.vitaminA: 'vitamin-a',
    Nutrient.vitaminE: 'vitamin-e',
    Nutrient.vitaminD: 'vitamin-d',
    Nutrient.vitaminB1: 'vitamin-b1',
    Nutrient.vitaminB2: 'vitamin-b2',
    Nutrient.vitaminPP: 'vitamin-pp',
    Nutrient.vitaminB6: 'vitamin-b6',
    Nutrient.vitaminB12: 'vitamin-b12',
    Nutrient.vitaminB9: 'vitamin-b9',
    Nutrient.vitaminK: 'vitamin-k',
    Nutrient.butyricAcid: 'butyric-acid',
    Nutrient.caproicAcid: 'caproic-acid',
    Nutrient.caprylicAcid: 'caprylic-acid',
    Nutrient.capricAcid: 'capric-acid',
    Nutrient.lauricAcid: 'lauric-acid',
    Nutrient.myristicAcid: 'myristic-acid',
    Nutrient.palmiticAcid: 'palmitic-acid',
    Nutrient.stearicAcid: 'stearic-acid',
    Nutrient.oleicAcid: 'oleic-acid',
    Nutrient.linoleicAcid: 'linoleic-acid',
    Nutrient.docosahexaenoicAcid: 'docosahexaenoic-acid',
    Nutrient.eicosapentaenoicAcid: 'eicosapentaenoic-acid',
    Nutrient.erucicAcid: 'erucic-acid',
    Nutrient.monounsaturatedFat: 'monounsaturated',
    Nutrient.polyunsaturatedFat: 'polyunsaturated',
    Nutrient.pantothenicAcid: 'pantothenic-acid',
    Nutrient.omega3: 'omega-3-fat',
    Nutrient.omega6: 'omega-6-fat',
    Nutrient.transFat: 'trans-fat',
  };

  /// Default units for nutrients.
  static const Map<Unit, Set<Nutrient>> _defaultUnits = <Unit, Set<Nutrient>>{
    Unit.KCAL: <Nutrient>{
      Nutrient.energyKCal,
    },
    Unit.KJ: <Nutrient>{
      Nutrient.energyKJ,
    },
    Unit.PERCENT: <Nutrient>{
      Nutrient.alcohol,
    },
    Unit.MILLI_G: <Nutrient>{
      Nutrient.calcium,
      Nutrient.iron,
      Nutrient.vitaminC,
      Nutrient.magnesium,
      Nutrient.phosphorus,
      Nutrient.potassium,
      Nutrient.zinc,
      Nutrient.copper,
      Nutrient.vitaminE,
      Nutrient.vitaminB1,
      Nutrient.vitaminB2,
      Nutrient.vitaminPP,
      Nutrient.vitaminB6,
      Nutrient.cholesterol,
      Nutrient.pantothenicAcid,
      Nutrient.chloride,
      Nutrient.fluoride,
      Nutrient.manganese,
      Nutrient.omega3,
      Nutrient.omega6,
    },
    Unit.G: <Nutrient>{
      Nutrient.salt,
      Nutrient.sodium,
      Nutrient.fiber,
      Nutrient.sugars,
      Nutrient.fat,
      Nutrient.saturatedFat,
      Nutrient.proteins,
      Nutrient.carbohydrates,
      Nutrient.caffeine,
      Nutrient.butyricAcid,
      Nutrient.caproicAcid,
      Nutrient.caprylicAcid,
      Nutrient.capricAcid,
      Nutrient.lauricAcid,
      Nutrient.myristicAcid,
      Nutrient.palmiticAcid,
      Nutrient.stearicAcid,
      Nutrient.oleicAcid,
      Nutrient.linoleicAcid,
      Nutrient.docosahexaenoicAcid,
      Nutrient.eicosapentaenoicAcid,
      Nutrient.erucicAcid,
      Nutrient.monounsaturatedFat,
      Nutrient.polyunsaturatedFat,
      Nutrient.transFat,
    },
    Unit.MICRO_G: <Nutrient>{
      Nutrient.selenium,
      Nutrient.vitaminA,
      Nutrient.vitaminD,
      Nutrient.vitaminB12,
      Nutrient.vitaminB9,
      Nutrient.vitaminK,
      Nutrient.biotin,
      Nutrient.chromium,
      Nutrient.iodine,
      Nutrient.molybdenum,
    },
  };

  /// Returns the tag used in [Nutriments]'s map.
  String get tag =>
      _specialNutrientTags[this] ?? toString().replaceFirst('Nutrient.', '');

  /// Returns the default unit of values.
  Unit? get defaultUnit {
    for (final MapEntry<Unit, Set<Nutrient>> entry in _defaultUnits.entries) {
      if (entry.value.contains(this)) {
        return entry.key;
      }
    }
    return null;
  }
}
