import 'package:openfoodfacts/src/model/off_tagged.dart';

enum NutrientModifier implements OffTagged {
  approximately,
  superiorTo,
  inferiorTo;

  @override
  String get offTag => symbol;
}

extension NutrientModifierExtension on NutrientModifier {
  String get symbol {
    switch (this) {
      case NutrientModifier.approximately:
        return '~';
      case NutrientModifier.superiorTo:
        return '>';
      case NutrientModifier.inferiorTo:
        return '<';
    }
  }

  static NutrientModifier? fromString(String? modifier) {
    for (final NutrientModifier value in NutrientModifier.values) {
      if (value.symbol == modifier) {
        return value;
      }
    }

    switch (modifier) {
      case '~':
        return NutrientModifier.approximately;
      case '>':
        return NutrientModifier.superiorTo;
      case '<':
        return NutrientModifier.inferiorTo;
      default:
        return null;
    }
  }

  static NutrientModifier? fromValue(String value) {
    if (value.trim().isEmpty) {
      return null;
    }

    String modifier = value.trim().substring(0, 1);
    return fromString(modifier);
  }
}
