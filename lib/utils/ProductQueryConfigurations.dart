import 'package:openfoodfacts/utils/AbstractQueryConfiguration.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';

/// Query Configuration for single barcode
class ProductQueryConfiguration extends AbstractQueryConfiguration {
  final String barcode;

  /// See [AbstractQueryConfiguration.secondaryLanguages] for
  /// parameter's description.
  ProductQueryConfiguration(
    this.barcode, {
    final OpenFoodFactsLanguage? language,
    final List<OpenFoodFactsLanguage> secondaryLanguages = const [],
    final String? lc,
    final String? cc,
    final List<ProductField>? fields,
  }) : super(
          language: language,
          secondaryLanguages: secondaryLanguages,
          lc: lc,
          cc: cc,
          fields: fields,
        );
}
