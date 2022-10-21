import 'package:openfoodfacts/model/Nutrient.dart';
import 'package:openfoodfacts/model/PerSize.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/UnitHelper.dart';

import '../interface/JsonObject.dart';

// TODO: most of the code is deprecated from 2022-10-04 (#566); remove when old enough

/// Values in nutrients.
class Nutriments extends JsonObject {
  /// Empty nutrient map.
  Nutriments.empty();

  /// Nutrient map with start values from [map].
  Nutriments._fromMap(final Map<String, dynamic> map) {
    for (final Nutrient nutrient in Nutrient.values) {
      for (final PerSize perSize in PerSize.values) {
        final String tag = _getTag(nutrient, perSize);
        try {
          final double? value = JsonObject.parseDouble(map[tag]);
          if (value != null) {
            _map[tag] = value;
          } else if (map.containsKey(tag)) {
            // typical case when null means something: to erase a value
            _map[tag] = null;
          }
        } catch (e) {
          throw Exception(
            'Could not parse the value for $nutrient and $perSize: ${map[tag]}',
          );
        }
      }
    }
  }

  /// Nutrient values.
  ///
  /// It is useful to store null values: this way we can make the difference
  /// between totally unknown values and values that have been erased.
  final Map<String, double?> _map = <String, double?>{};

  String _getTag(
    final Nutrient nutrient,
    final PerSize perSize,
  ) =>
      '${nutrient.offTag}_${perSize.offTag}';

  /// Returns the value in grams of that [nutrient] for that [perSize].
  ///
  /// It won't be grams for very specific nutrients, like [Nutrient.alcohol].
  double? getValue(final Nutrient nutrient, final PerSize perSize) =>
      _map[_getTag(nutrient, perSize)];

  /// Sets the value in grams of that [nutrient] for that [perSize].
  ///
  /// It won't be grams for very specific nutrients, like [Nutrient.alcohol].
  Nutriments setValue(
    final Nutrient nutrient,
    final PerSize perSize,
    final double? value,
  ) {
    _map[_getTag(nutrient, perSize)] = value;
    return this;
  }

  /// Returns the default [Unit] of that [nutrient].
  @Deprecated('Use nutrient.typicalUnit instead')
  Unit? getUnit(final Nutrient nutrient) => nutrient.typicalUnit;

  double? getComputedKJ(final PerSize perSize) {
    double? result;
    result = getValue(Nutrient.energyKJ, perSize);
    if (result != null) {
      return result;
    }
    result = getValue(Nutrient.energyKCal, perSize);
    if (result != null) {
      return NutrimentsHelper.fromKCalToKJ(result);
    }
    return null;
  }

  /// Salt, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get salt => getValue(Nutrient.salt, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set salt(final double? value) =>
      setValue(Nutrient.salt, PerSize.oneHundredGrams, value);

  /// Fibers, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get fiber => getValue(Nutrient.fiber, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set fiber(final double? value) =>
      setValue(Nutrient.fiber, PerSize.oneHundredGrams, value);

  /// Sugars, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get sugars => getValue(Nutrient.sugars, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set sugars(final double? value) =>
      setValue(Nutrient.sugars, PerSize.oneHundredGrams, value);

  /// Fats, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get fat => getValue(Nutrient.fat, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set fat(final double? value) =>
      setValue(Nutrient.fat, PerSize.oneHundredGrams, value);

