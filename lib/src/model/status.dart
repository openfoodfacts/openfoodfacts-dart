import 'package:json_annotation/json_annotation.dart';

import '../interface/json_object.dart';
import '../utils/http_helper.dart';

part 'status.g.dart';

@JsonSerializable()
class Status extends JsonObject {
  // TODO: deprecated from 2023-11-24; remove when old enough
  @Deprecated('Use wrongUserOrPasswordErrorMessage instead')
  static const WRONG_USER_OR_PASSWORD_ERROR_MESSAGE =
      wrongUserOrPasswordErrorMessage;

  static const wrongUserOrPasswordErrorMessage =
      'Incorrect user name or password';

  static const String openNewIssueUrl =
      'https://github.com/openfoodfacts/openfoodfacts-dart/issues/new';

  static const String serverErrorInEnglish =
      'No response, open an issue here: $openNewIssueUrl';

  static const int serverErrorStatus = 500;

  /// Commonly 1 = ok, 0 = failed
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
    if (responseBody.contains(wrongUserOrPasswordErrorMessage)) {
      statusVerbose = wrongUserOrPasswordErrorMessage;
    } else {
      statusVerbose = exception.toString();
    }
    return statusVerbose;
  }

  /// Constructs a [Status] from an API response
  factory Status.fromApiResponse(String responseBody) {
    try {
      return Status.fromJson(HttpHelper().jsonDecode(responseBody));
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
      statusVerbose == wrongUserOrPasswordErrorMessage;

  @override
  Map<String, dynamic> toJson() => _$StatusToJson(this);

  bool shouldOpenNewIssue() => status == serverErrorStatus;
}
