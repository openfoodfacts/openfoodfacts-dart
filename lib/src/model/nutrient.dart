import 'off_tagged.dart';
import '../utils/unit_helper.dart';

/// Nutrient
enum Nutrient implements OffTagged {
  /// Salt
  salt(typicalUnit: Unit.G, offTag: 'salt'),

  /// Sodium
  sodium(typicalUnit: Unit.G, offTag: 'sodium'),

  /// Fibers
  fiber(typicalUnit: Unit.G, offTag: 'fiber'),

  /// Sugars
  sugars(typicalUnit: Unit.G, offTag: 'sugars'),

  /// Added Sugars
  addedSugars(typicalUnit: Unit.G, offTag: 'added-sugars'),

  /// Fats
  fat(typicalUnit: Unit.G, offTag: 'fat'),

  /// Saturated Fats
  saturatedFat(typicalUnit: Unit.G, offTag: 'saturated-fat'),

  /// Proteins
  proteins(typicalUnit: Unit.G, offTag: 'proteins'),

  /// Energy in kcal
  energyKCal(typicalUnit: Unit.KCAL, offTag: 'energy-kcal'),

  /// Energy in kj
  energyKJ(typicalUnit: Unit.KJ, offTag: 'energy-kj'),

  /// Carbohydrates
  carbohydrates(typicalUnit: Unit.G, offTag: 'carbohydrates'),

  /// Caffeine
  caffeine(typicalUnit: Unit.G, offTag: 'caffeine'),

  /// Calcium
  calcium(typicalUnit: Unit.MILLI_G, offTag: 'calcium'),

  /// Iron
  iron(typicalUnit: Unit.MILLI_G, offTag: 'iron'),

  /// Vitamin C
  vitaminC(typicalUnit: Unit.MILLI_G, offTag: 'vitamin-c'),

  /// Magnesium
  magnesium(typicalUnit: Unit.MILLI_G, offTag: 'magnesium'),

  /// Phosphorus
  phosphorus(typicalUnit: Unit.MILLI_G, offTag: 'phosphorus'),

  /// Potassium
  potassium(typicalUnit: Unit.MILLI_G, offTag: 'potassium'),

  /// Zinc
  zinc(typicalUnit: Unit.MILLI_G, offTag: 'zinc'),

  /// Copper
  copper(typicalUnit: Unit.MILLI_G, offTag: 'copper'),

  /// Selenium
  selenium(typicalUnit: Unit.MICRO_G, offTag: 'selenium'),

  /// Vitamin A
  vitaminA(typicalUnit: Unit.MICRO_G, offTag: 'vitamin-a'),

  /// Vitamin E
  vitaminE(typicalUnit: Unit.MILLI_G, offTag: 'vitamin-e'),

  /// Vitamin D
  vitaminD(typicalUnit: Unit.MICRO_G, offTag: 'vitamin-d'),

  /// Vitamin B1
  vitaminB1(typicalUnit: Unit.MILLI_G, offTag: 'vitamin-b1'),

  /// Vitamin B2
  vitaminB2(typicalUnit: Unit.MILLI_G, offTag: 'vitamin-b2'),

  /// Vitamin PP
  vitaminPP(typicalUnit: Unit.MILLI_G, offTag: 'vitamin-pp'),

  /// Vitamin B6
  vitaminB6(typicalUnit: Unit.MILLI_G, offTag: 'vitamin-b6'),

  /// Vitamin B12
  vitaminB12(typicalUnit: Unit.MICRO_G, offTag: 'vitamin-b12'),

  /// Vitamin B9
  vitaminB9(typicalUnit: Unit.MICRO_G, offTag: 'vitamin-b9'),

  /// Vitamin K
  vitaminK(typicalUnit: Unit.MICRO_G, offTag: 'vitamin-k'),

  /// Cholesterol
  cholesterol(typicalUnit: Unit.MILLI_G, offTag: 'cholesterol'),

  /// Butyric Acid
  butyricAcid(typicalUnit: Unit.G, offTag: 'butyric-acid'),

  /// Caproic Acid
  caproicAcid(typicalUnit: Unit.G, offTag: 'caproic-acid'),

  /// Caprylic Acid
  caprylicAcid(typicalUnit: Unit.G, offTag: 'caprylic-acid'),

  /// Capric Acid
  capricAcid(typicalUnit: Unit.G, offTag: 'capric-acid'),

  /// Lauric Acid
  lauricAcid(typicalUnit: Unit.G, offTag: 'lauric-acid'),

  /// Myristic Acid
  myristicAcid(typicalUnit: Unit.G, offTag: 'myristic-acid'),

  /// Palmitic Acid
  palmiticAcid(typicalUnit: Unit.G, offTag: 'palmitic-acid'),

  /// Stearic Acid
  stearicAcid(typicalUnit: Unit.G, offTag: 'stearic-acid'),

  /// Oleic Acid
  oleicAcid(typicalUnit: Unit.G, offTag: 'oleic-acid'),

  /// Linoleic Acid
  linoleicAcid(typicalUnit: Unit.G, offTag: 'linoleic-acid'),

