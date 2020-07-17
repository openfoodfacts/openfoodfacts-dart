class Allergens {
  List<String> ids; // allergen id formatted as 'en:gluten'
  List<String> names; // allergen name formatted as 'gluten'

  Allergens(this.ids, this.names);

  static Allergens allergensFromJson(List<dynamic> json) {
    List<String> ids = List<String>();
    List<String> names = List<String>();

    if (json == null) {
      return Allergens(ids, names);
    }

    for (int i = 0; i < json.length; i++) {
      ids.add(json[i].toString());
      String name = json[i].toString().substring(3); // remove the 'en:' header.
      names.add(name);
    }

    return Allergens(ids, names);
  }

  static List<String> allergensToJson(Allergens allergens) {
    List<String> result = List<String>();

    if (allergens == null) {
      return null;
    }

    for (int i = 0; i < allergens.ids.length; i++) {
      result.add(allergens.ids[i].toString());
    }

    return result;
  }
}
