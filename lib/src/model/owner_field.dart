import '../utils/language_helper.dart';
import '../utils/product_fields.dart';
import 'nutrient.dart';
import 'off_tagged.dart';

/// Helper class to compute the Product.ownerFields tags.
class OwnerField implements OffTagged {
  const OwnerField.raw(this.offTag);

  OwnerField.nutrient(final Nutrient nutrient) : this.raw(nutrient.offTag);

  factory OwnerField.productField(
    final ProductField productField,
    final OpenFoodFactsLanguage language,
  ) {
    final ProductField? inLanguages = productField.inLanguages;
    if (inLanguages == null) {
      return OwnerField.raw(productField.offTag);
    }
    return OwnerField.raw('${inLanguages.offTag}${language.offTag}');
  }

  @override
  final String offTag;
}
