import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'test_constants.dart';

void main() {
  test('Create user', () async {
    Status response = await OpenFoodAPIClient.register(
      name: 'Irrelevant',
      user: TestConstants.PROD_USER,
      email: 'grumpf@gmx.de',
      queryType: QueryType.PROD,
    );
    expect(response.status, 400);
    expect(
        response.error, 'This username already exists, please choose another.');
  });

  test('Login', () async {
    bool response = await OpenFoodAPIClient.login(TestConstants.PROD_USER,
        queryType: QueryType.PROD);
    expect(response, true);
  });
}
