import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/utils/UnitHelper.dart';
import '../interface/JsonObject.dart';

part 'Nutriments.g.dart';

@JsonSerializable()
class Nutriments extends JsonObject {
  @JsonKey(
      name: 'salt_100g', includeIfNull: false, fromJson: JsonObject.parseDouble)
  double? salt;
  @JsonKey(
      name: 'fiber_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? fiber;
  @JsonKey(
      name: 'sugars_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? sugars;
  @JsonKey(
      name: 'fat_100g', includeIfNull: false, fromJson: JsonObject.parseDouble)
  double? fat;
  @JsonKey(
      name: 'saturated-fat_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? saturatedFat;
  @JsonKey(
      name: 'proteins_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? proteins;
  @JsonKey(
      name: 'nova-group_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseInt)
  int? novaGroup;
  @JsonKey(
      name: 'energy_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? energy;
  @JsonKey(
      name: 'energy-kcal',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? energyKcal;
  @JsonKey(
      name: 'energy-kcal_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? energyKcal100g;
  @JsonKey(
      name: 'carbohydrates_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? carbohydrates;

  @JsonKey(
      name: 'salt_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? saltServing;
  @JsonKey(
      name: 'fiber_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? fiberServing;
  @JsonKey(
      name: 'sugars_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? sugarsServing;
  @JsonKey(
      name: 'fat_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? fatServing;
  @JsonKey(
      name: 'saturated-fat_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? saturatedFatServing;
  @JsonKey(
      name: 'proteins_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? proteinsServing;
  @JsonKey(
      name: 'proteins_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? proteinsUnit;
  @JsonKey(
      name: 'nova-group_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseInt)
  int? novaGroupServing;
  @JsonKey(
      name: 'energy_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? energyServing;
  @JsonKey(
      name: 'carbohydrates_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? carbohydratesServing;

  @JsonKey(
      name: 'energy_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? energyUnit;

  @JsonKey(
      name: 'energy-kcal_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? energyKcalUnit;

  @JsonKey(
      name: 'caffeine_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? caffeineServing;

  @JsonKey(
      name: 'caffeine_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? caffeine;

  @JsonKey(
      name: 'caffeine_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? caffeineUnit;

  @JsonKey(
      name: 'calcium_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? calciumServing;

  @JsonKey(
      name: 'calcium_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? calcium;

  @JsonKey(
      name: 'calcium_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? calciumUnit;

  @JsonKey(
      name: 'iron_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? ironServing;

  @JsonKey(
      name: 'iron_100g', includeIfNull: false, fromJson: JsonObject.parseDouble)
  double? iron;

  @JsonKey(
      name: 'iron_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? ironUnit;

  @JsonKey(
      name: 'vitamin-c_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminCServing;

  @JsonKey(
      name: 'vitamin-c_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminC;

  @JsonKey(
      name: 'vitamin-c_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? vitaminCUnit;

  @JsonKey(
      name: 'magnesium_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? magnesiumServing;

  @JsonKey(
      name: 'magnesium_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? magnesium;

  @JsonKey(
      name: 'magnesium_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? magnesiumUnit;

  @JsonKey(
      name: 'phosphorus_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? phosphorusServing;

  @JsonKey(
      name: 'phosphorus_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? phosphorus;

  @JsonKey(
      name: 'phosphorus_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? phosphorusUnit;

  @JsonKey(
      name: 'potassium_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? potassiumServing;

  @JsonKey(
      name: 'potassium_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? potassium;

  @JsonKey(
      name: 'potassium_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? potassiumUnit;

  @JsonKey(
      name: 'sodium_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? sodiumServing;

  @JsonKey(
      name: 'sodium_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? sodium;

  @JsonKey(
      name: 'sodium_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? sodiumUnit;

  @JsonKey(
      name: 'zinc_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? zincServing;

  @JsonKey(
      name: 'zinc_100g', includeIfNull: false, fromJson: JsonObject.parseDouble)
  double? zinc;

  @JsonKey(
      name: 'zinc_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? zincUnit;

  @JsonKey(
      name: 'copper_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? copperServing;

  @JsonKey(
      name: 'copper_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? copper;

  @JsonKey(
      name: 'copper_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? copperUnit;

  @JsonKey(
      name: 'selenium_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? seleniumServing;

  @JsonKey(
      name: 'selenium_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? selenium;

  @JsonKey(
      name: 'selenium_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? seleniumUnit;

  @JsonKey(
      name: 'vitamin-a_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminAServing;

  @JsonKey(
      name: 'vitamin-a_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminA;

  @JsonKey(
      name: 'vitamin-a_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? vitaminAUnit;

  @JsonKey(
      name: 'vitamin-e_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminEServing;

  @JsonKey(
      name: 'vitamin-e_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminE;

  @JsonKey(
      name: 'vitamin-e_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? vitaminEUnit;

  @JsonKey(
      name: 'vitamin-d_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminDServing;

  @JsonKey(
      name: 'vitamin-d_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminD;

  @JsonKey(
      name: 'vitamin-d_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? vitaminDUnit;

  @JsonKey(
      name: 'vitamin-b1_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminB1Serving;

  @JsonKey(
      name: 'vitamin-b1_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminB1;

  @JsonKey(
      name: 'vitamin-b1_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? vitaminB1Unit;

  @JsonKey(
      name: 'vitamin-b2_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminB2Serving;

  @JsonKey(
      name: 'vitamin-b2_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminB2;

  @JsonKey(
      name: 'vitamin-b2_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? vitaminB2Unit;

  @JsonKey(
      name: 'vitamin-pp_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminPPServing;

  @JsonKey(
      name: 'vitamin-pp_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminPP;

  @JsonKey(
      name: 'vitamin-pp_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? vitaminPPUnit;

  @JsonKey(
      name: 'vitamin-b6_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminB6Serving;

  @JsonKey(
      name: 'vitamin-b6_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminB6;

  @JsonKey(
      name: 'vitamin-b6_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? vitaminB6Unit;

  @JsonKey(
      name: 'vitamin-b12_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminB12Serving;

  @JsonKey(
      name: 'vitamin-b12_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminB12;

  @JsonKey(
      name: 'vitamin-b12_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? vitaminB12Unit;

  @JsonKey(
      name: 'vitamin-b9_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminB9Serving;

  @JsonKey(
      name: 'vitamin-b9_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminB9;

  @JsonKey(
      name: 'vitamin-b9_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? vitaminB9Unit;

  @JsonKey(
      name: 'vitamin-k_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminKServing;

  @JsonKey(
      name: 'vitamin-k_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? vitaminK;

  @JsonKey(
      name: 'vitamin-k_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? vitaminKUnit;

  @JsonKey(
      name: 'cholesterol_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? cholesterolServing;

  @JsonKey(
      name: 'cholesterol_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? cholesterol;

  @JsonKey(
      name: 'cholesterol_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? cholesterolUnit;

  @JsonKey(
      name: 'butyric-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? butyricAcidServing;

  @JsonKey(
      name: 'butyric-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? butyricAcid;

  @JsonKey(
      name: 'butyric-acid_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? butyricAcidUnit;

  @JsonKey(
      name: 'caproic-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? caproicAcidServing;

  @JsonKey(
      name: 'caproic-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? caproicAcid;

  @JsonKey(
      name: 'caproic-acid_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? caproicAcidUnit;

  @JsonKey(
      name: 'caprylic-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? caprylicAcidServing;

  @JsonKey(
      name: 'caprylic-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? caprylicAcid;

  @JsonKey(
      name: 'caprylic-acid_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? caprylicAcidUnit;

  @JsonKey(
      name: 'capric-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? capricAcidServing;

  @JsonKey(
      name: 'capric-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? capricAcid;

  @JsonKey(
      name: 'capric-acid_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? capricAcidUnit;

  @JsonKey(
      name: 'lauric-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? lauricAcidServing;

  @JsonKey(
      name: 'lauric-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? lauricAcid;

  @JsonKey(
      name: 'lauric-acid_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? lauricAcidUnit;

  @JsonKey(
      name: 'myristic-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? myristicAcidServing;

  @JsonKey(
      name: 'myristic-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? myristicAcid;

  @JsonKey(
      name: 'myristic-acid_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? myristicAcidUnit;

  @JsonKey(
      name: 'palmitic-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? palmiticAcidServing;

  @JsonKey(
      name: 'palmitic-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? palmiticAcid;

  @JsonKey(
      name: 'palmitic-acid_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? palmiticAcidUnit;

  @JsonKey(
      name: 'stearic-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? stearicAcidServing;

  @JsonKey(
      name: 'stearic-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? stearicAcid;

  @JsonKey(
      name: 'stearic-acid_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? stearicAcidUnit;

  @JsonKey(
      name: 'oleic-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? oleicAcidServing;

  @JsonKey(
      name: 'oleic-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? oleicAcid;

  @JsonKey(
      name: 'oleic-acid_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? oleicAcidUnit;

  @JsonKey(
      name: 'linoleic-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? linoleicAcidServing;

  @JsonKey(
      name: 'linoleic-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? linoleicAcid;

  @JsonKey(
      name: 'linoleic-acid_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? linoleicAcidUnit;

  @JsonKey(
      name: 'docosahexaenoic-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? docosahexaenoicAcidServing;

  @JsonKey(
      name: 'docosahexaenoic-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? docosahexaenoicAcid;

  @JsonKey(
      name: 'docosahexaenoic-acid_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? docosahexaenoicAcidUnit;

  @JsonKey(
      name: 'eicosapentaenoic-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? eicosapentaenoicAcidServing;

  @JsonKey(
      name: 'eicosapentaenoic-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? eicosapentaenoicAcid;

  @JsonKey(
      name: 'eicosapentaenoic-acid_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? eicosapentaenoicAcidUnit;

  @JsonKey(
      name: 'erucic-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? erucicAcidServing;

  @JsonKey(
      name: 'erucic-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? erucicAcid;

  @JsonKey(
      name: 'erucic-acid_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? erucicAcidUnit;

  @JsonKey(
      name: 'monounsaturated_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? monounsaturatedServing;

  @JsonKey(
      name: 'monounsaturated_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? monounsaturatedAcid;

  @JsonKey(
      name: 'monounsaturated_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? monounsaturatedUnit;

  @JsonKey(
      name: 'polyunsaturated_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? polyunsaturatedServing;

  @JsonKey(
      name: 'polyunsaturated_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? polyunsaturatedAcid;

  @JsonKey(
      name: 'polyunsaturated_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? polyunsaturatedUnit;

  @JsonKey(
      name: 'alcohol: % vol of alcohol_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? alcoholServing;

  @JsonKey(
      name: 'alcohol: % vol of alcohol_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? alcohol;

  @JsonKey(
      name: 'alcohol: % vol of alcohol_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? alcoholUnit;

  @JsonKey(
      name: 'pantothenic-acid_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? pantothenicAcidServing;

  @JsonKey(
      name: 'pantothenic-acid_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? pantothenicAcid;

  @JsonKey(
      name: 'pantothenic-acid_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? pantothenicAcidUnit;

  @JsonKey(
      name: 'biotin_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? biotinServing;

  @JsonKey(
      name: 'biotin_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? biotin;

  @JsonKey(
      name: 'biotin_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? biotinUnit;

  @JsonKey(
      name: 'chloride_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? chlorideServing;

  @JsonKey(
      name: 'chloride_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? chloride;

  @JsonKey(
      name: 'chloride_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? chlorideUnit;

  @JsonKey(
      name: 'chromium_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? chromiumServing;

  @JsonKey(
      name: 'chromium_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? chromium;

  @JsonKey(
      name: 'chromium_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? chromiumUnit;

  @JsonKey(
      name: 'fluoride_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? fluorideServing;

  @JsonKey(
      name: 'fluoride_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? fluoride;

  @JsonKey(
      name: 'fluoride_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? fluorideUnit;

  @JsonKey(
      name: 'iodine_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? iodineServing;

  @JsonKey(
      name: 'iodine_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? iodine;

  @JsonKey(
      name: 'iodine_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? iodineUnit;

  @JsonKey(
      name: 'manganese_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? manganeseServing;

  @JsonKey(
      name: 'manganese_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? manganese;

  @JsonKey(
      name: 'manganese_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? manganeseUnit;

  @JsonKey(
      name: 'molybdenum_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? molybdenumServing;

  @JsonKey(
      name: 'molybdenum_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? molybdenum;

  @JsonKey(
      name: 'molybdenum_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? molybdenumUnit;

  @JsonKey(
      name: 'omega-3-fat_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? omega3FatServing;

  @JsonKey(
      name: 'omega-3-fat_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? omega3Fat;

  @JsonKey(
      name: 'omega-3-fat_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? omega3FatUnit;

  @JsonKey(
      name: 'omega-6-fat_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? omega6FatServing;

  @JsonKey(
      name: 'omega-6-fat_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? omega6Fat;

  @JsonKey(
      name: 'omega-6-fat_unit',
      includeIfNull: false,
      fromJson: UnitHelper.stringToUnit)
  Unit? omega6FatUnit;

  @JsonKey(
      name: 'trans-fat_serving',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? transFatServing;

  @JsonKey(
      name: 'trans-fat_100g',
      includeIfNull: false,
      fromJson: JsonObject.parseDouble)
  double? transFat;

  @JsonKey(
      name: 'trans-fat_unit',
      includeIfNull: false,
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
    this.energyKcal100g,
    this.carbohydrates,
    this.saltServing,
    this.fiberServing,
    this.sugarsServing,
    this.fatServing,
    this.saturatedFatServing,
    this.proteinsServing,
    this.proteinsUnit,
    this.novaGroupServing,
    this.energyServing,
    this.carbohydratesServing,
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
}
