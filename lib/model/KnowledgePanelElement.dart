import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
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
  final KnowledgePanelTextElementType type;

  const KnowledgePanelTextElement({required this.html, required this.type});

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

/// Element representing a Panel Id of a KnowledgePanel. This element is a
/// Knowledge panel itself, the KnowledgePanel can be found in the list of
/// Knowledge panels using the id.
@JsonSerializable()
class KnowledgePanelPanelIdElement {
  @JsonKey(name: 'panel_id')
  final String panelId;

  const KnowledgePanelPanelIdElement({required this.panelId});

  factory KnowledgePanelPanelIdElement.fromJson(Map<String, dynamic> json) =>
      _$KnowledgePanelPanelIdElementFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KnowledgePanelPanelIdElementToJson(this);
}

/// Element representing a tabular data for the KnowledgePanel.
@JsonSerializable()
class KnowledgePanelTableElement {
  @JsonKey(name: 'table_id')
  final String tableId;

  @JsonKey(name: 'table_type')
  final String tableType;

  final String title;

  final List<String> headers;

  final List<List<String>> rows;

  const KnowledgePanelTableElement(
      {required this.tableId,
      required this.tableType,
      required this.title,
      required this.headers,
      required this.rows});

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

  /// Disclaimer notes that the client may or may not choose to display.
  @JsonValue('panel')
  PANEL,

  /// Disclaimer notes that the client may or may not choose to display.
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
  final KnowledgePanelElementType type;

  /// Text description of the Knowledge panel.
  final KnowledgePanelTextElement? textElement;

  /// Image element of the Knowledge panel.
  final KnowledgePanelImageElement? imageElement;

  /// Id of a KnowledgePanel embedded inside [this] KnowledgePanel.
  final KnowledgePanelPanelIdElement? panelIdElement;

  /// Id of a KnowledgePanel embedded inside [this] KnowledgePanel.
  final KnowledgePanelTableElement? tableElement;

  const KnowledgePanelElement(
      {required this.type,
      this.textElement,
      this.imageElement,
      this.panelIdElement,
      this.tableElement});

  factory KnowledgePanelElement.fromJson(Map<String, dynamic> json) =>
      _KnowledgePanelElementFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KnowledgePanelElementToJson(this);

  /// Convert json -> KnowledgePanelElement.
  static KnowledgePanelElement _KnowledgePanelElementFromJson(
      Map<String, dynamic> json) {
    KnowledgePanelElementType type = _$enumDecode(
        _$KnowledgePanelElementTypeEnumMap, json['element_type'],
        unknownValue: KnowledgePanelElementType.UNKNOWN);
    switch (type) {
      case KnowledgePanelElementType.TEXT:
        return KnowledgePanelElement(
            type: type,
            textElement: KnowledgePanelTextElement.fromJson(json['element']));
      case KnowledgePanelElementType.IMAGE:
        return KnowledgePanelElement(
            type: type,
            imageElement: KnowledgePanelImageElement.fromJson(json['element']));
      case KnowledgePanelElementType.PANEL:
        return KnowledgePanelElement(
            type: type,
            panelIdElement:
                KnowledgePanelPanelIdElement.fromJson(json['element']));
      case KnowledgePanelElementType.TABLE:
        return KnowledgePanelElement(
            type: type,
            tableElement: KnowledgePanelTableElement.fromJson(json['element']));
      case KnowledgePanelElementType.UNKNOWN:
        throw ArgumentError('Unknown element type');
    }
  }
}
