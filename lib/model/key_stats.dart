import 'package:json_annotation/json_annotation.dart';
import '../interface/json_object.dart';

part 'key_stats.g.dart';

/// Folksonomy: statistics around a tag key.
@JsonSerializable()
class KeyStats extends JsonObject {
  @JsonKey(name: 'k')
  final String key;
  @JsonKey(name: 'count')
  final int count;
  @JsonKey(name: 'values')
  final int values;

  KeyStats({
    required this.key,
    required this.count,
    required this.values,
  });

  factory KeyStats.fromJson(Map<String, dynamic> json) =>
      _$KeyStatsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KeyStatsToJson(this);

  @override
  String toString() => toJson().toString();
}
