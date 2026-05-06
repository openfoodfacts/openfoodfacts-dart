import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';
import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  const UriHelper uriHelper = uriHelperRobotoffTest;

  group('$OpenFoodAPIClient answer robotoff question for FR', () {
    Future<void> testNotAskingAgain({
      required final User? user,
      required final String? deviceId,
    }) async {
      Future<RobotoffQuestionResult> getQuestions() async =>
          RobotoffAPIClient.getQuestions(
            OpenFoodFactsLanguage.FRENCH,
            countries: [OpenFoodFactsCountry.FRANCE],
            user: user,
            deviceId: deviceId,
            count: 2,
            uriHelper: uriHelper,
            questionOrder: RobotoffQuestionOrder.popularity,
            serverType: ServerType.openFoodFacts,
          );

      Future<Status> postAnnotation(final String insightId) async =>
          RobotoffAPIClient.postInsightAnnotation(
            insightId,
            InsightAnnotation.MAYBE,
            user: user,
            deviceId: deviceId,
            uriHelper: uriHelper,
          );

      RobotoffQuestionResult result;

      result = await getQuestions();

      if (result.status != 'found') {
        return;
      }
      if (result.questions == null) {
        // not likely
        return;
      }
      if (result.questions!.length < 2) {
        return;
      }
      final String firstInsightId = result.questions![0].insightId!;
      final String secondInsightId = result.questions![1].insightId!;

      final Status status = await postAnnotation(firstInsightId);
      expect(status.status, 'vote_saved');

      // checking that the first question is now skipped.
      result = await getQuestions();
      expect(result.status, 'found');
      expect(result.questions, isNotNull);
      expect(result.questions!.length, greaterThanOrEqualTo(1));
      expect(result.questions![0].insightId!, secondInsightId);
    }

    test(
      'get ALL questions and answer, with user',
      () async =>
          testNotAskingAgain(user: TestConstants.TEST_USER, deviceId: null),
    );

    test(
      'get ALL questions and answer, with device id',
      () async => testNotAskingAgain(
        user: null,
        deviceId: 'device id for off-dart tests',
      ),
    );

    test(
      'get ALL questions and answer, with both user and device id',
      () async => testNotAskingAgain(
        user: TestConstants.TEST_USER,
        deviceId: 'device id for off-dart tests',
      ),
    );

    test(
      'get ALL questions and answer, with no user and no device id',
      () async => testNotAskingAgain(user: null, deviceId: null),
    );
  });
}
