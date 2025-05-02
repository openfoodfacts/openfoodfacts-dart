import '../model/off_tagged.dart';

/// Kind of the contribution
enum ContributionKind implements OffTagged {
  consumption(offTag: 'CONSUMPTION'),
  community(offTag: 'COMMUNITY');

  const ContributionKind({
    required this.offTag,
  });
  @override
  final String offTag;

  /// Returns the first [ContributionKind] that matches the [offTag].
  static ContributionKind? fromOffTag(final String? offTag) =>
      OffTagged.fromOffTag(offTag, ContributionKind.values)
          as ContributionKind?;
}
