import 'package:openfoodfacts/openfoodfacts.dart';

class TestConstants {
  static const UserAgent TEST_USER_AGENT = UserAgent(
    name: 'off-dart integration tests',
  );

  static const User TEST_USER = User(
    userId: 'openfoodfacts-dart',
    password: 'iloveflutter',
    comment: 'dart API test',
  );

  static const User PROD_USER = User(
    userId: 'grumpf',
    password: 'takeitorleaveit',
    comment: 'dart API test',
  );
}
