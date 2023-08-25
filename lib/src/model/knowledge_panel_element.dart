import 'package:json_annotation/json_annotation.dart';
import 'knowledge_panel.dart';
import '../interface/json_object.dart';

part 'knowledge_panel_element.g.dart';

/// The type of Knowledge panel text description.
enum KnowledgePanelTextElementType {
  /// The description summarizes the knowledge panel.
  @JsonValue('summary')
  SUMMARY,

  @JsonValue('warning')
  WARNING,

  /// Disclaimer notes that the client may or may not choose to display.
  @JsonValue('notes')
  NOTES,

  /// Default type of the text element, this is just a normal description.
  @JsonValue('notes')
  DEFAULT,
}

/// The type of Knowledge panel table column.
enum KnowledgePanelColumnType {
  /// The column contains text elements.
  @JsonValue('text')
  TEXT,

  /// The column has percentages.
  @JsonValue('percent')
  PERCENT,
}

/// Description element of the Knowledge panel.
@JsonSerializable()
class KnowledgePanelTextElement extends JsonObject {
  /// HTML description of one Knowledge Panel Unit.
  final String html;

  /// Type of the text description, Client may choose to display the description
  /// depending upon the type.
  @JsonKey(unknownEnumValue: KnowledgePanelTextElementType.DEFAULT)
  final KnowledgePanelTextElementType? type;

  /// Human readable source language (eg: "English")
  @JsonKey(name: 'source_language')
  final String? sourceLanguage;

  /// Source locale name (eg: "en")
  @JsonKey(name: 'source_lc')
  final String? sourceLocale;

  /// Name of the source (eg: "Wikipedia")
  @JsonKey(name: 'source_text')
  final String? sourceText;

  /// Link to the source (eg: "https://en.wikipedia.org/wiki/Sodium acetate")
  @JsonKey(name: 'source_url')
  final String? sourceUrl;

  const KnowledgePanelTextElement({
    required this.html,
    this.type,
    this.sourceLanguage,
    this.sourceLocale,
    this.sourceText,
    this.sourceUrl,
  });

  factory KnowledgePanelTextElement.fromJson(Map<String, dynamic> json) =>
      _$KnowledgePanelTextElementFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KnowledgePanelTextElementToJson(this);
}

/// Image that represents the KnowledgePanel.
@JsonSerializable()
class KnowledgePanelImageElement extends JsonObject {
  /// Url of the image.
  final String url;

  /// Width of the image.
  ///
  /// This is just a suggestion coming from the server, the client may choose to
  /// use its own dimensions for the image.
  final int? width;

  /// Height of the image.
  ///
  /// This is just a suggestion coming from the server, the client may choose to
  /// use its own dimensions for the image.
  final int? height;

  /// Alt Text of the image.
  @JsonKey(name: 'alt_text')
  final String? altText;

  const KnowledgePanelImageElement(
      {required this.url, this.width, this.height, this.altText});

  factory KnowledgePanelImageElement.fromJson(Map<String, dynamic> json) =>
      _$KnowledgePanelImageElementFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KnowledgePanelImageElementToJson(this);
}

/// Element representing a Panel group that contains 1+ KnowledgePanels.
@JsonSerializable()
class KnowledgePanelPanelGroupElement extends JsonObject {
  /// Title of the panel group. Example: "Carbon Footprint" or "Labels" etc.
  final String? title;

  /// List of panel ids that belong to this panel group.
  @JsonKey(name: 'panel_ids')
  final List<String> panelIds;

  const KnowledgePanelPanelGroupElement(
      {required this.title, required this.panelIds});

  factory KnowledgePanelPanelGroupElement.fromJson(Map<String, dynamic> json) =>
      _$KnowledgePanelPanelGroupElementFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$KnowledgePanelPanelGroupElementToJson(this);
}

/// Element representing a Panel Id of a KnowledgePanel. This element is a
/// Knowledge panel itself, the KnowledgePanel can be found in the list of
/// Knowledge panels using the id.
@JsonSerializable()
class KnowledgePanelPanelIdElement extends JsonObject {
  @JsonKey(name: 'panel_id')
  final String panelId;

  const KnowledgePanelPanelIdElement({required this.panelId});

  factory KnowledgePanelPanelIdElement.fromJson(Map<String, dynamic> json) =>
      _$KnowledgePanelPanelIdElementFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KnowledgePanelPanelIdElementToJson(this);
}

/// Provides the values for each table cell inside a KnowledgePanel table.
@JsonSerializable()
class KnowledgePanelTableCell extends JsonObject {
  final String text;

  final double? percent;

  @JsonKey(name: 'icon_url')
  final String? iconUrl;

  /// Evaluation of the table cell.
  @JsonKey(unknownEnumValue: Evaluation.UNKNOWN)
  final Evaluation? evaluation;

  const KnowledgePanelTableCell(
      {required this.text, this.percent, this.iconUrl, this.evaluation});

  factory KnowledgePanelTableCell.fromJson(Map<String, dynamic> json) =>
      _$KnowledgePanelTableCellFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KnowledgePanelTableCellToJson(this);
}

/// A table row inside Table element of KonwledgePanel
@JsonSerializable()
class KnowledgePanelTableRowElement extends JsonObject {
  final List<KnowledgePanelTableCell> values;

  const KnowledgePanelTableRowElement({required this.values});

  factory KnowledgePanelTableRowElement.fromJson(Map<String, dynamic> json) =>
      _$KnowledgePanelTableRowElementFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KnowledgePanelTableRowElementToJson(this);
}

/// A descriptor that describes the type and label of each column.
@JsonSerializable()
class KnowledgePanelTableColumn extends JsonObject {
  final String text;

