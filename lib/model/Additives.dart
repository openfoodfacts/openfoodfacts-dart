class Additives {
  List<String> ids; // additive id formatted as 'en:e100i'
  List<String> names; // additive name formatted as 'E100i'

  Additives(this.ids, this.names);

  static Additives additivesFromJson(List<dynamic>? json) {
    List<String> ids = [];
    List<String> names = [];

    if (json == null) {
      return Additives(ids, names);
    }

    for (int i = 0; i < json.length; i++) {
      ids.add(json[i].toString());
      String name =
          'E${json[i].toString().substring(4)}'; // remove the 'en:' header and Capitalize the 'E'.
      names.add(name);
    }

    return Additives(ids, names);
  }

  static List<String>? additivesToJson(Additives? additives) {
    List<String> result = [];

    if (additives == null) {
      return null;
    }

    for (int i = 0; i < additives.ids.length; i++) {
      result.add(additives.ids[i].toString());
    }

    return result;
  }
}
