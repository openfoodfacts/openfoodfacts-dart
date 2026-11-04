import 'package:json_annotation/json_annotation.dart';

import '../interface/json_object.dart';
import '../open_prices_api_client.dart';
import '../utils/json_helper.dart';
import '../utils/uri_helper.dart';
import 'price_tag_prediction.dart';
import 'price_tag_status.dart';
import 'proof_half.dart';

part 'price_tag.g.dart';

/// Price tag annotation.
///
/// cf. `PriceTagFull` in https://prices.openfoodfacts.org/api/docs
@JsonSerializable()
class PriceTag extends JsonObject {
  /// Price tag ID. Read-only.
  @JsonKey()
  int? id;

  /// The price linked to this tag. Read-only.
  @JsonKey(name: 'price_id')
  int? priceId;

  /// Predictions generated for this price tag. Read-only.
  @JsonKey()
  List<PriceTagPrediction>? predictions;

  /// Proof nested inside this price tag.
  @JsonKey()
  ProofHalf? proof;

  /// Image path of the price tag. Read-only.
  @JsonKey(name: 'image_path')
  String? imagePath;

  /// Coordinates of the bounding box, in the format [y_min, x_min, y_max, x_max].
  @JsonKey(name: 'bounding_box')
  List<double>? boundingBox;

  /// The annotation status.
  @JsonKey()
  PriceTagStatus? status;

  /// Number of predictions for this price tag.
  @JsonKey(name: 'prediction_count')
  int? predictionCount;

  /// The name of the user who created this price tag.
  ///
  /// Null if the tag was created by a model.
  @JsonKey(name: 'created_by')
  String? createdBy;

  /// The name of the user who last updated this price tag bounding boxes.
  ///
  /// Null if never updated.
  @JsonKey(name: 'updated_by')
  String? updatedBy;

  /// Tags.
  @JsonKey()
  List<String>? tags;

  /// When the tag was created in DB.
  @JsonKey(fromJson: JsonHelper.nullableStringTimestampToDate)
  DateTime? created;

  /// When the tag was last updated. Read-only.
  @JsonKey(fromJson: JsonHelper.nullableStringTimestampToDate)
  DateTime? updated;

  /// The proof prediction used to create this price tag.
  ///
  /// Null if created by a user.
  @JsonKey(name: 'proof_prediction')
  int? proofPrediction;

  PriceTag();

  factory PriceTag.fromJson(Map<String, dynamic> json) =>
      _$PriceTagFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PriceTagToJson(this);

  /// Returns the URL of the price tag image.
  Uri? getImageUrl({required final UriProductHelper uriProductHelper}) =>
      imagePath == null
      ? null
      : OpenPricesAPIClient.getUri(
          path: 'img/$imagePath',
          uriHelper: uriProductHelper,
          addUserAgentParameters: false,
        );
}
