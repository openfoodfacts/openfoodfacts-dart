import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Integration tests around the "save packagings V3" feature.
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  const UriProductHelper uriHelper = uriHelperFoodTest;

  Future<ProductResultV3?> temporarySaveProductV3(
    final String barcode, {
    final List<ProductPackaging>? packagings,
    final bool? packagingsComplete,
    final dynamic nutritionInputSets,
    final String? servingSize,
    final OpenFoodFactsCountry? country,
    final OpenFoodFactsLanguage? language,
  }) async {
    try {
      final result = await OpenFoodAPIClient.temporarySaveProductV3(
        TestConstants.TEST_USER,
        barcode,
        packagings: packagings,
        packagingsComplete: packagingsComplete,
        nutritionInputSets: nutritionInputSets,
        servingSize: servingSize,
        uriHelper: uriHelper,
        country: country,
        language: language,
      );
      return result;
    } on HttpStatusException catch (e) {
      if (e.statusCode >= 500) {
        print('Server error: $e');
        return null;
      }
      rethrow;
    }
  }

  group('$OpenFoodAPIClient save product V3 - packaging', () {
    const String barcode = '7300400481588';
    const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.FRENCH;
    const OpenFoodFactsCountry country = OpenFoodFactsCountry.FRANCE;

    test(
      'save packagings with unknown recycling',
      () async {
        // Here we put an unknown recycling label, and we expect related warnings.
        const String unknownRecycling = 'recyKKlage';
        const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.FRENCH;
        const int numberOfUnits = 12;
        const String quantityPerUnit = '50cl';
        const double weightMeasured = 250;
        final List<ProductPackaging> inputPackagings = [
          ProductPackaging()
            ..shape = (LocalizedTag()..lcName = 'bouteille')
            ..material = (LocalizedTag()..lcName = 'verre')
            ..recycling = (LocalizedTag()..lcName = unknownRecycling)
            ..numberOfUnits = numberOfUnits
            ..quantityPerUnit = quantityPerUnit
            ..weightMeasured = weightMeasured,
        ];
        final ProductResultV3? status = await temporarySaveProductV3(
          barcode,
          country: country,
          language: language,
          packagings: inputPackagings,
        );
        if (status == null) {
          return;
        }

        expect(status.status, ProductResultV3.statusWarning);
        expect(status.errors, isEmpty);
        expect(status.result, isNull); // result is null for UPDATE queries
        expect(status.barcode, barcode);
        expect(status.product, isNotNull);

        expect(status.product!.packagings, isNotNull);
        final List<ProductPackaging> packagings = status.product!.packagings!;
        expect(packagings, hasLength(1));
        final ProductPackaging packaging = packagings.first;
        expect(packaging.shape, isNotNull);
        expect(packaging.material, isNotNull);
        expect(packaging.recycling, isNotNull);
        expect(packaging.numberOfUnits, numberOfUnits);
        expect(packaging.quantityPerUnit, quantityPerUnit);
        expect(packaging.weightMeasured, weightMeasured);

        expect(status.warnings, isNotEmpty);
        expect(status.warnings, hasLength(1));

        final ProductResultFieldAnswer answer = status.warnings!.first;
        expect(answer.impact, isNotNull);
        expect(answer.impact!.id, 'none');
        expect(answer.impact!.name, isNotNull);
        expect(answer.impact!.lcName, isNotNull);
        expect(answer.message, isNotNull);
        expect(answer.message!.id, 'unrecognized_value');
        expect(answer.message!.name, isNotNull);
        expect(answer.message!.lcName, isNotNull);
        expect(answer.field, isNotNull);
        expect(answer.field!.id, 'recycling');
        expect(answer.field!.value, '${language.offTag}:$unknownRecycling');
      },
      timeout: Timeout(Duration(seconds: 180)),
    );

    test('save packagings_complete', () async {
      final List<bool> values = [false, true, false];
      for (final bool value in values) {
        final ProductResultV3? status = await temporarySaveProductV3(
          barcode,
          country: country,
          language: language,
          packagingsComplete: value,
        );
        if (status == null) {
          return;
        }

        expect(status.status, ProductResultV3.statusSuccess);
        expect(status.errors, isEmpty);
        expect(status.result, isNull); // result is null for UPDATE queries
        expect(status.barcode, barcode);
        expect(status.product, isNotNull);
        expect(status.product!.packagingsComplete, value);
      }
    }, timeout: Timeout(Duration(seconds: 180)));

    test('reproducing issue 1038', () async {
      // Check it's ok if we get numbers instead of String? as warning/error values.
      const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.FRENCH;
      const int numberOfUnits = -12;
      const double weightMeasured = -250;
      final List<ProductPackaging> inputPackagings = [
        ProductPackaging()
          ..shape = (LocalizedTag()..lcName = 'bouteille')
          ..material = (LocalizedTag()..lcName = 'verre')
          ..recycling = (LocalizedTag()..lcName = 'bac de tri')
          ..numberOfUnits = numberOfUnits
          ..weightMeasured = weightMeasured,
      ];
      final ProductResultV3? status = await temporarySaveProductV3(
        barcode,
        country: country,
        language: language,
        packagings: inputPackagings,
      );
      if (status == null) {
        return;
      }

      expect(status.status, ProductResultV3.statusWarning);
      expect(status.errors, isEmpty);
      expect(status.result, isNull); // result is null for UPDATE queries
      expect(status.barcode, barcode);
      expect(status.product, isNotNull);

      expect(status.product!.packagings, isNotNull);
      final List<ProductPackaging> packagings = status.product!.packagings!;
      expect(packagings, hasLength(1));
      final ProductPackaging packaging = packagings.first;
      // we send crap data, we get "corrected" results.
      expect(packaging.numberOfUnits, isNull);
      expect(packaging.weightMeasured, isNull);

      expect(status.warnings, isNotEmpty);
      expect(status.warnings, hasLength(2));

      for (final ProductResultFieldAnswer answer in status.warnings!) {
        expect(answer.field, isNotNull);
        expect(answer.impact, isNotNull);
        expect(answer.message, isNotNull);
        if (answer.field!.id == 'number_of_units') {
          expect(answer.field!.value, numberOfUnits.toString());
          expect(answer.impact!.id, 'field_ignored');
          expect(answer.impact!.name, isNotNull);
          expect(answer.impact!.lcName, isNotNull);
          expect(answer.message!.id, 'invalid_type_must_be_integer');
          expect(answer.message!.name, isNotNull);
          expect(answer.message!.lcName, isNotNull);
        } else if (answer.field!.id == 'weight_measured') {
          expect(answer.field!.value, weightMeasured.toString());
          expect(answer.field!.valuedConverted, isNull);
          expect(answer.impact!.id, 'field_ignored');
          expect(answer.impact!.name, isNotNull);
          expect(answer.impact!.lcName, isNotNull);
          expect(answer.message!.id, 'invalid_type_must_be_number');
          expect(answer.message!.name, isNotNull);
          expect(answer.message!.lcName, isNotNull);
        } else {
          fail('Unexpected field id: ${answer.field!.id}');
        }
      }
    }, timeout: Timeout(Duration(seconds: 180)));
  });

  group('$OpenFoodAPIClient save product V3 - nutrition', () {
    test('nutrient modifiers', () async {
      const String barcode = '7622210449283';
      const String source = NutritionSetKey.sourcePackaging;
      const String preparation = NutritionSetKey.preparationAsSold;

      const Nutrient nutrient = Nutrient.fiber; // used to be 4g / 100g
      final Unit unit = Unit.MICRO_G;
      double value = 56;
      const perSize = PerSize.serving;
      int serving = 250;

      for (int i = 0; i < NutrientModifier.values.length + 1; i++) {
        final NutrientModifier? modifier;
        if (i == 0) {
          modifier = null;
        } else {
          modifier = NutrientModifier.values[i - 1];
        }
        value++;
        serving++;
        final String valueString = value.toStringAsFixed(0);
        final String servingSize = '$serving g';

        final ProductResultV3? productResultV3 = await temporarySaveProductV3(
          barcode,
          nutritionInputSets: [
            NutritionSet(
              key: NutritionSetKey(
                source: source,
                preparation: preparation,
                perSize: perSize,
              ),
              nutritionValues: {
                nutrient: NutritionValue(
                  modifier: modifier,
                  unit: unit,
                  valueString: valueString,
                ),
              },
            ),
          ],
          servingSize: servingSize,
        );
        if (productResultV3 == null) {
          return;
        }

        final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
          ProductQueryConfiguration(
            barcode,
            language: OpenFoodFactsLanguage.FRENCH,
            country: OpenFoodFactsCountry.FRANCE,
            fields: [ProductField.NUTRITION, ProductField.SERVING_SIZE],
            version: ProductQueryVersion.latestVersion,
          ),
          uriHelper: uriHelper,
        );

        expect(result.status, ProductResultV3.statusSuccess);
        expect(result.barcode, barcode);
        expect(result.product, isNotNull);

        final List<NutritionSet>? inputSets = NutritionHelper().getInputSets(
          result.product!,
        );
        expect(inputSets, isNotNull);

        final NutritionSet? nutritionSet = NutritionHelper().getNutritionSet(
          inputSets!,
          NutritionSetKey(
            source: NutritionSetKey.sourcePackaging,
            preparation: NutritionSetKey.preparationAsSold,
            perSize: perSize,
          ),
        );
        expect(nutritionSet, isNotNull);

        final nutritionValue = nutritionSet!.nutritionValues![nutrient];

        expect(result.product!.servingSize, servingSize);
        expect(nutritionSet.key.perSize, perSize);
        expect(nutritionSet.key.perQuantity, serving);
        expect(nutritionSet.key.perUnit, Unit.G);

        if (modifier == NutrientModifier.remove) {
          expect(nutritionValue, isNull);
        } else {
          expect(nutritionValue, isNotNull);
          expect(nutritionValue!.value, value);
          expect(nutritionValue.valueString, valueString);
          expect(nutritionValue.unit, unit);
          expect(nutritionValue.valueComputed, isNull);
          expect(nutritionValue.modifier, modifier);
        }
      }
    }, timeout: Timeout(Duration(seconds: 360)));

    test('unspecified nutrients', () async {
      const String barcode = '3760253400008';
      const String source = NutritionSetKey.sourcePackaging;
      const String preparation = NutritionSetKey.preparationAsSold;
      const Nutrient nutrient = Nutrient.fiber;
      const perSize = PerSize.oneHundredGrams;

      for (int i = 0; i < 2; i++) {
        final bool isUnspecified = i == 0;

        final ProductResultV3? productResultV3 = await temporarySaveProductV3(
          barcode,
          nutritionInputSets: [
            NutritionSet(
              key: NutritionSetKey(
                source: source,
                preparation: preparation,
                perSize: perSize,
              ),
              nutritionValues: null,
              unspecifiedNutrients: [if (isUnspecified) nutrient],
            ),
          ],
        );
        if (productResultV3 == null) {
          return;
        }

        final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
          ProductQueryConfiguration(
            barcode,
            language: OpenFoodFactsLanguage.FRENCH,
            country: OpenFoodFactsCountry.FRANCE,
            fields: [ProductField.NUTRITION],
            version: ProductQueryVersion.latestVersion,
          ),
          uriHelper: uriHelper,
        );

        expect(result.status, ProductResultV3.statusSuccess);
        expect(result.barcode, barcode);
        expect(result.product, isNotNull);

        final List<NutritionSet>? inputSets = NutritionHelper().getInputSets(
          result.product!,
        );
        expect(inputSets, isNotNull);

        final NutritionSet? nutritionSet = NutritionHelper().getNutritionSet(
          inputSets!,
          NutritionSetKey(
            source: source,
            preparation: preparation,
            perSize: perSize,
          ),
        );
        expect(nutritionSet, isNotNull);

        if (isUnspecified) {
          expect(nutritionSet!.unspecifiedNutrients!, contains(nutrient));
        } else {
          expect(nutritionSet!.unspecifiedNutrients, isNull);
        }
      }
    }, timeout: Timeout(Duration(seconds: 360)));

    test(
      'reproduce issue https://github.com/openfoodfacts/smooth-app/issues/7643',
      () async {
        const String barcode = '7044416009854';
        const String source = NutritionSetKey.sourcePackaging;
        const String preparation = NutritionSetKey.preparationAsSold;
        const perSize = PerSize.oneHundredGrams;
        const Nutrient nutrient = Nutrient.vitaminB9;
        const double valueInMicroG = 30;

        const Map<Unit, int> factors = <Unit, int>{
          Unit.G: 1_000_000,
          Unit.MILLI_G: 1_000,
          Unit.MICRO_G: 1,
        };

        for (final MapEntry<Unit, int> entry in factors.entries) {
          final Unit unit = entry.key;
          final double value = valueInMicroG / entry.value;
          final ProductResultV3? productResultV3 = await temporarySaveProductV3(
            barcode,
            nutritionInputSets: [
              NutritionSet(
                key: NutritionSetKey(
                  source: source,
                  preparation: preparation,
                  perSize: perSize,
                ),
                nutritionValues: {
                  nutrient: NutritionValue(
                    unit: unit,
                    valueString: value.toString(),
                  ),
                },
              ).toJson(),
            ],
          );
          if (productResultV3 == null) {
            return;
          }

          final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(
            ProductQueryConfiguration(
              barcode,
              fields: [ProductField.NUTRITION],
              version: ProductQueryVersion.latestVersion,
            ),
            uriHelper: uriHelper,
          );

          expect(result.status, ProductResultV3.statusSuccess);
          expect(result.barcode, barcode);
          expect(result.product, isNotNull);

          final List<NutritionSet>? inputSets = NutritionHelper().getInputSets(
            result.product!,
          );
          expect(inputSets, isNotNull);

          final NutritionSet? nutritionSet = NutritionHelper().getNutritionSet(
            inputSets!,
            NutritionSetKey(
              source: source,
              preparation: preparation,
              perSize: perSize,
            ),
          );
          expect(nutritionSet, isNotNull);

          final nutritionValue = nutritionSet!.nutritionValues![nutrient];
          expect(nutritionValue, isNotNull);
          expect(nutritionValue!.value, value);
          expect(nutritionValue.unit, unit);
          expect(nutritionValue.valueComputed, isNull);
          expect(nutritionValue.modifier, isNull);
        }
      },
      timeout: Timeout(Duration(seconds: 360)),
    );
  });
}
