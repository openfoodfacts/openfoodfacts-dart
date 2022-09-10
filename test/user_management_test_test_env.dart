import 'dart:math';

import 'package:openfoodfacts/model/SignUpStatus.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

void main() {
  const QueryType user_test_queryType = QueryType.TEST;

  group('Create user', () {
    test('Create user', () async {
      late String email;
      late String name;
      String password = "ThisIsThePassword";

      bool shouldRetry = true;
      int counter = 0;
      const int max_tries = 5;

      while (shouldRetry && counter < max_tries) {
        counter++;
        name = _generateRandomString(10);
        email = "$name@gmail.com";

        print(name);

        SignUpStatus response = await OpenFoodAPIClient.register(
          user: User(userId: name, password: password),
          name: name,
          email: email,
          queryType: user_test_queryType,
          newsletter: false,
        );

        if (response.status == 201) {
          shouldRetry = false;
        }
      }

      bool response = await OpenFoodAPIClient.login(
        User(userId: name, password: password),
        queryType: user_test_queryType,
      );
      expect(response, true);
      print('Creating a account and logging in worked in $counter tries');
    });
  });
}

String _generateRandomString(int length) {
  final Random r = Random();
  return String.fromCharCodes(
    List.generate(length, (index) => r.nextInt(26) + 65),
  ).toLowerCase();
}
