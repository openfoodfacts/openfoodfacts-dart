import 'get_challenges_order.dart';
import 'get_parameters_helper.dart';

/// Parameters for the "get challenges" API query.
///
/// cf. https://prices.openfoodfacts.org/api/docs
class GetChallengesParameters
    extends GetParametersHelper<GetChallengesOrderField> {
  /// Possible values for [status].
  static const String statusDraft = 'DRAFT';
  static const String statusUpcoming = 'UPCOMING';
  static const String statusOngoing = 'ONGOING';
  static const String statusCompleted = 'COMPLETED';

  DateTime? endDateGt;
  DateTime? endDateGte;
  DateTime? endDateLt;
  DateTime? endDateLte;
  int? endDateMonth;
  int? endDateYear;
  int? id;
  bool? isPublished;
  DateTime? startDateGt;
  DateTime? startDateGte;
  DateTime? startDateLt;
  DateTime? startDateLte;
  int? startDateMonth;
  int? startDateYear;
  String? status;

  @override
  Map<String, String> getQueryParameters() {
    super.getQueryParameters();
    addNonNullDate(endDateGt, 'end_date__gt', dayOnly: true);
    addNonNullDate(endDateGte, 'end_date__gte', dayOnly: true);
    addNonNullDate(endDateLt, 'end_date__lt', dayOnly: true);
    addNonNullDate(endDateLte, 'end_date__lte', dayOnly: true);
    addNonNullInt(endDateMonth, 'end_date__month');
    addNonNullInt(endDateYear, 'end_date__year');
    addNonNullInt(id, 'id');
    addNonNullBool(isPublished, 'is_published');
    addNonNullDate(startDateGt, 'start_date__gt', dayOnly: true);
    addNonNullDate(startDateGte, 'start_date__gte', dayOnly: true);
    addNonNullDate(startDateLt, 'start_date__lt', dayOnly: true);
    addNonNullDate(startDateLte, 'start_date__lte', dayOnly: true);
    addNonNullInt(startDateMonth, 'start_date__month');
    addNonNullInt(startDateYear, 'start_date__year');
    addNonNullString(status, 'status');
    return result;
  }
}
