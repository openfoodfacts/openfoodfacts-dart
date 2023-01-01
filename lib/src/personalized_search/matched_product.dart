import '../model/attribute.dart';
import '../model/attribute_group.dart';
import '../model/product.dart';
import 'preference_importance.dart';
import 'product_preferences_manager.dart';

/// Match and score of a [Product] vs. Preferences
///
/// cf. https://github.com/openfoodfacts/smooth-app/issues/39

enum MatchedProductStatus {
  YES,
  NO,
  UNKNOWN,
}

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
    _status = MatchedProductStatus.YES;
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
                if (_status == MatchedProductStatus.YES) {
                  _status = MatchedProductStatus.UNKNOWN;
                }
              } else {
                _debug +=
                    '${attribute.id} $importanceId - match: ${attribute.match}\n';
                _score += (attribute.match ?? 0) * factor;
                if (minimalMatch != null &&
                    (attribute.match ?? 0) <= minimalMatch) {
                  _status = MatchedProductStatus.NO;
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
  MatchedProductStatus? _status;
  String _debug = '';

  double get score => _score;
  MatchedProductStatus? get status => _status;
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
