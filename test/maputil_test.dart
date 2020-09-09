import 'package:flutter_test/flutter_test.dart';
import 'package:openfoodfacts/utils/MapUtil.dart';

void main() {
  test('Flatten map', () {
    var toFlatten = {
      "A": "a",
      "B": {
        "C": "c",
        "D": "d",
        "E": {
          "F": "f",
          "G": {"H": "h"}
        }
      }
    };
    expect(MapUtil.flattenMap(toFlatten),
        {"A": "a", "C": "c", "D": "d", "F": "f", "H": "h"});
  });
}
