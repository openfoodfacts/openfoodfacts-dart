import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:openfoodfacts/src/utils/http_status_exception.dart';

void main() {
  test('200 response is accepted', () {
    expect(
      () => HttpStatusException.check(Response('{"status":1}', 200)),
      returnsNormally,
    );
  });

  test('299 response is accepted', () {
    expect(
      () => HttpStatusException.check(Response('{"status":1}', 299)),
      returnsNormally,
    );
  });

  test('504 Gateway Time-out with HTML body throws exception', () {
    const body = '<html><title>504 Gateway Time-out</title></html>';
    expect(
      () => HttpStatusException.check(Response(body, 504)),
      throwsA(
        isA<HttpStatusException>()
            .having((e) => e.statusCode, 'statusCode', 504)
            .having((e) => e.message, 'message', body),
      ),
    );
  });

  test('500 throws exception with correct fields', () {
    expect(
      () => HttpStatusException.check(Response('Internal Server Error', 500)),
      throwsA(
        isA<HttpStatusException>()
            .having((e) => e.statusCode, 'statusCode', 500)
            .having((e) => e.message, 'message', 'Internal Server Error'),
      ),
    );
  });

  test('404 throws exception', () {
    expect(
      () => HttpStatusException.check(Response('Not Found', 404)),
      throwsA(isA<HttpStatusException>()),
    );
  });

  test('301 redirect throws exception', () {
    expect(
      () => HttpStatusException.check(Response('', 301)),
      throwsA(
        isA<HttpStatusException>().having(
          (e) => e.statusCode,
          'statusCode',
          301,
        ),
      ),
    );
  });

  test('toString contains status code', () {
    const exception = HttpStatusException(statusCode: 504, message: 'timeout');
    expect(exception.toString(), contains('504'));
  });
}
