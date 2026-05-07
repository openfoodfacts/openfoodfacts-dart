import 'off_tagged.dart';

/// Modifier for the nutrient values.
///
/// cf. https://github.com/openfoodfacts/openfoodfacts-server/blob/main/lib/ProductOpener/Nutrition.pm
enum NutrientModifier implements OffTagged {
  // TODO(monsieurtanuki) add and test valueNotSpecified(offTag: '-'),
  approximately(offTag: '~'),
  maximum(offTag: '\u{2264}'),
  minimum(offTag: '\u{2265}'),
  greaterThan(offTag: '>'),
  lessThan(offTag: '<');

  const NutrientModifier({required this.offTag});

  @override
  final String offTag;

  /// Returns the first [NutrientModifier] that matches the [offTag].
  static NutrientModifier? fromOffTag(final String? offTag) =>
      OffTagged.fromOffTag(offTag, NutrientModifier.values)
          as NutrientModifier?;

  static NutrientModifier? fromValue(final String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    return fromOffTag(value.substring(0, 1));
  }
}
