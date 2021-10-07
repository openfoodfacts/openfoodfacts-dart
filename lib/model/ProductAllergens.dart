class ProductAllergens {
  List<String> ids; // allergen id formatted as 'en:gluten'
  List<String> names; // allergen name formatted as 'gluten'

  ProductAllergens(this.ids, this.names);

  static ProductAllergens allergensFromJson(List<dynamic>? json) {
    List<String> ids = [];
    List<String> names = [];

    if (json == null) {
      return ProductAllergens(ids, names);
    }

    for (int i = 0; i < json.length; i++) {
      ids.add(json[i].toString());
      String name = json[i].toString().substring(3); // remove the 'en:' header.
      names.add(name);
    }

    return ProductAllergens(ids, names);
  }

  static List<String>? allergensToJson(ProductAllergens? allergens) {
    List<String> result = [];

    if (allergens == null) {
      return null;
    }

    for (int i = 0; i < allergens.ids.length; i++) {
      result.add(allergens.ids[i].toString());
    }

    return result;
  }
}
