import 'package:openfoodfacts/model/User.dart';

class TestConstants {
  /// TODO: insert your user login for OpenFoodFacts here
  static const User TEST_USER = User(
    userId: "openfoodfacts-dart",
    password: "iloveflutter",
    comment: "dart API test",
  );

  static const User PROD_USER = User(
    userId: "grumpf@gmx.de",
    password: "takeitorleaveit",
    comment: "dart API test",
  );
}
