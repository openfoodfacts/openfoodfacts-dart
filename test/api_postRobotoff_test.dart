import 'package:flutter_test/flutter_test.dart';
import 'package:openfoodfacts/model/Insight.dart';
import 'package:openfoodfacts/model/RobotoffQuestion.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'test_constants.dart';

void main() {
  group('$OpenFoodAPIClient answer robotoff question', () {
    test('get questions for Noix de Saint-Jacques EN and answer', () async {
      RobotoffQuestionResult result =
          await OpenFoodAPIClient.getRobotoffQuestionsForProduct(
              '0080868000633', 'en', TestConstants.TEST_USER,
              queryType: QueryType.TEST, count: 1);

      if (result.status == 'found') {
        Status postResult = await OpenFoodAPIClient.postInsightAnnotation(
            result.questions![0].insightId,
            InsightAnnotation.YES,
            TestConstants.TEST_USER);
        expect(postResult.status, 'saved');
      }
    });
  }, skip: 'This Group of tests is unstable');
}
