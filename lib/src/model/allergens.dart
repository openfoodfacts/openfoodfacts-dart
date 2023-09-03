import 'off_tagged.dart';

/// Main allergens.
enum AllergensTag implements OffTagged {
  GLUTEN(offTag: 'en:gluten'),
  MILK(offTag: 'en:milk'),
  EGGS(offTag: 'en:eggs'),
  NUTS(offTag: 'en:nuts'),
  PEANUTS(offTag: 'en:peanuts'),
  SESAME_SEEDS(offTag: 'en:sesame-seeds'),
  SOYBEANS(offTag: 'en:soybeans'),
  CELERY(offTag: 'en:celery'),
  MUSTARD(offTag: 'en:mustard'),
  LUPIN(offTag: 'en:lupin'),
  FISH(offTag: 'en:fish'),
  CRUSTACEANS(offTag: 'en:crustaceans'),
  MOLLUSCS(offTag: 'en:molluscs'),
  SULPHUR_DIOXIDE_AND_SULPHITES(offTag: 'en:sulphur-dioxide-and-sulphites');

  const AllergensTag({
    required this.offTag,
  });

  @override
  final String offTag;
}

/// List of known allergens for a [Product].
///
/// If we are lucky, we get values that match with [AllergensTag].
/// If we are less lucky, we have more exotic values.
class Allergens {
  /// Allergen id formatted as 'en:gluten', like in [AllergensTag] tag.
  List<String> ids;

  /// Allergen name formatted as 'gluten'
  List<String> names;

  Allergens(this.ids, this.names);

  static Allergens allergensFromJson(List<dynamic>? json) {
    List<String> ids = [];
    List<String> names = [];

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

  static List<String>? allergensToJson(Allergens? allergens) {
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
