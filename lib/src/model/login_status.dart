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
///       "country":"be"
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
  });

  final int status;
  final String statusVerbose;
  // TODO: deprecated from 2024-04-09; remove when old enough
  @Deprecated('Not retrieved anymore from the server')
  final String? userEmail = null;
  final String? userName;
  final String? userId;
  final OpenFoodFactsLanguage? preferredLanguage;
  final OpenFoodFactsCountry? country;
  final bool? isModerator;
  final bool? isAdmin;

  factory LoginStatus.fromJson(Map<String, dynamic> json) {
    print('json: $json');
    final details = json['user'];
    return LoginStatus(
      status: JsonObject.parseInt(json['status'])!,
      statusVerbose: json['status_verbose'] as String,
      userId: json['user_id'] as String?,
      userName: details?['name'] as String?,
      preferredLanguage:
          OpenFoodFactsLanguage.fromOffTag(details?['preferred_language']),
      country: OpenFoodFactsCountry.fromOffTag(details?['country']),
      isModerator: JsonHelper.boolFromJSON(details?['moderator']),
      isAdmin: JsonHelper.boolFromJSON(details?['admin']),
    );
  }

  /// Was the login successful?
  bool get successful => status == 1;

  @override
  String toString() => 'LoginStatus('
      'status:$status'
      ',statusVerbose:$statusVerbose'
      '${userId == null ? '' : ',userId:$userId'}'
      '${userName == null ? '' : ',userName:$userName'}'
      '${preferredLanguage == null ? '' : ',preferredLanguage:$preferredLanguage'}'
      '${country == null ? '' : ',country:$country'}'
      '${isAdmin == null ? '' : ',isAdmin:$isAdmin'}'
      '${isModerator == null ? '' : ',isModerator:$isModerator'}'
      ')';
}
