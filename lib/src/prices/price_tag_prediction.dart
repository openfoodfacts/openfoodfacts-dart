import 'package:json_annotation/json_annotation.dart';

import '../interface/json_object.dart';
import '../utils/json_helper.dart';
import 'price_tag_prediction_type.dart';

part 'price_tag_prediction.g.dart';

/// Prediction for a price tag.
///
/// cf. `PriceTagPrediction` in https://prices.openfoodfacts.org/api/docs
@JsonSerializable()
class PriceTagPrediction extends JsonObject {
  /// The type of the prediction.
  @JsonKey()
  PriceTagPredictionType? type;

  /// The name of the model that generated the prediction.
  @JsonKey(name: 'model_name')
  String? modelName;

  /// The specific version of the model that generated the prediction.
  @JsonKey(name: 'model_version')
  String? modelVersion;

  /// The schema version of the prediction data.
  @JsonKey(name: 'schema_version')
  String? schemaVersion;

  /// A dict representing the data of the prediction. Model-specific.
  @JsonKey()
  Map<String, dynamic>? data;

  /// When the prediction was created in DB.
  @JsonKey(fromJson: JsonHelper.nullableStringTimestampToDate)
  DateTime? created;

  PriceTagPrediction();

  factory PriceTagPrediction.fromJson(Map<String, dynamic> json) =>
      _$PriceTagPredictionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PriceTagPredictionToJson(this);
}
