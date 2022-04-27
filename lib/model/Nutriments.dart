import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/utils/UnitHelper.dart';

import '../interface/JsonObject.dart';

part 'Nutriments.g.dart';

/// Values in nutrients
@JsonSerializable()
class Nutriments extends JsonObject {
  /// Salt, in grams, per 100 grams of food
  @JsonKey(
      name: 'salt_100g', includeIfNull: false, fromJson: JsonObject.parseDouble)
  double? salt;

  /// Fibers, in grams, per 100 grams of food
  @JsonKey(
      name: 'fiber_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? fiber;

  /// Sugars, in grams, per 100 grams of food
  @JsonKey(
      name: 'sugars_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? sugars;

  /// Fats, in grams, per 100 grams of food
  @JsonKey(
      name: 'fat_100g', includeIfNull: false, fromJson: JsonObject.parseDouble)
  double? fat;

  /// Saturated Fats, in grams, per 100 grams of food
  @JsonKey(
      name: 'saturated-fat_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? saturatedFat;

  /// Proteins, in grams, per 100 grams of food
  @JsonKey(
      name: 'proteins_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? proteins;

  /// Nova Group
  @JsonKey(
      name: 'nova-group_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseInt)
  int? novaGroup;

  /// Energy, in kJ, per 100 grams of food
  @JsonKey(
      name: 'energy_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? energy;

  /// Energy, in kcal, per serving
  @JsonKey(
      name: 'energy-kcal',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? energyKcal;

  /// Energy, in kj, per serving
  @JsonKey(
      name: 'energy-kj', includeIfNull: false, fromJson: JsonObject.parseDouble)
  double? energyKj;

  /// Energy, in kcal, per 100 grams of food
  @JsonKey(
      name: 'energy-kcal_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? energyKcal100g;

  /// Carbohydrates, in grams, per 100 grams of food
  @JsonKey(
      name: 'carbohydrates_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? carbohydrates;

  /// Salt, in grams, per serving
  @JsonKey(
      name: 'salt_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? saltServing;

  /// Fibers, in grams, per serving
  @JsonKey(
      name: 'fiber_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? fiberServing;

  /// Sugars, in grams, per serving
  @JsonKey(
      name: 'sugars_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? sugarsServing;

  /// Fats, in grams, per serving
  @JsonKey(
      name: 'fat_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? fatServing;

  /// Typical Unit for Fat
  @JsonKey(
      name: 'fat_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? fatUnit;

  /// Saturated Fats, in grams, per serving
  @JsonKey(
      name: 'saturated-fat_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? saturatedFatServing;

  /// Proteins, in grams, per serving
  @JsonKey(
      name: 'proteins_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? proteinsServing;

  /// Typical Unit for Proteins
  @JsonKey(
      name: 'proteins_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? proteinsUnit;

  /// Nova Group
  @JsonKey(
      name: 'nova-group_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseInt)
  int? novaGroupServing;

  /// Energy, in kJ, per serving
  @JsonKey(
      name: 'energy_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? energyServing;

  /// Carbohydrates, in grams, per serving
  @JsonKey(
      name: 'carbohydrates_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? carbohydratesServing;

  /// Typical Unit for Carbohydrates
  @JsonKey(
      name: 'carbohydrates_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? carbohydratesUnit;

  /// Typical Unit for Energy (probably [Unit.KJ]
  @JsonKey(
      name: 'energy_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? energyUnit;

  /// Typical Unit for Energy (probably [Unit.KCAL]
  @JsonKey(
      name: 'energy-kcal_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? energyKcalUnit;

  /// Caffeine, in grams, per serving
  @JsonKey(
      name: 'caffeine_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? caffeineServing;

  /// Caffeine, in grams, per 100 grams of food
  @JsonKey(
      name: 'caffeine_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? caffeine;

  /// Typical Unit for Caffeine
  @JsonKey(
      name: 'caffeine_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? caffeineUnit;

  /// Calcium, in grams, per serving
  @JsonKey(
      name: 'calcium_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? calciumServing;

  /// Calcium, in grams, per 100 grams of food
  @JsonKey(
      name: 'calcium_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? calcium;

  /// Typical Unit for Calcium
  @JsonKey(
      name: 'calcium_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? calciumUnit;

  /// Iron, in grams, per serving
  @JsonKey(
      name: 'iron_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? ironServing;

  /// Iron, in grams, per 100 grams of food
  @JsonKey(
      name: 'iron_100g', includeIfNull: false, fromJson: JsonObject.parseDouble)
  double? iron;

  /// Typical Unit for Iron
  @JsonKey(
      name: 'iron_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? ironUnit;

  /// Vitamin C, in grams, per serving
  @JsonKey(
      name: 'vitamin-c_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminCServing;

  /// Vitamin C, in grams, per 100 grams of food
  @JsonKey(
      name: 'vitamin-c_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminC;

  /// Typical Unit for Vitamin C
  @JsonKey(
      name: 'vitamin-c_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? vitaminCUnit;

  /// Magnesium, in grams, per serving
  @JsonKey(
      name: 'magnesium_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? magnesiumServing;

  /// Magnesium, in grams, per 100 grams of food
  @JsonKey(
      name: 'magnesium_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? magnesium;

  /// Typical Unit for Magnesium
  @JsonKey(
      name: 'magnesium_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? magnesiumUnit;

  /// Phosphorus, in grams, per serving
  @JsonKey(
      name: 'phosphorus_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? phosphorusServing;

  /// Phosphorus, in grams, per 100 grams of food
  @JsonKey(
      name: 'phosphorus_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? phosphorus;

  /// Typical Unit for Phosphorus
  @JsonKey(
      name: 'phosphorus_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? phosphorusUnit;

  /// Potassium, in grams, per serving
  @JsonKey(
      name: 'potassium_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? potassiumServing;

  /// Potassium, in grams, per 100 grams of food
  @JsonKey(
      name: 'potassium_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? potassium;

  /// Typical Unit for Potassium
  @JsonKey(
      name: 'potassium_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? potassiumUnit;

  /// Sodium, in grams, per serving
  @JsonKey(
      name: 'sodium_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? sodiumServing;

  /// Sodium, in grams, per 100 grams of food
  @JsonKey(
      name: 'sodium_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? sodium;

  /// Typical Unit for Sodium
  @JsonKey(
      name: 'sodium_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? sodiumUnit;

  /// Zinc, in grams, per serving
  @JsonKey(
      name: 'zinc_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? zincServing;

  /// Zinc, in grams, per 100 grams of food
  @JsonKey(
      name: 'zinc_100g', includeIfNull: false, fromJson: JsonObject.parseDouble)
  double? zinc;

  /// Typical Unit for Zinc
  @JsonKey(
      name: 'zinc_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? zincUnit;

  /// Copper, in grams, per serving
  @JsonKey(
      name: 'copper_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? copperServing;

  /// Copper, in grams, per 100 grams of food
  @JsonKey(
      name: 'copper_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? copper;

  /// Typical Unit for Copper
  @JsonKey(
      name: 'copper_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? copperUnit;

  /// Selenium, in grams, per serving
  @JsonKey(
      name: 'selenium_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? seleniumServing;

  /// Selenium, in grams, per 100 grams of food
  @JsonKey(
      name: 'selenium_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? selenium;

  /// Typical Unit for Selenium
  @JsonKey(
      name: 'selenium_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? seleniumUnit;

  /// Vitamin A, in grams, per serving
  @JsonKey(
      name: 'vitamin-a_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminAServing;

  /// Vitamin A, in grams, per 100 grams of food
  @JsonKey(
      name: 'vitamin-a_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminA;

  /// Typical Unit for Vitamin A
  @JsonKey(
      name: 'vitamin-a_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? vitaminAUnit;

  /// Vitamin E, in grams, per serving
  @JsonKey(
      name: 'vitamin-e_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminEServing;

  /// Vitamin E, in grams, per 100 grams of food
  @JsonKey(
      name: 'vitamin-e_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminE;

  /// Typical Unit for Vitamin E
  @JsonKey(
      name: 'vitamin-e_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? vitaminEUnit;

  /// Vitamin D, in grams, per serving
  @JsonKey(
      name: 'vitamin-d_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminDServing;

  /// Vitamin D, in grams, per 100 grams of food
  @JsonKey(
      name: 'vitamin-d_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminD;

  /// Typical Unit for Vitamin D
  @JsonKey(
      name: 'vitamin-d_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? vitaminDUnit;

  /// Vitamin B1, in grams, per serving
  @JsonKey(
      name: 'vitamin-b1_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminB1Serving;

  /// Vitamin B1, in grams, per 100 grams of food
  @JsonKey(
      name: 'vitamin-b1_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminB1;

  /// Typical Unit for Vitamin B1
  @JsonKey(
      name: 'vitamin-b1_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? vitaminB1Unit;

  /// Vitamin B2, in grams, per serving
  @JsonKey(
      name: 'vitamin-b2_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminB2Serving;

  /// Vitamin B2, in grams, per 100 grams of food
  @JsonKey(
      name: 'vitamin-b2_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminB2;

  /// Typical Unit for Vitamin B2
  @JsonKey(
      name: 'vitamin-b2_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? vitaminB2Unit;

  /// Vitamin PP, in grams, per serving
  @JsonKey(
      name: 'vitamin-pp_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminPPServing;

  /// Vitamin PP, in grams, per 100 grams of food
  @JsonKey(
      name: 'vitamin-pp_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminPP;

  /// Typical Unit for Vitamin PP
  @JsonKey(
      name: 'vitamin-pp_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? vitaminPPUnit;

  /// Vitamin B6, in grams, per serving
  @JsonKey(
      name: 'vitamin-b6_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminB6Serving;

  /// Vitamin B6, in grams, per 100 grams of food
  @JsonKey(
      name: 'vitamin-b6_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminB6;

  /// Typical Unit for Vitamin B6
  @JsonKey(
      name: 'vitamin-b6_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? vitaminB6Unit;

  /// Vitamin B12, in grams, per serving
  @JsonKey(
      name: 'vitamin-b12_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminB12Serving;

  /// Vitamin B12, in grams, per 100 grams of food
  @JsonKey(
      name: 'vitamin-b12_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminB12;

  /// Typical Unit for Vitamin B12
  @JsonKey(
      name: 'vitamin-b12_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? vitaminB12Unit;

  /// Vitamin B9, in grams, per serving
  @JsonKey(
      name: 'vitamin-b9_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminB9Serving;

  /// Vitamin B9, in grams, per 100 grams of food
  @JsonKey(
      name: 'vitamin-b9_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminB9;

  /// Typical Unit for Vitamin B9
  @JsonKey(
      name: 'vitamin-b9_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? vitaminB9Unit;

  /// Vitamin K, in grams, per serving
  @JsonKey(
      name: 'vitamin-k_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminKServing;

  /// Vitamin K, in grams, per 100 grams of food
  @JsonKey(
      name: 'vitamin-k_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminK;

  /// Typical Unit for Vitamin K
  @JsonKey(
      name: 'vitamin-k_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? vitaminKUnit;

  /// Cholesterol, in grams, per serving
  @JsonKey(
      name: 'cholesterol_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? cholesterolServing;

  /// Cholesterol, in grams, per 100 grams of food
  @JsonKey(
      name: 'cholesterol_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? cholesterol;

  /// Typical Unit for Cholesterol
  @JsonKey(
      name: 'cholesterol_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? cholesterolUnit;

  /// Butyric Acid, in grams, per serving
  @JsonKey(
      name: 'butyric-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? butyricAcidServing;

  /// Butyric Acid, in grams, per 100 grams of food
  @JsonKey(
      name: 'butyric-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? butyricAcid;

  /// Typical Unit for Butyric Acid
  @JsonKey(
      name: 'butyric-acid_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? butyricAcidUnit;

  /// Caproic Acid, in grams, per serving
  @JsonKey(
      name: 'caproic-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? caproicAcidServing;

  /// Caproic Acid, in grams, per 100 grams of food
  @JsonKey(
      name: 'caproic-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? caproicAcid;

  /// Typical Unit for Caproic Acid
  @JsonKey(
      name: 'caproic-acid_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? caproicAcidUnit;

  /// Caprylic Acid, in grams, per serving
  @JsonKey(
      name: 'caprylic-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? caprylicAcidServing;

  /// Caprylic Acid, in grams, per 100 grams of food
  @JsonKey(
      name: 'caprylic-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? caprylicAcid;

  /// Typical Unit for Caprylic Acid
  @JsonKey(
      name: 'caprylic-acid_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? caprylicAcidUnit;

  /// Capric Acid, in grams, per serving
  @JsonKey(
      name: 'capric-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? capricAcidServing;

  /// Capric Acid, in grams, per 100 grams of food
  @JsonKey(
      name: 'capric-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? capricAcid;

  /// Typical Unit for Capric Acid
  @JsonKey(
      name: 'capric-acid_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? capricAcidUnit;

  /// Lauric Acid, in grams, per serving
  @JsonKey(
      name: 'lauric-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? lauricAcidServing;

  /// Lauric Acid, in grams, per 100 grams of food
  @JsonKey(
      name: 'lauric-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? lauricAcid;

  /// Typical Unit for Lauric Acid
  @JsonKey(
      name: 'lauric-acid_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? lauricAcidUnit;

  /// Myristic Acid, in grams, per serving
  @JsonKey(
      name: 'myristic-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? myristicAcidServing;

  /// Myristic Acid, in grams, per 100 grams of food
  @JsonKey(
      name: 'myristic-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? myristicAcid;

  /// Typical Unit for Myristic Acid
  @JsonKey(
      name: 'myristic-acid_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? myristicAcidUnit;

  /// Palmitic Acid, in grams, per serving
  @JsonKey(
      name: 'palmitic-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? palmiticAcidServing;

  /// Palmitic Acid, in grams, per 100 grams of food
  @JsonKey(
      name: 'palmitic-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? palmiticAcid;

  /// Typical Unit for Palmitic Acid
  @JsonKey(
      name: 'palmitic-acid_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? palmiticAcidUnit;

  /// Stearic Acid, in grams, per serving
  @JsonKey(
      name: 'stearic-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? stearicAcidServing;

  /// Stearic Acid, in grams, per 100 grams of food
  @JsonKey(
      name: 'stearic-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? stearicAcid;

  /// Typical Unit for Stearic Acid
  @JsonKey(
      name: 'stearic-acid_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? stearicAcidUnit;

  /// Oleic Acid, in grams, per serving
  @JsonKey(
      name: 'oleic-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? oleicAcidServing;

  /// Oleic Acid, in grams, per 100 grams of food
  @JsonKey(
      name: 'oleic-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? oleicAcid;

  /// Typical Unit for Oleic Acid
  @JsonKey(
      name: 'oleic-acid_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? oleicAcidUnit;

  /// Linoleic Acid, in grams, per serving
  @JsonKey(
      name: 'linoleic-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? linoleicAcidServing;

  /// Linoleic Acid, in grams, per 100 grams of food
  @JsonKey(
      name: 'linoleic-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? linoleicAcid;

  /// Typical Unit for Linoleic Acid
  @JsonKey(
      name: 'linoleic-acid_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? linoleicAcidUnit;

  /// Docosahexaenoic Acid, in grams, per serving
  @JsonKey(
      name: 'docosahexaenoic-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? docosahexaenoicAcidServing;

  /// Docosahexaenoic Acid, in grams, per 100 grams of food
  @JsonKey(
      name: 'docosahexaenoic-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? docosahexaenoicAcid;

  /// Typical Unit for Docosahexaenoic Acid
  @JsonKey(
      name: 'docosahexaenoic-acid_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? docosahexaenoicAcidUnit;

  /// Eicosapentaenoic Acid, in grams, per serving
  @JsonKey(
      name: 'eicosapentaenoic-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? eicosapentaenoicAcidServing;

  /// Eicosapentaenoic Acid, in grams, per 100 grams of food
  @JsonKey(
      name: 'eicosapentaenoic-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? eicosapentaenoicAcid;

  /// Typical Unit for Eicosapentaenoic Acid
  @JsonKey(
      name: 'eicosapentaenoic-acid_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? eicosapentaenoicAcidUnit;

  /// Erucic Acid, in grams, per serving
  @JsonKey(
      name: 'erucic-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? erucicAcidServing;

  /// Erucic Acid, in grams, per 100 grams of food
  @JsonKey(
      name: 'erucic-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? erucicAcid;

  /// Typical Unit for Erucic Acid
  @JsonKey(
      name: 'erucic-acid_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? erucicAcidUnit;

  /// Monounsaturated Fats, in grams, per serving
  @JsonKey(
      name: 'monounsaturated_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? monounsaturatedServing;

  /// Monounsaturated Fats, in grams, per 100 grams of food
  @JsonKey(
      name: 'monounsaturated_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? monounsaturatedAcid;

  /// Typical Unit for Monounsaturated Fats
  @JsonKey(
      name: 'monounsaturated_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? monounsaturatedUnit;

  /// Polyunsaturated Fats, in grams, per serving
  @JsonKey(
      name: 'polyunsaturated_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? polyunsaturatedServing;

  /// Polyunsaturated Fats, in grams, per 100 grams of food
  @JsonKey(
      name: 'polyunsaturated_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? polyunsaturatedAcid;

  /// Typical Unit for Polyunsaturated Fats
  @JsonKey(
      name: 'polyunsaturated_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? polyunsaturatedUnit;

  /// Alcohol, in % vol, per serving
  @JsonKey(
      name: 'alcohol_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? alcoholServing;

  /// Alcohol, in % vol, per 100g of food
  @JsonKey(
      name: 'alcohol_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? alcohol;

  /// Typical Unit for Alcohol
  @JsonKey(
      name: 'alcohol_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? alcoholUnit;

  /// Pantothenic Acid, in grams, per serving
  @JsonKey(
      name: 'pantothenic-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? pantothenicAcidServing;

  /// Pantothenic Acid, in grams, per 100 grams of food
  @JsonKey(
      name: 'pantothenic-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? pantothenicAcid;

  /// Typical Unit for Pantothenic Acid
  @JsonKey(
      name: 'pantothenic-acid_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? pantothenicAcidUnit;

  /// Biotin, in grams, per serving
  @JsonKey(
      name: 'biotin_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? biotinServing;

  /// Biotin, in grams, per 100 grams of food
  @JsonKey(
      name: 'biotin_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? biotin;

  /// Typical Unit for Biotin
  @JsonKey(
      name: 'biotin_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? biotinUnit;

  /// Chloride, in grams, per serving
  @JsonKey(
      name: 'chloride_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? chlorideServing;

  /// Chloride, in grams, per 100 grams of food
  @JsonKey(
      name: 'chloride_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? chloride;

  /// Typical Unit for Chloride
  @JsonKey(
      name: 'chloride_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? chlorideUnit;

  /// Chromium, in grams, per serving
  @JsonKey(
      name: 'chromium_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? chromiumServing;

  /// Chromium, in grams, per 100 grams of food
  @JsonKey(
      name: 'chromium_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? chromium;

  /// Typical Unit for Chromium
  @JsonKey(
      name: 'chromium_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? chromiumUnit;

  /// Fluoride, in grams, per serving
  @JsonKey(
      name: 'fluoride_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? fluorideServing;

  /// Fluoride, in grams, per 100 grams of food
  @JsonKey(
      name: 'fluoride_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? fluoride;

  /// Typical Unit for Fluoride
  @JsonKey(
      name: 'fluoride_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? fluorideUnit;

  /// Iodine, in grams, per serving
  @JsonKey(
      name: 'iodine_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? iodineServing;

  /// Iodine, in grams, per 100 grams of food
  @JsonKey(
      name: 'iodine_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? iodine;

  /// Typical Unit for Iodine
  @JsonKey(
      name: 'iodine_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? iodineUnit;

  /// Manganese, in grams, per serving
  @JsonKey(
      name: 'manganese_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? manganeseServing;

  /// Manganese, in grams, per 100 grams of food
  @JsonKey(
      name: 'manganese_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? manganese;

  /// Typical Unit for Manganese
  @JsonKey(
      name: 'manganese_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? manganeseUnit;

  /// Molybdenum, in grams, per serving
  @JsonKey(
      name: 'molybdenum_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? molybdenumServing;

  /// Molybdenum, in grams, per 100 grams of food
  @JsonKey(
      name: 'molybdenum_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? molybdenum;

  /// Typical Unit for Molybdenum
  @JsonKey(
      name: 'molybdenum_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? molybdenumUnit;

  /// Omega 3, in grams, per serving
  @JsonKey(
      name: 'omega-3-fat_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? omega3FatServing;

  /// Omega 3, in grams, per 100 grams of food
  @JsonKey(
      name: 'omega-3-fat_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? omega3Fat;

  /// Typical Unit for Omega 3
  @JsonKey(
      name: 'omega-3-fat_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? omega3FatUnit;

  /// Omega 6, in grams, per serving
  @JsonKey(
      name: 'omega-6-fat_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? omega6FatServing;

  /// Omega 6, in grams, per 100 grams of food
  @JsonKey(
      name: 'omega-6-fat_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? omega6Fat;

  /// Typical Unit for Omega 6
  @JsonKey(
      name: 'omega-6-fat_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? omega6FatUnit;

  /// Trans Fats, in grams, per serving
  @JsonKey(
      name: 'trans-fat_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? transFatServing;

  /// Trans Fats, in grams, per 100 grams of food
  @JsonKey(
      name: 'trans-fat_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? transFat;

  /// Typical Unit for Trans Fats
  @JsonKey(
      name: 'trans-fat_unit',
      includeIfNull: false,
      toJson: UnitHelper.unitToString,
      fromJson: UnitHelper.stringToUnit)
  Unit? transFatUnit;

  Nutriments({
    this.salt,
    this.fiber,
    this.sugars,
    this.fat,
    this.saturatedFat,
    this.proteins,
    this.novaGroup,
    this.energy,
    this.energyKcal,
    this.energyKj,
    this.energyKcal100g,
    this.carbohydrates,
    this.saltServing,
    this.fiberServing,
    this.sugarsServing,
    this.fatServing,
    this.fatUnit,
    this.saturatedFatServing,
    this.proteinsServing,
    this.proteinsUnit,
    this.novaGroupServing,
    this.energyServing,
    this.carbohydratesServing,
    this.carbohydratesUnit,
    this.energyKcalUnit,
    this.energyUnit,
    this.caffeineServing,
    this.caffeine,
    this.caffeineUnit,
    this.calciumServing,
    this.calcium,
    this.calciumUnit,
    this.ironServing,
    this.iron,
    this.ironUnit,
    this.vitaminC,
    this.vitaminCServing,
    this.vitaminCUnit,
    this.magnesium,
    this.magnesiumServing,
    this.magnesiumUnit,
    this.phosphorus,
    this.phosphorusServing,
    this.phosphorusUnit,
    this.potassium,
    this.potassiumServing,
    this.potassiumUnit,
    this.chloride,
    this.chlorideServing,
    this.chlorideUnit,
    this.sodium,
    this.sodiumServing,
    this.sodiumUnit,
    this.zinc,
    this.zincServing,
    this.zincUnit,
    this.copper,
    this.copperServing,
    this.copperUnit,
    this.manganese,
    this.manganeseServing,
    this.manganeseUnit,
    this.fluoride,
    this.fluorideServing,
    this.fluorideUnit,
    this.selenium,
    this.seleniumServing,
    this.seleniumUnit,
    this.chromium,
    this.chromiumServing,
    this.chromiumUnit,
    this.molybdenum,
    this.molybdenumServing,
    this.molybdenumUnit,
    this.iodine,
    this.iodineServing,
    this.iodineUnit,
    this.vitaminA,
    this.vitaminAServing,
    this.vitaminAUnit,
    this.vitaminE,
    this.vitaminEServing,
    this.vitaminEUnit,
    this.vitaminD,
    this.vitaminDServing,
    this.vitaminDUnit,
    this.vitaminB1,
    this.vitaminB1Serving,
    this.vitaminB1Unit,
    this.vitaminB2,
    this.vitaminB2Serving,
    this.vitaminB2Unit,
    this.vitaminPP,
    this.vitaminPPServing,
    this.vitaminPPUnit,
    this.vitaminB6,
    this.vitaminB6Serving,
    this.vitaminB6Unit,
    this.vitaminK,
    this.vitaminKServing,
    this.vitaminKUnit,
    this.vitaminB12,
    this.vitaminB12Serving,
    this.vitaminB12Unit,
    this.vitaminB9,
    this.vitaminB9Serving,
    this.vitaminB9Unit,
    this.biotin,
    this.biotinServing,
    this.biotinUnit,
    this.pantothenicAcid,
    this.pantothenicAcidServing,
    this.pantothenicAcidUnit,
    this.transFat,
    this.transFatServing,
    this.transFatUnit,
    this.cholesterol,
    this.cholesterolServing,
    this.cholesterolUnit,
    this.alcohol,
    this.alcoholServing,
    this.alcoholUnit,
    this.butyricAcid,
    this.butyricAcidServing,
    this.butyricAcidUnit,
    this.capricAcid,
    this.capricAcidServing,
    this.capricAcidUnit,
    this.caproicAcid,
    this.caproicAcidServing,
    this.caproicAcidUnit,
    this.caprylicAcid,
    this.caprylicAcidServing,
    this.caprylicAcidUnit,
    this.docosahexaenoicAcid,
    this.docosahexaenoicAcidServing,
    this.docosahexaenoicAcidUnit,
    this.eicosapentaenoicAcid,
    this.eicosapentaenoicAcidServing,
    this.eicosapentaenoicAcidUnit,
    this.erucicAcid,
    this.erucicAcidServing,
    this.erucicAcidUnit,
    this.lauricAcid,
    this.lauricAcidServing,
    this.lauricAcidUnit,
    this.linoleicAcid,
    this.linoleicAcidServing,
    this.linoleicAcidUnit,
    this.monounsaturatedAcid,
    this.monounsaturatedServing,
    this.monounsaturatedUnit,
    this.myristicAcid,
    this.myristicAcidServing,
    this.myristicAcidUnit,
    this.oleicAcid,
    this.oleicAcidServing,
    this.oleicAcidUnit,
    this.palmiticAcid,
    this.palmiticAcidServing,
    this.palmiticAcidUnit,
    this.polyunsaturatedAcid,
    this.polyunsaturatedServing,
    this.polyunsaturatedUnit,
    this.omega3Fat,
    this.omega3FatServing,
    this.omega3FatUnit,
    this.omega6Fat,
    this.omega6FatServing,
    this.omega6FatUnit,
    this.stearicAcid,
    this.stearicAcidServing,
    this.stearicAcidUnit,
  });

  factory Nutriments.fromJson(Map<String, dynamic> json) =>
      _$NutrimentsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NutrimentsToJson(this);

  static Map<String, dynamic> toJsonHelper(Nutriments? n) =>
      n != null ? _$NutrimentsToJson(n) : {};

  /// Nutrient ids supported by [Nutriments].
  ///
  /// To be used when another source of nutrients (e.g. [OrderedNutrient])
  /// has a broader list of nutrients - that we simply could not handle with
  /// [Nutriments].
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
