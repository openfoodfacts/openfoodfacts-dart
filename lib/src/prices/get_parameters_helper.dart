import 'package:meta/meta.dart';

/// Helper class for API query parameters.
abstract class GetParametersHelper {
  int? pageSize;
  int? pageNumber;

  final Map<String, String> _result = <String, String>{};

  @protected
  Map<String, String> get result => _result;

  /// Returns the parameters as a query parameter map.
  Map<String, String> getQueryParameters() {
    _checkIntValue('page_number', pageSize, min: 1);
    _checkIntValue('page_size', pageSize, min: 1, max: 100);
    _result.clear();
    addNonNullInt(pageNumber, 'page');
    addNonNullInt(pageSize, 'size');
    return _result;
  }

  void _checkIntValue(
    final String field,
    final int? value, {
    final int? min,
    final int? max,
  }) {
    if (value == null) {
      return;
    }
    if (min != null) {
      if (value < min) {
        throw Exception(
          '$field minimum value is $min (actual value is $value)',
        );
      }
    }
    if (max != null) {
      if (value > max) {
        throw Exception(
          '$field maximum value is $max (actual value is $value)',
        );
      }
    }
  }

  void addNonNullString(final String? value, final String tag) {
    if (value != null) {
      _result[tag] = value;
    }
  }

  void addNonNullInt(final int? value, final String tag) =>
      addNonNullString(value?.toString(), tag);

  void addNonNullBool(final bool? value, final String tag) =>
      addNonNullString(value?.toString(), tag);

  void addNonNullDate(
    final DateTime? value,
    final String tag, {
    required final bool dayOnly,
  }) {
    if (value != null) {
      addNonNullString(formatDate(value, dayOnly: dayOnly), tag);
    }
  }

  /// Formats a date as DateFormat('yyyy-MM-dd') but without the `intl` package.
  static String formatDate(
    final DateTime date, {
    bool dayOnly = true,
  }) {
    final String result = date.toIso8601String();
    if (dayOnly) {
      return result.substring(0, 10);
    }
    return result;
  }
}
