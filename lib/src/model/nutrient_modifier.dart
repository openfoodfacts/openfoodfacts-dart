import 'off_tagged.dart';

/// Modifier for the nutrient values.
enum NutrientModifier implements OffTagged {
  // TODO(monsieurtanuki) add and test valueNotSpecified(offTag: '-'),
  approximately(offTag: '~'),
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
