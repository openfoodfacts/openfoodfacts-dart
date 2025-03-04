import 'package:json_annotation/json_annotation.dart';

enum NutripatrolSource {
  @JsonValue('mobile')
  mobile('mobile'),

  @JsonValue('web')
  web('web'),

  @JsonValue('robotoff')
  robotoff('robotoff');

  final String label;
  const NutripatrolSource(this.label);
}

/// Enum for ticket type
enum NutripatrolType {
  @JsonValue('image')
  image('image'),

  @JsonValue('product')
  product('product'),

  @JsonValue('search')
  search('search');

  final String label;
  const NutripatrolType(this.label);
}

/// Enum for ticket status
enum NutripatrolTicketStatus {
  @JsonValue('open')
  open('open'),

  @JsonValue('closed')
  closed('closed');

  final String label;
  const NutripatrolTicketStatus(this.label);
}

/// Enum for flag reason
enum NutripatrolFlagReason {
  @JsonValue('inappropriate')
  inappropriate('inappropriate'),

  @JsonValue('human')
  human('human'),

  @JsonValue('beauty')
  beauty('beauty'),

  @JsonValue('other')
  other('other');

  final String label;
  const NutripatrolFlagReason(this.label);
}
