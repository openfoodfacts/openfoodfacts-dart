import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/src/nutripatrol/get_ticket.dart';

import '../interface/json_object.dart';

part 'create_flag.g.dart';

@JsonSerializable()
class CreateNutripatrolFlag extends JsonObject {
  /// Ticket ID associated with the flag
  @JsonKey()
  late NutripatrolTicket ticket;

  /// id of the flag.
  @JsonKey()
  late int id;

  CreateNutripatrolFlag();

  factory CreateNutripatrolFlag.fromJson(Map<String, dynamic> json) =>
      _$CreateNutripatrolFlagFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CreateNutripatrolFlagToJson(this);
}
