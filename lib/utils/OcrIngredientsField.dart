enum OcrIngredientsField {
  INGREDIENTS_EN,
  INGREDIENTS_FR,
  INGREDIENTS_DE,
}

extension OcrIngredientsFieldExtension on OcrIngredientsField {
  String get key {
    switch (this) {
      case OcrIngredientsField.INGREDIENTS_DE:
        return "ingredients_de";
        break;
      case OcrIngredientsField.INGREDIENTS_FR:
        return "ingredients_fr";
      case OcrIngredientsField.INGREDIENTS_EN:
      default:
        return "ingredients_en";
        break;
    }
  }
}
