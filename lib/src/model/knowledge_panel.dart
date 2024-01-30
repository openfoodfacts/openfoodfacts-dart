import 'package:json_annotation/json_annotation.dart';
import '../interface/json_object.dart';

import 'knowledge_panel_element.dart';

part 'knowledge_panel.g.dart';

/// Level of information conveyed by this KnowledgePanel.
///
/// Client may choose to display the panel based on the level.
enum Level {
  @JsonValue('trivia')
  TRIVIA,
  @JsonValue('info')
  INFO,
  @JsonValue('helpful')
  HELPFUL,
  @JsonValue('warning')
  WARNING,
  @JsonValue('alert')
  ALERT,
  UNKNOWN,
}

/// Grade of the panel, depicting the level of impact the product has on the
/// corresponding topic.
///
/// Client can choose to color code the panel depending on how good/bad the grade is.
enum Grade {
  @JsonValue('a')
  A,
  @JsonValue('b')
  B,
  @JsonValue('c')
  C,
  @JsonValue('d')
  D,
  @JsonValue('e')
  E,
  UNKNOWN,
}

/// Evaluation of the panel, depicting whether the content of the panel is
/// good/bad/neutral for the topic to which the panel applies.
enum Evaluation {
  @JsonValue('good')
  GOOD,
  @JsonValue('neutral')
  NEUTRAL,
  @JsonValue('average')
  AVERAGE,
  @JsonValue('bad')
  BAD,
  UNKNOWN,
}

/// Type of title element.
enum TitleElementType {
  // Title Element depicts a grade like 'Eco-Score' or 'Nutri-Score'.
  @JsonValue('grade')
  GRADE,
  UNKNOWN,
}

/// Size of the KnowledgePanel, if small the client must display the panel in a
/// compact size.
enum KnowledgePanelSize {
  @JsonValue('small')
  SMALL,
  UNKNOWN,
}

/// KnowledgePanels are a standardized and generic units of information that
/// the client can display on the product page.
///
/// See http://shorturl.at/oxRS9 for details.
// NOTE: This is WIP, do not use and expect changes.
@JsonSerializable()
class KnowledgePanel extends JsonObject {
  /// Title of the KnowledgePanel.
  @JsonKey(name: 'title_element')
  final TitleElement? titleElement;

  /// Level of this KnowledgePanel. Client may choose to display the panel based
  /// on the level.
  @JsonKey(unknownEnumValue: Level.UNKNOWN)
  final Level? level;

  final bool? expanded;

  /// KnowledgePanelElement is a single unit of KnowledgePanel that can be
  /// rendered on the client.
  final List<KnowledgePanelElement>? elements;

  /// The topics discussed in this knowledge panel, example: 'Environment'.
  final List<String>? topics;

  /// Evaluation of the panel, depicting whether the content of the panel is
  /// good/bad/neutral for the topic to which the panel applies.
  @JsonKey(unknownEnumValue: Evaluation.UNKNOWN)
  final Evaluation? evaluation;

  /// Size of the KnowledgePanel, if small the client must display the panel in a
  /// compact size.
  @JsonKey(unknownEnumValue: KnowledgePanelSize.UNKNOWN)
  final KnowledgePanelSize? size;

  const KnowledgePanel({
    this.titleElement,
    this.level,
    this.expanded,
    this.elements,
    this.topics,
    this.evaluation,
    this.size,
  });

  factory KnowledgePanel.fromJson(Map<String, dynamic> json) =>
      _$KnowledgePanelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KnowledgePanelToJson(this);

  KnowledgePanel copyWith({
    TitleElement? titleElement,
    Level? level,
    bool? expanded,
    List<KnowledgePanelElement>? elements,
    List<String>? topics,
    final Evaluation? evaluation,
    final KnowledgePanelSize? size,
  }) {
    return KnowledgePanel(
      titleElement: titleElement ?? this.titleElement,
      level: level ?? this.level,
      expanded: expanded ?? this.expanded,
      elements: elements ?? this.elements,
      topics: topics ?? this.topics,
      evaluation: evaluation ?? this.evaluation,
      size: size ?? this.size,
    );
  }
}

/// An element representing the title of the KnowledgePanel which could consist
/// of a text title, subtitle and an icon.
@JsonSerializable()
class TitleElement extends JsonObject {
  /// Title string of the panel. Example - 'Eco-Score D'.
  final String title;

  /// Subtitle of the panel. Example - 'High environmental impact'.
  final String? subtitle;

  /// Grade of the panel, depicting the level of impact the product has for the
  /// corresponding topics. Client can choose to color code the panel depending
  /// on how good/bad the grade is.
  /// Scale: 'A' -> 'E'
  @JsonKey(unknownEnumValue: Grade.UNKNOWN)
  final Grade? grade;

  /// Type of the TitleElement.
  @JsonKey(unknownEnumValue: TitleElementType.UNKNOWN)
  final TitleElementType? type;

  /// URL of an icon representing the Panel.
  @JsonKey(name: 'icon_url')
  final String? iconUrl;

  /// If true, the icon can be tinted with a color (red/green/yellow/whatever)
  /// in accordance with the [evaluation] of the knowledge panel as per the
  /// client's discretion.
  @JsonKey(name: 'icon_color_from_evaluation', defaultValue: false)
  final bool? iconColorFromEvaluation;

  const TitleElement({
    required this.title,
    this.subtitle,
    this.grade,
    this.type,
    this.iconUrl,
    this.iconColorFromEvaluation,
  });

  factory TitleElement.fromJson(Map<String, dynamic> json) =>
      _$TitleElementFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TitleElementToJson(this);

  TitleElement copyWith({
    String? title,
    String? subtitle,
    final Grade? grade,
    final TitleElementType? type,
    final String? iconUrl,
    final bool? iconColorFromEvaluation,
  }) {
    return TitleElement(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      grade: grade ?? this.grade,
      type: type ?? this.type,
      iconUrl: iconUrl ?? this.iconUrl,
      iconColorFromEvaluation:
          iconColorFromEvaluation ?? this.iconColorFromEvaluation,
    );
  }
}
