import 'package:json_annotation/json_annotation.dart';

enum NutripatrolSource {
  @JsonValue('mobile')
  mobile,

  @JsonValue('web')
  web,

  @JsonValue('robotoff')
  robotoff,
}
