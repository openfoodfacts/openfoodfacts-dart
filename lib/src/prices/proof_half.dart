import 'package:json_annotation/json_annotation.dart';

import '../interface/json_object.dart';
import '../open_prices_api_client.dart';
import '../utils/json_helper.dart';
import '../utils/uri_helper.dart';
import 'currency.dart';
import 'location.dart';
import 'location_osm_type.dart';
import 'proof_type.dart';

part 'proof_half.g.dart';

/// Reduced proof object nested inside a price tag.
///
/// cf. `ProofHalfFull` in https://prices.openfoodfacts.org/api/docs
@JsonSerializable()
class ProofHalf extends JsonObject {
  /// Proof ID. Read-only.
  @JsonKey()
  int? id;

  /// Location ID.
  @JsonKey(name: 'location_id')
  int? locationId;

  /// Location. Read-only.
  @JsonKey()
  Location? location;

  /// Image file path. Read-only.
  @JsonKey(name: 'file_path')
  String? filePath;

  /// Mime type. Read-only.
  @JsonKey()
  String? mimetype;

  /// Proof type.
  @JsonKey()
  ProofType? type;

  /// Image MD5 hash.
  @JsonKey(name: 'image_md5_hash')
  String? imageMd5Hash;

  /// Image thumb file path. Read-only.
  @JsonKey(name: 'image_thumb_path')
  String? imageThumbPath;

  /// ID of the location in OpenStreetMap.
  @JsonKey(name: 'location_osm_id')
  int? locationOSMId;

  /// Type of the OpenStreetMap location object.
  @JsonKey(name: 'location_osm_type')
  LocationOSMType? locationOSMType;

  /// Date when the product was bought.
  @JsonKey(fromJson: JsonHelper.nullableStringTimestampToDate)
  DateTime? date;

  /// Currency of the price.
  @JsonKey()
  Currency? currency;

  /// Receipt's number of prices (user input).
  @JsonKey(name: 'receipt_price_count')
  int? receiptPriceCount;

  /// Receipt's total amount (user input).
  @JsonKey(name: 'receipt_price_total')
  num? receiptPriceTotal;

  /// Receipt's online delivery costs (user input).
  @JsonKey(name: 'receipt_online_delivery_costs')
  num? receiptOnlineDeliveryCosts;

  /// Whether the proof is ready for price tag validation.
  @JsonKey(name: 'ready_for_price_tag_validation')
  bool? readyForPriceTagValidation;

  /// Whether the items were bought for owner consumption.
  @JsonKey(name: 'owner_consumption')
  bool? ownerConsumption;

  /// Owner comment.
  @JsonKey(name: 'owner_comment')
  String? ownerComment;

  /// Whether this proof is a draft.
  @JsonKey()
  bool? draft;

  /// Number of prices for this proof. Read-only.
  @JsonKey(name: 'price_count')
  int? priceCount;

  /// Number of predictions for this proof. Read-only.
  @JsonKey(name: 'prediction_count')
  int? predictionCount;

  /// Owner. Read-only.
  @JsonKey()
  String? owner;

  /// Name of the source (app, website…). Read-only.
  @JsonKey()
  String? source;

  /// Tags.
  @JsonKey()
  List<String>? tags;

  /// Creation timestamp. Read-only.
  @JsonKey(fromJson: JsonHelper.nullableStringTimestampToDate)
  DateTime? created;

  /// Latest update timestamp. Read-only.
  @JsonKey(fromJson: JsonHelper.nullableStringTimestampToDate)
  DateTime? updated;

  ProofHalf();

  factory ProofHalf.fromJson(Map<String, dynamic> json) =>
      _$ProofHalfFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProofHalfToJson(this);

  /// Returns the URL of the proof image, thumbnail or full.
  Uri? getFileUrl({
    required final UriProductHelper uriProductHelper,
    final bool isThumbnail = false,
  }) => _getFileUrl(
    uriProductHelper: uriProductHelper,
    path: isThumbnail ? imageThumbPath : filePath,
  );

  /// Returns the URL of a proof image.
  static Uri? _getFileUrl({
    required final UriProductHelper uriProductHelper,
    required String? path,
  }) => path == null
      ? null
      : OpenPricesAPIClient.getUri(
          path: 'img/$path',
          uriHelper: uriProductHelper,
          addUserAgentParameters: false,
        );
}
