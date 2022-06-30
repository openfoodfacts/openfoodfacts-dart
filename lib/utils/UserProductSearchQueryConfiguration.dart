import 'package:openfoodfacts/interface/Parameter.dart';
import 'package:openfoodfacts/model/parameter/PageNumber.dart';
import 'package:openfoodfacts/model/parameter/PageSize.dart';
import 'package:openfoodfacts/utils/AbstractQueryConfiguration.dart';
import 'package:openfoodfacts/utils/LanguageHelper.dart';
import 'package:openfoodfacts/utils/ProductFields.dart';

/// Query Configuration for user-related searches.
class UserProductSearchQueryConfiguration extends AbstractQueryConfiguration {
  UserProductSearchQueryConfiguration({
    required this.type,
    required this.userId,
    final OpenFoodFactsLanguage? language,
    final List<OpenFoodFactsLanguage> languages = const [],
    final List<ProductField>? fields,
    final int? pageNumber,
    final int? pageSize,
  }) : super(
          language: language,
          languages: languages,
          fields: fields,
          additionalParameters: _convertToParametersList(pageNumber, pageSize),
        );

  final UserProductSearchType type;
  final String userId;

  static List<Parameter> _convertToParametersList(
    int? page,
    int? pageSize,
  ) {
    final result = <Parameter>[];
    if (page != null) {
      result.add(PageNumber(page: page));
    }
    if (pageSize != null) {
      result.add(PageSize(size: pageSize));
    }
    return result;
  }

  @override
  String getUriPath() => type.getPath(userId);
}

/// Types of user-related searches.
enum UserProductSearchType {
  /// Where the user created the product.
  CONTRIBUTOR,

  /// Where the user edited the product.
  INFORMER,

  /// Where the user photographed the product.
  PHOTOGRAPHER,

  /// Where the user edited a product that still needs to be completed.
  TO_BE_COMPLETED,
}

extension UserProductSearchTypeExtension on UserProductSearchType {
  /// Returns the URI path for the search.
  String getPath(final String userId) {
    switch (this) {
      case UserProductSearchType.CONTRIBUTOR:
        return '/contributor/$userId.json';
      case UserProductSearchType.INFORMER:
        return '/informer/$userId.json';
      case UserProductSearchType.PHOTOGRAPHER:
        return '/photographer/$userId.json';
      case UserProductSearchType.TO_BE_COMPLETED:
        return '/informer/$userId/state/to-be-completed.json';
    }
  }
}
