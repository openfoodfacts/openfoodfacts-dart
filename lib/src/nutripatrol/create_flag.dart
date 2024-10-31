import 'package:json_annotation/json_annotation.dart';

import '../interface/json_object.dart';

part 'create_flag.g.dart';

@JsonSerializable()
class Flag extends JsonObject {
  @JsonKey()
  late String id;

  @JsonKey()
  String? barcode;

  @JsonKey()
  late Type type;

  @JsonKey()
  String? url;

  @JsonKey(name: 'user_id')
  late String userId;

  @JsonKey()
  late Source source;

  @JsonKey()
  double? confidence;

  @JsonKey(name: 'image_id')
  String? imageId;

  @JsonKey()
  late Flavor flavor;

  @JsonKey()
  String? reason;

  @JsonKey()
  String? comment;

  @JsonKey(name: 'created_at')
  late DateTime CreatedAt;

  @JsonKey(name: 'ticket_id')
  late int ticketId;

  @JsonKey(name: 'device_id')
  late String deviceId;

  Flag();

  factory Flag.fromJson(Map<String, dynamic> json) => _$FlagFromJson(json);

  @override Map<String, dynamic> toJson() => _$FlagToJson(this);
}

/// Enum for ticket type
enum Type {
  @JsonValue('image')
  image,
  
  @JsonValue('product')
  product,

  @JsonValue('search')
  search
}

/// Enum for ticket type
enum Source {
  @JsonValue('mobile')
  mobile,
  
  @JsonValue('web')
  web,

  @JsonValue('robotoff')
  robotoff
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