import 'package:openfoodfacts/utils/AbstractQueryConfiguration.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';

/// Query Configuration for multiple barcodes
class ProductListQueryConfiguration extends AbstractQueryConfiguration {
  final List<String> barcodes;

  ProductListQueryConfiguration(
    this.barcodes, {
    final OpenFoodFactsLanguage? language,
    final String? lc,
    final String? cc,
    final List<ProductField>? fields,
  })  : assert(barcodes.isNotEmpty),
        super(
          language: language,
          lc: lc,
          cc: cc,
          fields: fields,
        );
}
