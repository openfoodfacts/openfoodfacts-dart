import 'dart:math';

import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  OpenFoodAPIConfiguration.globalQueryType = QueryType.PROD;

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

  test('Reset password', () async {
    Status status =
        await OpenFoodAPIClient.resetPassword(TestConstants.TEST_USER.userId);

    expect(status.status, 200);
  });

  test('Reset password in French', () async {
    Status status = await OpenFoodAPIClient.resetPassword(
      TestConstants.TEST_USER.userId,
      language: OpenFoodFactsLanguage.FRENCH,
    );

    expect(
      status.body!,
      contains(
          'Un e-mail avec un lien pour vous permettre de changer le mot de passe a été envoyé'),
    );
  });
}

String _generateRandomString(int length) {
  final Random r = Random();
  return String.fromCharCodes(
      List.generate(length, (index) => r.nextInt(26) + 65));
}
