import 'package:json_annotation/json_annotation.dart';

import '../model/off_tagged.dart';

/// Type of the OpenStreetMap location object.
///
/// Stores can be represented as nodes, ways or relations in OpenStreetMap. It is necessary to be able to fetch the correct information about the store using the ID.
enum LocationOSMType implements OffTagged {
  @JsonValue('NODE')
  node(offTag: 'NODE'),
  @JsonValue('WAY')
  way(offTag: 'WAY'),
  @JsonValue('RELATION')
  relation(offTag: 'RELATION');

  const LocationOSMType({
    required this.offTag,
  });

  @override
  final String offTag;

  /// Returns the first [LocationOSMType] that matches the [offTag].
  static LocationOSMType? fromOffTag(final String? offTag) =>
      OffTagged.fromOffTag(offTag, LocationOSMType.values) as LocationOSMType?;
}
