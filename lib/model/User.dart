import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

part 'User.g.dart';

@JsonSerializable()
class User extends JsonObject {

  static const String LANGUAGE_DE = "de";
  static const String LANGUAGE_EN = "en";
  static const String LANGUAGE_FR = "fr";

  static const List<String> LANGUAGES = <String>[
    LANGUAGE_DE,
    LANGUAGE_EN,
    LANGUAGE_FR
  ];

  @JsonKey(includeIfNull: false)
  final String comment;

  @JsonKey(name: 'user_id', nullable: false)
  final String userId;
  @JsonKey( nullable: false)
  final String password;

  const User({
    @required this.userId,
    @required this.password,
    this.comment
  });


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}