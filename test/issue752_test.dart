import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

void main() {
  test('ProductPackaging bug', () {
    final testProduct = Product();
    const productName = 'Orange';
    testProduct.productName = productName;
    testProduct.packagings = [ProductPackaging()..quantityPerUnit = '75cl'];
    final productJson = testProduct.toJson();
    try {
      final productRestored = Product.fromJson(productJson);
      expect(productRestored.productName, productName);
    } catch (e, s) {
      print(s);
      fail('Could not restore Product from JSON $e');
    }
  });
}
