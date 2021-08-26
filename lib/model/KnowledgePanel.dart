import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

import 'KnowledgePanelElement.dart';

part 'KnowledgePanel.g.dart';

enum Level {
  TRIVIA,
  INFORMATIVE,
  HELPFUL,
  WARNING,
  ALERT,
}

enum Grade {
  A,
  B,
  C,
  D,
  E,
}

// KnowledgePanels are a standardized and generic units of information that
// the client can display on the product page. See http://shorturl.at/oxRS9
// for details.
// NOTE: This is WIP, do not use and expect changes.
@JsonSerializable()
class KnowledgePanel extends JsonObject {
  // Each KnowledgePanel has a unique id. Example - "ingredient_origin".
  final String id;
  // The topics discussed in this knowledge panel
  final List<String> topics;
  // Title of the panel. Example - "Eco score D".
  final String title;
  // Subtitle of the panel. Example - "High environmental impact".
  final String subtitle;
  // URL of an icon representing the Panel.
  @JsonKey(name: 'icon_url')
  final String iconUrl;
  // Level of level of this KnowledgePanel for the Product's eco details.
  final Level level;
  // KnowledgePanelElement is a single unit of KnowledgePanel that can be rendered
  // on the client.
  final List<KnowledgePanelElement> elements;
  // Score panels have a grade associated with the Knowledge panel.
  // Scale: 'A' -> 'E'
  final Grade? grade;

  const KnowledgePanel(
      {required this.id,
      required this.topics,
      required this.title,
      required this.subtitle,
      required this.iconUrl,
      required this.level,
      required this.elements,
      this.grade});

  factory KnowledgePanel.fromJson(Map<String, dynamic> json) =>
      _$KnowledgePanelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KnowledgePanelToJson(this);
}
