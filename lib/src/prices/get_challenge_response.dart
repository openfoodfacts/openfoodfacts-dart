import '../utils/json_helper.dart';

class GetChallengeResponse {
  final Map<String, dynamic> json;

  GetChallengeResponse(this.json);

  factory GetChallengeResponse.fromJson(Map<String, dynamic> json) {
    return GetChallengeResponse(json);
  }

  int? get id => json['id'] as int?;
  String? get status => json['status'] as String?;
  String? get tag => json['tag'] as String?;
  String? get title => json['title'] as String?;
  String? get icon => json['icon'] as String?;
  String? get subtitle => json['subtitle'] as String?;

  DateTime? get startDate =>
      JsonHelper.nullableStringTimestampToDate(json['start_date']);
  DateTime? get endDate =>
      JsonHelper.nullableStringTimestampToDate(json['end_date']);

  List<String>? get categories {
    if (json['categories'] == null) return null;
    final categoriesList = json['categories'] as List<dynamic>;
    return categoriesList.map((category) => category as String).toList();
  }

  String? get exampleProofUrl => json['example_proof_url'] as String?;
  bool? get isPublished => json['is_published'] as bool?;

  DateTime? get created =>
      JsonHelper.nullableStringTimestampToDate(json['created']);
  DateTime? get updated =>
      JsonHelper.nullableStringTimestampToDate(json['updated']);

  Map<String, dynamic> toJson() => json;
}
