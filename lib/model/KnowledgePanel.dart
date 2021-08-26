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

@JsonSerializable()
class KnowledgePanel extends JsonObject {
  final String id;
  final String title;
  final Relevance relevance;
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
