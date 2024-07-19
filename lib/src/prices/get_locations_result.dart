import 'package:json_annotation/json_annotation.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

import '../interface/json_object.dart';

part 'get_locations_result.g.dart';

/// List of location objects returned by the "get locations" method.
@JsonSerializable()
class GetLocationsResult extends JsonObject {
  @JsonKey()
  List<Location>? items;

  @JsonKey()
  int? total;

  @JsonKey(name: 'page')
  int? pageNumber;

  @JsonKey(name: 'size')
  int? pageSize;

  @JsonKey(name: 'pages')
  int? numberOfPages;

  GetLocationsResult();

  factory GetLocationsResult.fromJson(Map<String, dynamic> json) =>
      _$GetLocationsResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetLocationsResultToJson(this);
}
