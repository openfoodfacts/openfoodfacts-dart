import 'package:openfoodfacts/model/TaxonomyLabel.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

import 'fake_http_helper.dart';
import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;
  OpenFoodAPIConfiguration.globalCC = 'fr';
  late FakeHttpHelper httpHelper;
  final Map<String, dynamic> expectedResponse = <String, dynamic>{
    'en:vegetarian': {
      'description': {
        'fr':
            'Le v\u00e9g\u00e9tarisme est une pratique alimentaire qui exclut la consommation de chair animale.',
        'en':
            'Vegetarianism is the practice of abstaining from the consumption of meat, and may also include abstention from by-products of animal slaughter.',
      },
      'wikidata': {'en': 'Q638022'},
      'children': [
        'da:dansk-vegetarisk-forening',
        'en:european-vegetarian-union',
        'en:green-dot-india',
        'en:vegan',
        'en:vege-project',
        'en:vegetarian-society',
        'it:icea-bio-vegetariano',
        'it:icea-vegetariano',
      ],
      'name': {
        'en': 'Vegetarian',
        'fr': 'V\u00e9g\u00e9tarien',
      }
    }
  };

  setUp(() {
    httpHelper = FakeHttpHelper();
    HttpHelper.instance = httpHelper;
  });

  group('OpenFoodAPIClient getTaxonomyLabels', () {
    test('get a label', () async {
      final String tag = 'en:vegetarian';
      TaxonomyLabelQueryConfiguration configuration =
          TaxonomyLabelQueryConfiguration(
        fields: [
          TaxonomyLabelField.NAME,
          TaxonomyLabelField.WIKIDATA,
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>[tag],
      );
      httpHelper.setResponse(configuration.getUri(),
          response: expectedResponse);

      Map<String, TaxonomyLabel>? labels =
          await OpenFoodAPIClient.getTaxonomyLabels(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(labels, isNotNull);
      expect(labels!.length, equals(1));
      TaxonomyLabel label = labels[tag]!;
      expect(
          label.name![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyLabelField.NAME.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          label.name![OpenFoodFactsLanguage.FRENCH]!,
          equals(expectedResponse[tag][TaxonomyLabelField.NAME.key]
              [OpenFoodFactsLanguage.FRENCH.code]));
      expect(
          label.wikidata![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyLabelField.WIKIDATA.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
    });
    test("get an label that doesn't exist", () async {
      final String tag = 'en:some_nonexistent_label';
      Map<String, dynamic> expectedResponse = <String, dynamic>{
        tag: {},
      };
      TaxonomyLabelQueryConfiguration configuration =
          TaxonomyLabelQueryConfiguration(
        fields: [
          TaxonomyLabelField.NAME,
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>[tag],
      );
      httpHelper.setResponse(configuration.getUri(),
          response: expectedResponse);

      Map<String, TaxonomyLabel>? categories =
          await OpenFoodAPIClient.getTaxonomyLabels(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(categories, isNull);
    });
    test("get an label that doesn't exist with one that does", () async {
      final String tag = 'en:vegetarian';
      TaxonomyLabelQueryConfiguration configuration =
          TaxonomyLabelQueryConfiguration(
        fields: [
          TaxonomyLabelField.NAME,
          TaxonomyLabelField.WIKIDATA,
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>['en:some_nonexistent_label', tag],
      );
      httpHelper.setResponse(configuration.getUri(),
          response: expectedResponse);

      Map<String, TaxonomyLabel>? labels =
          await OpenFoodAPIClient.getTaxonomyLabels(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(labels, isNotNull);

      expect(labels!.length, equals(1));
      TaxonomyLabel label = labels[tag]!;
      expect(
          label.name![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyLabelField.NAME.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          label.name![OpenFoodFactsLanguage.FRENCH]!,
          equals(expectedResponse[tag][TaxonomyLabelField.NAME.key]
              [OpenFoodFactsLanguage.FRENCH.code]));
      expect(
          label.wikidata![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyLabelField.WIKIDATA.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
    });
  });
}
