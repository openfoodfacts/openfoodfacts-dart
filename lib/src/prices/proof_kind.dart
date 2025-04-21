import 'package:json_annotation/json_annotation.dart';

import '../model/off_tagged.dart';

/// Type of the Proof.
enum ProofKind implements OffTagged {
  @JsonValue('CONSUMPTION')
  online(offTag: 'CONSUMPTION'),
  @JsonValue('COMMUNITY')
  osm(offTag: 'COMMUNITY');

  const ProofKind({
    required this.offTag,
  });

  @override
  final String offTag;

  /// Returns the first [ProofKind] that matches the [offTag].
  static ProofKind? fromOffTag(final String? offTag) =>
      OffTagged.fromOffTag(offTag, ProofKind.values) as ProofKind?;
}
