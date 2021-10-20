import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/model/KnowledgePanel.dart';
import '../interface/JsonObject.dart';

part 'KnowledgePanelElement.g.dart';

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
  UNKNOWN,
}

/// Description element of the Knowledge panel.
@JsonSerializable()
class KnowledgePanelTextElement extends JsonObject {
  /// HTML description of one Knowledge Panel Unit.
  final String html;

  /// Type of the text description, Client may choose to display the description
  /// depending upon the type.
  @JsonKey(
      name: 'text_type',
      unknownEnumValue: KnowledgePanelTextElementType.UNKNOWN)
  final KnowledgePanelTextElementType? type;

  const KnowledgePanelTextElement({required this.html, this.type});

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
  final String title;

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

  final String type;

  const KnowledgePanelTableColumn({required this.text, required this.type});

  factory KnowledgePanelTableColumn.fromJson(Map<String, dynamic> json) =>
      _$KnowledgePanelTableColumnFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KnowledgePanelTableColumnToJson(this);
}

/// Element representing a tabular data for the KnowledgePanel.
@JsonSerializable()
class KnowledgePanelTableElement extends JsonObject {
  final String id;

  @JsonKey(name: 'type')
  final String type;

  final String title;

  @JsonKey(name: 'columns')
  final List<KnowledgePanelTableColumn> columns;

  final List<KnowledgePanelTableRowElement> rows;

  const KnowledgePanelTableElement({
    required this.id,
    required this.type,
    required this.title,
    required this.columns,
    required this.rows,
  });

  factory KnowledgePanelTableElement.fromJson(Map<String, dynamic> json) =>
      _$KnowledgePanelTableElementFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KnowledgePanelTableElementToJson(this);
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
  UNKNOWN,
}

/// KnowledgePanelElement is a single unit of KnowledgePanel that can be rendered on the client.
///
/// An Element could be one of [{@code ]KnowledgePanelElementType].
@JsonSerializable()
class KnowledgePanelElement extends JsonObject {
  /// Type of the text description, Client may choose to display the description
  /// depending upon the type.
  @JsonKey(name: 'element_type')
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

  @JsonKey(name: 'panel_group')
  final KnowledgePanelPanelGroupElement? panelGroupElement;

  /// Id of a KnowledgePanel embedded inside [this] KnowledgePanel.
  @JsonKey(name: 'table_element')
  final KnowledgePanelTableElement? tableElement;

  const KnowledgePanelElement({
    required this.elementType,
    this.textElement,
    this.imageElement,
    this.panelElement,
    this.panelGroupElement,
    this.tableElement,
  });

  factory KnowledgePanelElement.fromJson(Map<String, dynamic> json) =>
      _$KnowledgePanelElementFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KnowledgePanelElementToJson(this);
}
