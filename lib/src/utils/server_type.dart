import '../model/off_tagged.dart';

/// Type of Server (e.g. "food facts", "beauty facts", ...).
enum ServerType implements OffTagged {
  /// Open Food Facts
  openFoodFacts(offTag: 'off'),

  /// Open Beauty Facts
  openBeautyFacts(offTag: 'obf'),

  /// Open Pet Food Facts
  openPetFoodFacts(offTag: 'opff'),

  /// Open Product Facts
  openProductFacts(offTag: 'opf');

  const ServerType({
    required this.offTag,
  });

  @override
  final String offTag;
}
