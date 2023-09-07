import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

/// Tests about [OffTagged] `enum`s.
void main() {
  test('$OpenFoodAPIClient country', () async {
    const Map<String?, OpenFoodFactsCountry?> expectedCountries =
        <String?, OpenFoodFactsCountry?>{
      'fr': OpenFoodFactsCountry.FRANCE,
      'FR': OpenFoodFactsCountry.FRANCE,
      'fR': OpenFoodFactsCountry.FRANCE,
      'Fr': OpenFoodFactsCountry.FRANCE,
      'uk': OpenFoodFactsCountry.UNITED_KINGDOM,
      'UK': OpenFoodFactsCountry.UNITED_KINGDOM,
      'gb': OpenFoodFactsCountry.UNITED_KINGDOM,
      'GB': OpenFoodFactsCountry.UNITED_KINGDOM,
      null: null,
      'this is not a country code': null,
    };
    for (final MapEntry<String?, OpenFoodFactsCountry?> entry
        in expectedCountries.entries) {
      expect(OpenFoodFactsCountry.fromOffTag(entry.key), entry.value);
    }
  });
}