  /// Saturated Fats, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get saturatedFat =>
      getValue(Nutrient.saturatedFat, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set saturatedFat(final double? value) =>
      setValue(Nutrient.saturatedFat, PerSize.oneHundredGrams, value);

  /// Proteins, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get proteins => getValue(Nutrient.proteins, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set proteins(final double? value) =>
      setValue(Nutrient.proteins, PerSize.oneHundredGrams, value);

  /// Nova Group
  @Deprecated('Use Product.novaGroup instead')
  int? get novaGroup =>
      JsonObject.parseInt(_map['nova-group_${PerSize.oneHundredGrams.offTag}']);
  @Deprecated('Useless, nova is read-only here')
  set novaGroup(final int? value) {}

  /// Energy, in kJ, per 100 grams of product as sold
  @Deprecated('Use getComputedKJ instead')
  double? get energy => getComputedKJ(PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set energy(final double? value) =>
      setValue(Nutrient.energyKJ, PerSize.oneHundredGrams, value);

  /// Energy, in kcal, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get energyKcal =>
      getValue(Nutrient.energyKCal, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set energyKcal(final double? value) =>
      setValue(Nutrient.energyKCal, PerSize.oneHundredGrams, value);

  /// Energy, in kcal, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get energyKcalServing =>
      getValue(Nutrient.energyKCal, PerSize.serving);
  @Deprecated('Use setValue instead')
  set energyKcalServing(final double? value) =>
      setValue(Nutrient.energyKCal, PerSize.serving, value);

  /// Energy, in kj, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get energyKj => getValue(Nutrient.energyKJ, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set energyKj(final double? value) =>
      setValue(Nutrient.energyKJ, PerSize.oneHundredGrams, value);

  /// Energy, in kj, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get energyKjServing => getValue(Nutrient.energyKJ, PerSize.serving);
  @Deprecated('Use setValue instead')
  set energyKjServing(final double? value) =>
      setValue(Nutrient.energyKJ, PerSize.serving, value);

  /// Energy, in kj, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get energyKj100g => energyKj;
  @Deprecated('Use setValue instead')
  set energyKJ(final double? value) =>
      setValue(Nutrient.energyKJ, PerSize.oneHundredGrams, value);

  /// Energy, in kcal, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get energyKcal100g => energyKcal;
  @Deprecated('Use setValue instead')
  set energyKcal100g(final double? value) =>
      setValue(Nutrient.energyKCal, PerSize.oneHundredGrams, value);

  /// Carbohydrates, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get carbohydrates =>
      getValue(Nutrient.carbohydrates, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set carbohydrates(final double? value) =>
      setValue(Nutrient.carbohydrates, PerSize.oneHundredGrams, value);

  /// Salt, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get saltServing => getValue(Nutrient.salt, PerSize.serving);
  @Deprecated('Use setValue instead')
  set saltServing(final double? value) =>
      setValue(Nutrient.salt, PerSize.serving, value);

  /// Fibers, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get fiberServing => getValue(Nutrient.fiber, PerSize.serving);
  @Deprecated('Use setValue instead')
  set fiberServing(final double? value) =>
      setValue(Nutrient.fiber, PerSize.serving, value);

  /// Sugars, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get sugarsServing => getValue(Nutrient.sugars, PerSize.serving);
  @Deprecated('Use setValue instead')
  set sugarsServing(final double? value) =>
      setValue(Nutrient.sugars, PerSize.serving, value);

  /// Fats, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get fatServing => getValue(Nutrient.fat, PerSize.serving);
  @Deprecated('Use setValue instead')
  set fatServing(final double? value) =>
      setValue(Nutrient.fat, PerSize.serving, value);

  /// Typical Unit for Fat
  @Deprecated('Use getUnit instead')
  Unit? get fatUnit => getUnit(Nutrient.fat);
  @Deprecated('Forget that confusing feature')
  set fatUnit(final Unit? unit) {}

  /// Saturated Fats, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get saturatedFatServing =>
      getValue(Nutrient.saturatedFat, PerSize.serving);
  @Deprecated('Use setValue instead')
  set saturatedFatServing(final double? value) =>
      setValue(Nutrient.saturatedFat, PerSize.serving, value);

  /// Proteins, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get proteinsServing => getValue(Nutrient.proteins, PerSize.serving);
  @Deprecated('Use setValue instead')
  set proteinsServing(final double? value) =>
      setValue(Nutrient.proteins, PerSize.serving, value);

  /// Typical Unit for Proteins (probably [Unit.G])
  @Deprecated('Use getUnit instead')
  Unit? get proteinsUnit => getUnit(Nutrient.proteins);
  @Deprecated('Forget that confusing feature')
  set proteinsUnit(final Unit? unit) {}

  /// Nova Group per serving (?)
  @Deprecated('Use Product.novaGroup instead')
  int? get novaGroupServing => novaGroup;
  @Deprecated('Useless, nova is read-only here')
  set novaGroupServing(final int? value) {}

  /// Energy, in kJ, per serving of product as sold
  @Deprecated('Use getComputedKJ instead')
  double? get energyServing => getComputedKJ(PerSize.serving);
  @Deprecated('Use setValue instead')
  set energyServing(final double? value) =>
      setValue(Nutrient.energyKJ, PerSize.serving, value);

  /// Carbohydrates, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get carbohydratesServing =>
      getValue(Nutrient.carbohydrates, PerSize.serving);
  @Deprecated('Use setValue instead')
  set carbohydratesServing(final double? value) =>
      setValue(Nutrient.carbohydrates, PerSize.serving, value);

  /// Typical Unit for Carbohydrates
  @Deprecated('Use getUnit instead')
  Unit? get carbohydratesUnit => getUnit(Nutrient.carbohydrates);
  @Deprecated('Forget that confusing feature')
  set carbohydratesUnit(final Unit? unit) {}

  /// Typical Unit for Energy (probably [Unit.KJ])
  @Deprecated('Use getUnit instead')
  Unit get energyUnit => Unit.KJ;
  @Deprecated('Forget that confusing feature')
  set energyUnit(final Unit? unit) {}

  /// Typical Unit for Energy kcal (probably [Unit.KCAL])
  @Deprecated('Use getUnit instead')
  Unit? get energyKcalUnit => getUnit(Nutrient.energyKCal);
  @Deprecated('Forget that confusing feature')
  set energyKcalUnit(final Unit? unit) {}

  /// Caffeine, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get caffeineServing => getValue(Nutrient.caffeine, PerSize.serving);
  @Deprecated('Use setValue instead')
  set caffeineServing(final double? value) =>
      setValue(Nutrient.caffeine, PerSize.serving, value);

  /// Caffeine, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get caffeine => getValue(Nutrient.caffeine, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set caffeine(final double? value) =>
      setValue(Nutrient.caffeine, PerSize.oneHundredGrams, value);

  /// Typical Unit for Caffeine
  @Deprecated('Use getUnit instead')
  Unit? get caffeineUnit => getUnit(Nutrient.caffeine);
  @Deprecated('Forget that confusing feature')
  set caffeineUnit(final Unit? unit) {}

  /// Calcium, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get calciumServing => getValue(Nutrient.calcium, PerSize.serving);
  @Deprecated('Use setValue instead')
  set calciumServing(final double? value) =>
      setValue(Nutrient.calcium, PerSize.serving, value);

  /// Calcium, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get calcium => getValue(Nutrient.calcium, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set calcium(final double? value) =>
      setValue(Nutrient.calcium, PerSize.oneHundredGrams, value);

  /// Typical Unit for Calcium
  @Deprecated('Use getUnit instead')
  Unit? get calciumUnit => getUnit(Nutrient.calcium);
  @Deprecated('Forget that confusing feature')
  set calciumUnit(final Unit? unit) {}

  /// Iron, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get ironServing => getValue(Nutrient.iron, PerSize.serving);
  @Deprecated('Use setValue instead')
  set ironServing(final double? value) =>
      setValue(Nutrient.iron, PerSize.serving, value);

  /// Iron, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get iron => getValue(Nutrient.iron, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set iron(final double? value) =>
      setValue(Nutrient.iron, PerSize.oneHundredGrams, value);

  /// Typical Unit for Iron
  @Deprecated('Use getUnit instead')
  Unit? get ironUnit => getUnit(Nutrient.iron);
  @Deprecated('Forget that confusing feature')
  set ironUnit(final Unit? unit) {}

  /// Vitamin C, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get vitaminCServing => getValue(Nutrient.vitaminC, PerSize.serving);
  @Deprecated('Use setValue instead')
  set vitaminCServing(final double? value) =>
      setValue(Nutrient.vitaminC, PerSize.serving, value);

  /// Vitamin C, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get vitaminC => getValue(Nutrient.vitaminC, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set vitaminC(final double? value) =>
      setValue(Nutrient.vitaminC, PerSize.oneHundredGrams, value);

  /// Typical Unit for Vitamin C
  @Deprecated('Use getUnit instead')
  Unit? get vitaminCUnit => getUnit(Nutrient.vitaminC);
  @Deprecated('Forget that confusing feature')
  set vitaminCUnit(final Unit? unit) {}

  /// Magnesium, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get magnesiumServing => getValue(Nutrient.magnesium, PerSize.serving);
  @Deprecated('Use setValue instead')
  set magnesiumServing(final double? value) =>
      setValue(Nutrient.magnesium, PerSize.serving, value);

  /// Magnesium, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get magnesium =>
      getValue(Nutrient.magnesium, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set magnesium(final double? value) =>
      setValue(Nutrient.magnesium, PerSize.oneHundredGrams, value);

  /// Typical Unit for Magnesium
  @Deprecated('Use getUnit instead')
  Unit? get magnesiumUnit => getUnit(Nutrient.magnesium);
  @Deprecated('Forget that confusing feature')
  set magnesiumUnit(final Unit? unit) {}

  /// Phosphorus, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get phosphorusServing =>
      getValue(Nutrient.phosphorus, PerSize.serving);
  @Deprecated('Use setValue instead')
  set phosphorusServing(final double? value) =>
      setValue(Nutrient.phosphorus, PerSize.serving, value);

  /// Phosphorus, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get phosphorus =>
      getValue(Nutrient.phosphorus, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set phosphorus(final double? value) =>
      setValue(Nutrient.phosphorus, PerSize.oneHundredGrams, value);

  /// Typical Unit for Phosphorus
  @Deprecated('Use getUnit instead')
  Unit? get phosphorusUnit => getUnit(Nutrient.phosphorus);
  @Deprecated('Forget that confusing feature')
  set phosphorusUnit(final Unit? unit) {}

  /// Potassium, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get potassiumServing => getValue(Nutrient.potassium, PerSize.serving);
  @Deprecated('Use setValue instead')
  set potassiumServing(final double? value) =>
      setValue(Nutrient.potassium, PerSize.serving, value);

  /// Potassium, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get potassium =>
      getValue(Nutrient.potassium, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set potassium(final double? value) =>
      setValue(Nutrient.potassium, PerSize.oneHundredGrams, value);

  /// Typical Unit for Potassium
  @Deprecated('Use getUnit instead')
  Unit? get potassiumUnit => getUnit(Nutrient.potassium);
  @Deprecated('Forget that confusing feature')
  set potassiumUnit(final Unit? unit) {}

  /// Sodium, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get sodiumServing => getValue(Nutrient.sodium, PerSize.serving);
  @Deprecated('Use setValue instead')
  set sodiumServing(final double? value) =>
      setValue(Nutrient.sodium, PerSize.serving, value);

  /// Sodium, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get sodium => getValue(Nutrient.sodium, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set sodium(final double? value) =>
      setValue(Nutrient.sodium, PerSize.oneHundredGrams, value);

  /// Typical Unit for Sodium
  @Deprecated('Use getUnit instead')
  Unit? get sodiumUnit => getUnit(Nutrient.sodium);
  @Deprecated('Forget that confusing feature')
  set sodiumUnit(final Unit? unit) {}

  /// Zinc, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get zincServing => getValue(Nutrient.zinc, PerSize.serving);
  @Deprecated('Use setValue instead')
  set zincServing(final double? value) =>
      setValue(Nutrient.zinc, PerSize.serving, value);

  /// Zinc, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get zinc => getValue(Nutrient.zinc, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set zinc(final double? value) =>
      setValue(Nutrient.zinc, PerSize.oneHundredGrams, value);

  /// Typical Unit for Zinc
  @Deprecated('Use getUnit instead')
  Unit? get zincUnit => getUnit(Nutrient.zinc);
  @Deprecated('Forget that confusing feature')
  set zincUnit(final Unit? unit) {}

  /// Copper, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get copperServing => getValue(Nutrient.copper, PerSize.serving);
  @Deprecated('Use setValue instead')
  set copperServing(final double? value) =>
      setValue(Nutrient.copper, PerSize.serving, value);

  /// Copper, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get copper => getValue(Nutrient.copper, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set copper(final double? value) =>
      setValue(Nutrient.copper, PerSize.oneHundredGrams, value);

  /// Typical Unit for Copper
  @Deprecated('Use getUnit instead')
  Unit? get copperUnit => getUnit(Nutrient.copper);
  @Deprecated('Forget that confusing feature')
  set copperUnit(final Unit? unit) {}

  /// Selenium, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get seleniumServing => getValue(Nutrient.selenium, PerSize.serving);
  @Deprecated('Use setValue instead')
  set seleniumServing(final double? value) =>
      setValue(Nutrient.selenium, PerSize.serving, value);

  /// Selenium, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get selenium => getValue(Nutrient.selenium, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set selenium(final double? value) =>
      setValue(Nutrient.selenium, PerSize.oneHundredGrams, value);

  /// Typical Unit for Selenium
  @Deprecated('Use getUnit instead')
  Unit? get seleniumUnit => getUnit(Nutrient.selenium);
  @Deprecated('Forget that confusing feature')
  set seleniumUnit(final Unit? unit) {}

  /// Vitamin A, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get vitaminAServing => getValue(Nutrient.vitaminA, PerSize.serving);
  @Deprecated('Use setValue instead')
  set vitaminAServing(final double? value) =>
      setValue(Nutrient.vitaminA, PerSize.serving, value);

  /// Vitamin A, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get vitaminA => getValue(Nutrient.vitaminA, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set vitaminA(final double? value) =>
      setValue(Nutrient.vitaminA, PerSize.oneHundredGrams, value);

  /// Typical Unit for Vitamin A
  @Deprecated('Use getUnit instead')
  Unit? get vitaminAUnit => getUnit(Nutrient.vitaminA);
  @Deprecated('Forget that confusing feature')
  set vitaminAUnit(final Unit? unit) {}

  /// Vitamin E, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get vitaminEServing => getValue(Nutrient.vitaminE, PerSize.serving);
  @Deprecated('Use getValue instead')
  set vitaminEServing(final double? value) =>
      setValue(Nutrient.vitaminE, PerSize.serving, value);

  /// Vitamin E, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get vitaminE => getValue(Nutrient.vitaminE, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set vitaminE(final double? value) =>
      setValue(Nutrient.vitaminE, PerSize.oneHundredGrams, value);

  /// Typical Unit for Vitamin E
  @Deprecated('Use getUnit instead')
  Unit? get vitaminEUnit => getUnit(Nutrient.vitaminE);
  @Deprecated('Forget that confusing feature')
  set vitaminEUnit(final Unit? unit) {}

  /// Vitamin D, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get vitaminDServing => getValue(Nutrient.vitaminD, PerSize.serving);
  @Deprecated('Use setValue instead')
  set vitaminDServing(final double? value) =>
      setValue(Nutrient.vitaminD, PerSize.serving, value);

  /// Vitamin D, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get vitaminD => getValue(Nutrient.vitaminD, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set vitaminD(final double? value) =>
      setValue(Nutrient.vitaminD, PerSize.oneHundredGrams, value);

  /// Typical Unit for Vitamin D
  @Deprecated('Use getUnit instead')
  Unit? get vitaminDUnit => getUnit(Nutrient.vitaminD);
  @Deprecated('Forget that confusing feature')
  set vitaminDUnit(final Unit? unit) {}

  /// Vitamin B1, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get vitaminB1Serving => getValue(Nutrient.vitaminB1, PerSize.serving);
  @Deprecated('Use setValue instead')
  set vitaminB1Serving(final double? value) =>
      setValue(Nutrient.vitaminB1, PerSize.serving, value);

  /// Vitamin B1, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get vitaminB1 =>
      getValue(Nutrient.vitaminB1, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set vitaminB1(final double? value) =>
      setValue(Nutrient.vitaminB1, PerSize.oneHundredGrams, value);

  /// Typical Unit for Vitamin B1
  @Deprecated('Use getUnit instead')
  Unit? get vitaminB1Unit => getUnit(Nutrient.vitaminB1);
  @Deprecated('Forget that confusing feature')
  set vitaminB1Unit(final Unit? unit) {}

  /// Vitamin B2, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get vitaminB2Serving => getValue(Nutrient.vitaminB2, PerSize.serving);
  @Deprecated('Use setValue instead')
  set vitaminB2Serving(final double? value) =>
      setValue(Nutrient.vitaminB2, PerSize.serving, value);

  /// Vitamin B2, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get vitaminB2 =>
      getValue(Nutrient.vitaminB2, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set vitaminB2(final double? value) =>
      setValue(Nutrient.vitaminB2, PerSize.oneHundredGrams, value);

  /// Typical Unit for Vitamin B2
  @Deprecated('Use getUnit instead')
  Unit? get vitaminB2Unit => getUnit(Nutrient.vitaminB2);
  @Deprecated('Forget that confusing feature')
  set vitaminB2Unit(final Unit? unit) {}

  /// Vitamin PP, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get vitaminPPServing => getValue(Nutrient.vitaminPP, PerSize.serving);
  @Deprecated('Use setValue instead')
  set vitaminPPServing(final double? value) =>
      setValue(Nutrient.vitaminPP, PerSize.serving, value);

  /// Vitamin PP, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get vitaminPP =>
      getValue(Nutrient.vitaminPP, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set vitaminPP(final double? value) =>
      setValue(Nutrient.vitaminPP, PerSize.oneHundredGrams, value);

  /// Typical Unit for Vitamin PP
  @Deprecated('Use getUnit instead')
  Unit? get vitaminPPUnit => getUnit(Nutrient.vitaminPP);
  @Deprecated('Forget that confusing feature')
  set vitaminPPUnit(final Unit? unit) {}

  /// Vitamin B6, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get vitaminB6Serving => getValue(Nutrient.vitaminB6, PerSize.serving);
  @Deprecated('Use setValue instead')
  set vitaminB6Serving(final double? value) =>
      setValue(Nutrient.vitaminB6, PerSize.serving, value);

  /// Vitamin B6, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get vitaminB6 =>
      getValue(Nutrient.vitaminB6, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set vitaminB6(final double? value) =>
      setValue(Nutrient.vitaminB6, PerSize.oneHundredGrams, value);

  /// Typical Unit for Vitamin B6
  @Deprecated('Use getUnit instead')
  Unit? get vitaminB6Unit => getUnit(Nutrient.vitaminB6);
  @Deprecated('Forget that confusing feature')
  set vitaminB6Unit(final Unit? unit) {}

  /// Vitamin B12, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get vitaminB12Serving =>
      getValue(Nutrient.vitaminB12, PerSize.serving);
  @Deprecated('Use setValue instead')
  set vitaminB12Serving(final double? value) =>
      setValue(Nutrient.vitaminB12, PerSize.serving, value);

  /// Vitamin B12, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get vitaminB12 =>
      getValue(Nutrient.vitaminB12, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set vitaminB12(final double? value) =>
      setValue(Nutrient.vitaminB12, PerSize.oneHundredGrams, value);

  /// Typical Unit for Vitamin B12
  @Deprecated('Use getUnit instead')
  Unit? get vitaminB12Unit => getUnit(Nutrient.vitaminB12);
  @Deprecated('Forget that confusing feature')
  set vitaminB12Unit(final Unit? unit) {}

  /// Vitamin B9, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get vitaminB9Serving => getValue(Nutrient.vitaminB9, PerSize.serving);
  @Deprecated('Use setValue instead')
  set vitaminB9Serving(final double? value) =>
      setValue(Nutrient.vitaminB9, PerSize.serving, value);

  /// Vitamin B1, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get vitaminB9 =>
      getValue(Nutrient.vitaminB9, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set vitaminB9(final double? value) =>
      setValue(Nutrient.vitaminB9, PerSize.oneHundredGrams, value);

  /// Typical Unit for Vitamin B9
  @Deprecated('Use getUnit instead')
  Unit? get vitaminB9Unit => getUnit(Nutrient.vitaminB9);
  @Deprecated('Forget that confusing feature')
  set vitaminB9Unit(final Unit? unit) {}

  /// Vitamin K, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get vitaminKServing => getValue(Nutrient.vitaminK, PerSize.serving);
  @Deprecated('Use setValue instead')
  set vitaminKServing(final double? value) =>
      setValue(Nutrient.vitaminK, PerSize.serving, value);

  /// Vitamin K, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get vitaminK => getValue(Nutrient.vitaminK, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set vitaminK(final double? value) =>
      setValue(Nutrient.vitaminK, PerSize.oneHundredGrams, value);

  /// Typical Unit for Vitamin K
  @Deprecated('Use getUnit instead')
  Unit? get vitaminKUnit => getUnit(Nutrient.vitaminK);
  @Deprecated('Forget that confusing feature')
  set vitaminKUnit(final Unit? unit) {}

  /// Cholesterol, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get cholesterolServing =>
      getValue(Nutrient.cholesterol, PerSize.serving);
  @Deprecated('Use setValue instead')
  set cholesterolServing(final double? value) =>
      setValue(Nutrient.cholesterol, PerSize.serving, value);

  /// Cholesterol, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get cholesterol =>
      getValue(Nutrient.cholesterol, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set cholesterol(final double? value) =>
      setValue(Nutrient.cholesterol, PerSize.oneHundredGrams, value);

  /// Typical Unit for Cholesterol
  @Deprecated('Use getUnit instead')
  Unit? get cholesterolUnit => getUnit(Nutrient.cholesterol);
  @Deprecated('Forget that confusing feature')
  set cholesterolUnit(final Unit? unit) {}

  /// Butyric Acid, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get butyricAcidServing =>
      getValue(Nutrient.butyricAcid, PerSize.serving);
  @Deprecated('Use setValue instead')
  set butyricAcidServing(final double? value) =>
      setValue(Nutrient.butyricAcid, PerSize.serving, value);

  /// Butyric Acid, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get butyricAcid =>
      getValue(Nutrient.butyricAcid, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set butyricAcid(final double? value) =>
      setValue(Nutrient.butyricAcid, PerSize.oneHundredGrams, value);

  /// Typical Unit for Butyric Acid
  @Deprecated('Use getUnit instead')
  Unit? get butyricAcidUnit => getUnit(Nutrient.butyricAcid);
  @Deprecated('Forget that confusing feature')
  set butyricAcidUnit(final Unit? unit) {}

  /// Caproic Acid, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get caproicAcidServing =>
      getValue(Nutrient.caproicAcid, PerSize.serving);
  @Deprecated('Use setValue instead')
  set caproicAcidServing(final double? value) =>
      setValue(Nutrient.caproicAcid, PerSize.serving, value);

  /// Caproic Acid, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get caproicAcid =>
      getValue(Nutrient.caproicAcid, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set caproicAcid(final double? value) =>
      setValue(Nutrient.caproicAcid, PerSize.oneHundredGrams, value);

  /// Typical Unit for Caproic Acid
  @Deprecated('Use getUnit instead')
  Unit? get caproicAcidUnit => getUnit(Nutrient.caproicAcid);
  @Deprecated('Forget that confusing feature')
  set caproicAcidUnit(final Unit? unit) {}

  /// Caprylic Acid, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get caprylicAcidServing =>
      getValue(Nutrient.caprylicAcid, PerSize.serving);
  @Deprecated('Use setValue instead')
  set caprylicAcidServing(final double? value) =>
      setValue(Nutrient.caprylicAcid, PerSize.serving, value);

  /// Caprylic Acid, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get caprylicAcid =>
      getValue(Nutrient.caprylicAcid, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set caprylicAcid(final double? value) =>
      setValue(Nutrient.caprylicAcid, PerSize.oneHundredGrams, value);

  /// Typical Unit for Caprylic Acid
  @Deprecated('Use getUnit instead')
  Unit? get caprylicAcidUnit => getUnit(Nutrient.caprylicAcid);
  @Deprecated('Forget that confusing feature')
  set caprylicAcidUnit(final Unit? unit) {}

  /// Capric Acid, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get capricAcidServing =>
      getValue(Nutrient.capricAcid, PerSize.serving);
  @Deprecated('Use setValue instead')
  set capricAcidServing(final double? value) =>
      setValue(Nutrient.capricAcid, PerSize.serving, value);

  /// Capric Acid, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get capricAcid =>
      getValue(Nutrient.capricAcid, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set capricAcid(final double? value) =>
      setValue(Nutrient.capricAcid, PerSize.oneHundredGrams, value);

  /// Typical Unit for Capric Acid
  @Deprecated('Use getUnit instead')
  Unit? get capricAcidUnit => getUnit(Nutrient.capricAcid);
  @Deprecated('Forget that confusing feature')
  set capricAcidUnit(final Unit? unit) {}

  /// Lauric Acid, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get lauricAcidServing =>
      getValue(Nutrient.lauricAcid, PerSize.serving);
  @Deprecated('Use setValue instead')
  set lauricAcidServing(final double? value) =>
      setValue(Nutrient.lauricAcid, PerSize.serving, value);

  /// Lauric Acid, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get lauricAcid =>
      getValue(Nutrient.lauricAcid, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set lauricAcid(final double? value) =>
      setValue(Nutrient.lauricAcid, PerSize.oneHundredGrams, value);

  /// Typical Unit for Lauric Acid
  @Deprecated('Use getUnit instead')
  Unit? get lauricAcidUnit => getUnit(Nutrient.lauricAcid);
  @Deprecated('Forget that confusing feature')
  set lauricAcidUnit(final Unit? unit) {}

  /// Myristic Acid, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get myristicAcidServing =>
      getValue(Nutrient.myristicAcid, PerSize.serving);
  @Deprecated('Use setValue instead')
  set myristicAcidServing(final double? value) =>
      setValue(Nutrient.myristicAcid, PerSize.serving, value);

  /// Myristic Acid, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get myristicAcid =>
      getValue(Nutrient.myristicAcid, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set myristicAcid(final double? value) =>
      setValue(Nutrient.myristicAcid, PerSize.oneHundredGrams, value);

  /// Typical Unit for Myristic Acid
  @Deprecated('Use getUnit instead')
  Unit? get myristicAcidUnit => getUnit(Nutrient.myristicAcid);
  @Deprecated('Forget that confusing feature')
  set myristicAcidUnit(final Unit? unit) {}

  /// Palmitic Acid, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get palmiticAcidServing =>
      getValue(Nutrient.palmiticAcid, PerSize.serving);
  @Deprecated('Use setValue instead')
  set palmiticAcidServing(final double? value) =>
      setValue(Nutrient.palmiticAcid, PerSize.serving, value);

  /// Palmitic Acid, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get palmiticAcid =>
      getValue(Nutrient.palmiticAcid, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set palmiticAcid(final double? value) =>
      setValue(Nutrient.palmiticAcid, PerSize.oneHundredGrams, value);

  /// Typical Unit for Palmitic Acid
  @Deprecated('Use getUnit instead')
  Unit? get palmiticAcidUnit => getUnit(Nutrient.palmiticAcid);
  @Deprecated('Forget that confusing feature')
  set palmiticAcidUnit(final Unit? unit) {}

  /// Stearic Acid, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get stearicAcidServing =>
      getValue(Nutrient.stearicAcid, PerSize.serving);
  @Deprecated('Use setValue instead')
  set stearicAcidServing(final double? value) =>
      setValue(Nutrient.stearicAcid, PerSize.serving, value);

  /// Stearic Acid, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get stearicAcid =>
      getValue(Nutrient.stearicAcid, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set stearicAcid(final double? value) =>
      setValue(Nutrient.stearicAcid, PerSize.oneHundredGrams, value);

  /// Typical Unit for Stearic Acid
  @Deprecated('Use getUnit instead')
  Unit? get stearicAcidUnit => getUnit(Nutrient.stearicAcid);
  @Deprecated('Forget that confusing feature')
  set stearicAcidUnit(final Unit? unit) {}

  /// Oleic Acid, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get oleicAcidServing => getValue(Nutrient.oleicAcid, PerSize.serving);
  @Deprecated('Use setValue instead')
  set oleicAcidServing(final double? value) =>
      setValue(Nutrient.oleicAcid, PerSize.serving, value);

  /// Oleic Acid, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get oleicAcid =>
      getValue(Nutrient.oleicAcid, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set oleicAcid(final double? value) =>
      setValue(Nutrient.oleicAcid, PerSize.oneHundredGrams, value);

  /// Typical Unit for Oleic Acid
  @Deprecated('Use getUnit instead')
  Unit? get oleicAcidUnit => getUnit(Nutrient.oleicAcid);
  @Deprecated('Forget that confusing feature')
  set oleicAcidUnit(final Unit? unit) {}

  /// Linoleic Acid, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get linoleicAcidServing =>
      getValue(Nutrient.linoleicAcid, PerSize.serving);
  @Deprecated('Use setValue instead')
  set linoleicAcidServing(final double? value) =>
      setValue(Nutrient.linoleicAcid, PerSize.serving, value);

  /// Linoleic Acid, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get linoleicAcid =>
      getValue(Nutrient.linoleicAcid, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set linoleicAcid(final double? value) =>
      setValue(Nutrient.linoleicAcid, PerSize.oneHundredGrams, value);

  /// Typical Unit for Linoleic Acid
  @Deprecated('Use getUnit instead')
  Unit? get linoleicAcidUnit => getUnit(Nutrient.linoleicAcid);
  @Deprecated('Forget that confusing feature')
  set linoleicAcidUnit(final Unit? unit) {}

  /// Docosahexaenoic Acid, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get docosahexaenoicAcidServing =>
      getValue(Nutrient.docosahexaenoicAcid, PerSize.serving);
  @Deprecated('Use setValue instead')
  set docosahexaenoicAcidServing(final double? value) =>
      setValue(Nutrient.docosahexaenoicAcid, PerSize.serving, value);

  /// Docosahexaenoic Acid, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get docosahexaenoicAcid =>
      getValue(Nutrient.docosahexaenoicAcid, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set docosahexaenoicAcid(final double? value) =>
      setValue(Nutrient.docosahexaenoicAcid, PerSize.oneHundredGrams, value);

  /// Typical Unit for Docosahexaenoic Acid
  @Deprecated('Use getUnit instead')
  Unit? get docosahexaenoicAcidUnit => getUnit(Nutrient.docosahexaenoicAcid);
  @Deprecated('Forget that confusing feature')
  set docosahexaenoicAcidUnit(final Unit? unit) {}

  /// Eicosapentaenoic Acid, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get eicosapentaenoicAcidServing =>
      getValue(Nutrient.eicosapentaenoicAcid, PerSize.serving);
  @Deprecated('Use setValue instead')
  set eicosapentaenoicAcidServing(final double? value) =>
      setValue(Nutrient.eicosapentaenoicAcid, PerSize.serving, value);

  /// Eicosapentaenoic Acid, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get eicosapentaenoicAcid =>
      getValue(Nutrient.eicosapentaenoicAcid, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set eicosapentaenoicAcid(final double? value) =>
      setValue(Nutrient.eicosapentaenoicAcid, PerSize.oneHundredGrams, value);

  /// Typical Unit for Eicosapentaenoic Acid
  @Deprecated('Use getUnit instead')
  Unit? get eicosapentaenoicAcidUnit => getUnit(Nutrient.eicosapentaenoicAcid);
  @Deprecated('Forget that confusing feature')
  set eicosapentaenoicAcidUnit(final Unit? unit) {}

  /// Erucic Acid, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get erucicAcidServing =>
      getValue(Nutrient.erucicAcid, PerSize.serving);
  @Deprecated('Use setValue instead')
  set erucicAcidServing(final double? value) =>
      setValue(Nutrient.erucicAcid, PerSize.serving, value);

  /// Erucic Acid, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get erucicAcid =>
      getValue(Nutrient.erucicAcid, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set erucicAcid(final double? value) =>
      setValue(Nutrient.erucicAcid, PerSize.oneHundredGrams, value);

  /// Typical Unit for Erucic Acid
  @Deprecated('Use getUnit instead')
  Unit? get erucicAcidUnit => getUnit(Nutrient.erucicAcid);
  @Deprecated('Forget that confusing feature')
  set erucicAcidUnit(final Unit? unit) {}

  /// Monounsaturated Fats, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get monounsaturatedServing =>
      getValue(Nutrient.monounsaturatedFat, PerSize.serving);
  @Deprecated('Use setValue instead')
  set monounsaturatedServing(final double? value) =>
      setValue(Nutrient.monounsaturatedFat, PerSize.serving, value);

  /// Monounsaturated Fats, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get monounsaturatedAcid =>
      getValue(Nutrient.monounsaturatedFat, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set monounsaturatedAcid(final double? value) =>
      setValue(Nutrient.monounsaturatedFat, PerSize.oneHundredGrams, value);

  /// Typical Unit for Monounsaturated Fats
  @Deprecated('Use getUnit instead')
  Unit? get monounsaturatedUnit => getUnit(Nutrient.monounsaturatedFat);
  @Deprecated('Forget that confusing feature')
  set monounsaturatedUnit(final Unit? unit) {}

  /// Polyunsaturated Fats, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get polyunsaturatedServing =>
      getValue(Nutrient.polyunsaturatedFat, PerSize.serving);
  @Deprecated('Use setValue instead')
  set polyunsaturatedServing(final double? value) =>
      setValue(Nutrient.polyunsaturatedFat, PerSize.serving, value);

  /// Polyunsaturated Fats, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get polyunsaturatedAcid =>
      getValue(Nutrient.polyunsaturatedFat, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set polyunsaturatedAcid(final double? value) =>
      setValue(Nutrient.polyunsaturatedFat, PerSize.oneHundredGrams, value);

  /// Typical Unit for Polyunsaturated Fats
  @Deprecated('Use getUnit instead')
  Unit? get polyunsaturatedUnit => getUnit(Nutrient.polyunsaturatedFat);
  @Deprecated('Forget that confusing feature')
  set polyunsaturatedUnit(final Unit? unit) {}

  /// Alcohol, in % vol, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get alcoholServing => getValue(Nutrient.alcohol, PerSize.serving);
  @Deprecated('Use setValue instead')
  set alcoholServing(final double? value) =>
      setValue(Nutrient.alcohol, PerSize.serving, value);

  /// Alcohol, in % vol, per 100g of product as sold
  @Deprecated('Use getValue instead')
  double? get alcohol => getValue(Nutrient.alcohol, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set alcohol(final double? value) =>
      setValue(Nutrient.alcohol, PerSize.oneHundredGrams, value);

  /// Typical Unit for Alcohol
  @Deprecated('Use getUnit instead')
  Unit? get alcoholUnit => getUnit(Nutrient.alcohol);
  @Deprecated('Forget that confusing feature')
  set alcoholUnit(final Unit? unit) {}

  /// Pantothenic Acid, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get pantothenicAcidServing =>
      getValue(Nutrient.pantothenicAcid, PerSize.serving);
  @Deprecated('Use setValue instead')
  set pantothenicAcidServing(final double? value) =>
      setValue(Nutrient.pantothenicAcid, PerSize.serving, value);

  /// Pantothenic Acid, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get pantothenicAcid =>
      getValue(Nutrient.pantothenicAcid, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set pantothenicAcid(final double? value) =>
      setValue(Nutrient.pantothenicAcid, PerSize.oneHundredGrams, value);

  /// Typical Unit for Pantothenic Acid
  @Deprecated('Use getUnit instead')
  Unit? get pantothenicAcidUnit => getUnit(Nutrient.pantothenicAcid);
  @Deprecated('Forget that confusing feature')
  set pantothenicAcidUnit(final Unit? unit) {}

  /// Biotin, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get biotinServing => getValue(Nutrient.biotin, PerSize.serving);
  @Deprecated('Use setValue instead')
  set biotinServing(final double? value) =>
      setValue(Nutrient.biotin, PerSize.serving, value);

  /// Biotin, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get biotin => getValue(Nutrient.biotin, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set biotin(final double? value) =>
      setValue(Nutrient.biotin, PerSize.oneHundredGrams, value);

  /// Typical Unit for Biotin
  @Deprecated('Use getUnit instead')
  Unit? get biotinUnit => getUnit(Nutrient.biotin);
  @Deprecated('Forget that confusing feature')
  set biotinUnit(final Unit? unit) {}

  /// Chloride, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get chlorideServing => getValue(Nutrient.chloride, PerSize.serving);
  @Deprecated('Use setValue instead')
  set chlorideServing(final double? value) =>
      setValue(Nutrient.chloride, PerSize.serving, value);

  /// Chloride, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get chloride => getValue(Nutrient.chloride, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set chloride(final double? value) =>
      setValue(Nutrient.chloride, PerSize.oneHundredGrams, value);

  /// Typical Unit for Chloride
  @Deprecated('Use getUnit instead')
  Unit? get chlorideUnit => getUnit(Nutrient.chloride);
  @Deprecated('Forget that confusing feature')
  set chlorideUnit(final Unit? unit) {}

  /// Chromium, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get chromiumServing => getValue(Nutrient.chromium, PerSize.serving);
  @Deprecated('Use setValue instead')
  set chromiumServing(final double? value) =>
      setValue(Nutrient.chromium, PerSize.serving, value);

  /// Chromium, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get chromium => getValue(Nutrient.chromium, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set chromium(final double? value) =>
      setValue(Nutrient.chromium, PerSize.oneHundredGrams, value);

  /// Typical Unit for Chromium
  @Deprecated('Use getUnit instead')
  Unit? get chromiumUnit => getUnit(Nutrient.chromium);
  @Deprecated('Forget that confusing feature')
  set chromiumUnit(final Unit? unit) {}

  /// Fluoride, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get fluorideServing => getValue(Nutrient.fluoride, PerSize.serving);
  @Deprecated('Use setValue instead')
  set fluorideServing(final double? value) =>
      setValue(Nutrient.fluoride, PerSize.serving, value);

  /// Fluoride, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get fluoride => getValue(Nutrient.fluoride, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set fluoride(final double? value) =>
      setValue(Nutrient.fluoride, PerSize.oneHundredGrams, value);

  /// Typical Unit for Fluoride
  @Deprecated('Use getUnit instead')
  Unit? get fluorideUnit => getUnit(Nutrient.fluoride);
  @Deprecated('Forget that confusing feature')
  set fluorideUnit(final Unit? unit) {}

  /// Iodine, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get iodineServing => getValue(Nutrient.iodine, PerSize.serving);
  @Deprecated('Use setValue instead')
  set iodineServing(final double? value) =>
      setValue(Nutrient.iodine, PerSize.serving, value);

  /// Iodine, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get iodine => getValue(Nutrient.iodine, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set iodine(final double? value) =>
      setValue(Nutrient.iodine, PerSize.oneHundredGrams, value);

  /// Typical Unit for Iodine
  @Deprecated('Use getUnit instead')
  Unit? get iodineUnit => getUnit(Nutrient.iodine);
  @Deprecated('Forget that confusing feature')
  set iodineUnit(final Unit? unit) {}

  /// Manganese, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get manganeseServing => getValue(Nutrient.manganese, PerSize.serving);
  @Deprecated('Use setValue instead')
  set manganeseServing(final double? value) =>
      setValue(Nutrient.manganese, PerSize.serving, value);

  /// Manganese, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get manganese =>
      getValue(Nutrient.manganese, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set manganese(final double? value) =>
      getValue(Nutrient.manganese, PerSize.oneHundredGrams);

  /// Typical Unit for Manganese
  @Deprecated('Use getUnit instead')
  Unit? get manganeseUnit => getUnit(Nutrient.manganese);
  @Deprecated('Forget that confusing feature')
  set manganeseUnit(final Unit? unit) {}

  /// Molybdenum, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get molybdenumServing =>
      getValue(Nutrient.molybdenum, PerSize.serving);
  @Deprecated('Use setValue instead')
  set molybdenumServing(final double? value) =>
      setValue(Nutrient.molybdenum, PerSize.serving, value);

  /// Molybdenum, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get molybdenum =>
      getValue(Nutrient.molybdenum, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set molybdenum(final double? value) =>
      setValue(Nutrient.molybdenum, PerSize.oneHundredGrams, value);

  /// Typical Unit for Molybdenum
  @Deprecated('Use getUnit instead')
  Unit? get molybdenumUnit => getUnit(Nutrient.molybdenum);
  @Deprecated('Forget that confusing feature')
  set molybdenumUnit(final Unit? unit) {}

  /// Omega 3, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get omega3FatServing => getValue(Nutrient.omega3, PerSize.serving);
  @Deprecated('Use setValue instead')
  set omega3FatServing(final double? value) =>
      setValue(Nutrient.omega3, PerSize.serving, value);

  /// Omega 3, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get omega3Fat => getValue(Nutrient.omega3, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set omega3Fat(final double? value) =>
      setValue(Nutrient.omega3, PerSize.oneHundredGrams, value);

  /// Typical Unit for Omega 3
  @Deprecated('Use getUnit instead')
  Unit? get omega3FatUnit => getUnit(Nutrient.omega3);
  @Deprecated('Forget that confusing feature')
  set omega3FatUnit(final Unit? unit) {}

  /// Omega 6, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get omega6FatServing => getValue(Nutrient.omega6, PerSize.serving);
  @Deprecated('Use setValue instead')
  set omega6FatServing(final double? value) =>
      setValue(Nutrient.omega6, PerSize.serving, value);

  /// Omega 6, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get omega6Fat => getValue(Nutrient.omega6, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set omega6Fat(final double? value) =>
      setValue(Nutrient.omega6, PerSize.oneHundredGrams, value);

  /// Typical Unit for Omega 6
  @Deprecated('Use getUnit instead')
  Unit? get omega6FatUnit => getUnit(Nutrient.omega6);
  @Deprecated('Forget that confusing feature')
  set omega6FatUnit(final Unit? unit) {}

  /// Trans Fats, in grams, per serving of product as sold
  @Deprecated('Use getValue instead')
  double? get transFatServing => getValue(Nutrient.transFat, PerSize.serving);
  @Deprecated('Use setValue instead')
  set transFatServing(final double? value) =>
      setValue(Nutrient.transFat, PerSize.serving, value);

  /// Trans Fats, in grams, per 100 grams of product as sold
  @Deprecated('Use getValue instead')
  double? get transFat => getValue(Nutrient.transFat, PerSize.oneHundredGrams);
  @Deprecated('Use setValue instead')
  set transFat(final double? value) =>
      setValue(Nutrient.transFat, PerSize.oneHundredGrams, value);

  /// Typical Unit for Trans Fats
  @Deprecated('Use getUnit instead')
  Unit? get transFatUnit => getUnit(Nutrient.transFat);
  @Deprecated('Forget that confusing feature')
  set transFatUnit(final Unit? unit) {}

  @Deprecated('Use Nutriments.empty() instead')
  Nutriments({
    final double? salt,
    final double? fiber,
    final double? sugars,
    final double? fat,
    final double? saturatedFat,
    final double? proteins,
    final int? novaGroup,
    final double? energy,
    final double? energyKcal,
    final double? energyKj,
    final double? energyKcal100g,
    final double? carbohydrates,
    final double? saltServing,
    final double? fiberServing,
    final double? sugarsServing,
    final double? fatServing,
    final Unit? fatUnit,
    final double? saturatedFatServing,
    final double? proteinsServing,
    final Unit? proteinsUnit,
    final int? novaGroupServing,
    final double? energyServing,
    final double? carbohydratesServing,
    final Unit? carbohydratesUnit,
    final Unit? energyKcalUnit,
    final Unit? energyUnit,
    final double? caffeineServing,
    final double? caffeine,
    final Unit? caffeineUnit,
    final double? calciumServing,
    final double? calcium,
    final Unit? calciumUnit,
    final double? ironServing,
    final double? iron,
    final Unit? ironUnit,
    final double? vitaminC,
    final double? vitaminCServing,
    final Unit? vitaminCUnit,
    final double? magnesium,
    final double? magnesiumServing,
    final Unit? magnesiumUnit,
    final double? phosphorus,
    final double? phosphorusServing,
    final Unit? phosphorusUnit,
    final double? potassium,
    final double? potassiumServing,
    final Unit? potassiumUnit,
    final double? chloride,
    final double? chlorideServing,
    final Unit? chlorideUnit,
    final double? sodium,
    final double? sodiumServing,
    final Unit? sodiumUnit,
    final double? zinc,
    final double? zincServing,
    final Unit? zincUnit,
    final double? copper,
    final double? copperServing,
    final Unit? copperUnit,
    final double? manganese,
    final double? manganeseServing,
    final Unit? manganeseUnit,
    final double? fluoride,
    final double? fluorideServing,
    final Unit? fluorideUnit,
    final double? selenium,
    final double? seleniumServing,
    final Unit? seleniumUnit,
    final double? chromium,
    final double? chromiumServing,
    final Unit? chromiumUnit,
    final double? molybdenum,
    final double? molybdenumServing,
    final Unit? molybdenumUnit,
    final double? iodine,
    final double? iodineServing,
    final Unit? iodineUnit,
    final double? vitaminA,
    final double? vitaminAServing,
    final Unit? vitaminAUnit,
    final double? vitaminE,
    final double? vitaminEServing,
    final Unit? vitaminEUnit,
    final double? vitaminD,
    final double? vitaminDServing,
    final Unit? vitaminDUnit,
    final double? vitaminB1,
    final double? vitaminB1Serving,
    final Unit? vitaminB1Unit,
    final double? vitaminB2,
    final double? vitaminB2Serving,
    final Unit? vitaminB2Unit,
    final double? vitaminPP,
    final double? vitaminPPServing,
    final Unit? vitaminPPUnit,
    final double? vitaminB6,
    final double? vitaminB6Serving,
    final Unit? vitaminB6Unit,
    final double? vitaminK,
    final double? vitaminKServing,
    final Unit? vitaminKUnit,
    final double? vitaminB12,
    final double? vitaminB12Serving,
    final Unit? vitaminB12Unit,
    final double? vitaminB9,
    final double? vitaminB9Serving,
    final Unit? vitaminB9Unit,
    final double? biotin,
    final double? biotinServing,
    final Unit? biotinUnit,
    final double? pantothenicAcid,
    final double? pantothenicAcidServing,
    final Unit? pantothenicAcidUnit,
    final double? transFat,
    final double? transFatServing,
    final Unit? transFatUnit,
    final double? cholesterol,
    final double? cholesterolServing,
    final Unit? cholesterolUnit,
    final double? alcohol,
    final double? alcoholServing,
    final Unit? alcoholUnit,
    final double? butyricAcid,
    final double? butyricAcidServing,
    final Unit? butyricAcidUnit,
    final double? capricAcid,
    final double? capricAcidServing,
    final Unit? capricAcidUnit,
    final double? caproicAcid,
    final double? caproicAcidServing,
    final Unit? caproicAcidUnit,
    final double? caprylicAcid,
    final double? caprylicAcidServing,
    final Unit? caprylicAcidUnit,
    final double? docosahexaenoicAcid,
    final double? docosahexaenoicAcidServing,
    final Unit? docosahexaenoicAcidUnit,
    final double? eicosapentaenoicAcid,
    final double? eicosapentaenoicAcidServing,
    final Unit? eicosapentaenoicAcidUnit,
    final double? erucicAcid,
    final double? erucicAcidServing,
    final Unit? erucicAcidUnit,
    final double? lauricAcid,
    final double? lauricAcidServing,
    final Unit? lauricAcidUnit,
    final double? linoleicAcid,
    final double? linoleicAcidServing,
    final Unit? linoleicAcidUnit,
    final double? monounsaturatedAcid,
    final double? monounsaturatedServing,
    final Unit? monounsaturatedUnit,
    final double? myristicAcid,
    final double? myristicAcidServing,
    final Unit? myristicAcidUnit,
    final double? oleicAcid,
    final double? oleicAcidServing,
    final Unit? oleicAcidUnit,
    final double? palmiticAcid,
    final double? palmiticAcidServing,
    final Unit? palmiticAcidUnit,
    final double? polyunsaturatedAcid,
    final double? polyunsaturatedServing,
    final Unit? polyunsaturatedUnit,
    final double? omega3Fat,
    final double? omega3FatServing,
    final Unit? omega3FatUnit,
    final double? omega6Fat,
    final double? omega6FatServing,
    final Unit? omega6FatUnit,
    final double? stearicAcid,
    final double? stearicAcidServing,
    final Unit? stearicAcidUnit,
  }) {
    this.salt = salt;
    this.fiber = fiber;
    this.sugars = sugars;
    this.fat = fat;
    this.saturatedFat = saturatedFat;
    this.proteins = proteins;
    this.novaGroup = novaGroup;
    this.energy = energy;
    this.energyKcal = energyKcal;
    this.energyKj = energyKj;
    this.energyKcal100g = energyKcal100g;
    this.carbohydrates = carbohydrates;
    this.saltServing = saltServing;
    this.fiberServing = fiberServing;
    this.sugarsServing = sugarsServing;
    this.fatServing = fatServing;
    this.fatUnit = fatUnit;
    this.saturatedFatServing = saturatedFatServing;
    this.proteinsServing = proteinsServing;
    this.proteinsUnit = proteinsUnit;
    this.novaGroupServing = novaGroupServing;
    this.energyServing = energyServing;
    this.carbohydratesServing = carbohydratesServing;
    this.carbohydratesUnit = carbohydratesUnit;
    this.energyKcalUnit = energyKcalUnit;
    this.energyUnit = energyUnit;
    this.caffeineServing = caffeineServing;
    this.caffeine = caffeine;
    this.caffeineUnit = caffeineUnit;
    this.calciumServing = calciumServing;
    this.calcium = calcium;
    this.calciumUnit = calciumUnit;
    this.ironServing = ironServing;
    this.iron = iron;
    this.ironUnit = ironUnit;
    this.vitaminC = vitaminC;
    this.vitaminCServing = vitaminCServing;
    this.vitaminCUnit = vitaminCUnit;
    this.magnesium = magnesium;
    this.magnesiumServing = magnesiumServing;
    this.magnesiumUnit = magnesiumUnit;
    this.phosphorus = phosphorus;
    this.phosphorusServing = phosphorusServing;
    this.phosphorusUnit = phosphorusUnit;
    this.potassium = potassium;
    this.potassiumServing = potassiumServing;
    this.potassiumUnit = potassiumUnit;
    this.chloride = chloride;
    this.chlorideServing = chlorideServing;
    this.chlorideUnit = chlorideUnit;
    this.sodium = sodium;
    this.sodiumServing = sodiumServing;
    this.sodiumUnit = sodiumUnit;
    this.zinc = zinc;
    this.zincServing = zincServing;
    this.zincUnit = zincUnit;
    this.copper = copper;
    this.copperServing = copperServing;
    this.copperUnit = copperUnit;
    this.manganese = manganese;
    this.manganeseServing = manganeseServing;
    this.manganeseUnit = manganeseUnit;
    this.fluoride = fluoride;
    this.fluorideServing = fluorideServing;
    this.fluorideUnit = fluorideUnit;
    this.selenium = selenium;
    this.seleniumServing = seleniumServing;
    this.seleniumUnit = seleniumUnit;
    this.chromium = chromium;
    this.chromiumServing = chromiumServing;
    this.chromiumUnit = chromiumUnit;
    this.molybdenum = molybdenum;
    this.molybdenumServing = molybdenumServing;
    this.molybdenumUnit = molybdenumUnit;
    this.iodine = iodine;
    this.iodineServing = iodineServing;
    this.iodineUnit = iodineUnit;
    this.vitaminA = vitaminA;
    this.vitaminAServing = vitaminAServing;
    this.vitaminAUnit = vitaminAUnit;
    this.vitaminE = vitaminE;
    this.vitaminEServing = vitaminEServing;
    this.vitaminEUnit = vitaminEUnit;
    this.vitaminD = vitaminD;
    this.vitaminDServing = vitaminDServing;
    this.vitaminDUnit = vitaminDUnit;
    this.vitaminB1 = vitaminB1;
    this.vitaminB1Serving = vitaminB1Serving;
    this.vitaminB1Unit = vitaminB1Unit;
    this.vitaminB2 = vitaminB2;
    this.vitaminB2Serving = vitaminB2Serving;
    this.vitaminB2Unit = vitaminB2Unit;
    this.vitaminPP = vitaminPP;
    this.vitaminPPServing = vitaminPPServing;
    this.vitaminPPUnit = vitaminPPUnit;
    this.vitaminB6 = vitaminB6;
    this.vitaminB6Serving = vitaminB6Serving;
    this.vitaminB6Unit = vitaminB6Unit;
    this.vitaminK = vitaminK;
    this.vitaminKServing = vitaminKServing;
    this.vitaminKUnit = vitaminKUnit;
    this.vitaminB12 = vitaminB12;
    this.vitaminB12Serving = vitaminB12Serving;
    this.vitaminB12Unit = vitaminB12Unit;
    this.vitaminB9 = vitaminB9;
    this.vitaminB9Serving = vitaminB9Serving;
    this.vitaminB9Unit = vitaminB9Unit;
    this.biotin = biotin;
    this.biotinServing = biotinServing;
    this.biotinUnit = biotinUnit;
    this.pantothenicAcid = pantothenicAcid;
    this.pantothenicAcidServing = pantothenicAcidServing;
    this.pantothenicAcidUnit = pantothenicAcidUnit;
    this.transFat = transFat;
    this.transFatServing = transFatServing;
    this.transFatUnit = transFatUnit;
    this.cholesterol = cholesterol;
    this.cholesterolServing = cholesterolServing;
    this.cholesterolUnit = cholesterolUnit;
    this.alcohol = alcohol;
    this.alcoholServing = alcoholServing;
    this.alcoholUnit = alcoholUnit;
    this.butyricAcid = butyricAcid;
    this.butyricAcidServing = butyricAcidServing;
    this.butyricAcidUnit = butyricAcidUnit;
    this.capricAcid = capricAcid;
    this.capricAcidServing = capricAcidServing;
    this.capricAcidUnit = capricAcidUnit;
    this.caproicAcid = caproicAcid;
    this.caproicAcidServing = caproicAcidServing;
    this.caproicAcidUnit = caproicAcidUnit;
    this.caprylicAcid = caprylicAcid;
    this.caprylicAcidServing = caprylicAcidServing;
    this.caprylicAcidUnit = caprylicAcidUnit;
    this.docosahexaenoicAcid = docosahexaenoicAcid;
    this.docosahexaenoicAcidServing = docosahexaenoicAcidServing;
    this.docosahexaenoicAcidUnit = docosahexaenoicAcidUnit;
    this.eicosapentaenoicAcid = eicosapentaenoicAcid;
    this.eicosapentaenoicAcidServing = eicosapentaenoicAcidServing;
    this.eicosapentaenoicAcidUnit = eicosapentaenoicAcidUnit;
    this.erucicAcid = erucicAcid;
    this.erucicAcidServing = erucicAcidServing;
    this.erucicAcidUnit = erucicAcidUnit;
    this.lauricAcid = lauricAcid;
    this.lauricAcidServing = lauricAcidServing;
    this.lauricAcidUnit = lauricAcidUnit;
    this.linoleicAcid = linoleicAcid;
    this.linoleicAcidServing = linoleicAcidServing;
    this.linoleicAcidUnit = linoleicAcidUnit;
    this.monounsaturatedAcid = monounsaturatedAcid;
    this.monounsaturatedServing = monounsaturatedServing;
    this.monounsaturatedUnit = monounsaturatedUnit;
    this.myristicAcid = myristicAcid;
    this.myristicAcidServing = myristicAcidServing;
    this.myristicAcidUnit = myristicAcidUnit;
    this.oleicAcid = oleicAcid;
    this.oleicAcidServing = oleicAcidServing;
    this.oleicAcidUnit = oleicAcidUnit;
    this.palmiticAcid = palmiticAcid;
    this.palmiticAcidServing = palmiticAcidServing;
    this.palmiticAcidUnit = palmiticAcidUnit;
    this.polyunsaturatedAcid = polyunsaturatedAcid;
    this.polyunsaturatedServing = polyunsaturatedServing;
    this.polyunsaturatedUnit = polyunsaturatedUnit;
    this.omega3Fat = omega3Fat;
    this.omega3FatServing = omega3FatServing;
    this.omega3FatUnit = omega3FatUnit;
    this.omega6Fat = omega6Fat;
    this.omega6FatServing = omega6FatServing;
    this.omega6FatUnit = omega6FatUnit;
    this.stearicAcid = stearicAcid;
    this.stearicAcidServing = stearicAcidServing;
    this.stearicAcidUnit = stearicAcidUnit;
  }

  factory Nutriments.fromJson(Map<String, dynamic> json) =>
      Nutriments._fromMap(json);

  /// Returns a JSON version of the [Nutriments].
  ///
  /// When we want to erase a value, we need to set the value to `''`.
  /// If we put `null` instead the server will interpret it as `0`.
  /// If we don't set a value the server will keep the previous value.
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};
    for (final Nutrient nutrient in Nutrient.values) {
      for (final PerSize perSize in PerSize.values) {
        final String tag = _getTag(nutrient, perSize);
        final double? value = _map[tag];
        if (value != null) {
          result[tag] = value;
        } else if (_map.containsKey(tag)) {
          result[tag] = '';
        }
      }
    }
    return result;
  }

  static Map<String, dynamic> toJsonHelper(Nutriments? n) => n?.toJson() ?? {};

  /// Nutrient ids supported by [Nutriments].
  ///
  /// To be used when another source of nutrients (e.g. [OrderedNutrient])
  /// has a broader list of nutrients - that we simply could not handle with
  /// [Nutriments].
  @Deprecated('Use Nutrient.values instead')
  static const Set<String> supportedNutrientIds = <String>{
    'salt',
    'fiber',
    'sugars',
    'fat',
    'saturated-fat',
    'proteins',
    'nova-group',
    'energy',
    'energy-kcal',
    'carbohydrates',
    'caffeine',
    'calcium',
    'iron',
    'vitamin-c',
    'magnesium',
    'phosphorus',
    'potassium',
    'sodium',
    'zinc',
    'copper',
    'selenium',
    'vitamin-a',
    'vitamin-e',
    'vitamin-d',
    'vitamin-b1',
    'vitamin-b2',
    'vitamin-pp',
    'vitamin-b6',
    'vitamin-b12',
    'vitamin-b9',
    'vitamin-k',
    'cholesterol',
    'butyric-acid',
    'caproic-acid',
    'caprylic-acid',
    'capric-acid',
    'lauric-acid',
    'myristic-acid',
    'palmitic-acid',
    'stearic-acid',
    'oleic-acid',
    'linoleic-acid',
    'docosahexaenoic-acid',
    'eicosapentaenoic-acid',
    'erucic-acid',
    'monounsaturated',
    'polyunsaturated',
    'alcohol',
    'pantothenic-acid',
    'biotin',
    'chloride',
    'chromium',
    'fluoride',
    'iodine',
    'manganese',
    'molybdenum',
    'omega-3-fat',
    'omega-6-fat',
    'trans-fat',
  };
}
