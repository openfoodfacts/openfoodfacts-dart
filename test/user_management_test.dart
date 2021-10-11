import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.globalQueryType = QueryType.PROD;

  test('Create user', () async {
    Status response = await OpenFoodAPIClient.register(
      name: 'Irrelevant',
      user: TestConstants.PROD_USER,
      email: 'grumpf@gmx.de',
    );
    expect(response.status, 400);
    expect(
        response.error, 'This username already exists, please choose another.');
  });

  test('Login', () async {
    bool response = await OpenFoodAPIClient.login(
      TestConstants.PROD_USER,
    );
    expect(response, true);
  });

  test('Reset password', () async {
    Status status =
        await OpenFoodAPIClient.resetPassword(TestConstants.TEST_USER.userId);

    expect(status.status, 200);
  });
}
