/// Interface about OFF code unification.
abstract class OffTagged {
  /// Identifying tag used in the rest of OFF.
  String get offTag;

  /// Returns the first [OffTagged] of [values] that matches the [offTag].
  ///
  /// Typical use: with `enum`s that implement OffTagged.
  static OffTagged? fromOffTag(
    final String? offTag,
    final Iterable<OffTagged> values,
  ) {
    if (offTag == null) {
      return null;
    }
    for (final OffTagged offTagged in values) {
      if (offTagged.offTag == offTag) {
        return offTagged;
      }
    }
    return null;
  }
}
