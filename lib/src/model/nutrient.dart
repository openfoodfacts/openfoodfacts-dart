import 'per_size.dart';
import 'off_tagged.dart';
import '../utils/unit_helper.dart';

/// Nutrient
enum Nutrient implements OffTagged {
  /// Salt
  salt(typicalUnit: Unit.G, offTag: 'salt', acceptsPercentDV: false),

  /// Sodium
  sodium(typicalUnit: Unit.G, offTag: 'sodium', acceptsPercentDV: false),

  /// Fibers
  fiber(typicalUnit: Unit.G, offTag: 'fiber', acceptsPercentDV: false),

  /// Sugars
  sugars(typicalUnit: Unit.G, offTag: 'sugars', acceptsPercentDV: false),

  /// Added Sugars
  addedSugars(typicalUnit: Unit.G, offTag: 'added-sugars'),

  /// Fats
  fat(typicalUnit: Unit.G, offTag: 'fat', acceptsPercentDV: false),

  /// Saturated Fats
  saturatedFat(
    typicalUnit: Unit.G,
    offTag: 'saturated-fat',
    acceptsPercentDV: false,
  ),

  /// Proteins
  proteins(typicalUnit: Unit.G, offTag: 'proteins', acceptsPercentDV: false),

  /// Energy in kcal
  energyKCal(typicalUnit: Unit.KCAL, offTag: 'energy-kcal'),

  /// Energy in kj
  energyKJ(typicalUnit: Unit.KJ, offTag: 'energy-kj'),

  /// Carbohydrates
  carbohydrates(
    typicalUnit: Unit.G,
    offTag: 'carbohydrates',
    acceptsPercentDV: false,
  ),

  /// Caffeine
  caffeine(typicalUnit: Unit.G, offTag: 'caffeine'),

  /// Calcium
  calcium(typicalUnit: Unit.MILLI_G, offTag: 'calcium'),

  /// Iron
  iron(typicalUnit: Unit.MILLI_G, offTag: 'iron'),

  /// Vitamin C
  vitaminC(typicalUnit: Unit.MILLI_G, offTag: 'vitamin-c', acceptsIU: true),

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
  vitaminA(typicalUnit: Unit.MICRO_G, offTag: 'vitamin-a', acceptsIU: true),

  /// Vitamin E
  vitaminE(typicalUnit: Unit.MILLI_G, offTag: 'vitamin-e', acceptsIU: true),

