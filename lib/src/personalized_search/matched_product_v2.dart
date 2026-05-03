import '../model/attribute.dart';
import '../model/attribute_group.dart';
import '../model/product.dart';
import 'preference_importance.dart';
import 'product_preferences_manager.dart';

/// Match and score of a [Product] vs. Preferences, v2
///
/// cf. https://github.com/openfoodfacts/smooth-app/issues/1894
/// cf. https://github.com/openfoodfacts/openfoodfacts-server/blob/main/html/js/product-search.js
/// cf. https://openfoodfacts.org/js/product-search.js

enum MatchedProductStatusV2 {
  /// Very good match (very good score)
  VERY_GOOD_MATCH,

  /// Good match (good score)
  GOOD_MATCH,

  /// Poor match (poor score)
  POOR_MATCH,

  /// Unknown match (at least 50% unknown attributes or one mandatory unknown)
  UNKNOWN_MATCH,

  /// May not match (at least one mandatory attribute that may not match)
  MAY_NOT_MATCH,

  /// Does not match (at least one mandatory attribute that does not match)
  DOES_NOT_MATCH,
}

/// Score of a product according to preferences.
///
/// For performance reasons we store just the barcode, not the product.
class MatchedScoreV2 {
  MatchedScoreV2(
    final Product product,
    final ProductPreferencesManager productPreferencesManager,
  ) : barcode = product.barcode! {
    _score = 0;
    _debug = '';

    final List<AttributeGroup>? attributeGroups = product.attributeGroups;
    if (attributeGroups == null) {
      // the product does not have the attribute_groups field
      _status = MatchedProductStatusV2.UNKNOWN_MATCH;
      _debug = 'no attribute_groups';
      return;
    }

    int sumOfFactors = 0;
    int sumOfFactorsForUnknownAttributes = 0;
    bool mayNotMatch = false;
    bool doesNotMatch = false;
    bool isUnknown = false;

    for (final AttributeGroup group in attributeGroups) {
      if (group.attributes == null) {
        continue;
      }
      for (final Attribute attribute in group.attributes!) {
        final String attributeId = attribute.id!;
        final double match = attribute.match ?? 0;
        final String importanceId = productPreferencesManager
            .getImportanceIdForAttributeId(attributeId);

        if (importanceId == PreferenceImportance.ID_NOT_IMPORTANT) {
          // Ignore attribute
          _debug += '$attributeId $importanceId\n';
          continue;
        }

        final int factor = _preferencesFactors[importanceId]!;
        sumOfFactors += factor;

        if (attribute.status == Attribute.STATUS_UNKNOWN) {
          sumOfFactorsForUnknownAttributes += factor;
          if (importanceId == PreferenceImportance.ID_MANDATORY) {
            isUnknown = true;
          }
        } else {
          _score += match * factor;
          _debug += '$attributeId $importanceId - match: $match\n';

          if (importanceId == PreferenceImportance.ID_MANDATORY) {
            if (match <= 10) {
              // Mandatory attribute with a very bad score (e.g. contains an allergen) -> status: does not match
              doesNotMatch = true;
            }
            // Mandatory attribute with a bad score (e.g. may contain traces of an allergen) -> status: may not match
            else if (match <= 50) {
              mayNotMatch = true;
            }
          }
        }
      }
    }

    // Normalize the score from 0 to 100
    if (sumOfFactors == 0) {
      _score = 0;
    } else {
      _score /= sumOfFactors;
    }

    // If one of the attributes does not match, the product does not match
    if (doesNotMatch) {
      // Set score to 0 for products that do not match
      _score = 0;
      _status = MatchedProductStatusV2.DOES_NOT_MATCH;
    } else if (mayNotMatch) {
      _status = MatchedProductStatusV2.MAY_NOT_MATCH;
    } else if (isUnknown) {
      _status = MatchedProductStatusV2.UNKNOWN_MATCH;
    }
    // If too many attributes are unknown, set an unknown match
    else if (sumOfFactorsForUnknownAttributes >= sumOfFactors / 2) {
      _status = MatchedProductStatusV2.UNKNOWN_MATCH;
    }
    // If the product matches, check how well it matches user preferences
    else if (score >= 75) {
      _status = MatchedProductStatusV2.VERY_GOOD_MATCH;
    } else if (score >= 50) {
      _status = MatchedProductStatusV2.GOOD_MATCH;
    } else {
      _status = MatchedProductStatusV2.POOR_MATCH;
    }
  }

  final String barcode;
  double _score = 0;
  late MatchedProductStatusV2 _status;
  String _debug = '';
  int _initialOrder = 0;

  double get score => _score;

  MatchedProductStatusV2 get status => _status;

  String get debug => _debug;

  /// Weights for score
  static const Map<String, int> _preferencesFactors = <String, int>{
    PreferenceImportance.ID_MANDATORY: 2,
    PreferenceImportance.ID_VERY_IMPORTANT: 2,
    PreferenceImportance.ID_IMPORTANT: 1,
    PreferenceImportance.ID_NOT_IMPORTANT: 0,
  };

  static void sort(final List<MatchedScoreV2> scores) {
    int i = 0;
    for (final MatchedScoreV2 score in scores) {
      score._initialOrder = i++;
    }
    scores.sort((MatchedScoreV2 a, MatchedScoreV2 b) {
      late int compare;
      // Highest score first
      compare = b.score.compareTo(a.score);
      if (compare != 0) {
        return compare;
      }
      // Matching products second
      compare =
          (b.status == MatchedProductStatusV2.DOES_NOT_MATCH ? 0 : 1) -
          (a.status == MatchedProductStatusV2.DOES_NOT_MATCH ? 0 : 1);
      if (compare != 0) {
        return compare;
      }
      // Initial order third
      return a._initialOrder.compareTo(b._initialOrder);
    });
  }
}

/// Score of a product according to preferences, with a [Product] field.
class MatchedProductV2 extends MatchedScoreV2 {
  MatchedProductV2(
    this.product,
    final ProductPreferencesManager productPreferencesManager,
  ) : super(product, productPreferencesManager);

  final Product product;

  static List<MatchedProductV2> sort(
    final List<Product> products,
    final ProductPreferencesManager productPreferencesManager,
  ) {
    final List<MatchedProductV2> scores = <MatchedProductV2>[];
    for (final Product product in products) {
      scores.add(MatchedProductV2(product, productPreferencesManager));
    }
    MatchedScoreV2.sort(scores);
    return scores;
  }
}
