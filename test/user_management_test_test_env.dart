import 'dart:math';

import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

void main() {
  const QueryType user_test_queryType = QueryType.TEST;

  group('Create user', () {
    test('Create user', () async {
      late String userId;
      late String email;
      late String name;
      String password = "ThisIsThePassword";

      bool shouldRetry = true;
      int counter = 0;
      const int max_tries = 5;

      while (shouldRetry && counter < max_tries) {
        counter++;
        userId = _generateRandomString(10);
        name = 'M. $userId';
        email = "$userId@gmail.com";

        print(name);

        SignUpStatus response = await OpenFoodAPIClient.register(
          user: User(userId: userId, password: password),
          name: name,
          email: email,
          queryType: user_test_queryType,
          newsletter: false,
        );

        if (response.status == 201) {
          shouldRetry = false;
        }
      }

      final LoginStatus? status = await OpenFoodAPIClient.login2(
        User(userId: userId, password: password),
        queryType: user_test_queryType,
      );
      expect(status, isNotNull);
      expect(status!.successful, isTrue);
      expect(status.userId, userId);
      expect(status.userName, name);
      expect(status.userEmail, email);
      print('Creating a account and logging in worked in $counter trie(s)');
    });

    test('Login with invalid credentials', () async {
      final LoginStatus? status = await OpenFoodAPIClient.login2(
        User(userId: '123', password: '123'),
        queryType: user_test_queryType,
      );
      expect(status?.successful, false);
      expect(status?.statusVerbose, 'user not signed-in');
    });
  });
}

String _generateRandomString(int length) {
  final Random r = Random();
  return String.fromCharCodes(
    List.generate(length, (index) => r.nextInt(26) + 65),
  ).toLowerCase();
}
