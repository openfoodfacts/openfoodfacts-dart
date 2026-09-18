import '../per_size.dart';
import '../../utils/unit_helper.dart';

/// "Key" of a nutrition set.
class NutritionSetKey {
  NutritionSetKey({
    required this.source,
    required this.preparation,
    required this.perSize,
    this.perQuantity,
    this.perUnit,
    this.lastUpdatedT,
  });

  static const String sourcePackaging = "packaging";
  static const String sourceManufacturer = "manufacturer";
  static const String sourceEstimate = "estimate";

  static const String preparationAsSold = "as_sold";
  static const String preparationPrepared = "prepared";

  /// Source. Part of the key.
  ///
  /// Most probable value: [sourcePackaging].
  /// Other possible values: [sourceManufacturer], [sourceEstimate].
  final String source;

  /// Preparation. Part of the key.
  ///
  /// Most probable value: [preparationAsSold].
  /// Other possible value: [preparationPrepared].
  final String preparation;

  /// Per Size. Part of the key.
  final PerSize perSize;

  /// Per Quantity. Read-only: computed from Product.servingSize
  final num? perQuantity;

  /// Per Unit. Read-only: computed from Product.servingSize
  final Unit? perUnit;

  /// Last Update Timestamp. Read-only.
  final int? lastUpdatedT;

  @override
  String toString() =>
      'NutritionSetKey'
      '($source'
      ',$preparation'
      ',$perSize'
      ',$perQuantity'
      ',$perUnit'
      ',$lastUpdatedT'
      ')';

  static NutritionSetKey? fromJson(dynamic json) {
    final PerSize? perSize = PerSize.fromOffTag(json['per']);
    if (perSize == null) {
      return null;
    }
    final String preparation = json['preparation'];
    final String source = json['source'];
    final num perQuantity = json['per_quantity'];
    final Unit perUnit = UnitHelper.stringToUnit(json['per_unit'])!;
    final int? lastUpdatedT = json['last_updated_t'];
    return NutritionSetKey(
      perSize: perSize,
      perQuantity: perQuantity,
      perUnit: perUnit,
      preparation: preparation,
      source: source,
      lastUpdatedT: lastUpdatedT,
    );
  }

  /// Write-only.
  Map<String, dynamic> toJson() => {
    'per': perSize.offTag,
    'preparation': preparation,
    'source': source,
  };
}
