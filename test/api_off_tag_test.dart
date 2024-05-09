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

  test('$OpenFoodAPIClient country/currency', () async {
    final Set<Currency> countryCurrencies = <Currency>{};
    for (final OpenFoodFactsCountry country in OpenFoodFactsCountry.values) {
      final Currency? currency = country.currency;
      if (currency == null) {
        expect(country, OpenFoodFactsCountry.ANTARCTICA);
        continue;
      }
      countryCurrencies.add(currency);
    }
    for (final Currency currency in Currency.values) {
      if (countryCurrencies.contains(currency)) {
        expect(
          currency.complementaryCurrency,
          isFalse,
          reason: 'Problem with currency $currency',
        );
        expect(
          currency.unofficialCode,
          isFalse,
          reason: 'Problem with currency $currency',
        );
        expect(
          currency.historicalCode,
          isFalse,
          reason: 'Problem with currency $currency',
        );
        expect(
          currency.fundsCode,
          isFalse,
          reason: 'Problem with currency $currency',
        );
        expect(
          currency.noCountry,
          isFalse,
          reason: 'Problem with currency $currency',
        );

        continue;
      }
      expect(
        currency.complementaryCurrency ||
            currency.unofficialCode ||
            currency.historicalCode ||
            currency.fundsCode ||
            currency.noCountry,
        isTrue,
        reason: 'Problem with currency $currency',
      );
    }
  });
}
