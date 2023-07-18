import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

void main() {
  test('ProductPackaging bug', () {
    final testProduct = Product();
    const productName = 'Orange';
    testProduct.productName = productName;
    const expectedQuantity = '75cl';
    testProduct.packagings = [
      ProductPackaging()..quantityPerUnit = expectedQuantity
    ];
    final productJson = testProduct.toJson();
    final productRestored = Product.fromJson(productJson);
    expect(productRestored.productName, productName);
    expect(productRestored.packagings!.first.quantityPerUnit, expectedQuantity);
  });
}
