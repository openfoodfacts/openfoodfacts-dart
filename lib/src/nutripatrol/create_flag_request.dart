import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/src/utils/nutripatrol_source.dart';

import '../interface/json_object.dart';

part 'create_flag_request.g.dart';

@JsonSerializable()
class CreateNutripatrolFlagRequest extends JsonObject {
  /// Barcode of the product.
  @JsonKey()
  String? barcode;

  /// Type of the flag
  @JsonKey()
  late NutripatrolType type;

  /// Url of the product
  @JsonKey()
  late String url;

  /// User ID
  @JsonKey(name: 'user_id')
  late String userId;

  /// Device ID
  @JsonKey(name: 'device_id')
  late String deviceId;

  /// Source of the flag
  @JsonKey()
  late NutripatrolSource source;

  /// Confidence of the flag
  @JsonKey()
  double? confidence;

  /// Image ID of the flag
  @JsonKey(name: 'image_id')
  String? imageId;

  /// Flavor of the flag
  @JsonKey()
  late Flavor flavor;

  /// Reason for the flag
  @JsonKey()
  List<NutripatrolFlagReason>? reason;

  /// Comment associated with the flag
  @JsonKey()
  String? comment;

  /// Created date of the flag
  @JsonKey(name: 'created_at')
  late DateTime createdAt;

  CreateNutripatrolFlagRequest();

  factory CreateNutripatrolFlagRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateNutripatrolFlagRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CreateNutripatrolFlagRequestToJson(this);
}
