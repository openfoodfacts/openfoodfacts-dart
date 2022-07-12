import 'package:openfoodfacts/openfoodfacts.dart';

/// The response from a call to the [OpenFoodAPIClient.register] method
/// The [status] may be:
/// - 201: Account created + user logged in
/// - 400: An error occurred - see [statusError] for more information
/// - 500: Unknown error
class SignUpStatus extends Status {
  final SignUpStatusError? statusError;

  SignUpStatus._({
    dynamic status,
    String? statusVerbose,
    String? body,
    String? error,
    int? imageId,
    this.statusError,
  }) : super(
          status: status,
          statusVerbose: statusVerbose,
          body: body,
          error: error,
          imageId: imageId,
        );

  factory SignUpStatus(Status status) {
    if (status.body == null) {
      return SignUpStatus._(
        status: 500,
        statusError: SignUpStatusError.UNKNOWN,
        error:
            'No response, open an issue here: https://github.com/openfoodfacts/openfoodfacts-dart/issues/new',
      );
    } else if (status.body!.contains('loggedin')) {
      return SignUpStatus._(
        status: 201,
      );
    } else {
      return SignUpStatus._(
        status: 400,
        statusError: _findErrorInMap(status.body) ?? SignUpStatusError.UNKNOWN,
        error: _extractErrorFromHTMLBody(status.body),
      );
    }
  }

  /// [_errorTexts] have values where have to call the [contains] method
  static _findErrorInMap(String? sentence) {
    if (sentence == null) {
      return null;
    }

    for (String errorLabel in _errorTexts.keys) {
      if (sentence.contains(errorLabel)) {
        return _errorTexts[errorLabel];
      }
    }

    return null;
  }

  /// Try to extract the error from the HTML… or will return the [body] otherwise
  static String? _extractErrorFromHTMLBody(String? body) {
    if (body == null || body.isEmpty) {
      return null;
    }

    /// Errors are displayed between two specific "templates" in HTML
    const String startLine =
        '<!-- start templates/web/common/includes/error_list.tt.html -->';
    const String endLine =
        '<!-- end templates/web/common/includes/error_list.tt.html -->';

    final int startIndex = body.indexOf(startLine);
    final int endIndex = body.indexOf(endLine);

    if (startIndex != -1 && endIndex != 1) {
      return body.substring(startIndex + startLine.length, endIndex);
    }

    return body;
  }

  /// Lists of errors sent by the server
  /// Sentences are available in
  /// [https://github.com/openfoodfacts/openfoodfacts-translations/blob/main/openfoodfacts-web/openfoodfacts-web-fr.po]
  static const Map<String, SignUpStatusError> _errorTexts =
      <String, SignUpStatusError>{
    'This username already exists, please choose another.':
        SignUpStatusError.USERNAME_ALREADY_USED,
    'The e-mail address is already used.': SignUpStatusError.EMAIL_ALREADY_USED,
    'The password needs to be a least 6 characters long.':
        SignUpStatusError.INVALID_PASSWORD,
    'The password and confirmation password are different.':
        SignUpStatusError.INVALID_PASSWORD,
    'The user name must contain only unaccented letters, digits and dashes.':
        SignUpStatusError.INVALID_USERNAME,
  };
}

/// A list of errors returned by the server
enum SignUpStatusError {
  /// The email provided is already used by another user
  EMAIL_ALREADY_USED,

  /// The username provided is already used by another user
  USERNAME_ALREADY_USED,

  /// The username is invalid (empty or with invalid characters)
  /// Only unaccented letters, digits and dashes are accepted
  INVALID_USERNAME,

  /// The password is incorrect (too short)
  INVALID_PASSWORD,

  /// Generic error
  UNKNOWN,
}
