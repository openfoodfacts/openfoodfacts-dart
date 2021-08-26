import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

import 'KnowledgePanelLayout.dart';

part 'KnowledgePanel.g.dart';

enum Relevance {
  TRIVIAL,
  INFORMATIVE,
  HELPFUL,
  WARNING,
  ALERT,
}

// KnowledgePanels are a standardized and generic units of information that
// the client can display on the product page. See http://shorturl.at/oxRS9
// for details.
// NOTE: This is WIP, do not use and expect changes.
@JsonSerializable()
class KnowledgePanel extends JsonObject {
  // Each KnowledgePanel has a unique id. Example - "ingredient_origin".
  final String id;
  // Title of the panel. Example - "Origin of ingredients".
  final String title;
  // Level of relevance of this KnowledgePanel for the Product's eco details.
  final Relevance relevance;
  // Layout detailing how the KnowledgePanel can be rendered on the client.
  final KnowledgePanelLayout layout;

  const KnowledgePanel(
      {required this.id,
      required this.title,
      required this.relevance,
      required this.layout});

  factory KnowledgePanel.fromJson(Map<String, dynamic> json) =>
      _$KnowledgePanelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KnowledgePanelToJson(this);
}
