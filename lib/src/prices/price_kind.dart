import 'package:json_annotation/json_annotation.dart';

import '../model/off_tagged.dart';

/// Type of the Price.
enum PriceKind implements OffTagged {
  @JsonValue('CONSUMPTION')
  online(offTag: 'CONSUMPTION'),
  @JsonValue('COMMUNITY')
  osm(offTag: 'COMMUNITY');

  const PriceKind({
    required this.offTag,
  });

  @override
  final String offTag;

  /// Returns the first [PriceKind] that matches the [offTag].
  static PriceKind? fromOffTag(final String? offTag) =>
      OffTagged.fromOffTag(offTag, PriceKind.values) as PriceKind?;
}
