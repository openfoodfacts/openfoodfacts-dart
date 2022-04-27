import 'package:openfoodfacts/interface/JsonObject.dart';

class Attribute extends JsonObject {
  Attribute({
    this.id,
    this.name,
    this.title,
    this.iconUrl,
    this.defaultF,
    this.settingNote,
    this.settingName,
    this.description,
    this.descriptionShort,
    this.match,
    this.status,
    this.panelId,
  });

  factory Attribute.fromJson(dynamic json) => Attribute(
        id: json[_JSON_TAG_ID] as String,
        name: json[_JSON_TAG_NAME] as String?,
        title: json[_JSON_TAG_TITLE] as String?,
        iconUrl: json[_JSON_TAG_ICON_URL] as String?,
        defaultF: json[_JSON_TAG_DEFAULT] as String?,
        settingNote: json[_JSON_TAG_SETTING_NOTE] as String?,
        settingName: json[_JSON_TAG_SETTING_NAME] as String?,
        description: json[_JSON_TAG_DESCRIPTION] as String?,
        descriptionShort: json[_JSON_TAG_DESCRIPTION_SHORT] as String?,
        match: JsonObject.parseDouble(json[_JSON_TAG_MATCH]),
        status: json[_JSON_TAG_STATUS] as String?,
        panelId: json[_JSON_TAG_PANEL_ID] as String?,
      );

  @override
  Map<String, dynamic> toJson() => JsonObject.removeNullEntries({
        _JSON_TAG_ID: id,
        _JSON_TAG_NAME: name,
        _JSON_TAG_TITLE: title,
        _JSON_TAG_ICON_URL: iconUrl,
        _JSON_TAG_DEFAULT: defaultF,
        _JSON_TAG_SETTING_NOTE: settingNote,
        _JSON_TAG_SETTING_NAME: settingName,
        _JSON_TAG_DESCRIPTION: description,
        _JSON_TAG_DESCRIPTION_SHORT: descriptionShort,
        _JSON_TAG_MATCH: match,
        _JSON_TAG_STATUS: status,
        _JSON_TAG_PANEL_ID: panelId,
      });

  static const String _JSON_TAG_ID = 'id';
  static const String _JSON_TAG_NAME = 'name';
  static const String _JSON_TAG_TITLE = 'title';
  static const String _JSON_TAG_ICON_URL = 'icon_url';
  static const String _JSON_TAG_DEFAULT = 'default';
  static const String _JSON_TAG_SETTING_NOTE = 'setting_note';
  static const String _JSON_TAG_SETTING_NAME = 'setting_name';
  static const String _JSON_TAG_DESCRIPTION = 'description';
  static const String _JSON_TAG_DESCRIPTION_SHORT = 'description_short';
  static const String _JSON_TAG_MATCH = 'match';
  static const String _JSON_TAG_STATUS = 'status';
  static const String _JSON_TAG_PANEL_ID = 'panel_id';

  static const String STATUS_UNKNOWN = 'unknown';
  static const String STATUS_KNOWN = 'known';

  static const String ATTRIBUTE_NUTRISCORE = 'nutriscore';
  static const String ATTRIBUTE_LOW_SALT = 'low_salt';
  static const String ATTRIBUTE_LOW_SUGARS = 'low_sugars';
  static const String ATTRIBUTE_LOW_FAT = 'low_fat';
  static const String ATTRIBUTE_LOW_SATURATED_FAT = 'low_saturated_fat';

  static const String ATTRIBUTE_NOVA = 'nova';
  static const String ATTRIBUTE_ADDITIVES = 'additives';

  static const String ATTRIBUTE_ALLERGENS_NO_GLUTEN = 'allergens_no_gluten';
  static const String ATTRIBUTE_ALLERGENS_NO_MILK = 'allergens_no_milk';
  static const String ATTRIBUTE_ALLERGENS_NO_EGGS = 'allergens_no_eggs';
  static const String ATTRIBUTE_ALLERGENS_NO_NUTS = 'allergens_no_nuts';
  static const String ATTRIBUTE_ALLERGENS_NO_PEANUTS = 'allergens_no_peanuts';
  static const String ATTRIBUTE_ALLERGENS_NO_SESAME_SEEDS =
      'allergens_no_sesame_seeds';
  static const String ATTRIBUTE_ALLERGENS_NO_SOYBEANS = 'allergens_no_soybeans';
  static const String ATTRIBUTE_ALLERGENS_NO_CELERY = 'allergens_no_celery';
  static const String ATTRIBUTE_ALLERGENS_NO_MUSTARD = 'allergens_no_mustard';
  static const String ATTRIBUTE_ALLERGENS_NO_LUPIN = 'allergens_no_lupin';
  static const String ATTRIBUTE_ALLERGENS_NO_FISH = 'allergens_no_fish';
  static const String ATTRIBUTE_ALLERGENS_NO_CRUSTACEANS =
      'allergens_no_crustaceans';
  static const String ATTRIBUTE_ALLERGENS_NO_MOLLUSCS = 'allergens_no_molluscs';
  static const String ATTRIBUTE_ALLERGENS_NO_SULPHUR_DIOXIDE_AND_SULPHITES =
      'allergens_no_sulphur_dioxide_and_sulphites';

  static const String ATTRIBUTE_VEGETARIAN = 'vegetarian';
  static const String ATTRIBUTE_VEGAN = 'vegan';
  static const String ATTRIBUTE_PALM_OIL_FREE = 'palm_oil_free';

  static const String ATTRIBUTE_LABELS_ORGANIC = 'labels_organic';
  static const String ATTRIBUTE_LABELS_FAIR_TRADE = 'labels_fair_trade';

  static const String ATTRIBUTE_ECOSCORE = 'ecoscore';
  static const String ATTRIBUTE_FOREST_FOOTPRINT = 'forest_footprint';

  final String? id;
  final String? name;
  final String? title;
  final String? iconUrl;
  final String? defaultF;
  final String? settingNote;
  final String? settingName;
  final String? description;
  final String? descriptionShort;
  final double? match;
  final String? status;
  final String? panelId;

  @override
  String toString() => 'Attribute(${toJson()})';
}
