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
  alcohol,

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
  static const Map<Nutrient, Unit> _defaultUnits = <Nutrient, Unit>{
    Nutrient.salt: Unit.G,
    Nutrient.sodium: Unit.G,
    Nutrient.fiber: Unit.G,
    Nutrient.sugars: Unit.G,
    Nutrient.fat: Unit.G,
    Nutrient.saturatedFat: Unit.G,
    Nutrient.proteins: Unit.G,
    Nutrient.energyKCal: Unit.KCAL,
    Nutrient.energyKJ: Unit.KJ,
    Nutrient.carbohydrates: Unit.G,
    Nutrient.caffeine: Unit.G,
    Nutrient.calcium: Unit.MILLI_G,
    Nutrient.iron: Unit.MILLI_G,
    Nutrient.vitaminC: Unit.MILLI_G,
    Nutrient.magnesium: Unit.MILLI_G,
    Nutrient.phosphorus: Unit.MILLI_G,
    Nutrient.potassium: Unit.MILLI_G,
    Nutrient.zinc: Unit.MILLI_G,
    Nutrient.copper: Unit.MILLI_G,
    Nutrient.selenium: Unit.MICRO_G,
    Nutrient.vitaminA: Unit.MICRO_G,
    Nutrient.vitaminE: Unit.MILLI_G,
    Nutrient.vitaminD: Unit.MICRO_G,
    Nutrient.vitaminB1: Unit.MILLI_G,
    Nutrient.vitaminB2: Unit.MILLI_G,
    Nutrient.vitaminPP: Unit.MILLI_G,
    Nutrient.vitaminB6: Unit.MILLI_G,
    Nutrient.vitaminB12: Unit.MICRO_G,
    Nutrient.vitaminB9: Unit.MICRO_G,
    Nutrient.vitaminK: Unit.MICRO_G,
    Nutrient.cholesterol: Unit.MILLI_G,
    Nutrient.butyricAcid: Unit.G,
    Nutrient.caproicAcid: Unit.G,
    Nutrient.caprylicAcid: Unit.G,
    Nutrient.capricAcid: Unit.G,
    Nutrient.lauricAcid: Unit.G,
    Nutrient.myristicAcid: Unit.G,
    Nutrient.palmiticAcid: Unit.G,
    Nutrient.stearicAcid: Unit.G,
    Nutrient.oleicAcid: Unit.G,
    Nutrient.linoleicAcid: Unit.G,
    Nutrient.docosahexaenoicAcid: Unit.G,
    Nutrient.eicosapentaenoicAcid: Unit.G,
    Nutrient.erucicAcid: Unit.G,
    Nutrient.monounsaturatedFat: Unit.G,
    Nutrient.polyunsaturatedFat: Unit.G,
    Nutrient.alcohol: Unit.PERCENT,
    Nutrient.pantothenicAcid: Unit.MILLI_G,
    Nutrient.biotin: Unit.MICRO_G,
    Nutrient.chloride: Unit.MILLI_G,
    Nutrient.chromium: Unit.MICRO_G,
    Nutrient.fluoride: Unit.MILLI_G,
    Nutrient.iodine: Unit.MICRO_G,
    Nutrient.manganese: Unit.MILLI_G,
    Nutrient.molybdenum: Unit.MICRO_G,
    Nutrient.omega3: Unit.MILLI_G,
    Nutrient.omega6: Unit.MILLI_G,
    Nutrient.transFat: Unit.G,
  };

  /// Returns the tag used in [Nutriments]'s map.
  String get tag =>
      _specialNutrientTags[this] ?? toString().replaceFirst('Nutrient.', '');

  /// Returns the default unit of values.
  Unit? get defaultUnit => _defaultUnits[this];
}
