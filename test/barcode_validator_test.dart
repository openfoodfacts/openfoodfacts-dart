import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;

  group('EAN8', () {
    test('Valid EAN8 barcodes', () {
      expect(BarcodeValidator.isValid("12345670"), true);
      expect(BarcodeValidator.isValid("47195127"), true);
    });

    test('Invalid EAN8 barcodes', () {
      expect(BarcodeValidator.isValid("12345676"), false);
      expect(BarcodeValidator.isValid("56987943"), false);
    });
  });

  group('EAN13', () {
    test('Valid EAN13 barcodes', () {
      expect(BarcodeValidator.isValid("4719512002889"), true);
      expect(BarcodeValidator.isValid("1234567890128"), true);
    });

    test('Invalid EAN13 barcodes', () {
      expect(BarcodeValidator.isValid("4719512002884"), false);
      expect(BarcodeValidator.isValid("1234567890127"), false);
    });
  });
}
