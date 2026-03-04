import '../interface/json_object.dart';

/// Simple reusable json map.
class JsonMap extends JsonObject {
  JsonMap(this.jsonMap);

  final Map<String, dynamic> jsonMap;

  @override
  Map<String, dynamic> toJson() => jsonMap;
}
