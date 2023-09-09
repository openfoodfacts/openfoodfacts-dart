import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;

  group('$OpenFoodAPIClient get robotoff questions', () {
    test('get questions for Noix de Saint-Jacques EN', () async {
      RobotoffQuestionResult result =
          await RobotoffAPIClient.getProductQuestions(
        '3274570800026',
        OpenFoodFactsLanguage.ENGLISH,
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
          await RobotoffAPIClient.getProductQuestions(
        '3274570800026',
        OpenFoodFactsLanguage.FRENCH,
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

    test('Find questions by insight type', () async {
      // Let's find 5 products with questions
      final OpenFoodFactsLanguage language = OpenFoodFactsLanguage.ENGLISH;
      final User user = TestConstants.PROD_USER;

      final RobotoffQuestionResult productsWithQuestions =
          await RobotoffAPIClient.getQuestions(
        language,
        user: user,
        count: 5,
      );

      // For each question, check if we can get it with [getProductQuestions]
      // with the given insight type
      if (productsWithQuestions.questions?.isNotEmpty != true) {
        return;
      }
      for (RobotoffQuestion question in productsWithQuestions.questions!) {
        if (question.insightType == null ||
            question.insightType == InsightType.UNDEFINED ||
            question.insightType == InsightType.UNKNOWN) {
          continue;
        }

        final InsightType insightType = question.insightType!;

        final RobotoffQuestionResult result =
            await RobotoffAPIClient.getProductQuestions(
          question.barcode!,
          language,
          user: user,
          insightTypes: [insightType],
        );

        final int count = result.questions!
            .where((RobotoffQuestion productQuestion) =>
                productQuestion.insightType == insightType)
            .length;

        expect(count, greaterThan(0));
      }
    });

    test('get popular questions with types', () async {
      Future<List<RobotoffQuestion>> getTopPopularQuestions(
        final OpenFoodFactsCountry country,
      ) async {
        const InsightType type = InsightType.CATEGORY;
        const int numQuestions = 10;
        final RobotoffQuestionResult result =
            await RobotoffAPIClient.getQuestions(
          OpenFoodFactsLanguage.GERMAN,
          user: TestConstants.PROD_USER,
          insightTypes: [type],
          count: numQuestions,
          countries: <OpenFoodFactsCountry>[country],
          questionOrder: RobotoffQuestionOrder.popularity,
        );

        expect(result.status, isNotNull);
        expect(result.status, 'found');
        expect(result.questions, isNotNull);
        expect(result.questions!.length, numQuestions);
        for (final RobotoffQuestion question in result.questions!) {
          expect(question.insightType, type);
        }
        return result.questions!;
      }

      List<RobotoffQuestion> questions;

      questions = await getTopPopularQuestions(
        OpenFoodFactsCountry.GERMANY,
      );
      final List<String> germanBarcodes1 = <String>[];
      for (final RobotoffQuestion question in questions) {
        germanBarcodes1.add(question.barcode!);
      }

      questions = await getTopPopularQuestions(
        OpenFoodFactsCountry.GERMANY,
      );
      final List<String> germanBarcodes2 = <String>[];
      for (final RobotoffQuestion question in questions) {
        germanBarcodes2.add(question.barcode!);
      }
      // highly probable
      expect(germanBarcodes2, germanBarcodes1);

      questions = await getTopPopularQuestions(
        OpenFoodFactsCountry.FRANCE,
      );
      final List<String> frenchBarcodes1 = <String>[];
      for (final RobotoffQuestion question in questions) {
        frenchBarcodes1.add(question.barcode!);
      }
      // highly probable
      expect(germanBarcodes2, isNot(frenchBarcodes1));
    });

    test('get 2 random questions with no specific type', () async {
      final RobotoffQuestionResult result =
          await RobotoffAPIClient.getQuestions(
        OpenFoodFactsLanguage.FRENCH,
        user: TestConstants.PROD_USER,
        count: 2,
        questionOrder: RobotoffQuestionOrder.random,
      );

      expect(result.status, isNotNull);
      expect(result.status, 'found');
      expect(result.questions!.length, 2);
    });
  });

  group('$OpenFoodAPIClient get robotoff insights', () {
    test('get random insight', () async {
      final InsightsResult result = await RobotoffAPIClient.getRandomInsights(
        type: InsightType.CATEGORY,
        countries: <OpenFoodFactsCountry>[OpenFoodFactsCountry.FRANCE],
      );

      expect(result.status, isNotNull);
      expect(result.status, 'found');
      expect(result.insights![0].type, InsightType.CATEGORY);
      expect(result.insights![0].id, isNotNull);
      expect(result.insights![0].barcode, isNotNull);
    });

    test('get product insights (found)', () async {
      final InsightsResult result1 = await RobotoffAPIClient.getRandomInsights(
        type: InsightType.CATEGORY,
      );

      final String barcode = result1.insights![0].barcode!;

      final InsightsResult result = await RobotoffAPIClient.getProductInsights(
        barcode,
      );

      expect(result.status, isNotNull);
      expect(result.status, 'found');
      expect(result.insights!, isNotEmpty);
      expect(result.insights![0].id, isNotNull);
      expect(result.insights![0].barcode, barcode);
    });

    test('get product insights (none)', () async {
      const String fakeBarcode = '3615';
      InsightsResult result = await RobotoffAPIClient.getProductInsights(
        fakeBarcode,
      );

      expect(result.status, isNotNull);
      expect(result.status, 'no_insights');
      expect(result.insights, isNull);
    });
  });
}
