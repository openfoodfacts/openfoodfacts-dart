import 'dart:convert';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import '../interface/JsonObject.dart';

part 'Status.g.dart';

@CopyWith()
@JsonSerializable()
class Status extends JsonObject {
  static const WRONG_USER_OR_PASSWORD_ERROR_MESSAGE =
      'Incorrect user name or password';

  final dynamic status;

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

  Status copyWith({
    final dynamic status,
    final String? statusVerbose,
    final String? body,
    final String? error,
    final int? imageId,
  }) {
    return Status(
      status: status ?? this.status,
      statusVerbose: statusVerbose ?? this.statusVerbose,
      body: body ?? this.body,
      error: error ?? this.error,
      imageId: imageId ?? this.imageId,
    );
  }

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
        status: 400,
        statusVerbose: _createStatusVerbose(responseBody, e),
      );
    }
  }

  /// Returns true if this [Status] is caused by wrong username or password,
  /// false otherwise.
  bool isWrongUsernameOrPassword() =>
      statusVerbose == WRONG_USER_OR_PASSWORD_ERROR_MESSAGE;

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}
