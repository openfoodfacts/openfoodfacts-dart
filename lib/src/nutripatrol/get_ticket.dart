import 'package:json_annotation/json_annotation.dart';

import '../interface/json_object.dart';

part 'get_ticket.g.dart';

@JsonSerializable()
class Ticket extends JsonObject {
  /// Flag ID. Read-only.
  @JsonKey()
  late int id;

  /// Barcode of the product. Read-only.
  @JsonKey()
  late String barcode;

  /// Type of the ticket.
  @JsonKey()
  late String type;

  /// Url of the ticket. Read-only.
  @JsonKey()
  String? url;

  /// Status of the ticket.
  @JsonKey()
  late String status;

  /// Image id of the ticket. Read-only.
  @JsonKey(name: 'image_id')
  String? imageId;

  /// Flavor of the ticket.
  @JsonKey()
  late String flavor;

  /// created date of the ticket. Read-only.
  @JsonKey(name: 'created_at')
  late String createdAt;

  Ticket();

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

  @override Map<String, dynamic> toJson() => _$TicketToJson(this);
}