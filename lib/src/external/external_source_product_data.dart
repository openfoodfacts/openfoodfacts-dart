import '../interface/json_map.dart';
import '../model/knowledge_panels.dart';

/// External Source Product Data, including knowledge panels.
class ExternalSourceProductData extends JsonMap {
  ExternalSourceProductData(super.jsonMap);

  String get productImageUrl => jsonMap['product']['image_url'] as String;

  String get name => jsonMap['product']['name'] as String;

  KnowledgePanels get knowledgePanels =>
      KnowledgePanels.fromJson(jsonMap['panels']);
}
