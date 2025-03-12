import 'package:json_annotation/json_annotation.dart';
import 'get_ticket.dart';

import '../interface/json_object.dart';

part 'get_tickets.g.dart';

/// Get the list of tickets.
@JsonSerializable()
class NutripatrolTickets extends JsonObject {
  /// List of Tickets
  @JsonKey()
  late List<NutripatrolTicket> tickets;

  /// Max Page
  @JsonKey(name: 'max_page')
  late int maxPage;

  NutripatrolTickets();

  factory NutripatrolTickets.fromJson(Map<String, dynamic> json) =>
      _$NutripatrolTicketsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NutripatrolTicketsToJson(this);
}
