import 'dart:async';

import 'package:openfoodfacts/model/Insight.dart';
import 'package:openfoodfacts/model/RobotoffQuestion.dart';
import 'package:openfoodfacts/model/SpellingCorrections.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';
import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;

  group('$OpenFoodAPIClient get robotoff questions', () {
    test('get questions for Noix de Saint-Jacques EN', () async {
      RobotoffQuestionResult result =
          await OpenFoodAPIClient.getRobotoffQuestionsForProduct(
        '3274570800026',
        'en',
        TestConstants.TEST_USER,
        count: 1,
      );

      if (result.status != 'no_questions') {
        expect(result.status != null, true);
        expect(result.status, 'found');
        expect(result.questions!.length, 1);
        expect(result.questions![0].barcode, '3274570800026');
        expect(result.questions![0].type, 'add-binary');
        expect(result.questions![0].value, 'Scallop');
        expect(result.questions![0].question,
            'Does the product belong to this category?');
        expect(result.questions![0].insightId,
            '5cac03bc-a5a7-4ec2-a548-17fd9319fee7');
        expect(result.questions![0].insightType, InsightType.CATEGORY);
        expect(result.questions![0].imageUrl,
            'https://static.openfoodfacts.org/images/products/327/457/080/0026/front_en.4.400.jpg');
      }
    });

    test('get questions for Noix de Saint-Jacques FR', () async {
      RobotoffQuestionResult result =
          await OpenFoodAPIClient.getRobotoffQuestionsForProduct(
        '3274570800026',
        'fr',
        TestConstants.TEST_USER,
      );

      if (result.status != 'no_questions') {
        expect(result.status != null, true);
        expect(result.status, 'found');
        expect(result.questions!.length, 1);
        expect(result.questions![0].barcode, '3274570800026');
        expect(result.questions![0].type, 'add-binary');
        expect(result.questions![0].value, 'Noix de Saint-Jacques');
        expect(result.questions![0].question,
            'Le produit appartient-il à cette catégorie ?');
        expect(result.questions![0].insightId,
            '5cac03bc-a5a7-4ec2-a548-17fd9319fee7');
        expect(result.questions![0].insightType, InsightType.CATEGORY);
        expect(result.questions![0].imageUrl,
            'https://static.openfoodfacts.org/images/products/327/457/080/0026/front_en.4.400.jpg');
      }
    });

    test('get 2 random questions', () async {
      RobotoffQuestionResult result =
          await OpenFoodAPIClient.getRandomRobotoffQuestion(
              'fr', TestConstants.TEST_USER,
              types: [InsightType.CATEGORY], count: 2);

      expect(result.status != null, true);
      expect(result.status, 'found');
      expect(result.questions!.length, 2);
      expect(result.questions![0].insightType, InsightType.CATEGORY);
      expect(result.questions![1].insightType, InsightType.CATEGORY);
    });
  }, skip: 'This Group of tests is unstable');

  group('$OpenFoodAPIClient get robotoff insights', () {
    test('get random insight', () async {
      InsightsResult result = await OpenFoodAPIClient.getRandomInsight(
          TestConstants.TEST_USER,
          type: InsightType.CATEGORY);

      expect(result.status == null, true);
      expect(result.insights![0].type, InsightType.CATEGORY);
      expect(result.insights![0].id != null, true);
      expect(result.insights![0].barcode != null, true);
      expect(result.insights![0].countries != null, true);
      expect(result.insights![0].lang != null, true);
      expect(result.insights![0].model != null, true);
      // Actually, I stumbled across insights without confidence field...
      //expect(result.insight.confidence != null, true);
    });

    test('get product insights', () async {
      InsightsResult result = await OpenFoodAPIClient.getProductInsights(
        '8025386005564',
        TestConstants.TEST_USER,
      );

      expect(result.status != null, true);
      expect(result.status, 'found');
      expect(result.insights!.isNotEmpty, true);
      expect(result.insights![0].id != null, true);
      expect(result.insights![0].barcode != null, true);
      expect(result.insights![0].countries != null, true);
      expect(result.insights![0].lang != null, true);
      expect(result.insights![0].model != null, true);
      // Actually, I stumbled across insights without confidence field...
      //expect(result.insight.confidence != null, true);
    });
  }, skip: 'This Group of tests is unstable');

  group('$OpenFoodAPIClient get robotoff ingredient spelling corrections', () {
    test('get farine de blé spelling corrections', () async {
      SpellingCorrection result =
          await (OpenFoodAPIClient.getIngredientSpellingCorrection(
        user: TestConstants.TEST_USER,
        ingredientName: 'fqrine de blé',
      ) as FutureOr<SpellingCorrection>);

      expect(result.corrected, 'farine de blé');
      expect(result.input, 'fqrine de blé');
      expect(result.termCorrections!.length, 1);
      expect(result.termCorrections![0].corrections, null);
    });
  }, skip: 'This Group of tests is unstable');
}
