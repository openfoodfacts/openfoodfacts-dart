import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

part 'UserAgent.g.dart';

@JsonSerializable()
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

  factory UserAgent.fromJson(Map<String, dynamic> json) =>
      _$UserAgentFromJson(json);

  Map<String, dynamic> toJson() => _$UserAgentToJson(this);
}
