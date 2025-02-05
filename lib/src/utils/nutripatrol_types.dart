import 'package:json_annotation/json_annotation.dart';

enum NutripatrolSource {
  @JsonValue('mobile')
  mobile,

  @JsonValue('web')
  web,

  @JsonValue('robotoff')
  robotoff,
}

/// Enum for ticket type
enum NutripatrolType {
  @JsonValue('image')
  image,

  @JsonValue('product')
  product,

  @JsonValue('search')
  search,
}

/// Enum for ticket status
enum NutripatrolTicketStatus {
  @JsonValue('open')
  open,

  @JsonValue('closed')
  closed,
}

/// Enum for flag reason
enum NutripatrolFlagReason {
  @JsonValue('inappropriate')
  inappropriate,

  @JsonValue('human')
  human,

  @JsonValue('beauty')
  beauty,

  @JsonValue('other')
  other,
}
