import 'package:json_annotation/json_annotation.dart';

import '../model/off_tagged.dart';

/// Type of the Location.
enum LocationType implements OffTagged {
  @JsonValue('OSM')
  osm(offTag: 'OSM'),
  @JsonValue('ONLINE')
  online(offTag: 'ONLINE');

  const LocationType({
    required this.offTag,
  });

  @override
  final String offTag;

  /// Returns the first [LocationType] that matches the [offTag].
  static LocationType? fromOffTag(final String? offTag) =>
      OffTagged.fromOffTag(offTag, LocationType.values) as LocationType?;
}
