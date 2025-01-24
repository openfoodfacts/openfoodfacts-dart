enum NutrientModifier {
  approximately,
  superiorTo,
  inferiorTo,
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
    String modifier = value.trim().substring(0, 1);
    return fromString(modifier);
  }
}
