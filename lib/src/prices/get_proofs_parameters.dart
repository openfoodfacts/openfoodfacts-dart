import 'contribution_kind.dart';
import 'get_price_count_parameters_helper.dart';
import 'get_proofs_order.dart';
import 'proof_type.dart';
import 'currency.dart';
import 'location_osm_type.dart';

/// Parameters for the "get proofs" API query.
///
/// cf. https://prices.openfoodfacts.org/api/docs
class GetProofsParameters
    extends GetPriceCountParametersHelper<GetProofsOrderField> {
  String? owner;
  ProofType? type;
  int? locationOSMId;
  LocationOSMType? locationOSMType;
  int? locationId;
  Currency? currency;
  DateTime? date;
  DateTime? dateGt;
  DateTime? dateGte;
  DateTime? dateLt;
  DateTime? dateLte;
  ContributionKind? kind;

  /// Returns the parameters as a query parameter map.
  @override
  Map<String, String> getQueryParameters() {
    super.getQueryParameters();
    addNonNullString(owner, 'owner');
    addNonNullString(type?.offTag, 'type');
    addNonNullInt(locationOSMId, 'location_osm_id');
    addNonNullString(locationOSMType?.offTag, 'location_osm_type');
    addNonNullInt(locationId, 'location_id');
    addNonNullString(currency?.name, 'currency');
    addNonNullDate(date, 'date', dayOnly: true);
    addNonNullDate(dateGt, 'date__gt', dayOnly: true);
    addNonNullDate(dateGte, 'date__gte', dayOnly: true);
    addNonNullDate(dateLt, 'date__lt', dayOnly: true);
    addNonNullDate(dateLte, 'date__lte', dayOnly: true);
    addNonNullString(kind?.offTag, 'kind');
    if (additionalParameters != null) {
      result.addAll(additionalParameters!);
    }
    return result;
  }
}
