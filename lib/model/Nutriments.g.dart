// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Nutriments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Nutriments _$NutrimentsFromJson(Map<String, dynamic> json) => Nutriments(
      salt: JsonObject.parseDouble(json['salt_100g']),
      fiber: JsonObject.parseDouble(json['fiber_100g']),
      sugars: JsonObject.parseDouble(json['sugars_100g']),
      fat: JsonObject.parseDouble(json['fat_100g']),
      saturatedFat: JsonObject.parseDouble(json['saturated-fat_100g']),
      proteins: JsonObject.parseDouble(json['proteins_100g']),
      novaGroup: JsonObject.parseInt(json['nova-group_100g']),
      energy: JsonObject.parseDouble(json['energy_100g']),
      energyKcal: JsonObject.parseDouble(json['energy-kcal']),
      energyKj: JsonObject.parseDouble(json['energy-kj']),
      energyKcal100g: JsonObject.parseDouble(json['energy-kcal_100g']),
      carbohydrates: JsonObject.parseDouble(json['carbohydrates_100g']),
      saltServing: JsonObject.parseDouble(json['salt_serving']),
      fiberServing: JsonObject.parseDouble(json['fiber_serving']),
      sugarsServing: JsonObject.parseDouble(json['sugars_serving']),
      fatServing: JsonObject.parseDouble(json['fat_serving']),
      fatUnit: UnitHelper.stringToUnit(json['fat_unit'] as String?),
      saturatedFatServing:
          JsonObject.parseDouble(json['saturated-fat_serving']),
      proteinsServing: JsonObject.parseDouble(json['proteins_serving']),
      proteinsUnit: UnitHelper.stringToUnit(json['proteins_unit'] as String?),
      novaGroupServing: JsonObject.parseInt(json['nova-group_serving']),
      energyServing: JsonObject.parseDouble(json['energy_serving']),
      carbohydratesServing:
          JsonObject.parseDouble(json['carbohydrates_serving']),
      carbohydratesUnit:
          UnitHelper.stringToUnit(json['carbohydrates_unit'] as String?),
      energyKcalUnit:
          UnitHelper.stringToUnit(json['energy-kcal_unit'] as String?),
      energyUnit: UnitHelper.stringToUnit(json['energy_unit'] as String?),
      caffeineServing: JsonObject.parseDouble(json['caffeine_serving']),
      caffeine: JsonObject.parseDouble(json['caffeine_100g']),
      caffeineUnit: UnitHelper.stringToUnit(json['caffeine_unit'] as String?),
      calciumServing: JsonObject.parseDouble(json['calcium_serving']),
      calcium: JsonObject.parseDouble(json['calcium_100g']),
      calciumUnit: UnitHelper.stringToUnit(json['calcium_unit'] as String?),
      ironServing: JsonObject.parseDouble(json['iron_serving']),
      iron: JsonObject.parseDouble(json['iron_100g']),
      ironUnit: UnitHelper.stringToUnit(json['iron_unit'] as String?),
      vitaminC: JsonObject.parseDouble(json['vitamin-c_100g']),
      vitaminCServing: JsonObject.parseDouble(json['vitamin-c_serving']),
      vitaminCUnit: UnitHelper.stringToUnit(json['vitamin-c_unit'] as String?),
      magnesium: JsonObject.parseDouble(json['magnesium_100g']),
      magnesiumServing: JsonObject.parseDouble(json['magnesium_serving']),
      magnesiumUnit: UnitHelper.stringToUnit(json['magnesium_unit'] as String?),
      phosphorus: JsonObject.parseDouble(json['phosphorus_100g']),
      phosphorusServing: JsonObject.parseDouble(json['phosphorus_serving']),
      phosphorusUnit:
          UnitHelper.stringToUnit(json['phosphorus_unit'] as String?),
      potassium: JsonObject.parseDouble(json['potassium_100g']),
      potassiumServing: JsonObject.parseDouble(json['potassium_serving']),
      potassiumUnit: UnitHelper.stringToUnit(json['potassium_unit'] as String?),
      chloride: JsonObject.parseDouble(json['chloride_100g']),
      chlorideServing: JsonObject.parseDouble(json['chloride_serving']),
      chlorideUnit: UnitHelper.stringToUnit(json['chloride_unit'] as String?),
      sodium: JsonObject.parseDouble(json['sodium_100g']),
      sodiumServing: JsonObject.parseDouble(json['sodium_serving']),
      sodiumUnit: UnitHelper.stringToUnit(json['sodium_unit'] as String?),
      zinc: JsonObject.parseDouble(json['zinc_100g']),
      zincServing: JsonObject.parseDouble(json['zinc_serving']),
      zincUnit: UnitHelper.stringToUnit(json['zinc_unit'] as String?),
      copper: JsonObject.parseDouble(json['copper_100g']),
      copperServing: JsonObject.parseDouble(json['copper_serving']),
      copperUnit: UnitHelper.stringToUnit(json['copper_unit'] as String?),
      manganese: JsonObject.parseDouble(json['manganese_100g']),
      manganeseServing: JsonObject.parseDouble(json['manganese_serving']),
      manganeseUnit: UnitHelper.stringToUnit(json['manganese_unit'] as String?),
      fluoride: JsonObject.parseDouble(json['fluoride_100g']),
      fluorideServing: JsonObject.parseDouble(json['fluoride_serving']),
      fluorideUnit: UnitHelper.stringToUnit(json['fluoride_unit'] as String?),
      selenium: JsonObject.parseDouble(json['selenium_100g']),
      seleniumServing: JsonObject.parseDouble(json['selenium_serving']),
      seleniumUnit: UnitHelper.stringToUnit(json['selenium_unit'] as String?),
      chromium: JsonObject.parseDouble(json['chromium_100g']),
      chromiumServing: JsonObject.parseDouble(json['chromium_serving']),
      chromiumUnit: UnitHelper.stringToUnit(json['chromium_unit'] as String?),
      molybdenum: JsonObject.parseDouble(json['molybdenum_100g']),
      molybdenumServing: JsonObject.parseDouble(json['molybdenum_serving']),
      molybdenumUnit:
          UnitHelper.stringToUnit(json['molybdenum_unit'] as String?),
      iodine: JsonObject.parseDouble(json['iodine_100g']),
      iodineServing: JsonObject.parseDouble(json['iodine_serving']),
      iodineUnit: UnitHelper.stringToUnit(json['iodine_unit'] as String?),
      vitaminA: JsonObject.parseDouble(json['vitamin-a_100g']),
      vitaminAServing: JsonObject.parseDouble(json['vitamin-a_serving']),
      vitaminAUnit: UnitHelper.stringToUnit(json['vitamin-a_unit'] as String?),
      vitaminE: JsonObject.parseDouble(json['vitamin-e_100g']),
      vitaminEServing: JsonObject.parseDouble(json['vitamin-e_serving']),
      vitaminEUnit: UnitHelper.stringToUnit(json['vitamin-e_unit'] as String?),
      vitaminD: JsonObject.parseDouble(json['vitamin-d_100g']),
      vitaminDServing: JsonObject.parseDouble(json['vitamin-d_serving']),
      vitaminDUnit: UnitHelper.stringToUnit(json['vitamin-d_unit'] as String?),
      vitaminB1: JsonObject.parseDouble(json['vitamin-b1_100g']),
      vitaminB1Serving: JsonObject.parseDouble(json['vitamin-b1_serving']),
      vitaminB1Unit:
          UnitHelper.stringToUnit(json['vitamin-b1_unit'] as String?),
      vitaminB2: JsonObject.parseDouble(json['vitamin-b2_100g']),
      vitaminB2Serving: JsonObject.parseDouble(json['vitamin-b2_serving']),
      vitaminB2Unit:
          UnitHelper.stringToUnit(json['vitamin-b2_unit'] as String?),
      vitaminPP: JsonObject.parseDouble(json['vitamin-pp_100g']),
      vitaminPPServing: JsonObject.parseDouble(json['vitamin-pp_serving']),
      vitaminPPUnit:
          UnitHelper.stringToUnit(json['vitamin-pp_unit'] as String?),
      vitaminB6: JsonObject.parseDouble(json['vitamin-b6_100g']),
      vitaminB6Serving: JsonObject.parseDouble(json['vitamin-b6_serving']),
      vitaminB6Unit:
          UnitHelper.stringToUnit(json['vitamin-b6_unit'] as String?),
      vitaminK: JsonObject.parseDouble(json['vitamin-k_100g']),
      vitaminKServing: JsonObject.parseDouble(json['vitamin-k_serving']),
      vitaminKUnit: UnitHelper.stringToUnit(json['vitamin-k_unit'] as String?),
      vitaminB12: JsonObject.parseDouble(json['vitamin-b12_100g']),
      vitaminB12Serving: JsonObject.parseDouble(json['vitamin-b12_serving']),
      vitaminB12Unit:
          UnitHelper.stringToUnit(json['vitamin-b12_unit'] as String?),
      vitaminB9: JsonObject.parseDouble(json['vitamin-b9_100g']),
      vitaminB9Serving: JsonObject.parseDouble(json['vitamin-b9_serving']),
      vitaminB9Unit:
          UnitHelper.stringToUnit(json['vitamin-b9_unit'] as String?),
      biotin: JsonObject.parseDouble(json['biotin_100g']),
      biotinServing: JsonObject.parseDouble(json['biotin_serving']),
      biotinUnit: UnitHelper.stringToUnit(json['biotin_unit'] as String?),
      pantothenicAcid: JsonObject.parseDouble(json['pantothenic-acid_100g']),
      pantothenicAcidServing:
          JsonObject.parseDouble(json['pantothenic-acid_serving']),
      pantothenicAcidUnit:
          UnitHelper.stringToUnit(json['pantothenic-acid_unit'] as String?),
      transFat: JsonObject.parseDouble(json['trans-fat_100g']),
      transFatServing: JsonObject.parseDouble(json['trans-fat_serving']),
      transFatUnit: UnitHelper.stringToUnit(json['trans-fat_unit'] as String?),
      cholesterol: JsonObject.parseDouble(json['cholesterol_100g']),
      cholesterolServing: JsonObject.parseDouble(json['cholesterol_serving']),
      cholesterolUnit:
          UnitHelper.stringToUnit(json['cholesterol_unit'] as String?),
      alcohol: JsonObject.parseDouble(json['alcohol_100g']),
      alcoholServing: JsonObject.parseDouble(json['alcohol_serving']),
      alcoholUnit: UnitHelper.stringToUnit(json['alcohol_unit'] as String?),
      butyricAcid: JsonObject.parseDouble(json['butyric-acid_100g']),
      butyricAcidServing: JsonObject.parseDouble(json['butyric-acid_serving']),
      butyricAcidUnit:
          UnitHelper.stringToUnit(json['butyric-acid_unit'] as String?),
      capricAcid: JsonObject.parseDouble(json['capric-acid_100g']),
      capricAcidServing: JsonObject.parseDouble(json['capric-acid_serving']),
      capricAcidUnit:
          UnitHelper.stringToUnit(json['capric-acid_unit'] as String?),
      caproicAcid: JsonObject.parseDouble(json['caproic-acid_100g']),
      caproicAcidServing: JsonObject.parseDouble(json['caproic-acid_serving']),
      caproicAcidUnit:
          UnitHelper.stringToUnit(json['caproic-acid_unit'] as String?),
      caprylicAcid: JsonObject.parseDouble(json['caprylic-acid_100g']),
      caprylicAcidServing:
          JsonObject.parseDouble(json['caprylic-acid_serving']),
      caprylicAcidUnit:
          UnitHelper.stringToUnit(json['caprylic-acid_unit'] as String?),
      docosahexaenoicAcid:
          JsonObject.parseDouble(json['docosahexaenoic-acid_100g']),
      docosahexaenoicAcidServing:
          JsonObject.parseDouble(json['docosahexaenoic-acid_serving']),
      docosahexaenoicAcidUnit:
          UnitHelper.stringToUnit(json['docosahexaenoic-acid_unit'] as String?),
      eicosapentaenoicAcid:
          JsonObject.parseDouble(json['eicosapentaenoic-acid_100g']),
      eicosapentaenoicAcidServing:
          JsonObject.parseDouble(json['eicosapentaenoic-acid_serving']),
      eicosapentaenoicAcidUnit: UnitHelper.stringToUnit(
          json['eicosapentaenoic-acid_unit'] as String?),
      erucicAcid: JsonObject.parseDouble(json['erucic-acid_100g']),
      erucicAcidServing: JsonObject.parseDouble(json['erucic-acid_serving']),
      erucicAcidUnit:
          UnitHelper.stringToUnit(json['erucic-acid_unit'] as String?),
      lauricAcid: JsonObject.parseDouble(json['lauric-acid_100g']),
      lauricAcidServing: JsonObject.parseDouble(json['lauric-acid_serving']),
      lauricAcidUnit:
          UnitHelper.stringToUnit(json['lauric-acid_unit'] as String?),
      linoleicAcid: JsonObject.parseDouble(json['linoleic-acid_100g']),
      linoleicAcidServing:
          JsonObject.parseDouble(json['linoleic-acid_serving']),
      linoleicAcidUnit:
          UnitHelper.stringToUnit(json['linoleic-acid_unit'] as String?),
      monounsaturatedAcid: JsonObject.parseDouble(json['monounsaturated_100g']),
      monounsaturatedServing:
          JsonObject.parseDouble(json['monounsaturated_serving']),
      monounsaturatedUnit:
          UnitHelper.stringToUnit(json['monounsaturated_unit'] as String?),
      myristicAcid: JsonObject.parseDouble(json['myristic-acid_100g']),
      myristicAcidServing:
          JsonObject.parseDouble(json['myristic-acid_serving']),
      myristicAcidUnit:
          UnitHelper.stringToUnit(json['myristic-acid_unit'] as String?),
      oleicAcid: JsonObject.parseDouble(json['oleic-acid_100g']),
      oleicAcidServing: JsonObject.parseDouble(json['oleic-acid_serving']),
      oleicAcidUnit:
          UnitHelper.stringToUnit(json['oleic-acid_unit'] as String?),
      palmiticAcid: JsonObject.parseDouble(json['palmitic-acid_100g']),
      palmiticAcidServing:
          JsonObject.parseDouble(json['palmitic-acid_serving']),
      palmiticAcidUnit:
          UnitHelper.stringToUnit(json['palmitic-acid_unit'] as String?),
      polyunsaturatedAcid: JsonObject.parseDouble(json['polyunsaturated_100g']),
      polyunsaturatedServing:
          JsonObject.parseDouble(json['polyunsaturated_serving']),
      polyunsaturatedUnit:
          UnitHelper.stringToUnit(json['polyunsaturated_unit'] as String?),
      omega3Fat: JsonObject.parseDouble(json['omega-3-fat_100g']),
      omega3FatServing: JsonObject.parseDouble(json['omega-3-fat_serving']),
      omega3FatUnit:
          UnitHelper.stringToUnit(json['omega-3-fat_unit'] as String?),
      omega6Fat: JsonObject.parseDouble(json['omega-6-fat_100g']),
      omega6FatServing: JsonObject.parseDouble(json['omega-6-fat_serving']),
      omega6FatUnit:
          UnitHelper.stringToUnit(json['omega-6-fat_unit'] as String?),
      stearicAcid: JsonObject.parseDouble(json['stearic-acid_100g']),
      stearicAcidServing: JsonObject.parseDouble(json['stearic-acid_serving']),
      stearicAcidUnit:
          UnitHelper.stringToUnit(json['stearic-acid_unit'] as String?),
    );

