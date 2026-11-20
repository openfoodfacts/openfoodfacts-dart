import 'package:json_annotation/json_annotation.dart';

import '../utils/json_helper.dart';
import 'currency.dart';
import 'location.dart';
import 'location_osm_type.dart';
import 'proof.dart';
import 'proof_prediction.dart';
import 'proof_type.dart';

part 'proof_full.g.dart';

/// Full proof object, including predictions.
///
/// cf. `ProofFull` in https://prices.openfoodfacts.org/api/docs
@JsonSerializable()
class ProofFull extends Proof {
  /// Predictions generated for this proof. Read-only.
  @JsonKey()
  List<ProofPrediction>? predictions;

  ProofFull();

  factory ProofFull.fromJson(Map<String, dynamic> json) =>
      _$ProofFullFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProofFullToJson(this);
}
