import 'package:openfoodfacts/interface/json_object.dart';

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
///       "email":"blababla@gmail.com",
///       "name":"Mr. John Doe"
///     }
///   }
class LoginStatus {
  LoginStatus({
    required this.status,
    required this.statusVerbose,
    this.userEmail,
    this.userName,
    this.userId,
  });

  final int status;
  final String statusVerbose;
  final String? userEmail;
  final String? userName;
  final String? userId;

  factory LoginStatus.fromJson(Map<String, dynamic> json) => LoginStatus(
        status: JsonObject.parseInt(json['status'])!,
        statusVerbose: json['status_verbose'] as String,
        userId: json['user_id'] as String?,
        userEmail: json['user']?['email'] as String?,
        userName: json['user']?['name'] as String?,
      );

  /// Was the login successful?
  bool get successful => status == 1;

  @override
  String toString() => 'LoginStatus('
      'status:$status'
      ',statusVerbose:$statusVerbose'
      '${userId == null ? '' : ',userId:$userId'}'
      '${userEmail == null ? '' : ',userEmail:$userEmail'}'
      '${userName == null ? '' : ',userName:$userName'}'
      ')';
}
