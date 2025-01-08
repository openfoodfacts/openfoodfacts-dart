import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/src/nutripatrol/get_ticket.dart';

import '../interface/json_object.dart';

part 'create_flag.g.dart';

@JsonSerializable()
class CreateFlag extends JsonObject {
  /// Ticket ID associated with the flag
  @JsonKey()
  late Ticket ticket;

  /// Barcode of the product.
  @JsonKey()
  String? barcode;

  /// Type of the flag
  @JsonKey()
  late String type;

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
  late String source;

  /// Confidence of the flag
  @JsonKey()
  double? confidence;

  /// Image ID of the flag
  @JsonKey(name: 'image_id')
  String? imageId;

  /// Flavor of the flag
  @JsonKey()
  late String flavor;

  /// Reason for the flag
  @JsonKey()
  String? reason;

  /// Comment associated with the flag
  @JsonKey()
  String? comment;

  /// Created date of the flag
  @JsonKey(name: 'created_at')
  late DateTime createdAt;

  CreateFlag();

  factory CreateFlag.fromJson(Map<String, dynamic> json) =>
      _$CreateFlagFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CreateFlagToJson(this);
}

enum NutripatrolSource {
  @JsonValue('mobile')
  mobile,

  @JsonValue('web')
  web,

  @JsonValue('robotoff')
  robotoff,
}
