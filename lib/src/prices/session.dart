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

  /// Status Code when the authentication fails.
  static const int invalidAuthStatusCode = 401;

  /// Error message when the authentication fails.
  static const String invalidAuthMessage = 'Invalid authentication credentials';

  /// Status Code when we try an edit operation with a wrong authentication.
  static const int invalidActionWithAuthStatusCode = 403;

  /// Error message when we try an edit operation with a wrong authentication.
  static const String invalidActionWithAuthMessage =
      'Authentication credentials were not provided.';
}
