import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:openfoodfacts/utils/TagType.dart';
import 'package:test/test.dart';

void main() {
  group('$OpenFoodAPIClient Suggestions and autocompletion', () {
    test('Suggestions for countries', () async {
      List<dynamic> result =
          await OpenFoodAPIClient.getAutocompletedSuggestions(TagType.COUNTRIES,
              language: OpenFoodFactsLanguage.FRENCH,
              input: 't',
              queryType: QueryType.TEST);

      expect(result, [
        'Territoire britannique de l\'océan Indien',
        'Tchad',
        'Afghanistan',
        'Région antarctique',
        'Antarctique',
        'Antigua-et-Barbuda',
        'Argentine',
        'Australie',
        'Autriche',
        'Bhoutan',
        'Botswana',
        'Île Bouvet',
        'Îles Vierges britanniques',
        'Cap-Vert',
        'République centrafricaine',
        'Île Christmas',
        'Costa Rica',
        'Côte d\'Ivoire',
        'Croatie',
        'République tchèque',
        'République démocratique du Congo',
        'Djibouti',
        'République démocratique allemande',
        'Équateur',
        'Égypte'
      ]);
      expect(result.last, 'Égypte');

      result = await OpenFoodAPIClient.getAutocompletedSuggestions(
          TagType.COUNTRIES,
          language: OpenFoodFactsLanguage.FRENCH,
          input: 'TUN',
          queryType: QueryType.TEST);

      expect(result, ['Tunisie', 'Wallis-et-Futuna']);
      expect(result.first, 'Tunisie');

      result = await OpenFoodAPIClient.getAutocompletedSuggestions(
          TagType.COUNTRIES,
          language: OpenFoodFactsLanguage.ENGLISH,
          input: 'TUN',
          queryType: QueryType.TEST);

      expect(result, ['Tunisia', 'Wallis and Futuna']);
      expect(result.first, 'Tunisia');

      result = await OpenFoodAPIClient.getAutocompletedSuggestions(
          TagType.COUNTRIES,
          language: OpenFoodFactsLanguage.ARABIC,
          input: 'تو',
          queryType: QueryType.TEST);

      expect(result, [
        'توغو',
        'توكلو',
        'تونجا',
        'تونس',
        'توفالو',
        'غينيا الاستوائية',
        'إستونيا',
        'ليسوتو',
        'ليتوانيا',
        'بورتوريكو',
        'ساو تومي وبرينسيبي',
        'ترينيداد وتوباغو',
        'جزر توركس وكايكوس',
        'فانواتو',
        'والس وفوتونا'
      ]);
      expect(result[3], 'تونس');

      result = await OpenFoodAPIClient.getAutocompletedSuggestions(
          TagType.COUNTRIES,
          language: OpenFoodFactsLanguage.GEORGIAN,
          input: 'TUN',
          queryType: QueryType.TEST);

      expect(result.isEmpty, true);

      expect(
          await OpenFoodAPIClient.getAutocompletedSuggestions(TagType.COUNTRIES,
              language: OpenFoodFactsLanguage.FRENCH,
              input: 'TUN',
              queryType: QueryType.TEST),
          await OpenFoodAPIClient.getAutocompletedSuggestions(TagType.COUNTRIES,
              language: OpenFoodFactsLanguage.FRENCH,
              input: 'tun',
              queryType: QueryType.TEST));
    });
    test('Suggestions for state', () async {
      List<dynamic> result =
          await OpenFoodAPIClient.getAutocompletedSuggestions(
        TagType.STATES,
        input: 'b',
        language: OpenFoodFactsLanguage.FRENCH,
        queryType: QueryType.TEST,
      );

      expect(result, [
        'Code emballeur complété',
        'Code emballeur à compléter',
        'Emballage complété',
        'Photo de l\'emballage sélectionnée',
        'Photo de l\'emballage non sélectionnée',
        'Emballage à compléter'
      ]);
      expect(result.last, 'Emballage à compléter');

      result = await OpenFoodAPIClient.getAutocompletedSuggestions(
          TagType.STATES,
          language: OpenFoodFactsLanguage.FRENCH,
          input: 'compléter',
          queryType: QueryType.TEST);

      expect(result, [
        'Marques à compléter',
        'Catégories à compléter',
        'Caractéristiques à compléter',
        'Date limite à compléter',
        'Ingrédients à compléter',
        'Informations nutritionnelles à compléter',
        'Origines à compléter',
        'Code emballeur à compléter',
        'Emballage à compléter',
        'Nom du produit à compléter',
        'Quantité à compléter',
        'À compléter'
      ]);
      expect(result.first, 'Marques à compléter');

      result = await OpenFoodAPIClient.getAutocompletedSuggestions(
          TagType.STATES,
          language: OpenFoodFactsLanguage.ENGLISH,
          input: 'h',
          queryType: QueryType.TEST);

      expect(result, [
        'Characteristics completed',
        'Characteristics to be completed',
        'Checked',
        'Front photo selected',
        'Front photo to be selected',
        'Ingredients photo selected',
        'Ingredients photo to be selected',
        'Nutrition photo selected',
        'Nutrition photo to be selected',
        'Packaging photo selected',
        'Packaging photo to be selected',
        'Photos to be uploaded',
        'Photos to be validated',
        'Photos uploaded',
        'Photos validated',
        'To be checked'
      ]);
      expect(result.first, 'Characteristics completed');

      result = await OpenFoodAPIClient.getAutocompletedSuggestions(
          TagType.STATES,
          language: OpenFoodFactsLanguage.ARABIC,
          input: 'غ',
          queryType: QueryType.TEST);

      expect(result.isEmpty, true);

      result = await OpenFoodAPIClient.getAutocompletedSuggestions(
          TagType.STATES,
          language: OpenFoodFactsLanguage.GEORGIAN,
          input: 'M',
          queryType: QueryType.TEST);

      expect(result.isEmpty, true);

      expect(
          await OpenFoodAPIClient.getAutocompletedSuggestions(TagType.STATES,
              language: OpenFoodFactsLanguage.ENGLISH,
              input: 'O',
              queryType: QueryType.TEST),
          await OpenFoodAPIClient.getAutocompletedSuggestions(TagType.STATES,
              language: OpenFoodFactsLanguage.ENGLISH,
              input: 'o',
              queryType: QueryType.TEST));
    });
    test('Suggestions for language', () async {
      List<dynamic> result =
          await OpenFoodAPIClient.getAutocompletedSuggestions(TagType.LANGUAGES,
              language: OpenFoodFactsLanguage.GERMAN,
              input: 'bA',
              queryType: QueryType.TEST);

      expect(result, [
        'Bambara',
        'Baschkirische Sprache',
        'Baskische Sprache',
        'Albanisch',
        'Aserbaidschanische Sprache',
        'Kiluba',
        'Yoruba'
      ]);
      expect(result.last, 'Yoruba');
    });
    test('Suggestions for label', () async {
      List<dynamic> result =
          await OpenFoodAPIClient.getAutocompletedSuggestions(TagType.LABELS,
              language: OpenFoodFactsLanguage.TURKISH,
              input: 'sk',
              queryType: QueryType.TEST);

      expect(result, [
        'SK-BIO-002',
        'SK-BIO-003',
        'Dansk vegetarisk forening',
        'Dansk vegetarisk forening vegan',
        'Dansk vegetarisk forening vegetarian'
      ]);
      expect(result.last, 'Dansk vegetarisk forening vegetarian');
    });
    test('Suggestions for categories', () async {
      List<dynamic> result =
          await OpenFoodAPIClient.getAutocompletedSuggestions(
              TagType.CATEGORIES,
              language: OpenFoodFactsLanguage.FRENCH,
              input: 'compo',
              queryType: QueryType.TEST);

      expect(result, [
        'Compotes de pomme',
        'Compotes pommes nature',
        'Compotes pommes myrtille',
        'Compotes pommes châtaigne',
        'Compotes',
        'Compotes à boire',
        'Compote de fruits allégée en sucres',
        'Compotes allégées',
        'Compotes pommes mangue',
        'Compotes de mangues',
        'Compotes pommes pêche',
        'Compotes pommes poires',
        'Compotes de poire',
        'Compotes de prunes',
        'Compotes pommes framboise',
        'Compote de fruits allégée en sucres rayon frais',
        'Compotes pommes rhubarbe',
        'Compotes fraise myrtille',
        'Compotes pommes fraise',
        'Compotes de fraise',
        'Compotée de lièvre',
        'Compotes d\'abricot',
        'Salades composées en conserve au poisson',
        'Salades composées en conserve à la viande',
        'Salades composées'
      ]);
      expect(result.first, 'Compotes de pomme');
    });
    test('Suggestions for ingredients', () async {
      List<dynamic> result =
          await OpenFoodAPIClient.getAutocompletedSuggestions(
              TagType.INGREDIENTS,
              language: OpenFoodFactsLanguage.FRENCH,
              input: 'vian',
              queryType: QueryType.TEST);

      expect(result, [
        'Viande de bœuf',
        'Viande de poulet',
        'Viande de bœuf cuite',
        'Viande de canard',
        'Viande de chèvre',
        'Viande d\'oie',
        'Viande de cheval',
        'Viande d\'agneau',
        'Viande',
        'Viande séparée mécaniquement de dinde',
        'Viande hachée de bœuf',
        'Viande de porc hachée',
        'Viande de mouton',
        'Viande de porc',
        'Viande de volaille',
        'Viande de poulet précuite',
        'Viande de lapin',
        'Viande de renne',
        'Viandes de porc à l\'étouffée',
        'Viande de dinde',
        'Extrait de viande de bœuf',
        'Arôme de viande',
        'Préparation de viande',
        'Bouillon de viande',
        'Boulette de viande'
      ]);
      expect(result.first, 'Viande de bœuf');
    });
    test('Suggestions for traces', () async {
      List<dynamic> result =
          await OpenFoodAPIClient.getAutocompletedSuggestions(TagType.TRACES,
              language: OpenFoodFactsLanguage.ENGLISH,
              input: 'e',
              queryType: QueryType.TEST);

      expect(result, [
        'Eggs',
        'Celery',
        'Crustaceans',
        'Gluten',
        'None',
        'Peanuts',
        'Sesame seeds',
        'Soybeans',
        'Sulphur dioxide and sulphites'
      ]);
      expect(result.first, 'Eggs');
    });
    test('Suggestions for additives', () async {
      List<dynamic> result =
          await OpenFoodAPIClient.getAutocompletedSuggestions(TagType.ADDITIVES,
              language: OpenFoodFactsLanguage.RUSSIAN,
              input: 'e9',
              queryType: QueryType.TEST);

      expect(result, [
        'E904',
        'E905a',
        'E905b',
        'E905cii',
        'E917',
        'E922',
        'E924',
        'E927b',
        'E930',
        'E938',
        'E939',
        'E940',
        'E941',
        'E942',
        'E944',
        'E948',
        'E949',
        'E953',
        'E955',
        'E965'
      ]);
      expect(result.first, 'E904');
    });
    test('Suggestions for allergens', () async {
      List<dynamic> result =
          await OpenFoodAPIClient.getAutocompletedSuggestions(TagType.ALLERGENS,
              language: OpenFoodFactsLanguage.FRENCH,
              input: 'fRu',
              queryType: QueryType.TEST);

      expect(result, ['Fruits à coque']);
    });
    test('Suggestions for emb_code', () async {
      List<dynamic> result =
          await OpenFoodAPIClient.getAutocompletedSuggestions(TagType.EMB_CODES,
              input: 'fR', queryType: QueryType.TEST);

      expect(result, [
        'FR 01.004.002 EC',
        'FR 01.004.062 EC',
        'FR 01.007.001 EC',
        'FR 01.012.001 EC',
        'FR 01.013.050 EC',
        'FR 01.025.001 EC',
        'FR 01.025.059 EC',
        'FR 01.033.001 EC',
        'FR 01.033.002 EC',
        'FR 01.033.060 EC',
        'FR 01.033.098 EC',
        'FR 01.034.001 EC',
        'FR 01.034.002 EC',
        'FR 01.034.050 EC',
        'FR 01.035.001 EC',
        'FR 01.038.050 EC',
        'FR 01.038.053 EC',
        'FR 01.040.050 EC',
        'FR 01.046.001 EC',
        'FR 01.046.050 EC',
        'FR 01.047.001 EC',
        'FR 01.053.002 EC',
        'FR 01.053.003 EC',
        'FR 01.053.005 EC',
        'FR 01.053.006 EC'
      ]);

      result = await OpenFoodAPIClient.getAutocompletedSuggestions(
          TagType.EMB_CODES,
          input: 'R',
          queryType: QueryType.TEST);

      expect(result, [
        'RS 1 EC',
        'RS 1022 EC',
        'RS 10289 EC',
        'RS 1062 EC',
        'RS 1063 EC',
        'RS 1067 EC',
        'RS 10838 EC',
        'RS 1170 EC',
        'RS 12108 EC',
        'RS 12293 EC',
        'RS 127 EC',
        'RS 153 EC',
        'RS 154 EC',
        'RS 156 EC',
        'RS 158 EC',
        'RS 20044 EC',
        'RS 204 EC',
        'RS 20514 EC',
        'RS 20830 EC',
        'RS 26 EC',
        'RS 30-002 EC',
        'RS 30-112 EC',
        'RS 30-15 EC',
        'RS 30-194 EC',
        'RS 300 EC'
      ]);

      expect(
          await OpenFoodAPIClient.getAutocompletedSuggestions(TagType.EMB_CODES,
              language: OpenFoodFactsLanguage.ITALIAN,
              input: 'U',
              queryType: QueryType.TEST),
          await OpenFoodAPIClient.getAutocompletedSuggestions(TagType.EMB_CODES,
              language: OpenFoodFactsLanguage.FRENCH,
              input: 'U',
              queryType: QueryType.TEST));

      expect(
          await OpenFoodAPIClient.getAutocompletedSuggestions(TagType.EMB_CODES,
              language: OpenFoodFactsLanguage.GERMAN,
              input: 'C',
              queryType: QueryType.TEST),
          await OpenFoodAPIClient.getAutocompletedSuggestions(TagType.EMB_CODES,
              language: OpenFoodFactsLanguage.ENGLISH,
              input: 'C',
              queryType: QueryType.TEST));

      expect(
          await OpenFoodAPIClient.getAutocompletedSuggestions(TagType.EMB_CODES,
              language: OpenFoodFactsLanguage.JAPANESE,
              input: 'd',
              queryType: QueryType.TEST),
          await OpenFoodAPIClient.getAutocompletedSuggestions(TagType.EMB_CODES,
              language: OpenFoodFactsLanguage.UKRAINIAN,
              input: 'D',
              queryType: QueryType.TEST));
    });
    test('Suggestions empty fields', () async {
      List<dynamic> result =
          await OpenFoodAPIClient.getAutocompletedSuggestions(TagType.ALLERGENS,
              language: OpenFoodFactsLanguage.FRENCH,
              queryType: QueryType.TEST);

      expect(result, [
        'Céleri',
        'Crustacés',
        'Œufs',
        'Poisson',
        'Gluten',
        'Lupin',
        'Lait',
        'Mollusques',
        'Moutarde',
        'Aucun',
        'Fruits à coque',
        'Arachides',
        'Graines de sésame',
        'Soja',
        'Anhydride sulfureux et sulfites'
      ]);

      result = await OpenFoodAPIClient.getAutocompletedSuggestions(
          TagType.TRACES,
          language: OpenFoodFactsLanguage.ENGLISH,
          queryType: QueryType.TEST);

      expect(result, [
        'Celery',
        'Crustaceans',
        'Eggs',
        'Fish',
        'Gluten',
        'Lupin',
        'Milk',
        'Molluscs',
        'Mustard',
        'None',
        'Nuts',
        'Peanuts',
        'Sesame seeds',
        'Soybeans',
        'Sulphur dioxide and sulphites'
      ]);

      result = await OpenFoodAPIClient.getAutocompletedSuggestions(
          TagType.INGREDIENTS,
          language: OpenFoodFactsLanguage.ENGLISH,
          queryType: QueryType.TEST);

      expect(result, [
        'Hydrolyzed pork protein',
        'Abalone',
        'Absinthe',
        'Acacia fibre',
        'Acacia honey',
        'Acacia honey from France',
        'Acai berry',
        'Acai juice',
        'Acerola',
        'Acerola juice',
        'Acerola powder',
        'Acerola powder on manioc starch',
        'Acid',
        'Acid whey',
        'Acidity regulator',
        'Acorn fed iberian pig',
        'Adenosine monophosphate',
        'Advocaat',
        'Agave fibre',
        'Agave syrup',
        'Alaska pollock',
        'Alaskan Pollock fillet',
        'Albacore',
        'Alcohol',
        'Alcohol vinegar'
      ]);

      result = await OpenFoodAPIClient.getAutocompletedSuggestions(
          TagType.INGREDIENTS,
          language: OpenFoodFactsLanguage.ENGLISH,
          queryType: QueryType.TEST);

      expect(
          await OpenFoodAPIClient.getAutocompletedSuggestions(
              TagType.INGREDIENTS,
              language: OpenFoodFactsLanguage.ENGLISH,
              queryType: QueryType.TEST),
          await OpenFoodAPIClient.getAutocompletedSuggestions(
              TagType.INGREDIENTS,
              queryType: QueryType.TEST));
    });
  });
}
