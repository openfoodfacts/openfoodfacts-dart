import 'package:json_annotation/json_annotation.dart';

import '../interface/json_object.dart';
import '../utils/json_helper.dart';

part 'session.g.dart';

/// Price session.
///
/// cf. SessionBase in https://prices.openfoodfacts.org/api/docs
@JsonSerializable()
class Session extends JsonObject {
  @JsonKey(name: 'user_id')
  late String userId;

  @JsonKey(fromJson: JsonHelper.stringTimestampToDate)
  late DateTime created;

  @JsonKey(
    name: 'last_used',
    fromJson: JsonHelper.nullableStringTimestampToDate,
  )
  DateTime? lastUsed;

  Session();

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SessionToJson(this);

  static const int invalidAuthStatusCode = 401;
  static const String invalidAuthMessage = 'Invalid authentication credentials';
}
