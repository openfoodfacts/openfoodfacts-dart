import 'package:openfoodfacts/openfoodfacts.dart';

void main() async {
  User myUser = User(userId: "username", password: "secret_password");

  String barcode = "0000000000000";

  SendImage image = SendImage(
    lang: OpenFoodFactsLanguage.FRENCH,
    barcode: barcode,
    imageField: ImageField.FRONT,
    imageUri: Uri.parse("path_to_my_image"),
  );

  Status status = await OpenFoodAPIClient.addProductImage(myUser, image);

  if (status.status != 1) {
    print(
        "An error occured while sending the picture : ${status.statusVerbose}");
    return;
  }

  print("Upload was successful");
}
