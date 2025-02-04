import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/src/utils/nutripatrol_types.dart';

import '../interface/json_object.dart';

part 'get_ticket.g.dart';

@JsonSerializable()
class NutripatrolTicket extends JsonObject {
  /// Flag ID. Read-only.
  @JsonKey()
  late int id;

  /// Barcode of the product. Read-only.
  @JsonKey()
  String? barcode;

  /// Type of the ticket.
  @JsonKey()
  late NutripatrolType type;

  /// Url of the ticket. Read-only.
  @JsonKey()
  late String url;

  /// Status of the ticket.
  @JsonKey()
  late NutripatrolTicketStatus status;

  /// Image id of the ticket. Read-only.
  @JsonKey(name: 'image_id')
  String? imageId;

  /// Flavor of the ticket.
  @JsonKey()
  late Flavor flavor;

  /// created date of the ticket. Read-only.
  @JsonKey(name: 'created_at')
  late DateTime createdAt;

  NutripatrolTicket();

  factory NutripatrolTicket.fromJson(Map<String, dynamic> json) =>
      _$NutripatrolTicketFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NutripatrolTicketToJson(this);
}
