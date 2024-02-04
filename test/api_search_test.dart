import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Tests around the Elastic Search API.
void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;

  group(
    '$OpenFoodSearchAPIClient autocomplete',
    () {
      const int maxSize = 5;
      const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.FRENCH;

      void basicTest(final AutocompleteSearchResult result) {
        expect(result.took, greaterThanOrEqualTo(0));
        expect(result.timedOut, false);
        expect(result.options, isNotNull);
        expect(result.options!.length, lessThanOrEqualTo(maxSize));
      }

      test(
        'category with existing matches',
        () async {
          const TaxonomyName taxonomyName = TaxonomyName.category;
          final AutocompleteSearchResult result =
              await OpenFoodSearchAPIClient.autocomplete(
            query: 'pizza',
            taxonomyNames: <TaxonomyName>[taxonomyName],
            language: language,
            size: maxSize,
          );
          basicTest(result);
          expect(result.options, hasLength(maxSize));
          for (final AutocompleteSingleResult item in result.options!) {
            expect(item.id, contains(':'));
            expect(item.taxonomyName, taxonomyName);
          }
        },
      );

      test(
        'category with non existing matches',
        () async {
          const TaxonomyName taxonomyName = TaxonomyName.category;
          final AutocompleteSearchResult result =
              await OpenFoodSearchAPIClient.autocomplete(
            query: 'pifsehjfsjkvnskjvbehjszza',
            taxonomyNames: <TaxonomyName>[taxonomyName],
            language: language,
            size: maxSize,
          );
          basicTest(result);
          expect(result.options, isEmpty);
        },
      );

      test(
        'all fuzziness levels',
        () async {
          const TaxonomyName taxonomyName = TaxonomyName.country;
          const String expectedValue = 'France';
          const Map<String, Fuzziness> inputs = <String, Fuzziness>{
            expectedValue: Fuzziness.none,
            'Franse': Fuzziness.one,
            'Frense': Fuzziness.two,
          };
          for (final String inputValue in inputs.keys) {
            final AutocompleteSearchResult result =
                await OpenFoodSearchAPIClient.autocomplete(
              // possibly with a typo
              query: inputValue,
              taxonomyNames: <TaxonomyName>[taxonomyName],
              language: language,
              size: maxSize,
              // supposed to fix the typo (if relevant)
              fuzziness: inputs[inputValue]!,
            );
            basicTest(result);
            expect(result.options, isNotEmpty);
            bool found = false;
            for (final AutocompleteSingleResult item in result.options!) {
              expect(item.id, contains(':'));
              expect(item.taxonomyName, taxonomyName);
              if (item.text == expectedValue) {
                found = true;
              }
            }
            expect(found, isTrue);
          }
        },
      );

      Future<void> simpleTest(
        final TaxonomyName taxonomyName,
        final String query,
        final String expectedValue, {
        final OpenFoodFactsLanguage language = OpenFoodFactsLanguage.FRENCH,
      }) async {
        final AutocompleteSearchResult result =
            await OpenFoodSearchAPIClient.autocomplete(
          query: query,
          taxonomyNames: <TaxonomyName>[taxonomyName],
          language: language,
          size: maxSize,
          fuzziness: Fuzziness.none,
        );
        basicTest(result);
        expect(result.options, isNotEmpty);
        bool found = false;
        for (final AutocompleteSingleResult item in result.options!) {
          expect(item.id, contains(':'));
          expect(item.taxonomyName, taxonomyName);
          if (item.text == expectedValue) {
            found = true;
          }
        }
        expect(found, isTrue);
      }

      test(
        'all taxonomy names',
        () async {
          await simpleTest(TaxonomyName.category, 'sky', 'Skyr nature');
          await simpleTest(TaxonomyName.label, 'fsc', 'FSC Mix');
          await simpleTest(TaxonomyName.additive, 'E100', 'E1001');
          await simpleTest(TaxonomyName.allergen, 'mouta', 'moutarde');
          await simpleTest(TaxonomyName.aminoAcid, 'L-argin', 'L-arginine');
          await simpleTest(TaxonomyName.country, 'fra', 'France');
          await simpleTest(
            TaxonomyName.dataQuality,
            'Valeur nutritionnelle',
            'Valeur nutritionnelle supérieure à 3800 - Energie',
          );
          await simpleTest(
              TaxonomyName.foodGroup, 'fromage per', 'Fromage persillé');
          await simpleTest(TaxonomyName.improvement, 'Nutrition - Hau',
              'Nutrition - Haut taux de sel pour la catégorie');
          await simpleTest(
              TaxonomyName.ingredient, 'fromage bla', 'Fromage blanc');
          await simpleTest(
              TaxonomyName.ingredientAnalysis, 'végé', 'Végétarien');
          await simpleTest(
              TaxonomyName.ingredientProcessing, 'enri', 'enrichi');
          await simpleTest(TaxonomyName.language, 'fran', 'français');
          await simpleTest(TaxonomyName.mineral, 'zi', 'Zinc');
          await simpleTest(
              TaxonomyName.misc, 'nutriscore', 'NutriScore - Calculé');
          await simpleTest(
              TaxonomyName.novaGroup, 'aliments', 'Aliments transformés');
          await simpleTest(TaxonomyName.nucleotide, 'adénosine mon',
              'Adénosine monophosphate');
          await simpleTest(TaxonomyName.nutrient, 'prot', 'Protéine');
          await simpleTest(TaxonomyName.origin, 'prove', 'Provence');
          await simpleTest(
              TaxonomyName.otherNutritionalSubstance, 'chol', 'Choline');
          await simpleTest(TaxonomyName.packagingMaterial, 'verr', 'Verre');
          await simpleTest(
              TaxonomyName.packagingRecycling, 'compost', 'Compostable');
          await simpleTest(TaxonomyName.packagingShape, 'boute', 'Bouteille');
          await simpleTest(TaxonomyName.periodsAfterOpening, '21', '21 mois');
          await simpleTest(TaxonomyName.preservation, 'cons', 'Conserve');
          await simpleTest(TaxonomyName.state, 'emball', 'Emballage complété');
          await simpleTest(TaxonomyName.vitamin, 'b', 'b12');
          await simpleTest(TaxonomyName.brand, 'carref', 'Carrefour',
              language: OpenFoodFactsLanguage.ENGLISH);
        },
      );
    },
  );
}
