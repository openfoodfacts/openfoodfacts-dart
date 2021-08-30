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
  @JsonValue('ecoscore')
  ECOSCORE,

  /// Knowledge Panel with ecoscore LCA.
  @JsonValue('ecoscore_lca')
  ECOSCORE_LCA,
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

/// KnowledgePanels are a standardized and generic units of information that
/// the client can display on the product page.
///
/// See http://shorturl.at/oxRS9 for details.
// NOTE: This is WIP, do not use and expect changes.
@JsonSerializable()
class KnowledgePanel extends JsonObject {
  final KnowledgePanelType type;

  /// Level of this KnowledgePanel. Client may choose to display the panel based
  /// on the level.
  @JsonKey(unknownEnumValue: Level.UNKNOWN)
  final Level level;

  /// The topics discussed in this knowledge panel, example: 'Environment'.
  final List<String> topics;

  /// Each KnowledgePanel has a unique id. Example - 'ecoscore'.

  /// Title of the panel. Example - 'Eco-Score D'.
  final String title;

  /// KnowledgePanelElement is a single unit of KnowledgePanel that can be
  /// rendered on the client.
  final List<KnowledgePanelElement> elements;

  /// Subtitle of the panel. Example - 'High environmental impact'.
  final String? subtitle;

  /// URL of an icon representing the Panel.
  @JsonKey(name: 'icon_url')
  final String? iconUrl;

  /// Grade of the panel, depicting the level of impact the product has for the
  /// corresponding topics. Client can choose to color code the panel depending
  /// on how good/bad the grade is.
  /// Scale: 'A' -> 'E'
  @JsonKey(unknownEnumValue: Grade.UNKNOWN)
  final Grade? grade;

  const KnowledgePanel(
      {required this.type,
      required this.level,
      required this.topics,
      required this.title,
      required this.elements,
      this.subtitle,
      this.iconUrl,
      this.grade});

  factory KnowledgePanel.fromJson(Map<String, dynamic> json) =>
      _$KnowledgePanelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KnowledgePanelToJson(this);
}
