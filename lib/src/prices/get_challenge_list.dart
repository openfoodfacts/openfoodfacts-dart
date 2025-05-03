import '../utils/json_helper.dart';

/// Get Challege List
class GetChallengeList {
  final Map<String, dynamic> json;

  GetChallengeList(this.json);

  factory GetChallengeList.fromJson(Map<String, dynamic> json) {
    return GetChallengeList(json);
  }

  List<List<ChallengeItem>>? get items {
    if (json['items'] == null) return null;
    final itemsList = json['items'] as List<dynamic>;
    return itemsList.map((itemGroup) {
      final itemGroupList = itemGroup as List<dynamic>;
      return itemGroupList
          .map((item) => ChallengeItem.fromJson(item as Map<String, dynamic>))
          .toList();
    }).toList();
  }

  int? get page => json['page'] as int?;
  int? get pages => json['pages'] as int?;
  int? get size => json['size'] as int?;
  int? get total => json['total'] as int?;

  Map<String, dynamic> toJson() => json;
}

/// Individual challenge item.
class ChallengeItem {
  final Map<String, dynamic> json;

  ChallengeItem(this.json);

  factory ChallengeItem.fromJson(Map<String, dynamic> json) {
    return ChallengeItem(json);
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
