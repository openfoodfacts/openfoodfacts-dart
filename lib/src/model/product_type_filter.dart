import 'off_tagged.dart';
import 'product_type.dart';

/// Filter on product type for API get product queries.
class ProductTypeFilter implements OffTagged {
  const ProductTypeFilter._(this.offTag);

  ProductTypeFilter(final ProductType productType)
    : offTag = productType.offTag;

  static const ProductTypeFilter all = ProductTypeFilter._('all');

  @override
  final String offTag;
}
