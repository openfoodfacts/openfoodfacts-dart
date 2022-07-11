import 'package:openfoodfacts/model/Status.dart';

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

  // Sentences are available in
  // [https://github.com/openfoodfacts/openfoodfacts-translations/blob/main/openfoodfacts-web/openfoodfacts-web-fr.po]
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
    } else if (status.body!
        .contains('This username already exists, please choose another.')) {
      return SignUpStatus._(
        status: 400,
        statusError: SignUpStatusError.USERNAME_ALREADY_USED,
        error: 'This username already exists, please choose another.',
      );
    } else if (status.body!.contains('The e-mail address is already used.')) {
      return SignUpStatus._(
        status: 400,
        statusError: SignUpStatusError.EMAIL_ALREADY_USED,
        error:
            'The e-mail address is already used by another user. Maybe you already have an account? You can reset the password of your other account.',
      );
    } else if (status.body!
            .contains('The password needs to be a least 6 characters long.') ||
        status.body!.contains(
            'The password and confirmation password are different.')) {
      return SignUpStatus._(
        status: 400,
        statusError: SignUpStatusError.INVALID_PASSWORD,
        error:
            'The e-mail address is already used by another user. Maybe you already have an account? You can reset the password of your other account.',
      );
    } else if (status.body!.contains(
        'The user name must contain only unaccented letters, digits and dashes.')) {
      return SignUpStatus._(
        status: 400,
        statusError: SignUpStatusError.INVALID_USERNAME,
        error:
            'The e-mail address is already used by another user. Maybe you already have an account? You can reset the password of your other account.',
      );
    } else {
      return SignUpStatus._(
        status: 400,
        statusError: SignUpStatusError.UNKNOWN,
        error: 'Unrecognized request error',
      );
    }
  }
}

enum SignUpStatusError {
  EMPTY_EMAIL,
  EMAIL_ALREADY_USED,
  EMPTY_USERNAME,
  USERNAME_ALREADY_USED,
  INVALID_USERNAME,
  INVALID_PASSWORD,
  UNKNOWN,
}
