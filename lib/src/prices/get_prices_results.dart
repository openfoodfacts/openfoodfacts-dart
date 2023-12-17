import 'get_prices_result.dart';
import 'validation_errors.dart';

/// Either successful "get prices" result, or request validation errors.
class GetPricesResults {
  final GetPricesResult? result;

  final ValidationErrors? error;

  GetPricesResults.result(this.result) : error = null;

  GetPricesResults.error(this.error) : result = null;
}
