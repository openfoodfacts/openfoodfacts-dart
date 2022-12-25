import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/open_food_api_configuration.dart';
import 'package:openfoodfacts/utils/query_type.dart';
import 'package:test/test.dart';
import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;

  group('$OpenFoodAPIClient answer robotoff question', () {
    test('get questions for Noix de Saint-Jacques EN and answer', () async {
      RobotoffQuestionResult result =
          await OpenFoodAPIClient.getRobotoffQuestionsForProduct(
              '0080868000633', 'en',
              user: TestConstants.TEST_USER, count: 1);

      if (result.status == 'found') {
        Status postResult = await OpenFoodAPIClient.postInsightAnnotation(
            result.questions![0].insightId, InsightAnnotation.YES,
            user: TestConstants.TEST_USER);
        expect(postResult.status, 'saved');
      }
    });
  });
}
