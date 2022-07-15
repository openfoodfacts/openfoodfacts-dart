import 'dart:math';

import 'package:openfoodfacts/model/SignUpStatus.dart';
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
      SignUpStatus response = await OpenFoodAPIClient.register(
        name: 'Irrelevant',
        user: user,
        email: email,
      );
      expect(response.status, 400);
      expect(
        response.statusErrors!
            .contains(SignUpStatusError.USERNAME_ALREADY_USED),
        isTrue,
      );
    });

    test('Create an user with an existing email', () async {
      SignUpStatus response = await OpenFoodAPIClient.register(
        name: _generateRandomString(OpenFoodAPIClient.USER_NAME_MAX_LENGTH),
        user: user,
        email: 'test@test.com',
      );
      expect(response.status, 400);
      expect(
        response.statusErrors!.contains(SignUpStatusError.EMAIL_ALREADY_USED),
        isTrue,
      );
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

String _generateRandomString(int length) {
  final Random r = Random();
  return String.fromCharCodes(
      List.generate(length, (index) => r.nextInt(26) + 65));
}
