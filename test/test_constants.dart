import 'package:openfoodfacts/model/User.dart';

class TestConstants {
  /// TODO: insert your user login for OpenFoodFacts here
  static const User TEST_USER = const User(
    userId: "grumpf@gmx.de",
    password: "takeitorleaveit",
    comment: "dart API test",
  );
}
