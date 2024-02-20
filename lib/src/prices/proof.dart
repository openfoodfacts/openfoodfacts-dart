import 'package:json_annotation/json_annotation.dart';
import 'proof_type.dart';

import '../interface/json_object.dart';
import '../utils/json_helper.dart';

part 'proof.g.dart';

/// Proof of a price.
///
/// cf. ProofFull in https://prices.openfoodfacts.org/api/docs
@JsonSerializable()
class Proof extends JsonObject {
  @JsonKey()
  late int id;

  @JsonKey(name: 'file_path')
  String? filePath;

  @JsonKey()
  late String mimetype;

  @JsonKey()
  ProofType? type;

  /// if true, the proof is public and is included in the API response.
  ///
  /// Set false only if the proof contains personal information.
  @JsonKey(name: 'is_public')
  late bool isPublic;

  /// Number of prices for this proof.
  @JsonKey(name: 'price_count')
  late int priceCount;

  @JsonKey()
  late String owner;

  @JsonKey(fromJson: JsonHelper.stringTimestampToDate)
  late DateTime created;

  Proof();

  factory Proof.fromJson(Map<String, dynamic> json) => _$ProofFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProofToJson(this);
}