  /// Docosahexaenoic Acid
  docosahexaenoicAcid(typicalUnit: Unit.G, offTag: 'docosahexaenoic-acid'),

  /// Eicosapentaenoic Acid
  eicosapentaenoicAcid(typicalUnit: Unit.G, offTag: 'eicosapentaenoic-acid'),

  /// Erucic Acid
  erucicAcid(typicalUnit: Unit.G, offTag: 'erucic-acid'),

  /// Monounsaturated Fats
  monounsaturatedFat(typicalUnit: Unit.G, offTag: 'monounsaturated-fat'),

  /// Polyunsaturated Fats
  polyunsaturatedFat(typicalUnit: Unit.G, offTag: 'polyunsaturated-fat'),

  /// Alcohol
  alcohol(typicalUnit: Unit.PERCENT, offTag: 'alcohol'),

  /// Pantothenic Acid
  pantothenicAcid(typicalUnit: Unit.MILLI_G, offTag: 'pantothenic-acid'),

  /// Biotin
  biotin(typicalUnit: Unit.MICRO_G, offTag: 'biotin'),

  /// Chloride
  chloride(typicalUnit: Unit.MILLI_G, offTag: 'chloride'),

  /// Chromium
  chromium(typicalUnit: Unit.MICRO_G, offTag: 'chromium'),

  /// Fluoride
  fluoride(typicalUnit: Unit.MILLI_G, offTag: 'fluoride'),

  /// Iodine
  iodine(typicalUnit: Unit.MICRO_G, offTag: 'iodine'),

  /// Manganese
  manganese(typicalUnit: Unit.MILLI_G, offTag: 'manganese'),

  /// Molybdenum
  molybdenum(typicalUnit: Unit.MICRO_G, offTag: 'molybdenum'),

  /// Omega 3
  omega3(typicalUnit: Unit.MILLI_G, offTag: 'omega-3-fat'),

  /// Omega 6
  omega6(typicalUnit: Unit.MILLI_G, offTag: 'omega-6-fat'),

  /// Omega 9
  omega9(typicalUnit: Unit.MILLI_G, offTag: 'omega-9-fat'),

  /// ß-Carotene
  betaCarotene(typicalUnit: Unit.G, offTag: 'beta-carotene'),

  /// Bicarbonate
  bicarbonate(typicalUnit: Unit.MILLI_G, offTag: 'bicarbonate'),

  /// Sugar Alcohol (polyol)
  sugarAlcohol(typicalUnit: Unit.G, offTag: 'polyols'),

  /// Alpha Linolenic Acid
  alphaLinolenicAcid(typicalUnit: Unit.G, offTag: 'alpha-linolenic-acid'),

  /// Arachidic Acid
  arachidicAcid(typicalUnit: Unit.G, offTag: 'arachidic-acid'),

  /// Arachidonic Acid
  arachidonicAcid(typicalUnit: Unit.G, offTag: 'arachidonic-acid'),

  /// Behenic Acid
  behenicAcid(typicalUnit: Unit.G, offTag: 'behenic-acid'),

  /// Cerotic Acid
  ceroticAcid(typicalUnit: Unit.G, offTag: 'cerotic-acid'),

  /// Dihomo-Gamma-Linolenic Acid
  dihomoGammaLinolenicAcid(
      typicalUnit: Unit.G, offTag: 'dihomo-gamma-linolenic-acid'),

  /// Elaidic Acid
  elaidicAcid(typicalUnit: Unit.G, offTag: 'elaidic-acid'),

  /// Gamma-Linolenic Acid
  gammaLinolenicAcid(typicalUnit: Unit.G, offTag: 'gamma-linolenic-acid'),

  /// Gondoic Acid (11-Eicosenoic acid)
  gondoicAcid(typicalUnit: Unit.G, offTag: 'gondoic-acid'),

  /// Lignoceric Acid
  lignocericAcid(typicalUnit: Unit.G, offTag: 'lignoceric-acid'),

  /// Mead Acid
  meadAcid(typicalUnit: Unit.G, offTag: 'mead-acid'),

  /// Melissic Acid
  melissicAcid(typicalUnit: Unit.G, offTag: 'melissic-acid'),

  /// Montanic Acid
  montanicAcid(typicalUnit: Unit.G, offTag: 'montanic-acid'),

  /// Nervonic Acid
  nervonicAcid(typicalUnit: Unit.G, offTag: 'nervonic-acid'),

  /// Trans Fats
  transFat(typicalUnit: Unit.G, offTag: 'trans-fat');

  const Nutrient({
    required this.typicalUnit,
    required this.offTag,
  });

  /// Typical unit. An educated guess only: may differ according to countries.
  final Unit typicalUnit;

  @override
  final String offTag;

  /// Returns the first [Nutrient] that matches the [offTag].
  ///
  /// Special case for [offTag] 'energy', which can be found in
  /// [OrderedNutrient], and is a duplicate of 'energy-kj'.
  static Nutrient? fromOffTag(final String? offTag) => offTag == 'energy'
      ? Nutrient.energyKJ
      : OffTagged.fromOffTag(offTag, Nutrient.values) as Nutrient?;
}
