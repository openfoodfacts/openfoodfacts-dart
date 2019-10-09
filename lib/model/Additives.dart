import '../interface/JsonObject.dart';

class Additives extends JsonObject {
  List<String> ids; // additive id formatted as 'en:e100i'
  List<String> names; // additive name formatted as 'E100i'

  Additives(this.ids, this.names);

  factory Additives.fromJson(List<String> json) {
    List<String> ids = List<String>();
    List<String> names = List<String>();

    for (int i = 0; i < json.length; i++) {
      ids.add(json[i].toString());
      String name = 'E' +
          json[i]
              .toString()
              .substring(4); // remove the 'en:' header and Capitalize the 'E'.
      names.add(name);
    }

    return Additives(ids, names);
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, String> result = Map<String, String>();

    for (int i = 0; i < ids.length; i++) {
      result[i.toString()] = ids[i].toString();
    }

    return result;
  }
}
