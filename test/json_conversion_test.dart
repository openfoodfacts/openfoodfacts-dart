import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

void main() {
  test('ProductPackaging bug - covers issues #752 and #765', () {
    const expectedProductName = 'Orange';
    final testProduct = Product()..productName = expectedProductName;
    const expectedQuantity = '75cl';
    final packing = ProductPackaging()..quantityPerUnit = expectedQuantity;
    const expectedId = '4';
    packing.shape = LocalizedTag()..id = expectedId;
    testProduct.packagings = [packing];
    final productJson = testProduct.toJson();
    final productRestored = Product.fromJson(productJson);
    expect(productRestored.productName, expectedProductName);
    final packingRestored = productRestored.packagings!.first;
    expect(packingRestored.quantityPerUnit, expectedQuantity);
    expect(packingRestored.shape!.id, expectedId);
  });

  test('ProductPackaging bug - covers issue #6369 (part 1)', () {
    final testProduct = Product();
    testProduct.packagings = [];
    final productJson = testProduct.toJson();
    final productRestored = Product.fromJson(productJson);
    final packagings = productRestored.packagings;
    expect(packagings, isNotNull);
    expect(packagings, isEmpty);
  });

  test('ProductPackaging bug - covers issue #6369 (part 2)', () {
    final testProduct = Product();
    testProduct.packagings = null;
    final productJson = testProduct.toJson();
    final productRestored = Product.fromJson(productJson);
    final packagings = productRestored.packagings;
    expect(packagings, isNull);
  });
}
