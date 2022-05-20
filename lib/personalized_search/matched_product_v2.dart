import 'package:openfoodfacts/model/Attribute.dart';
import 'package:openfoodfacts/model/AttributeGroup.dart';
import 'package:openfoodfacts/model/Product.dart';
import 'package:openfoodfacts/personalized_search/preference_importance.dart';
import 'package:openfoodfacts/personalized_search/product_preferences_manager.dart';

/// Match and score of a [Product] vs. Preferences, v2
///
/// cf. https://github.com/openfoodfacts/smooth-app/issues/1894
/// cf. https://github.com/openfoodfacts/openfoodfacts-server/blob/main/html/js/product-search.js
/// cf. https://openfoodfacts.org/js/product-search.js

enum MatchedProductStatusV2 {
  /// Very good match (very good score)
  VERY_GOOD,

  /// Good match (good score)
  GOOD,

  /// Poor match (poor score)
  POOR,

  /// Unknown match (at least 50% unknown attributes or one mandatory unknown)
  UNKNOWN,

  /// May not match (at least one mandatory attribute that may not match)
  MAY,

  /// Does not match (at least one mandatory attribute that does not match)
  NO,
}

class MatchedProductV2 {
  MatchedProductV2(
    this.product,
    final ProductPreferencesManager productPreferencesManager,
  ) {
    _score = 0;
    _debug = '';

    final List<AttributeGroup>? attributeGroups = product.attributeGroups;
    if (attributeGroups == null) {
      // the product does not have the attribute_groups field
      _status = MatchedProductStatusV2.UNKNOWN;
      _debug = "no attribute_groups";
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
      _status = MatchedProductStatusV2.NO;
    } else if (mayNotMatch) {
      _status = MatchedProductStatusV2.MAY;
    } else if (isUnknown) {
      _status = MatchedProductStatusV2.UNKNOWN;
    }
    // If too many attributes are unknown, set an unknown match
    else if (sumOfFactorsForUnknownAttributes >= sumOfFactors / 2) {
      _status = MatchedProductStatusV2.UNKNOWN;
    }
    // If the product matches, check how well it matches user preferences
    else if (score >= 75) {
      _status = MatchedProductStatusV2.VERY_GOOD;
    } else if (score >= 50) {
      _status = MatchedProductStatusV2.GOOD;
    } else {
      _status = MatchedProductStatusV2.POOR;
    }
  }

  final Product product;
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

  static List<MatchedProductV2> sort(
    final List<Product> products,
    final ProductPreferencesManager productPreferencesManager,
  ) {
    final List<MatchedProductV2> result = <MatchedProductV2>[];
    int i = 0;
    for (final Product product in products) {
      final MatchedProductV2 matchedProduct =
          MatchedProductV2(product, productPreferencesManager);
      matchedProduct._initialOrder = i++;
      result.add(matchedProduct);
    }
    result.sort(
      (MatchedProductV2 a, MatchedProductV2 b) {
        late int compare;
        // Highest score first
        compare = b.score.compareTo(a.score);
        if (compare != 0) {
          return compare;
        }
        // Matching products second
        compare = (b.status == MatchedProductStatusV2.NO ? 0 : 1) -
            (a.status == MatchedProductStatusV2.NO ? 0 : 1);
        if (compare != 0) {
          return compare;
        }
        // Initial order third
        return a._initialOrder.compareTo(b._initialOrder);
      },
    );
    return result;
  }
}
