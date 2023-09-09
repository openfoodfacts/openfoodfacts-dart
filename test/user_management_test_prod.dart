import 'dart:math';

import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;

  group('Create existing user (without specifying a country, nor a language)',
      () {
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

  group('Create existing user by forcing a country + language', () {
    final User user = TestConstants.PROD_USER;
    final String email = 'grumpf@gmx.de';
    final OpenFoodFactsCountry country = OpenFoodFactsCountry.FRANCE;
    final OpenFoodFactsLanguage language = OpenFoodFactsLanguage.FRENCH;

    test('Create a FR-fr user with a long username', () async {
      String randomUserName = List.filled(
        OpenFoodAPIClient.USER_NAME_MAX_LENGTH + 1,
        'A',
      ).join();

      expect(
        OpenFoodAPIClient.register(
          name: randomUserName,
          user: user,
          email: email,
          country: country,
          language: language,
        ),
        throwsArgumentError,
      );
    });

    test('Create an existing FR-fr user', () async {
      SignUpStatus response = await OpenFoodAPIClient.register(
        name: 'Irrelevant',
        user: user,
        email: email,
        country: country,
        language: language,
      );
      expect(response.status, 400);
      expect(
        response.error!.contains(
            'Ce nom d\'utilisateur existe déjà, choisissez en un autre.'),
        isTrue,
      );
    });

    test('Create a FR-fr user with an existing email', () async {
      SignUpStatus response = await OpenFoodAPIClient.register(
        name: _generateRandomString(OpenFoodAPIClient.USER_NAME_MAX_LENGTH),
        user: user,
        email: 'test@test.com',
        country: country,
        language: language,
      );
      expect(response.status, 400);
      expect(
        response.error!.contains(
            'Ce nom d\'utilisateur existe déjà, choisissez en un autre.'),
        isTrue,
      );
    });
  });

  test('Login', () async {
    final LoginStatus? status = await OpenFoodAPIClient.login2(
      TestConstants.PROD_USER,
    );
    expect(status, isNotNull);
    expect(status!.successful, isTrue);
    expect(status.userId, TestConstants.PROD_USER.userId);
  });

  group('reset password', () {
    final String existingUser = TestConstants.TEST_USER.userId;
    final String notExistingUser =
        '${TestConstants.TEST_USER.userId}...@comfjdklf';
    const int okStatus = 200;
    const int koStatus = 400;

    test('Reset password for existing user (no country, no language)',
        () async {
      final Status status = await OpenFoodAPIClient.resetPassword(
        existingUser,
      );
      expect(status.status, okStatus);
    });

    test('Reset password for not existing user (no country, no language)',
        () async {
      final Status status = await OpenFoodAPIClient.resetPassword(
        notExistingUser,
      );
      expect(status.status, koStatus);
    });

    test('Reset password in French for existing user', () async {
      final Status status = await OpenFoodAPIClient.resetPassword(
        existingUser,
        language: OpenFoodFactsLanguage.FRENCH,
      );
      expect(status.status, okStatus);
    });

    test('Reset password in French for not existing user', () async {
      final Status status = await OpenFoodAPIClient.resetPassword(
        notExistingUser,
        language: OpenFoodFactsLanguage.FRENCH,
      );
      expect(status.status, koStatus);
    });

    test('Reset password in BE_nl for existing user', () async {
      final Status status = await OpenFoodAPIClient.resetPassword(
        existingUser,
        language: OpenFoodFactsLanguage.DUTCH,
        country: OpenFoodFactsCountry.BELGIUM,
      );
      expect(status.status, okStatus);
    });

    test('Reset password in BE_nl for not existing user', () async {
      final Status status = await OpenFoodAPIClient.resetPassword(
        notExistingUser,
        language: OpenFoodFactsLanguage.DUTCH,
        country: OpenFoodFactsCountry.BELGIUM,
      );
      expect(status.status, koStatus);
    });
  });
}

String _generateRandomString(int length) {
  final Random r = Random();
  return String.fromCharCodes(
      List.generate(length, (index) => r.nextInt(26) + 65));
}
