import 'package:openfoodfacts/model/TaxonomyAdditive.dart';
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
    'en:e436': {
      'efsa_evaluation_adi': {
        'en': '25',
      },
      'vegetarian': {
        'en': 'maybe',
      },
      'additives_classes': {
        'en': 'en:emulsifier,en:stabiliser',
      },
      'efsa_evaluation_date': {
        'en': '2015-07-17',
      },
      'wikidata': {
        'en': 'Q2103107',
      },
      'name': {
        'en': 'E436 - Polyoxyethylene sorbitan tristearate',
        'fr': 'E436 - Trist\u00e9arate de polyoxy\u00e9thyl\u00e8ne sorbitane',
      },
      'efsa_evaluation_exposure_95th_greater_than_adi': {
        'en': 'en:adults, en:elderly, en:children, en:toddlers',
      },
      'e_number': {
        'en': '436',
      },
      'efsa_evaluation_overexposure_risk': {
        'en': 'en:moderate',
      },
      'efsa_evaluation_exposure_mean_greater_than_adi': {
        'en': 'en:no-group',
      },
      'vegan': {
        'en': 'maybe',
      },
      'efsa_evaluation': {
        'en':
            'Scientific Opinion on the re-evaluation of polyoxyethylene sorbitan monolaurate -E 432- as food additives',
      },
      'efsa_evaluation_url': {
        'en': 'http://dx.doi.org/10.2903/j.efsa.2015.4152',
      }
    },
  };

  setUp(() {
    httpHelper = FakeHttpHelper();
    HttpHelper.instance = httpHelper;
  });

  group('OpenFoodAPIClient getTaxonomyAdditives', () {
    test('get an additive', () async {
      final String tag = 'en:e436';
      TaxonomyAdditiveQueryConfiguration configuration =
          TaxonomyAdditiveQueryConfiguration(
        fields: [
          TaxonomyAdditiveField.NAME,
          TaxonomyAdditiveField.VEGAN,
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>[tag],
      );
      httpHelper.setResponse(configuration.getUri(),
          response: expectedResponse);

      Map<String, TaxonomyAdditive>? additives =
          await OpenFoodAPIClient.getTaxonomyAdditives(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(additives, isNotNull);
      expect(additives!.length, equals(1));
      TaxonomyAdditive additive = additives[tag]!;
      expect(
          additive.name![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyAdditiveField.NAME.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          additive.name![OpenFoodFactsLanguage.FRENCH]!,
          equals(expectedResponse[tag][TaxonomyAdditiveField.NAME.key]
              [OpenFoodFactsLanguage.FRENCH.code]));
      expect(
          additive.vegan![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyAdditiveField.VEGAN.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
    });
    test("get an additive that doesn't exist", () async {
      final String tag = 'en:some_nonexistent_additive';
      Map<String, dynamic> expectedResponse = <String, dynamic>{
        tag: {},
      };
      TaxonomyAdditiveQueryConfiguration configuration =
          TaxonomyAdditiveQueryConfiguration(
        fields: [
          TaxonomyAdditiveField.NAME,
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>[tag],
      );
      httpHelper.setResponse(configuration.getUri(),
          response: expectedResponse);

      Map<String, TaxonomyAdditive>? categories =
          await OpenFoodAPIClient.getTaxonomyAdditives(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(categories, isNull);
    });
    test("get an additive that doesn't exist with one that does", () async {
      final String tag = 'en:e436';
      TaxonomyAdditiveQueryConfiguration configuration =
          TaxonomyAdditiveQueryConfiguration(
        fields: [
          TaxonomyAdditiveField.NAME,
          TaxonomyAdditiveField.VEGAN,
        ],
        languages: [
          OpenFoodFactsLanguage.ENGLISH,
          OpenFoodFactsLanguage.FRENCH,
        ],
        tags: <String>['en:some_nonexistent_additive', tag],
      );
      httpHelper.setResponse(configuration.getUri(),
          response: expectedResponse);

      Map<String, TaxonomyAdditive>? additives =
          await OpenFoodAPIClient.getTaxonomyAdditives(
        configuration,
        user: TestConstants.TEST_USER,
      );
      expect(additives, isNotNull);

      expect(additives!.length, equals(1));
      TaxonomyAdditive additive = additives[tag]!;
      expect(
          additive.name![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyAdditiveField.NAME.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
      expect(
          additive.name![OpenFoodFactsLanguage.FRENCH]!,
          equals(expectedResponse[tag][TaxonomyAdditiveField.NAME.key]
              [OpenFoodFactsLanguage.FRENCH.code]));
      expect(
          additive.vegan![OpenFoodFactsLanguage.ENGLISH]!,
          equals(expectedResponse[tag][TaxonomyAdditiveField.VEGAN.key]
              [OpenFoodFactsLanguage.ENGLISH.code]));
    });
  });
}
