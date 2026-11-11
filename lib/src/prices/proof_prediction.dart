import 'package:json_annotation/json_annotation.dart';

import '../interface/json_object.dart';
import '../utils/json_helper.dart';

part 'proof_prediction.g.dart';

/// Prediction for a proof.
///
/// cf. `ProofPrediction` in https://prices.openfoodfacts.org/api/docs
@JsonSerializable()
class ProofPrediction extends JsonObject {
  /// The type of the prediction.
  @JsonKey()
  String? type;

  /// The name of the model that generated the prediction.
  @JsonKey(name: 'model_name')
  String? modelName;

  /// The specific version of the model that generated the prediction.
  @JsonKey(name: 'model_version')
  String? modelVersion;

  /// A dict representing the data of the prediction. Model-specific.
  @JsonKey()
  Map<String, dynamic>? data;

  /// The predicted value, e.g. for classification models.
  @JsonKey()
  dynamic value;

  /// The maximum confidence of the prediction.
  @JsonKey(name: 'max_confidence')
  num? maxConfidence;

  /// When the prediction was created in DB.
  @JsonKey(fromJson: JsonHelper.nullableStringTimestampToDate)
  DateTime? created;

  ProofPrediction();

  factory ProofPrediction.fromJson(Map<String, dynamic> json) =>
      _$ProofPredictionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProofPredictionToJson(this);
}
