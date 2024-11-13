import 'package:json_annotation/json_annotation.dart';
import 'get_ticket.dart';

import '../interface/json_object.dart';

part 'get_tickets.g.dart';

@JsonSerializable()
class Tickets extends JsonObject {
  /// List of Tickets
  @JsonKey()
  late List<Ticket> tickets;

  /// Max Page
  @JsonKey(name: 'max_page')
  late int maxPage;

  Tickets();

  factory Tickets.fromJson(Map<String, dynamic> json) => _$TicketsFromJson(json);

  @override Map<String, dynamic> toJson() => _$TicketsToJson(this);
}