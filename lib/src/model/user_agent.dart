import '../interface/json_object.dart';

class UserAgent extends JsonObject {
  /// The name of your application (eg: smooth-app)
  final String name;

  /// The version of the application (1.0.0)
  final String? version;

  /// The system running the application (eg: Android+10)
  final String? system;

  /// The url of your application (eg: https://example.com)
  final String? url;

  /// Additional information about your application
  final String? comment;

  UserAgent({
    required this.name,
    this.version,
    this.system,
    this.url,
    this.comment,
  }) {
    if (name.trim().isEmpty) {
      throw Exception('A non empty name is required');
    }
  }

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'version': version,
        'system': system,
        'url': url,
        'comment': comment,
      };
}
