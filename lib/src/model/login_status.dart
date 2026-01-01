import '../interface/json_object.dart';
import '../utils/country_helper.dart';
import '../utils/json_helper.dart';
import '../utils/language_helper.dart';

/// Status after an attempt to log in.
///
/// Typical JSON:
/// * wrong user and/or password
///   {
///     "status":0,
///     "status_verbose":"user not signed-in"
///   }
/// * successful login:
///   {
///     "status":1,
///     "status_verbose":"user signed-in",
///     "user_id":"gqwbgsvvod",
///     "user":{
///       "name":"Mr. John Doe",
///       "preferred_language":"fr",
///       "cc":"be",
///       "country":"en:belgium",
///       "admin":0,
///       "moderator":1
///     }
///   }
class LoginStatus {
  LoginStatus({
    required this.status,
    required this.statusVerbose,
    String? userEmail,
    this.userName,
    this.userId,
    this.preferredLanguage,
    this.country,
    this.isModerator,
    this.isAdmin,
    this.cookie,
  });

  final int status;
  final String statusVerbose;
  final String? userName;
  final String? userId;
  final OpenFoodFactsLanguage? preferredLanguage;
  final OpenFoodFactsCountry? country;
  final bool? isModerator;
  final bool? isAdmin;

  /// The cookie is necessary for some GET requests that require an
  /// authenticated user.
  final String? cookie;

  factory LoginStatus.fromJson(
    Map<String, dynamic> json, [
    Map<String, String>? headers,
  ]) {
    final details = json['user'];
    return LoginStatus(
      status: JsonObject.parseInt(json['status'])!,
      statusVerbose: json['status_verbose'] as String,
      userId: json['user_id'] as String?,
      userName: details?['name'] as String?,
      preferredLanguage: OpenFoodFactsLanguage.fromOffTag(
        details?['preferred_language'],
      ),
      country: OpenFoodFactsCountry.fromOffTag(details?['cc']),
      isModerator: JsonHelper.boolFromJSON(details?['moderator']),
      isAdmin: JsonHelper.boolFromJSON(details?['admin']),
      cookie: headers?['set-cookie'],
    );
  }

  /// Was the login successful?
  bool get successful => status == 1;

  @override
  String toString() =>
      'LoginStatus('
      'status:$status'
      ',statusVerbose:$statusVerbose'
      '${userId == null ? '' : ',userId:$userId'}'
      '${userName == null ? '' : ',userName:$userName'}'
      '${preferredLanguage == null ? '' : ',preferredLanguage:$preferredLanguage'}'
      '${country == null ? '' : ',country:$country'}'
      '${isAdmin == null ? '' : ',isAdmin:$isAdmin'}'
      '${isModerator == null ? '' : ',isModerator:$isModerator'}'
      '${cookie == null ? '' : ',cookie:$cookie'}'
      ')';
}
