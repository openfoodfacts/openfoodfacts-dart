import 'package:json_annotation/json_annotation.dart';

part 'update_ticket_status.g.dart';

@JsonSerializable()
class UpdateTicketStatus {
  /// Barcode of the product, if any
  @JsonKey()
  String? barcode;

  /// Type of the ticket
  @JsonKey()
  late String type;

  /// URL associated with the ticket
  @JsonKey()
  late String url;

  /// Status of the ticket
  @JsonKey()
  late String status;

  /// Image ID associated with the ticket
  @JsonKey(name: 'image_id')
  String? imageId;

  /// Flavor of the ticket
  @JsonKey()
  late String flavor;

  /// Created date of the ticket
  @JsonKey(name: 'created_at')
  late DateTime createdAt;

  UpdateTicketStatus();

  factory UpdateTicketStatus.fromJson(Map<String, dynamic> json) =>
      _$UpdateTicketStatusFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateTicketStatusToJson(this);
}
