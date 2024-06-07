import 'package:json_annotation/json_annotation.dart';
import 'proof_type.dart';

import '../interface/json_object.dart';
import '../open_prices_api_client.dart';
import '../utils/json_helper.dart';
import '../utils/uri_helper.dart';

part 'proof.g.dart';

/// Proof of a price.
///
/// cf. `ProofFull` in https://prices.openfoodfacts.org/api/docs
@JsonSerializable()
class Proof extends JsonObject {
  /// Proof ID. Read-only.
  @JsonKey()
  late int id;

  /// Image file path. Read-only.
  @JsonKey(name: 'file_path')
  String? filePath;

  /// Mime type. Read-only.
  @JsonKey()
  late String mimetype;

  /// Proof type. Read-only.
  @JsonKey()
  ProofType? type;

  /// Number of prices for this proof. Read-only.
  @JsonKey(name: 'price_count')
  late int priceCount;

  /// Owner. Read-only.
  @JsonKey()
  late String owner;

  /// Creation timestamp. Read-only.
  @JsonKey(fromJson: JsonHelper.stringTimestampToDate)
  late DateTime created;

  Proof();

  factory Proof.fromJson(Map<String, dynamic> json) => _$ProofFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProofToJson(this);

  /// Returns the URL of the proof image.
  Uri? getFileUrl({required final UriProductHelper uriProductHelper}) =>
      filePath == null
          ? null
          : OpenPricesAPIClient.getUri(
              path: 'img/$filePath',
              uriHelper: uriProductHelper,
              addUserAgentParameters: false,
            );
}
