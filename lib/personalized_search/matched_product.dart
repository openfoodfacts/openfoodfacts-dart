// Package imports:
import 'package:openfoodfacts/model/Attribute.dart';
import 'package:openfoodfacts/model/AttributeGroup.dart';
import 'package:openfoodfacts/model/Product.dart';

// Project imports:
import 'package:openfoodfacts/personalized_search/preference_importance.dart';
import 'package:openfoodfacts/personalized_search/product_preferences_manager.dart';

/// Match and score of a [Product] vs. Preferences
///
/// cf. https://github.com/openfoodfacts/smooth-app/issues/39
class MatchedProduct {
  MatchedProduct(
    this.product,
    final ProductPreferencesManager productPreferencesManager,
  ) {
    final List<AttributeGroup>? attributeGroups = product.attributeGroups;
    if (attributeGroups == null) {
      _status = null;
      return;
    }
    for (final AttributeGroup group in attributeGroups) {
      if (group.attributes != null) {
        for (final Attribute attribute in group.attributes!) {
          final PreferenceImportance? preferenceImportance =
              productPreferencesManager.getPreferenceImportanceFromImportanceId(
            productPreferencesManager.getImportanceIdForAttributeId(
              attribute.id!,
            ),
          );
          if (preferenceImportance != null) {
            final String? importanceId = preferenceImportance.id;
            final int factor = preferenceImportance.factor ?? 0;
            final int? minimalMatch = preferenceImportance.minimalMatch;
            if (importanceId == null || factor == 0) {
              _debug += '${attribute.id} $importanceId\n';
            } else {
              if (attribute.status == Attribute.STATUS_UNKNOWN) {
                if (_status ?? false) {
                  _status = null;
                }
              } else {
                _debug +=
                    '${attribute.id} $importanceId - match: ${attribute.match}\n';
                _score += (attribute.match ?? 0) * factor;
                if (minimalMatch != null &&
                    (attribute.match ?? 0) <= minimalMatch) {
                  _status = false;
                }
              }
            }
          }
        }
      }
    }
  }

  final Product product;
  double _score = 0;
  bool? _status = true;
  String _debug = '';

  double get score => _score;
  bool? get status => _status;
  String get debug => _debug;

  static List<MatchedProduct> sort(
    final List<Product> products,
    final ProductPreferencesManager productPreferencesManager,
  ) {
    final List<MatchedProduct> result = <MatchedProduct>[];
    for (final Product product in products) {
      final MatchedProduct matchedProduct =
          MatchedProduct(product, productPreferencesManager);
      result.add(matchedProduct);
    }
    result.sort(
        (MatchedProduct a, MatchedProduct b) => b.score.compareTo(a.score));
    return result;
  }
}
