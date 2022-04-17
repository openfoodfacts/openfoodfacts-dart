class BarcodeValidator {
  const BarcodeValidator._();

  /// EAN13 and EAN8 are only supported by the OFF API
  static bool isValid(String? barcode) {
    if (barcode == null) {
      return false;
    }

    return _AbstractBarcodeValidator(barcode).isValid;
  }
}

// Code freely inspired from
// [https://commons.apache.org/proper/commons-validator/jacoco/org.apache.commons.validator.routines.checkdigit/]
abstract class _AbstractBarcodeValidator {
  static const int _CHAR_UNIT_ZERO = 48;
  static const int _CHAR_UNIT_NINE = 57;

  final String barcode;
  final int modulus;

  factory _AbstractBarcodeValidator(String barcode) {
    if (_EANValidator.isEAN(barcode)) {
      return _EANValidator(barcode);
    }

    throw Exception("Unsupported barcode type!");
  }

  const _AbstractBarcodeValidator._(this.modulus, this.barcode);

  bool get isValid {
    return _calculateModulus(barcode) == 0;
  }

  int _calculateModulus(String code) {
    int total = 0;
    for (int i = 0; i < code.length; i++) {
      int lth = code.length;
      int leftPos = i + 1;
      int rightPos = lth - i;
      int charValue = _charAsInt(code, i);
      total += _weightedValue(charValue, leftPos, rightPos);
    }

    if (total == 0) {
      throw Exception('Invalid code, sum is zero');
    }

    return total % modulus;
  }

  int _charAsInt(String code, int position) =>
      code.codeUnitAt(position) - _CHAR_UNIT_ZERO;

  int _weightedValue(int charValue, int leftPos, int rightPos);
}

class _EANValidator extends _AbstractBarcodeValidator {
  static const List<int> _POSITION_WEIGHT = <int>[3, 1];
  static const int _EAN8_LENGTH = 8;
  static const int _EAN13_LENGTH = 13;

  const _EANValidator(String barcode) : super._(10, barcode);

  static bool isEAN(String barcode) {
    return (barcode.length == _EAN8_LENGTH ||
            barcode.length == _EAN13_LENGTH) &&
        _isDigitsOnly(barcode);
  }

  static bool _isDigitsOnly(String str) {
    for (int char in str.codeUnits) {
      if (char < _AbstractBarcodeValidator._CHAR_UNIT_ZERO &&
          char > _AbstractBarcodeValidator._CHAR_UNIT_NINE) {
        return false;
      }
    }
    return true;
  }

  int _weightedValue(int charValue, int leftPos, int rightPos) {
    int weight = _POSITION_WEIGHT[rightPos % 2];
    return charValue * weight;
  }
}
