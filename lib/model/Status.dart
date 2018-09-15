import 'package:json_annotation/json_annotation.dart';
import '../interface/JsonObject.dart';

part 'Status.g.dart';

@JsonSerializable()
class Status extends JsonObject {

  final status;

  @JsonKey(name: 'status_verbose')
  final String statusVerbose;

  final String error;

  @JsonKey(name: 'imgid')
  final int imageId;

  Status({
    this.status,
    this.statusVerbose,
    this.error,
    this.imageId,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

