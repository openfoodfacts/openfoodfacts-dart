import 'package:openfoodfacts/model/KnowledgePanel.dart';

/// An object containing all KnowledgePanels in the form of a map.
class KnowledgePanels {
  /// A map of the type: {"knowledge-panel-id": KnowledgePanel}
  final Map<String, KnowledgePanel> panelIdToPanelMap;

  const KnowledgePanels({required this.panelIdToPanelMap});

  factory KnowledgePanels.fromJson(Map<String, dynamic> json) {
    print(json);
    Map<String, KnowledgePanel> map = {};
    for (var panelId in json.keys) {
      map[panelId] = KnowledgePanel.fromJson(json[panelId]);
    }
    return KnowledgePanels(panelIdToPanelMap: map);
  }

  factory KnowledgePanels.empty() {
    return KnowledgePanels(panelIdToPanelMap: {});
  }
}
