import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';
import 'Product.dart';

part 'KnowledgePanelLayout.g.dart';

@JsonSerializable()
class DescriptionUnit extends JsonObject {
  final String html;

  const DescriptionUnit(
      {required this.html});

  factory DescriptionUnit.fromJson(Map<String, dynamic> json) =>
      _$DescriptionUnitFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DescriptionUnitToJson(this);
}

@JsonSerializable()
class ImageUnit extends JsonObject {
  final String url;
  final int? width;
  final int? height;
  @JsonKey(name: 'alt_text')
  final String? altText;

  const ImageUnit(
      {required this.url, this.width, this.height, this.altText});

  factory ImageUnit.fromJson(Map<String, dynamic> json) =>
      _$ImageUnitFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ImageUnitToJson(this);
}

enum ElementStyle {
  CONTINUOUS,
  SEPARATE,
}

@JsonSerializable()
class KnowledgePanelElement extends JsonObject {
  @JsonKey(name: 'element_style')
  final ElementStyle elementStyle;

  @JsonKey(name: 'description_unit')
  final DescriptionUnit? descriptionUnit;

  @JsonKey(name: 'image_unit')
  final ImageUnit? imageUnit;

  const KnowledgePanelElement(
      {required this.elementStyle, this.descriptionUnit, this.imageUnit});

  factory KnowledgePanelElement.fromJson(Map<String, dynamic> json) =>
      _validatedKnowledgeElementPanelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KnowledgePanelElementToJson(this);

  static KnowledgePanelElement _validatedKnowledgeElementPanelFromJson(Map<String, dynamic> json) {
    KnowledgePanelElement element = _$KnowledgePanelElementFromJson(json);
    return _validateKnowledgePanelElementsOneOf(element);
  }

  static Map<String, dynamic> _validatedKnowledgeElementToJson(KnowledgePanelElement element) {
    return _$KnowledgePanelElementToJson(_validateKnowledgePanelElementsOneOf(element));
  }

  static KnowledgePanelElement _validateKnowledgePanelElementsOneOf(KnowledgePanelElement element) {
    int aliveUnits = 0;
    if (element.descriptionUnit != null ) {
      aliveUnits++;
    }
    if (element.imageUnit != null ) {
      aliveUnits++;
    }
    if (aliveUnits != 1) {
      throw FormatException("Invalid Knowledge Panel format, "
          "KnowledgePanelElement can only have one element set.");
    }
    return element;
  }
}

@JsonSerializable()
class KnowledgePanelLayout extends JsonObject {
  final List<KnowledgePanelElement> elements;

  const KnowledgePanelLayout(
      {required this.elements});

  factory KnowledgePanelLayout.fromJson(Map<String, dynamic> json) =>
      _$KnowledgePanelLayoutFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KnowledgePanelLayoutToJson(this);
}
