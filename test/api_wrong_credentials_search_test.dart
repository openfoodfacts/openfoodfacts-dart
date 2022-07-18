import 'package:openfoodfacts/model/parameter/SearchTerms.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

void main() async {
  test('Test for FormatException when searching with wrong credentials',
      () async {
    final ProductSearchQueryConfiguration configuration =
        ProductSearchQueryConfiguration(
      parametersList: [
        SearchTerms(terms: ["Olive", "Oil"]),
        const SortBy(option: SortOption.POPULARITY)
      ],
      fields: [ProductField.ALL],
      language: OpenFoodFactsLanguage.GERMAN,
    );

    expect(
      () async => await OpenFoodAPIClient.searchProducts(
        User(userId: 'sdfsdf', password: 'sdfsdf'),
        configuration,
        queryType: QueryType.TEST,
      ),
      throwsFormatException,
    );
  });
}
