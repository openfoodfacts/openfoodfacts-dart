import 'package:json_annotation/json_annotation.dart';
import '../model/off_tagged.dart';
import '../utils/server_type.dart';

/// Flavor is used to refer to a specific Open*Facts project.
///
/// cf. `Flavor` in https://prices.openfoodfacts.org/api/docs
/// Somehow redundant with [ServerType].
enum Flavor implements OffTagged {
  /// Open Food Facts
  @JsonValue('off')
  openFoodFacts(offTag: 'off'),

  /// Open Beauty Facts
  @JsonValue('obf')
  openBeautyFacts(offTag: 'obf'),

  /// Open Pet Food Facts
  @JsonValue('opff')
  openPetFoodFacts(offTag: 'opff'),

  /// Open Product Facts
  @JsonValue('opf')
  openProductFacts(offTag: 'opf'),

  /// Open Product Facts (Pro platform)
  @JsonValue('off-pro')
  openFoodProductFactsPro(offTag: 'off-pro');

  const Flavor({required this.offTag});

  @override
  final String offTag;

  /// Returns the first [Flavor] that matches the [offTag].
  static Flavor? fromOffTag(final String? offTag) =>
      OffTagged.fromOffTag(offTag, Flavor.values) as Flavor?;
}