  @JsonKey(name: 'text_for_small_screens')
  final String? textForSmallScreens;

  @JsonKey(name: 'shown_by_default')
  final bool? showByDefault;

  @JsonKey(name: 'column_group_id')
  final String? columnGroupId;

  final String? style;

  @JsonKey(unknownEnumValue: KnowledgePanelColumnType.TEXT)
  final KnowledgePanelColumnType? type;

  const KnowledgePanelTableColumn({
    required this.text,
    required this.type,
    this.textForSmallScreens,
    this.showByDefault,
    this.columnGroupId,
    this.style,
  });

  factory KnowledgePanelTableColumn.fromJson(Map<String, dynamic> json) =>
      _$KnowledgePanelTableColumnFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KnowledgePanelTableColumnToJson(this);
}

/// Element representing a world map.
@JsonSerializable()
class KnowledgePanelWorldMapElement extends JsonObject {
  final List<KnowledgePanelGeoPointer> pointers;

  const KnowledgePanelWorldMapElement({
    required this.pointers,
  });

  factory KnowledgePanelWorldMapElement.fromJson(Map<String, dynamic> json) =>
      _$KnowledgePanelWorldMapElementFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KnowledgePanelWorldMapElementToJson(this);
}

/// Element representing a geo location of a map pointer.
@JsonSerializable()
class KnowledgePanelGeoPointer extends JsonObject {
  final KnowledgePanelLatLng? geo;

  const KnowledgePanelGeoPointer({
    this.geo,
  });

  factory KnowledgePanelGeoPointer.fromJson(Map<String, dynamic> json) =>
      _$KnowledgePanelGeoPointerFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KnowledgePanelGeoPointerToJson(this);
}

/// Element representing a lat/long positioning of a map pointer.
@JsonSerializable()
class KnowledgePanelLatLng extends JsonObject {
  final double lat;
  final double lng;

  const KnowledgePanelLatLng({
    required this.lat,
    required this.lng,
  });

  factory KnowledgePanelLatLng.fromJson(Map<String, dynamic> json) =>
      _$KnowledgePanelLatLngFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KnowledgePanelLatLngToJson(this);
}

/// Element representing a tabular data for the KnowledgePanel.
@JsonSerializable()
class KnowledgePanelTableElement extends JsonObject {
  final String id;

  final String? title;

  @JsonKey(name: 'columns')
  final List<KnowledgePanelTableColumn> columns;

  final List<KnowledgePanelTableRowElement> rows;

  const KnowledgePanelTableElement({
    required this.id,
    required this.title,
    required this.columns,
    required this.rows,
  });

  factory KnowledgePanelTableElement.fromJson(Map<String, dynamic> json) =>
      _$KnowledgePanelTableElementFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KnowledgePanelTableElementToJson(this);
}

/// "Contribute action" element of the Knowledge panel.
@JsonSerializable()
class KnowledgePanelActionElement extends JsonObject {
  /// HTML description.
  final String html;

  /// Needed contribute actions, as [KnowledgePanelAction.addCategories.offTag].
  final List<String> actions;

  const KnowledgePanelActionElement({
    required this.html,
    required this.actions,
  });

  factory KnowledgePanelActionElement.fromJson(Map<String, dynamic> json) =>
      _$KnowledgePanelActionElementFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KnowledgePanelActionElementToJson(this);
}

/// The type of Knowledge panel.
enum KnowledgePanelElementType {
  /// The description summarizes the knowledge panel.
  @JsonValue('text')
  TEXT,

  @JsonValue('image')
  IMAGE,

  @JsonValue('panel')
  PANEL,

  @JsonValue('panel_group')
  PANEL_GROUP,

  @JsonValue('table')
  TABLE,

  @JsonValue('action')
  ACTION,

  @JsonValue('map')
  MAP,
  UNKNOWN,
}

/// KnowledgePanelElement is a single unit of KnowledgePanel that can be rendered on the client.
///
/// An Element could be one of [{@code ]KnowledgePanelElementType].
@JsonSerializable()
class KnowledgePanelElement extends JsonObject {
  /// Type of the text description.
  ///
  /// Client may choose to display the description depending upon the type.
  @JsonKey(
      name: 'element_type', unknownEnumValue: KnowledgePanelElementType.UNKNOWN)
  final KnowledgePanelElementType elementType;

  /// Text description of the Knowledge panel.
  @JsonKey(name: 'text_element')
  final KnowledgePanelTextElement? textElement;

  /// Image element of the Knowledge panel.
  @JsonKey(name: 'image_element')
  final KnowledgePanelImageElement? imageElement;

  /// Id of a KnowledgePanel embedded inside [this] KnowledgePanel.
  @JsonKey(name: 'panel_element')
  final KnowledgePanelPanelIdElement? panelElement;

  @JsonKey(name: 'panel_group_element')
  final KnowledgePanelPanelGroupElement? panelGroupElement;

  /// Id of a KnowledgePanel embedded inside [this] KnowledgePanel.
  @JsonKey(name: 'table_element')
  final KnowledgePanelTableElement? tableElement;

  /// Map element embedded inside [this] KnowledgePanel.
  @JsonKey(name: 'map_element')
  final KnowledgePanelWorldMapElement? mapElement;

  /// "Contribute action" element.
  @JsonKey(name: 'action_element')
  final KnowledgePanelActionElement? actionElement;

  const KnowledgePanelElement({
    required this.elementType,
    this.textElement,
    this.imageElement,
    this.panelElement,
    this.panelGroupElement,
    this.tableElement,
    this.mapElement,
    this.actionElement,
  });

  factory KnowledgePanelElement.fromJson(Map<String, dynamic> json) =>
      _$KnowledgePanelElementFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KnowledgePanelElementToJson(this);
}
