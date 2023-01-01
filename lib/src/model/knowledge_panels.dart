import 'knowledge_panel.dart';

/// An object containing all KnowledgePanels in the form of a map.
class KnowledgePanels {
  /// A map of the type: {"knowledge-panel-id": KnowledgePanel}
  final Map<String, KnowledgePanel> panelIdToPanelMap;

  const KnowledgePanels({required this.panelIdToPanelMap});

  factory KnowledgePanels.fromJson(Map<String, dynamic> json) {
    Map<String, KnowledgePanel> map = {};
    for (var panelId in json.keys) {
      map[panelId] = KnowledgePanel.fromJson(json[panelId]);
    }
    return KnowledgePanels(panelIdToPanelMap: map);
  }

  factory KnowledgePanels.empty() {
    return KnowledgePanels(panelIdToPanelMap: {});
  }

  @override
  String toString() => 'KnowledgePanels(map: $panelIdToPanelMap)';

  static KnowledgePanels? fromJsonHelper(final Map? json) => json == null
      ? null
      : KnowledgePanels.fromJson(json as Map<String, dynamic>);

  static Map<String, dynamic>? toJsonHelper(
      final KnowledgePanels? knowledgePanels) {
    final Map<String, dynamic> result = {};
    if (knowledgePanels == null) {
      return null;
    }
    for (final MapEntry<String, KnowledgePanel> entry
        in knowledgePanels.panelIdToPanelMap.entries) {
      result[entry.key] = entry.value.toJson();
    }
    return result;
  }
}
