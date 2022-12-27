import '../interface/parameter.dart';
import '../model/parameter/page_number.dart';
import '../model/parameter/page_size.dart';
import 'abstract_query_configuration.dart';
import 'language_helper.dart';
import 'product_fields.dart';

/// Query Configuration for user-related searches.
/// Get products a user created, photographed,
///
/// ```dart
///   UserProductSearchQueryConfiguration configuration =
///       UserProductSearchQueryConfiguration(
///     // Products user photographed
///     type: UserProductSearchType.PHOTOGRAPHER,
///     userId: '',
///   );
///
///   SearchResult result = await OpenFoodAPIClient.searchProducts(
///     User(userId: '', password: ''),
///     configuration,
///   );
///
///   print(result.count);
/// ´´´
///
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

  @override
  Map<String, String> getParametersMap() {
    final Map<String, String> parameters = super.getParametersMap();
    String? tmp;
    tmp = type.getUserTag();
    if (tmp != null) {
      parameters[tmp] = userId;
    }
    tmp = type.getStateTag();
    if (tmp != null) {
      parameters['states_tags'] = tmp;
    }
    return parameters;
  }
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
        return '/contributor/$userId.json'; // TODO(monsieurtanuki): use '/api/v2/search' instead
      case UserProductSearchType.INFORMER:
      case UserProductSearchType.PHOTOGRAPHER:
      case UserProductSearchType.TO_BE_COMPLETED:
        return '/api/v2/search';
    }
  }

  String? getUserTag() {
    switch (this) {
      case UserProductSearchType.CONTRIBUTOR:
        return null;
      case UserProductSearchType.PHOTOGRAPHER:
        return 'photographers_tags';
      case UserProductSearchType.INFORMER:
        return 'informers_tags';
      case UserProductSearchType.TO_BE_COMPLETED:
        return 'informers_tags';
    }
  }

  String? getStateTag() {
    switch (this) {
      case UserProductSearchType.CONTRIBUTOR:
      case UserProductSearchType.PHOTOGRAPHER:
      case UserProductSearchType.INFORMER:
        return null;
      case UserProductSearchType.TO_BE_COMPLETED:
        return 'en:to-be-completed';
    }
  }
}
