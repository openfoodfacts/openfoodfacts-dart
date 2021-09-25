import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

part 'Status.g.dart';

@JsonSerializable()
class Status extends JsonObject {
  static const WRONG_USER_OR_PASSWORD_ERROR_MESSAGE =
      'Incorrect user name or password';

  final status;

  @JsonKey(name: 'status_verbose')
  final String? statusVerbose;

  final String? body;

  final String? error;

  @JsonKey(name: 'imgid', fromJson: JsonObject.parseInt)
  final int? imageId;

  Status({
    this.status,
    this.statusVerbose,
    this.body,
    this.error,
    this.imageId,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  /// Creates a verbose status from an API response. In case this is not
  /// possible, this method falls back to the information contained in the
  /// exception.
  static String _createStatusVerbose(String responseBody, Object exception) {
    String statusVerbose;
    if (responseBody.contains(WRONG_USER_OR_PASSWORD_ERROR_MESSAGE)) {
      statusVerbose = WRONG_USER_OR_PASSWORD_ERROR_MESSAGE;
    } else {
      statusVerbose = exception.toString();
    }
    return statusVerbose;
  }

  /// Constructs a [Status] from an API response
  factory Status.fromApiResponse(String responseBody) {
    try {
      return Status.fromJson(json.decode(responseBody));
    } catch (e) {
      return Status(
        body: responseBody,
        status: -1,
        statusVerbose: _createStatusVerbose(responseBody, e),
      );
    }
  }

  bool isWrongUsernameOrPassword() =>
      statusVerbose == WRONG_USER_OR_PASSWORD_ERROR_MESSAGE;

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}
