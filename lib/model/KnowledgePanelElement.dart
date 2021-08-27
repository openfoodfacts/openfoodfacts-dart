import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

part 'KnowledgePanelElement.g.dart';

// ElementStyle tells the client how to display the element.
enum ElementStyle {
  // Continue laying out the element in order, render after the last rendered
  // element.
  CONTINUOUS,
  // Display separately from the cluster of "continuous elements". Can be
  // displayed on the left, bottom, right, top of the entire Panel. Up to the
  // discretion of the client.
  SEPARATE,
}

// KnowledgePanelElement is a single unit of KnowledgePanel that can be rendered
// on the client. An Element must contain exactly one unit of KnowledgePanel
// (example: Description or Image), having more than one unit will cause an
// exception.
@JsonSerializable()
class KnowledgePanelElement extends JsonObject {
  // ElementStyle tells the client how to display the element, whether in
  // a continuous sequence after the last element that was rendered or
  // separately (left, bottom, right, top) as per the client's discretion.
  @JsonKey(name: 'element_style')
  final ElementStyle elementStyle;

  // Description of the Knowledge panel.
  @JsonKey(name: 'description_unit')
  final DescriptionUnit? descriptionUnit;

  // Image that represents the KnowledgePanel.
  @JsonKey(name: 'image_unit')
  final ImageUnit? imageUnit;

  const KnowledgePanelElement(
      {required this.elementStyle, this.descriptionUnit, this.imageUnit});

  factory KnowledgePanelElement.fromJson(Map<String, dynamic> json) =>
      _validatedKnowledgeElementPanelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _validatedKnowledgeElementToJson(this);

  // Convert json -> KnowledgePanelElement and validate that only one unit of
  // information is present in the KnowledgePanelElement.
  static KnowledgePanelElement _validatedKnowledgeElementPanelFromJson(
      Map<String, dynamic> json) {
    KnowledgePanelElement element = _$KnowledgePanelElementFromJson(json);
    return _validateKnowledgePanelElementsOneOf(element);
  }

  // Validate that only one unit of information is present in the
  // KnowledgePanelElement and then convert KnowledgePanelElement -> json
  static Map<String, dynamic> _validatedKnowledgeElementToJson(
      KnowledgePanelElement element) {
    return _$KnowledgePanelElementToJson(
        _validateKnowledgePanelElementsOneOf(element));
  }

  // Validate that only one unit of information is present in the
  // KnowledgePanelElement
  static KnowledgePanelElement _validateKnowledgePanelElementsOneOf(
      KnowledgePanelElement element) {
    int aliveUnits = 0;
    if (element.descriptionUnit != null) {
      aliveUnits++;
    }
    if (element.imageUnit != null) {
      aliveUnits++;
    }
    if (aliveUnits != 1) {
      throw FormatException('Invalid Knowledge Panel format, '
          'KnowledgePanelElement can only have one element set.');
    }
    return element;
  }
}

// The type of description.
enum DescriptionType {
  // The description summarizes the knowledge panel.
  SUMMARY,
  // These are notes that the client may or may not choose to display.
  NOTES,
}

// Description of the Knowledge panel.
@JsonSerializable()
class DescriptionUnit extends JsonObject {
  // HTML description of one Knowledge Panel Unit.
  final String html;
  // Type of description, Client may choose to display the description depending
  // upon the type.
  final DescriptionType type;

  const DescriptionUnit({required this.html, required this.type});

  factory DescriptionUnit.fromJson(Map<String, dynamic> json) =>
      _$DescriptionUnitFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DescriptionUnitToJson(this);
}

// Image that represents the KnowledgePanel.
@JsonSerializable()
class ImageUnit extends JsonObject {
  // Url of the image.
  final String url;
  // Width of the image, this is just a suggestion coming from the server, the
  // client may choose to use it's own dimensions for the image.
  final int? width;
  // Height of the image, this is just a suggestion coming from the server, the
  // client may choose to use it's own dimensions for the image.
  final int? height;
  // Alt Text of the image.
  @JsonKey(name: 'alt_text')
  final String? altText;

  const ImageUnit({required this.url, this.width, this.height, this.altText});

  factory ImageUnit.fromJson(Map<String, dynamic> json) =>
      _$ImageUnitFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ImageUnitToJson(this);
}
