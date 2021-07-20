import 'package:openfoodfacts/utils/AbstractQueryConfiguration.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';

/// Query Configuration for multiple barcodes
class ProductListQueryConfiguration extends AbstractQueryConfiguration {
  final List<String> barcodes;

  /// See [AbstractQueryConfiguration.extraLanguages] for
  /// parameter's description.
  ProductListQueryConfiguration(
    this.barcodes, {
    final OpenFoodFactsLanguage? language,
    final List<OpenFoodFactsLanguage> extraLanguages = const [],
    final String? lc,
    final String? cc,
    final List<ProductField>? fields,
  })  : assert(barcodes.isNotEmpty),
        super(
          language: language,
          extraLanguages: extraLanguages,
          lc: lc,
          cc: cc,
          fields: fields,
        );
}
