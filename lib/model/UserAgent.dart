import '../interface/JsonObject.dart';

class UserAgent extends JsonObject {
  final String? name;
  final String? version;
  final String? system;
  final String? url;
  final String? comment;

  const UserAgent({
    this.name,
    this.version,
    this.system,
    this.url,
    this.comment,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'version': version,
        'system': system,
        'url': url,
        'comment': comment,
      };
}