Map<String, dynamic> _$NutrimentsToJson(Nutriments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('salt_100g', instance.salt);
  writeNotNull('fiber_100g', instance.fiber);
  writeNotNull('sugars_100g', instance.sugars);
  writeNotNull('fat_100g', instance.fat);
  writeNotNull('saturated-fat_100g', instance.saturatedFat);
  writeNotNull('proteins_100g', instance.proteins);
  writeNotNull('nova-group_100g', instance.novaGroup);
  writeNotNull('energy_100g', instance.energy);
  writeNotNull('energy-kcal', instance.energyKcal);
  writeNotNull('energy-kj', instance.energyKj);
  writeNotNull('energy-kcal_100g', instance.energyKcal100g);
  writeNotNull('carbohydrates_100g', instance.carbohydrates);
  writeNotNull('salt_serving', instance.saltServing);
  writeNotNull('fiber_serving', instance.fiberServing);
  writeNotNull('sugars_serving', instance.sugarsServing);
  writeNotNull('fat_serving', instance.fatServing);
  writeNotNull('fat_unit', UnitHelper.unitToString(instance.fatUnit));
  writeNotNull('saturated-fat_serving', instance.saturatedFatServing);
  writeNotNull('proteins_serving', instance.proteinsServing);
  writeNotNull('proteins_unit', UnitHelper.unitToString(instance.proteinsUnit));
  writeNotNull('nova-group_serving', instance.novaGroupServing);
  writeNotNull('energy_serving', instance.energyServing);
  writeNotNull('carbohydrates_serving', instance.carbohydratesServing);
  writeNotNull('carbohydrates_unit',
      UnitHelper.unitToString(instance.carbohydratesUnit));
  writeNotNull('energy_unit', UnitHelper.unitToString(instance.energyUnit));
  writeNotNull(
      'energy-kcal_unit', UnitHelper.unitToString(instance.energyKcalUnit));
  writeNotNull('caffeine_serving', instance.caffeineServing);
  writeNotNull('caffeine_100g', instance.caffeine);
  writeNotNull('caffeine_unit', UnitHelper.unitToString(instance.caffeineUnit));
  writeNotNull('calcium_serving', instance.calciumServing);
  writeNotNull('calcium_100g', instance.calcium);
  writeNotNull('calcium_unit', UnitHelper.unitToString(instance.calciumUnit));
  writeNotNull('iron_serving', instance.ironServing);
  writeNotNull('iron_100g', instance.iron);
  writeNotNull('iron_unit', UnitHelper.unitToString(instance.ironUnit));
  writeNotNull('vitamin-c_serving', instance.vitaminCServing);
  writeNotNull('vitamin-c_100g', instance.vitaminC);
  writeNotNull(
      'vitamin-c_unit', UnitHelper.unitToString(instance.vitaminCUnit));
  writeNotNull('magnesium_serving', instance.magnesiumServing);
  writeNotNull('magnesium_100g', instance.magnesium);
  writeNotNull(
      'magnesium_unit', UnitHelper.unitToString(instance.magnesiumUnit));
  writeNotNull('phosphorus_serving', instance.phosphorusServing);
  writeNotNull('phosphorus_100g', instance.phosphorus);
  writeNotNull(
      'phosphorus_unit', UnitHelper.unitToString(instance.phosphorusUnit));
  writeNotNull('potassium_serving', instance.potassiumServing);
  writeNotNull('potassium_100g', instance.potassium);
  writeNotNull(
      'potassium_unit', UnitHelper.unitToString(instance.potassiumUnit));
  writeNotNull('sodium_serving', instance.sodiumServing);
  writeNotNull('sodium_100g', instance.sodium);
  writeNotNull('sodium_unit', UnitHelper.unitToString(instance.sodiumUnit));
  writeNotNull('zinc_serving', instance.zincServing);
  writeNotNull('zinc_100g', instance.zinc);
  writeNotNull('zinc_unit', UnitHelper.unitToString(instance.zincUnit));
  writeNotNull('copper_serving', instance.copperServing);
  writeNotNull('copper_100g', instance.copper);
  writeNotNull('copper_unit', UnitHelper.unitToString(instance.copperUnit));
  writeNotNull('selenium_serving', instance.seleniumServing);
  writeNotNull('selenium_100g', instance.selenium);
  writeNotNull('selenium_unit', UnitHelper.unitToString(instance.seleniumUnit));
  writeNotNull('vitamin-a_serving', instance.vitaminAServing);
  writeNotNull('vitamin-a_100g', instance.vitaminA);
  writeNotNull(
      'vitamin-a_unit', UnitHelper.unitToString(instance.vitaminAUnit));
  writeNotNull('vitamin-e_serving', instance.vitaminEServing);
  writeNotNull('vitamin-e_100g', instance.vitaminE);
  writeNotNull(
      'vitamin-e_unit', UnitHelper.unitToString(instance.vitaminEUnit));
  writeNotNull('vitamin-d_serving', instance.vitaminDServing);
  writeNotNull('vitamin-d_100g', instance.vitaminD);
  writeNotNull(
      'vitamin-d_unit', UnitHelper.unitToString(instance.vitaminDUnit));
  writeNotNull('vitamin-b1_serving', instance.vitaminB1Serving);
  writeNotNull('vitamin-b1_100g', instance.vitaminB1);
  writeNotNull(
      'vitamin-b1_unit', UnitHelper.unitToString(instance.vitaminB1Unit));
  writeNotNull('vitamin-b2_serving', instance.vitaminB2Serving);
  writeNotNull('vitamin-b2_100g', instance.vitaminB2);
  writeNotNull(
      'vitamin-b2_unit', UnitHelper.unitToString(instance.vitaminB2Unit));
  writeNotNull('vitamin-pp_serving', instance.vitaminPPServing);
  writeNotNull('vitamin-pp_100g', instance.vitaminPP);
  writeNotNull(
      'vitamin-pp_unit', UnitHelper.unitToString(instance.vitaminPPUnit));
  writeNotNull('vitamin-b6_serving', instance.vitaminB6Serving);
  writeNotNull('vitamin-b6_100g', instance.vitaminB6);
  writeNotNull(
      'vitamin-b6_unit', UnitHelper.unitToString(instance.vitaminB6Unit));
  writeNotNull('vitamin-b12_serving', instance.vitaminB12Serving);
  writeNotNull('vitamin-b12_100g', instance.vitaminB12);
  writeNotNull(
      'vitamin-b12_unit', UnitHelper.unitToString(instance.vitaminB12Unit));
  writeNotNull('vitamin-b9_serving', instance.vitaminB9Serving);
  writeNotNull('vitamin-b9_100g', instance.vitaminB9);
  writeNotNull(
      'vitamin-b9_unit', UnitHelper.unitToString(instance.vitaminB9Unit));
  writeNotNull('vitamin-k_serving', instance.vitaminKServing);
  writeNotNull('vitamin-k_100g', instance.vitaminK);
  writeNotNull(
      'vitamin-k_unit', UnitHelper.unitToString(instance.vitaminKUnit));
  writeNotNull('cholesterol_serving', instance.cholesterolServing);
  writeNotNull('cholesterol_100g', instance.cholesterol);
  writeNotNull(
      'cholesterol_unit', UnitHelper.unitToString(instance.cholesterolUnit));
  writeNotNull('butyric-acid_serving', instance.butyricAcidServing);
  writeNotNull('butyric-acid_100g', instance.butyricAcid);
  writeNotNull(
      'butyric-acid_unit', UnitHelper.unitToString(instance.butyricAcidUnit));
  writeNotNull('caproic-acid_serving', instance.caproicAcidServing);
  writeNotNull('caproic-acid_100g', instance.caproicAcid);
  writeNotNull(
      'caproic-acid_unit', UnitHelper.unitToString(instance.caproicAcidUnit));
  writeNotNull('caprylic-acid_serving', instance.caprylicAcidServing);
  writeNotNull('caprylic-acid_100g', instance.caprylicAcid);
  writeNotNull(
      'caprylic-acid_unit', UnitHelper.unitToString(instance.caprylicAcidUnit));
  writeNotNull('capric-acid_serving', instance.capricAcidServing);
  writeNotNull('capric-acid_100g', instance.capricAcid);
  writeNotNull(
      'capric-acid_unit', UnitHelper.unitToString(instance.capricAcidUnit));
  writeNotNull('lauric-acid_serving', instance.lauricAcidServing);
  writeNotNull('lauric-acid_100g', instance.lauricAcid);
  writeNotNull(
      'lauric-acid_unit', UnitHelper.unitToString(instance.lauricAcidUnit));
  writeNotNull('myristic-acid_serving', instance.myristicAcidServing);
  writeNotNull('myristic-acid_100g', instance.myristicAcid);
  writeNotNull(
      'myristic-acid_unit', UnitHelper.unitToString(instance.myristicAcidUnit));
  writeNotNull('palmitic-acid_serving', instance.palmiticAcidServing);
  writeNotNull('palmitic-acid_100g', instance.palmiticAcid);
  writeNotNull(
      'palmitic-acid_unit', UnitHelper.unitToString(instance.palmiticAcidUnit));
  writeNotNull('stearic-acid_serving', instance.stearicAcidServing);
  writeNotNull('stearic-acid_100g', instance.stearicAcid);
  writeNotNull(
      'stearic-acid_unit', UnitHelper.unitToString(instance.stearicAcidUnit));
  writeNotNull('oleic-acid_serving', instance.oleicAcidServing);
  writeNotNull('oleic-acid_100g', instance.oleicAcid);
  writeNotNull(
      'oleic-acid_unit', UnitHelper.unitToString(instance.oleicAcidUnit));
  writeNotNull('linoleic-acid_serving', instance.linoleicAcidServing);
  writeNotNull('linoleic-acid_100g', instance.linoleicAcid);
  writeNotNull(
      'linoleic-acid_unit', UnitHelper.unitToString(instance.linoleicAcidUnit));
  writeNotNull(
      'docosahexaenoic-acid_serving', instance.docosahexaenoicAcidServing);
  writeNotNull('docosahexaenoic-acid_100g', instance.docosahexaenoicAcid);
  writeNotNull('docosahexaenoic-acid_unit',
      UnitHelper.unitToString(instance.docosahexaenoicAcidUnit));
  writeNotNull(
      'eicosapentaenoic-acid_serving', instance.eicosapentaenoicAcidServing);
  writeNotNull('eicosapentaenoic-acid_100g', instance.eicosapentaenoicAcid);
  writeNotNull('eicosapentaenoic-acid_unit',
      UnitHelper.unitToString(instance.eicosapentaenoicAcidUnit));
  writeNotNull('erucic-acid_serving', instance.erucicAcidServing);
  writeNotNull('erucic-acid_100g', instance.erucicAcid);
  writeNotNull(
      'erucic-acid_unit', UnitHelper.unitToString(instance.erucicAcidUnit));
  writeNotNull('monounsaturated_serving', instance.monounsaturatedServing);
  writeNotNull('monounsaturated_100g', instance.monounsaturatedAcid);
  writeNotNull('monounsaturated_unit',
      UnitHelper.unitToString(instance.monounsaturatedUnit));
  writeNotNull('polyunsaturated_serving', instance.polyunsaturatedServing);
  writeNotNull('polyunsaturated_100g', instance.polyunsaturatedAcid);
  writeNotNull('polyunsaturated_unit',
      UnitHelper.unitToString(instance.polyunsaturatedUnit));
  writeNotNull('alcohol_serving', instance.alcoholServing);
  writeNotNull('alcohol_100g', instance.alcohol);
  writeNotNull('alcohol_unit', UnitHelper.unitToString(instance.alcoholUnit));
  writeNotNull('pantothenic-acid_serving', instance.pantothenicAcidServing);
  writeNotNull('pantothenic-acid_100g', instance.pantothenicAcid);
  writeNotNull('pantothenic-acid_unit',
      UnitHelper.unitToString(instance.pantothenicAcidUnit));
  writeNotNull('biotin_serving', instance.biotinServing);
  writeNotNull('biotin_100g', instance.biotin);
  writeNotNull('biotin_unit', UnitHelper.unitToString(instance.biotinUnit));
  writeNotNull('chloride_serving', instance.chlorideServing);
  writeNotNull('chloride_100g', instance.chloride);
  writeNotNull('chloride_unit', UnitHelper.unitToString(instance.chlorideUnit));
  writeNotNull('chromium_serving', instance.chromiumServing);
  writeNotNull('chromium_100g', instance.chromium);
  writeNotNull('chromium_unit', UnitHelper.unitToString(instance.chromiumUnit));
  writeNotNull('fluoride_serving', instance.fluorideServing);
  writeNotNull('fluoride_100g', instance.fluoride);
  writeNotNull('fluoride_unit', UnitHelper.unitToString(instance.fluorideUnit));
  writeNotNull('iodine_serving', instance.iodineServing);
  writeNotNull('iodine_100g', instance.iodine);
  writeNotNull('iodine_unit', UnitHelper.unitToString(instance.iodineUnit));
  writeNotNull('manganese_serving', instance.manganeseServing);
  writeNotNull('manganese_100g', instance.manganese);
  writeNotNull(
      'manganese_unit', UnitHelper.unitToString(instance.manganeseUnit));
  writeNotNull('molybdenum_serving', instance.molybdenumServing);
  writeNotNull('molybdenum_100g', instance.molybdenum);
  writeNotNull(
      'molybdenum_unit', UnitHelper.unitToString(instance.molybdenumUnit));
  writeNotNull('omega-3-fat_serving', instance.omega3FatServing);
  writeNotNull('omega-3-fat_100g', instance.omega3Fat);
  writeNotNull(
      'omega-3-fat_unit', UnitHelper.unitToString(instance.omega3FatUnit));
  writeNotNull('omega-6-fat_serving', instance.omega6FatServing);
  writeNotNull('omega-6-fat_100g', instance.omega6Fat);
  writeNotNull(
      'omega-6-fat_unit', UnitHelper.unitToString(instance.omega6FatUnit));
  writeNotNull('trans-fat_serving', instance.transFatServing);
  writeNotNull('trans-fat_100g', instance.transFat);
  writeNotNull(
      'trans-fat_unit', UnitHelper.unitToString(instance.transFatUnit));
  return val;
}
