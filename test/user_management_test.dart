import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.PROD;

  group('Create user', () {
    final User user = TestConstants.PROD_USER;
    final String email = 'grumpf@gmx.de';

    test('Create a user with a long username', () async {
      String randomUserName = List.filled(
        OpenFoodAPIClient.USER_NAME_MAX_LENGTH + 1,
        'A',
      ).join();

      expect(
        OpenFoodAPIClient.register(
          name: randomUserName,
          user: user,
          email: email,
        ),
        throwsArgumentError,
      );
    });

    test('Create existing user', () async {
      Status response = await OpenFoodAPIClient.register(
        name: 'Irrelevant',
        user: user,
        email: email,
      );
      expect(response.status, 400);
      expect(response.error,
          'This username already exists, please choose another.');
    });
  });

  test('Login', () async {
    bool response = await OpenFoodAPIClient.login(
      TestConstants.PROD_USER,
    );
    expect(response, true);
  });

  test('Reset password', () async {
    Status status =
        await OpenFoodAPIClient.resetPassword(TestConstants.TEST_USER.userId);

    expect(status.status, 200);
  });
}