  /// Vitamin D
  vitaminD(typicalUnit: Unit.MICRO_G, offTag: 'vitamin-d', acceptsIU: true),

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
    typicalUnit: Unit.G,
    offTag: 'dihomo-gamma-linolenic-acid',
  ),

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

  /// Energy from fat
  energyFromFat(typicalUnit: Unit.KJ, offTag: 'energy-from-fat'),

  /// Unsaturated fat
  unsaturatedFat(typicalUnit: Unit.G, offTag: 'unsaturated-fat'),

  /// Sucrose
  sucrose(typicalUnit: Unit.G, offTag: 'sucrose'),

  /// Glucose
  glucose(typicalUnit: Unit.G, offTag: 'glucose'),

  /// Fructose
  fructose(typicalUnit: Unit.G, offTag: 'fructose'),

  /// Galactose
  galactose(typicalUnit: Unit.G, offTag: 'galactose'),

  /// Lactose
  lactose(typicalUnit: Unit.G, offTag: 'lactose'),

  /// Maltose
  maltose(typicalUnit: Unit.G, offTag: 'maltose'),

  /// Maltodextrins
  maltodextrins(typicalUnit: Unit.G, offTag: 'maltodextrins'),

  /// Psicose
  psicose(typicalUnit: Unit.G, offTag: 'psicose'),

  /// Starch
  starch(typicalUnit: Unit.G, offTag: 'starch'),

  /// Erythritol
  erythritol(typicalUnit: Unit.G, offTag: 'erythritol'),

  /// Isomalt
  isomalt(typicalUnit: Unit.G, offTag: 'isomalt'),

  /// Maltitol
  maltitol(typicalUnit: Unit.G, offTag: 'maltitol'),

  /// Sorbitol
  sorbitol(typicalUnit: Unit.G, offTag: 'sorbitol'),

  /// Soluble Fiber
  solubleFiber(typicalUnit: Unit.G, offTag: 'soluble-fiber'),

  /// Insoluble Fiber
  insolubleFiber(typicalUnit: Unit.G, offTag: 'insoluble-fiber'),

  /// Casein
  casein(typicalUnit: Unit.G, offTag: 'casein'),

  /// Serum Proteins
  serumProteins(typicalUnit: Unit.G, offTag: 'serum-proteins'),

  /// Nucleotides
  nucleotides(typicalUnit: Unit.G, offTag: 'nucleotides'),

  /// Added Salt
  addedSalt(typicalUnit: Unit.G, offTag: 'added-salt'),

  /// Folates
  folates(typicalUnit: Unit.G, offTag: 'folates'),

  /// Silica
  silica(typicalUnit: Unit.MILLI_G, offTag: 'silica'),

  /// Taurine
  taurine(typicalUnit: Unit.G, offTag: 'taurine'),

  /// Methylsulfonylmethane
  methylsulfonylmethane(
    typicalUnit: Unit.MILLI_G,
    offTag: 'methylsulfonylmethane',
  ),

  /// pH
  ph(typicalUnit: Unit.UNKNOWN, offTag: 'ph'),

  /// Fruits Vegetables Nuts
  fruitsVegetablesNuts(
    typicalUnit: Unit.PERCENT,
    offTag: 'fruits-vegetables-nuts',
  ),

  /// Fruits Vegetables Nuts Dried
  fruitsVegetablesNutsDried(
    typicalUnit: Unit.PERCENT,
    offTag: 'fruits-vegetables-nuts-dried',
  ),

  /// Fruits Vegetables Nuts Estimate
  fruitsVegetablesNutsEstimate(
    typicalUnit: Unit.PERCENT,
    offTag: 'fruits-vegetables-nuts-estimate',
  ),

  /// Collagen Meat Protein Ratio
  collagenMeatProteinRatio(
    typicalUnit: Unit.PERCENT,
    offTag: 'collagen-meat-protein-ratio',
  ),

  /// Cocoa
  cocoa(typicalUnit: Unit.PERCENT, offTag: 'cocoa'),

  /// chlorophyl
  chlorophyl(typicalUnit: Unit.G, offTag: 'chlorophyl'),

  /// Carbon footprint
  carbonFootprint(typicalUnit: Unit.G, offTag: 'carbon-footprint'),

  /// Carbon footprint from meat or fish
  carbonFootprintFromMeatOrFish(
    typicalUnit: Unit.G,
    offTag: 'carbon-footprint-from-meat-or-fish',
  ),

  /// Nutrition Score FR
  nutritionScoreFR(typicalUnit: Unit.UNKNOWN, offTag: 'nutrition-score-fr'),

  /// Nutrition Score UK
  nutritionScoreUK(typicalUnit: Unit.UNKNOWN, offTag: 'nutrition-score-uk'),

  /// Glycemic index
  glycemicIndex(typicalUnit: Unit.UNKNOWN, offTag: 'glycemic-index'),

  /// Water hardness
  waterHardness(typicalUnit: Unit.UNKNOWN, offTag: 'water-hardness'),

  /// Choline
  choline(typicalUnit: Unit.G, offTag: 'choline'),

  /// Phylloquinone
  phylloquinone(typicalUnit: Unit.G, offTag: 'phylloquinone'),

  /// Beta-glucan
  betaGlucan(typicalUnit: Unit.G, offTag: 'beta-glucan'),

  /// Inositol
  inositol(typicalUnit: Unit.G, offTag: 'inositol'),

  /// Carnitine
  carnitine(typicalUnit: Unit.G, offTag: 'carnitine'),

  /// Sulphate
  sulphate(typicalUnit: Unit.MILLI_G, offTag: 'sulphate'),

  /// Nitrate
  nitrate(typicalUnit: Unit.MILLI_G, offTag: 'nitrate'),

  /// Acidity
  acidity(typicalUnit: Unit.UNKNOWN, offTag: 'acidity'),

  /// Carbohydrates total
  carbohydratesTotal(typicalUnit: Unit.G, offTag: 'carbohydrates-total'),

  /// Total Carboydrates
  totalCarboydrates(typicalUnit: Unit.G, offTag: 'total-carboydrates'),

  /// Sulfate
  sulfate(typicalUnit: Unit.G, offTag: 'sulfate'),

  /// Melatonin
  melatonin(typicalUnit: Unit.MICRO_G, offTag: 'melatonin'),

  /// Trans Fats
  transFat(typicalUnit: Unit.G, offTag: 'trans-fat'),

  /// Crude Fat
  crudeFat(
    typicalUnit: Unit.PERCENT,
    offTag: 'crude-fat',
    probablyPetFood: true,
  ),

  /// Crude Protein
  crudeProtein(
    typicalUnit: Unit.PERCENT,
    offTag: 'crude-protein',
    probablyPetFood: true,
  ),

  /// Crude Ash
  crudeAsh(
    typicalUnit: Unit.PERCENT,
    offTag: 'crude-ash',
    probablyPetFood: true,
  ),

  /// Crude Ash
  crudeFiber(
    typicalUnit: Unit.PERCENT,
    offTag: 'crude-fibre',
    probablyPetFood: true,
  ),

  /// Moisture
  moisture(
    typicalUnit: Unit.PERCENT,
    offTag: 'moisture',
    probablyPetFood: true,
  ),

  /// Ammonium Chloride
  ammoniumChloride(
    typicalUnit: Unit.MILLI_G,
    offTag: 'ammonium-chloride',
    probablyPetFood: true,
  ),

  /// Calcium Iodate Anhydrous
  calciumIodateAnhydrous(
    typicalUnit: Unit.MILLI_G,
    offTag: 'calcium-iodate-anhydrous',
    probablyPetFood: true,
  ),

  /// Cassia Gum
  cassiaGum(
    typicalUnit: Unit.MILLI_G,
    offTag: 'cassia-gum',
    probablyPetFood: true,
  ),

  /// Choline Chloride
  cholineChloride(
    typicalUnit: Unit.MILLI_G,
    offTag: 'choline-chloride',
    probablyPetFood: true,
  ),

  /// Copper II Sulphate Pentahydrate
  copperIISulphatePentahydrate(
    typicalUnit: Unit.MILLI_G,
    offTag: 'copper-ii-sulphate-pentahydrate',
    probablyPetFood: true,
  ),

  /// Iron II Sulphate Monohydrate
  ironIISulphateMonohydrate(
    typicalUnit: Unit.MILLI_G,
    offTag: 'iron-ii-sulphate-monohydrate',
    probablyPetFood: true,
  ),

  /// Manganous Sulphate Monohydrate
  manganousSulphateMonohydrate(
    typicalUnit: Unit.MILLI_G,
    offTag: 'manganous-sulphate-monohydrate',
    probablyPetFood: true,
  ),

  /// Potassium Iodide
  potassiumIodide(
    typicalUnit: Unit.MILLI_G,
    offTag: 'potassium-iodide',
    probablyPetFood: true,
  ),

  /// Sodium Selenite
  sodiumSelenite(
    typicalUnit: Unit.MILLI_G,
    offTag: 'sodium-selenite',
    probablyPetFood: true,
  ),

  /// Zinc Sulphate Monohydrate
  zincSulphateMonohydrate(
    typicalUnit: Unit.MILLI_G,
    offTag: 'zinc-sulphate-monohydrate',
    probablyPetFood: true,
  ),

  /// Protein Value
  proteinValue(
    typicalUnit: Unit.G_PER_KG,
    offTag: 'protein-value',
    probablyPetFood: true,
  ),

  /// Polydextrose
  polydextrose(typicalUnit: Unit.G, offTag: 'polydextrose');

  const Nutrient({
    required this.typicalUnit,
    required this.offTag,
    bool acceptsPercentDV = true,
    this.acceptsIU = false,
    this.probablyPetFood = false,
  }) : _acceptsPercentDV = acceptsPercentDV;

  /// Typical unit. An educated guess only: may differ according to countries.
  final Unit typicalUnit;

  static const List<Unit> _weightUnits = [Unit.G, Unit.MILLI_G, Unit.MICRO_G];

  /// Can this nutrient typically be valued in weight? (g, mg, mcg)
  bool get acceptsWeight => _weightUnits.contains(typicalUnit);

  /// Can this nutrient typically be valued in "% DV"?
  final bool _acceptsPercentDV;

  bool get acceptsPercentDV => acceptsWeight && _acceptsPercentDV;

  /// Can this nutrient typically be valued in "IU"?
  final bool acceptsIU;

  /// Is that nutrient likely to be specific to pet food.
  final bool probablyPetFood;

  @override
  final String offTag;

  /// Returns the first [Nutrient] that matches the [offTag].
  ///
  /// Special case for [offTag] 'energy', which can be found in
  /// [OrderedNutrient], and is a duplicate of 'energy-kj'.
  static Nutrient? fromOffTag(final String? offTag) => offTag == 'energy'
      ? Nutrient.energyKJ
      : OffTagged.fromOffTag(offTag, Nutrient.values) as Nutrient?;

  String getOffTagPerSize(PerSize perSize) => '${offTag}_${perSize.offTag}';
}
