import 'dart:math';

import 'package:openfoodfacts/model/SignUpStatus.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.TEST;

  group('Create user', () {
    test('Login', () async {
      late String email;
      late String name;
      String password = "ThisIsThePassword";

      bool shouldRetry = true;
      int counter = 0;
      const int max_tries = 1;

      while (shouldRetry && counter < max_tries) {
        print("Try $counter");

        counter++;
        name = _generateRandomString(10);
        email = "$name@gmail.com";

        print(name);
        print(email);

        SignUpStatus response = await OpenFoodAPIClient.register(
          user: User(userId: name, password: password),
          name: name,
          email: email,
          queryType: QueryType.TEST,
          newsletter: false,
        );

        print(response.status);
        print(response.statusErrors);
        print(response.error);

        if (response.status == 201) {
          shouldRetry = false;
        }
      }

      bool response = await OpenFoodAPIClient.login(
        User(userId: name, password: password),
        queryType: QueryType.TEST,
      );
      expect(response, true);
    });
  });
}

String _generateRandomString(int length) {
  final Random r = Random();
  return String.fromCharCodes(
      List.generate(length, (index) => r.nextInt(26) + 65));
}
