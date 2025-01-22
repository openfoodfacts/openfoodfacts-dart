import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/src/nutripatrol/get_ticket.dart';
import 'package:openfoodfacts/src/prices/flavor.dart';

import '../interface/json_object.dart';
import '../utils/nutripatrol_source.dart';

part 'get_flag.g.dart';

@JsonSerializable()
class Flag extends JsonObject {
  /// Flag ID. Read-only.
  @JsonKey()
  late String id;

  /// Ticket ID. Read-only.
  @JsonKey()
  late Ticket ticket;

  /// Barcode of the product. Read-only.
  @JsonKey()
  String? barcode;

  /// Type of the flag
  @JsonKey()
  late NutripatrolType type;

  /// Url of the product. Read-only.
  @JsonKey()
  late String url;

  /// User ID. Read-only.
  @JsonKey(name: 'user_id')
  late String userId;

  /// Device ID. Read-only.
  @JsonKey(name: 'device_id')
  late String deviceId;

  /// Source of the flag
  @JsonKey()
  late NutripatrolSource source;

  /// Confidence of the flag
  @JsonKey()
  double? confidence;

  /// Image ID of the flag. Read-only.
  @JsonKey(name: 'image_id')
  String? imageId;

  /// Flavor of the flag
  @JsonKey()
  late Flavor flavor;

  /// Reason of the flag
  @JsonKey()
  String? reason;

  /// Comment of the flag
  @JsonKey()
  String? comment;

  /// created date of the ticket. Read-only.
  @JsonKey(name: 'created_at')
  late String createdAt;

  Flag();

  factory Flag.fromJson(Map<String, dynamic> json) => _$FlagFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FlagToJson(this);
}
