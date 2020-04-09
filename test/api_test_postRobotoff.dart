import 'package:flutter_test/flutter_test.dart';
import 'package:openfoodfacts/model/Insight.dart';
import 'package:openfoodfacts/model/RobotoffQuestion.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/HttpHelper.dart';
import 'test_constants.dart';

void main() {

  setUpAll(() async {
    new HttpHelper().isTestMode = true;
  });

  group('$OpenFoodAPIClient answer robotoff question', () {
    test('get questions for Noix de Saint-Jacques EN and answer', () async {
      RobotoffQuestionResult result = await OpenFoodAPIClient
          .getRobotoffQuestionsForProduct(
          "3274570800026", "en", TestConstants.TEST_USER, count: 1);

      if(result.status == "found") {
        Status postResult = await OpenFoodAPIClient.postInsightAnnotation(result.questions[0].insightId, InsightAnnotation.YES, TestConstants.TEST_USER);
        expect(postResult.status, "saved");
      } else if(result.status == "no_questions") {
        print("No question found for this product");
        expect(result.status, "found");
      } else {
        expect(result.status, "found");
      }
    });
  });
}