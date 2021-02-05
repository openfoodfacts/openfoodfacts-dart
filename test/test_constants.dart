import 'package:openfoodfacts/model/User.dart';

class TestConstants {
  /// TODO: insert your user login for OpenFoodFacts here
  static const User TEST_USER = const User(
    userId: "openfoodfacts-dart",
    password: "iloveflutter",
    comment: "dart API test",
  );
}
