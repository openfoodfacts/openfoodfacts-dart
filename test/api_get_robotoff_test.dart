import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';
import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalQueryType = QueryType.PROD;

  group('$OpenFoodAPIClient get robotoff questions', () {
    test('get questions for Noix de Saint-Jacques EN', () async {
      RobotoffQuestionResult result =
          await OpenFoodAPIClient.getRobotoffQuestionsForProduct(
        '3274570800026',
        'en',
        user: TestConstants.PROD_USER,
        count: 1,
      );

      if (result.status != 'no_questions') {
        expect(result.status, isNotNull);
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
        user: TestConstants.PROD_USER,
      );

      if (result.status != 'no_questions') {
        expect(result.status, isNotNull);
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

    test('get 2 random questions with types', () async {
      const InsightType type = InsightType.CATEGORY;
      final RobotoffQuestionResult result =
          await OpenFoodAPIClient.getRandomRobotoffQuestion(
        'fr',
        TestConstants.PROD_USER,
        types: [type],
        count: 2,
      );

      expect(result.status, isNotNull);
      expect(result.status, 'found');
      expect(result.questions!.length, 2);
      expect(result.questions![0].insightType, type);
      expect(result.questions![1].insightType, type);
    });

    test('get 2 random questions with no specific type', () async {
      final RobotoffQuestionResult result =
          await OpenFoodAPIClient.getRandomRobotoffQuestion(
        'fr',
        TestConstants.PROD_USER,
        count: 2,
      );

      expect(result.status, isNotNull);
      expect(result.status, 'found');
      expect(result.questions!.length, 2);
    });
  });

  group('$OpenFoodAPIClient get robotoff insights', () {
    test('get random insight', () async {
      final InsightsResult result = await OpenFoodAPIClient.getRandomInsight(
        TestConstants.PROD_USER,
        type: InsightType.CATEGORY,
      );

      expect(result.status, isNotNull);
      expect(result.status, 'found');
      expect(result.insights![0].type, InsightType.CATEGORY);
      expect(result.insights![0].id, isNotNull);
      expect(result.insights![0].barcode, isNotNull);
    });

    test('get product insights (found)', () async {
      final InsightsResult result1 = await OpenFoodAPIClient.getRandomInsight(
        TestConstants.PROD_USER,
        type: InsightType.CATEGORY,
      );

      final String barcode = result1.insights![0].barcode!;

      final InsightsResult result = await OpenFoodAPIClient.getProductInsights(
        barcode,
        TestConstants.PROD_USER,
      );

      expect(result.status, isNotNull);
      expect(result.status, 'found');
      expect(result.insights!, isNotEmpty);
      expect(result.insights![0].id, isNotNull);
      expect(result.insights![0].barcode, barcode);
    });

    test('get product insights (none)', () async {
      const String fakeBarcode = '3615';
      InsightsResult result = await OpenFoodAPIClient.getProductInsights(
        fakeBarcode,
        TestConstants.PROD_USER,
      );

      expect(result.status, isNotNull);
      expect(result.status, 'no_insights');
      expect(result.insights, isNull);
    });
  });
}
