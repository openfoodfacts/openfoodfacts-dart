import 'package:openfoodfacts/openfoodfacts.dart';

class TestConstants {
  // ignore: non_constant_identifier_names
  static final UserAgent TEST_USER_AGENT = UserAgent(
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

  static const String badGatewayError =
      'Exception: JSON expected, html found: <head><title>502 Bad Gateway</title></head>';
}
