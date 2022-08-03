/// Main allergens.
enum AllergensTag {
  GLUTEN,
  MILK,
  EGGS,
  NUTS,
  PEANUTS,
  SESAME_SEEDS,
  SOYBEANS,
  CELERY,
  MUSTARD,
  LUPIN,
  FISH,
  CRUSTACEANS,
  MOLLUSCS,
  SULPHUR_DIOXIDE_AND_SULPHITES,
}

extension AllergensTagExtension on AllergensTag {
  static const Map<AllergensTag, String> _tags = <AllergensTag, String>{
    AllergensTag.GLUTEN: 'en:gluten',
    AllergensTag.MILK: 'en:milk',
    AllergensTag.EGGS: 'en:eggs',
    AllergensTag.NUTS: 'en:nuts',
    AllergensTag.PEANUTS: 'en:peanuts',
    AllergensTag.SESAME_SEEDS: 'en:sesame-seeds',
    AllergensTag.SOYBEANS: 'en:soybeans',
    AllergensTag.CELERY: 'en:celery',
    AllergensTag.MUSTARD: 'en:mustard',
    AllergensTag.LUPIN: 'en:lupin',
    AllergensTag.FISH: 'en:fish',
    AllergensTag.CRUSTACEANS: 'en:crustaceans',
    AllergensTag.MOLLUSCS: 'en:molluscs',
    AllergensTag.SULPHUR_DIOXIDE_AND_SULPHITES:
        'en:sulphur-dioxide-and-sulphites',
  };
  String get tag => _tags[this]!;
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
