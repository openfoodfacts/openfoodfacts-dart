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
  String? barcode;

  /// Type of the ticket.
  @JsonKey()
  late TicketType type;

  /// Url of the ticket. Read-only.
  @JsonKey()
  late String url;

  /// Status of the ticket.
  @JsonKey()
  late TicketStatus status;

  /// Image id of the ticket. Read-only.
  @JsonKey(name: 'image_id')
  String? imageId;

  /// Flavor of the ticket.
  @JsonKey()
  late Flavor flavor;

  /// created date of the ticket. Read-only.
  @JsonKey(name: 'created_at')
  late String CreatedAt;

  Ticket();

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

  @override Map<String, dynamic> toJson() => _$TicketToJson(this);
}

/// Enum for ticket type
enum TicketType {
  @JsonValue('image')
  image,
  
  @JsonValue('product')
  product,

  @JsonValue('search')
  search
}

/// Enum for ticket status
enum TicketStatus {
  @JsonValue('open')
  open,
  
  @JsonValue('closed')
  closed
}

/// Enum for ticket flavor
enum Flavor {
  @JsonValue('off')
  off,
  
  @JsonValue('obf')
  obf,

  @JsonValue('opff')
  opff,

  @JsonValue('opf')
  opf,

  @JsonValue('off-pro')
  offPro
}