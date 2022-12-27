import 'package:openfoodfacts/openfoodfacts.dart';

void main() async {
  User offUser = User(userId: 'username or email', password: 'password');

  SignUpStatus status = await OpenFoodAPIClient.register(
    user: offUser,
    name: 'Namer',
    email: 'email',
  );

  if (status.status == 201) {
    print('Yeah account created');
    OpenFoodAPIConfiguration.globalUser = offUser;
  } else {
    print('Error: ${status.error}');
  }

/*
  UserProductSearchQueryConfiguration configuration1 =
      UserProductSearchQueryConfiguration(
    type: UserProductSearchType.PHOTOGRAPHER,
    userId: '',
  );

  SearchResult result = await OpenFoodAPIClient.searchProducts(
    User(userId: '', password: ''),
    configuration1,
  );*/
}
