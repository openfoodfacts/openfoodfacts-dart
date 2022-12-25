import 'package:openfoodfacts/model/user.dart';

class TestConstants {
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
