import 'package:json_annotation/json_annotation.dart';
import '../interface/json_object.dart';

part 'localized_tag.g.dart';

/// Tag with localizations (in English and an additional language).
///
/// We need to populate URL parameter `tag_lc` to get [lcName].
@JsonSerializable()
class LocalizedTag extends JsonObject {
  /// Tag id.
  @JsonKey(includeIfNull: false)
  String? id;

  /// Name in English.
  @JsonKey(includeIfNull: false)
  String? name;

  /// Localized name - according to query parameter `tags_lc`.
  @JsonKey(name: 'lc_name', includeIfNull: false)
  String? lcName;

  LocalizedTag();

  factory LocalizedTag.fromJson(Map<String, dynamic> json) =>
      _$LocalizedTagFromJson(json);

  static Map<String, dynamic> objToJson(LocalizedTag? tag) =>
      tag != null ? tag.toJson() : {};

  @override
  Map<String, dynamic> toJson() => _$LocalizedTagToJson(this);

  Map<String, String> toServerData() => JsonObject.toDataStatic(toJson());

  @override
  String toString() => toServerData().toString();
}
