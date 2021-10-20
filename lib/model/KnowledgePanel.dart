import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

import 'KnowledgePanelElement.dart';

part 'KnowledgePanel.g.dart';

/// Type of the KnowledgePanel.
enum KnowledgePanelType {
  /// Do you know types informative Knowledge Panels.
  @JsonValue('doyouknow')
  DO_YOU_KNOW,

  /// Knowledge Panel with ecoscore information.
  @JsonValue('score')
  SCORE,

  /// Knowledge Panel with ecoscore LCA.
  @JsonValue('ecoscore_lca')
  ECOSCORE_LCA,

  /// Knowledge Panel which is rendered as a card on the UI.
  @JsonValue('card')
  CARD,
  UNKNOWN,
}

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
  A,
  B,
  C,
  D,
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
  @JsonValue('bad')
  BAD,
  UNKNOWN,
}

/// KnowledgePanels are a standardized and generic units of information that
/// the client can display on the product page.
///
/// See http://shorturl.at/oxRS9 for details.
// NOTE: This is WIP, do not use and expect changes.
@JsonSerializable()
class KnowledgePanel extends JsonObject {
  /// Panel id of the parent panel.
  @JsonKey(name: 'parent_panel_id')
  final String parentPanelId;

  /// Title of the KnowledgePanel.
  @JsonKey(name: 'title_element')
  final TitleElement titleElement;

  /// Level of this KnowledgePanel. Client may choose to display the panel based
  /// on the level.
  @JsonKey(unknownEnumValue: Level.UNKNOWN)
  final Level level;

  final bool? expanded;

  /// KnowledgePanelElement is a single unit of KnowledgePanel that can be
  /// rendered on the client.
  final List<KnowledgePanelElement>? elements;

  final KnowledgePanelType? type;

  /// The topics discussed in this knowledge panel, example: 'Environment'.
  final List<String>? topics;

  /// Grade of the panel, depicting the level of impact the product has for the
  /// corresponding topics. Client can choose to color code the panel depending
  /// on how good/bad the grade is.
  /// Scale: 'A' -> 'E'
  @JsonKey(unknownEnumValue: Grade.UNKNOWN)
  final Grade? grade;

  /// Evaluation of the panel, depicting whether the content of the panel is
  /// good/bad/neutral for the topic to which the panel applies.
  @JsonKey(unknownEnumValue: Evaluation.UNKNOWN)
  final Evaluation? evaluation;

  const KnowledgePanel({
    required this.parentPanelId,
    required this.titleElement,
    required this.level,
    this.expanded,
    this.elements,
    this.type,
    this.topics,
    this.grade,
    this.evaluation,
  });

  factory KnowledgePanel.fromJson(Map<String, dynamic> json) =>
      _$KnowledgePanelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KnowledgePanelToJson(this);
}

/// An element representing the title of the KnowledgePanel which could consist
/// of a text title, subtitle and an icon.
@JsonSerializable()
class TitleElement extends JsonObject {
  /// Title string of the panel. Example - 'Eco-Score D'.
  final String title;

  /// Subtitle of the panel. Example - 'High environmental impact'.
  final String? subtitle;

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
    this.iconUrl,
    this.iconColorFromEvaluation,
  });

  factory TitleElement.fromJson(Map<String, dynamic> json) =>
      _$TitleElementFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TitleElementToJson(this);
}
