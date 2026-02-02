import 'user_details.dart';
import '../interface/json_object.dart';
import '../utils/country_helper.dart';
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
    required this.userId,
    required this.cookie,
    required this.userDetails,
  });

  final int status;
  final String statusVerbose;
  final String? userId;

  // TODO: deprecated from 2026-01-20; remove when old enough
  @Deprecated('Use userDetails.name instead')
  String? get userName => userDetails.name;

  // TODO: deprecated from 2026-01-20; remove when old enough
  @Deprecated('Use userDetails.preferredLanguage instead')
  OpenFoodFactsLanguage? get preferredLanguage => userDetails.preferredLanguage;

  // TODO: deprecated from 2026-01-20; remove when old enough
  @Deprecated('Use userDetails.country instead')
  OpenFoodFactsCountry? get country => userDetails.country;

  // TODO: deprecated from 2026-01-20; remove when old enough
  @Deprecated('Use userDetails.isModerator instead')
  bool? get isModerator => userDetails.isModerator;

  // TODO: deprecated from 2026-01-20; remove when old enough
  @Deprecated('Use userDetails.isAdmin instead')
  bool? get isAdmin => userDetails.isAdmin;

  final UserDetails userDetails;

  /// The cookie is necessary for some GET requests that require an
  /// authenticated user.
  final String? cookie;

  factory LoginStatus.fromJson(
    Map<String, dynamic> json, [
    Map<String, String>? headers,
  ]) {
    return LoginStatus(
      status: JsonObject.parseInt(json['status'])!,
      statusVerbose: json['status_verbose'] as String,
      userId: json['user_id'] as String?,
      cookie: headers?['set-cookie'],
      userDetails: UserDetails.fromJson(json['user']),
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
      '${cookie == null ? '' : ',cookie:$cookie'}'
      ',userDetails:$userDetails'
      ')';
}
