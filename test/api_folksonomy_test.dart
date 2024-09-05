import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Tests around folksonomy
void main() {
  // TODO have it working on TEST too
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;

  // of course we need to check that those 3 "known" guys combine well
  // cf. https://api.folksonomy.openfoodfacts.org/docs
  const String knownBarcode = '8025386009180';
  const String knownKey = 'producer_data_issue';
  const String knownValue = 'proteins too large for category';

  const String unknownBarcode = 'blablabla$knownBarcode';
  const String unknownKey = 'blablabla$knownKey';
  const String unknownValue = 'blablabla$knownValue';

  const List<Map<String, String>> unknownParameters = <Map<String, String>>[
    {'barcode': unknownBarcode, 'key': knownKey},
    {'barcode': knownBarcode, 'key': unknownKey},
  ];

  /// Checks that all [ProductTag]s concern that [barcode], and [key] in option.
  void checkProductTagList(final Iterable<ProductTag> list) {
    bool found = false;
    for (var element in list) {
      expect(element.barcode, knownBarcode);
      if (element.key == knownKey) {
        found = true;
        expect(element.value, knownValue);
      }
    }
    expect(found, true);
  }

  /// Checks that all [ProductStats]s concern that [barcode], and [key] in option.
  void checkProductStatsList(final Iterable<ProductStats> list) {
    bool foundBarcode = false;
    for (final ProductStats productStats in list) {
      if (productStats.barcode == knownBarcode) {
        foundBarcode = true;
        expect(productStats.numberOfKeys, greaterThanOrEqualTo(1));
      }
    }
    expect(foundBarcode, true);
  }

  group('$OpenFoodAPIClient Folksonomy', () {
    test('hello', () async => await FolksonomyAPIClient.hello());

    group('$FolksonomyAPIClient Auth', () {
      const UriHelper uriHelper = uriHelperFolksonomyProd;
      const User user = TestConstants.TEST_USER;

      test('unknown user', () async {
        final MaybeError<String> status =
            await FolksonomyAPIClient.getAuthenticationToken(
          username: 'magritte',
          password: 'this is not a password',
          uriHelper: uriHelper,
        );
        expect(status.isError, isTrue);
        expect(status.statusCode, Session.invalidAuthStatusCode);
        expect(status.detailError, Session.invalidAuthMessage);
      });

      test('existing user', () async {
        final MaybeError<String> token =
            await FolksonomyAPIClient.getAuthenticationToken(
          username: user.userId,
          password: user.password,
          uriHelper: uriHelper,
        );
        expect(token.isError, isFalse);
        expect(token.value, isNotEmpty);
      });
    });

    group('$FolksonomyAPIClient getProductStats', () {
      test('all', () async {
        final List<ProductStats> result =
            await FolksonomyAPIClient.getProductStats();
        expect(result, isNotEmpty);
        checkProductStatsList(result);
      });

      test('key - found', () async {
        final List<ProductStats> result =
            await FolksonomyAPIClient.getProductStats(key: knownKey);
        expect(result, isNotEmpty);
        checkProductStatsList(result);
      });

      test('key - not found', () async {
        final List<ProductStats> result =
            await FolksonomyAPIClient.getProductStats(key: unknownKey);
        expect(result, isEmpty);
      });
    });

    test('getProducts - found key', () async {
      final Map<String, String> result = await FolksonomyAPIClient.getProducts(
        key: knownKey,
      );
      expect(result, isNotEmpty);
      expect(result[knownBarcode], knownValue);
    });

    test('getProducts - found key and value', () async {
      final Map<String, String> result = await FolksonomyAPIClient.getProducts(
        key: knownKey,
        value: knownValue,
      );
      expect(result, isNotEmpty);
      expect(result[knownBarcode], knownValue);
    });

    test('getProducts - not found key', () async {
      final Map<String, String> result = await FolksonomyAPIClient.getProducts(
        key: unknownKey,
      );
      expect(result, isEmpty);
    });

    test('getProducts - not found key and value', () async {
      final Map<String, String> result = await FolksonomyAPIClient.getProducts(
        key: knownKey,
        value: unknownValue,
      );
      expect(result, isEmpty);
    });

    test('getProductTags - found', () async {
      final Map<String, ProductTag> result =
          await FolksonomyAPIClient.getProductTags(
        barcode: knownBarcode,
      );
      expect(result, isNotEmpty);
      checkProductTagList(result.values);
    });

    test('getProductTags - not found', () async {
      final Map<String, ProductTag> result =
          await FolksonomyAPIClient.getProductTags(
        barcode: unknownBarcode,
      );
      expect(result, isEmpty);
    });

    test('getProductTag - found', () async {
      final ProductTag? result = await FolksonomyAPIClient.getProductTag(
        barcode: knownBarcode,
        key: knownKey,
      );
      expect(result, isNotNull);
      expect(result!.barcode, knownBarcode);
      expect(result.key, knownKey);
    });

    test('getProductTag - not found', () async {
      for (final unknownParameter in unknownParameters) {
        final ProductTag? result = await FolksonomyAPIClient.getProductTag(
          barcode: unknownParameter['barcode']!,
          key: unknownParameter['key']!,
        );
        expect(result, isNull);
      }
    });

    test('getProductTagVersions - found', () async {
      final List<ProductTag> result =
          await FolksonomyAPIClient.getProductTagVersions(
        barcode: knownBarcode,
        key: knownKey,
      );
      expect(result, isNotEmpty);
      checkProductTagList(result);
    });

    test('getProductTagVersions - not found', () async {
      for (final unknownParameter in unknownParameters) {
        final List<ProductTag> result =
            await FolksonomyAPIClient.getProductTagVersions(
          barcode: unknownParameter['barcode']!,
          key: unknownParameter['key']!,
        );
        expect(result, isEmpty);
      }
    });

    test('create', () async {
      const UriHelper uriHelper = uriHelperFolksonomyProd;
      const User user = TestConstants.TEST_USER;
      const String barcode = '123';
      const String key = 'mykey';
      const String value1 = 'myvalue1';
      const String value2 = 'myvalue2';

      // authentication
      final MaybeError<String> token =
          await FolksonomyAPIClient.getAuthenticationToken(
        username: user.userId,
        password: user.password,
        uriHelper: uriHelper,
      );
      expect(token.isError, isFalse);
      expect(token.value, isNotEmpty);
      final String bearerToken = token.value;

      MaybeError<bool> deleteResult;
      ProductTag? productTag;
      ProductTag? productTag2;

      productTag = await FolksonomyAPIClient.getProductTag(
        barcode: barcode,
        key: key,
        uriHelper: uriHelper,
      );
      if (productTag != null) {
        expect(productTag.barcode, barcode);
        expect(productTag.key, key);
        deleteResult = await FolksonomyAPIClient.deleteProductTag(
          barcode: productTag.barcode,
          key: productTag.key,
          version: productTag.version,
          bearerToken: bearerToken,
          uriHelper: uriHelper,
        );
        expect(deleteResult.isError, false);
        expect(deleteResult.value, true);
      }
      productTag = await FolksonomyAPIClient.getProductTag(
        barcode: barcode,
        key: key,
        uriHelper: uriHelper,
      );
      expect(productTag, isNull);

      MaybeError<bool> addResult = await FolksonomyAPIClient.addProductTag(
        barcode: barcode,
        key: key,
        value: value1,
        bearerToken: bearerToken,
        uriHelper: uriHelper,
      );
      expect(addResult.isError, false);
      expect(addResult.value, true);

      addResult = await FolksonomyAPIClient.addProductTag(
        barcode: barcode,
        key: key,
        value: value2,
        bearerToken: bearerToken,
        uriHelper: uriHelper,
      );
      expect(addResult.isError, true);

      productTag = await FolksonomyAPIClient.getProductTag(
        barcode: barcode,
        key: key,
        uriHelper: uriHelper,
      );
      expect(productTag, isNotNull);
      expect(productTag!.barcode, barcode);
      expect(productTag.key, key);
      expect(productTag.value, value1);
      expect(productTag.version, 1);
      expect(productTag.editor, user.userId);

      MaybeError<bool> updateResult =
          await FolksonomyAPIClient.updateProductTag(
        barcode: barcode,
        key: key,
        value: value2,
        version: productTag.version,
        bearerToken: bearerToken,
        uriHelper: uriHelper,
      );
      // we expect "version + 1";
      expect(updateResult.isError, true);

      updateResult = await FolksonomyAPIClient.updateProductTag(
        barcode: barcode,
        key: key,
        value: value2,
        version: productTag.version + 1,
        bearerToken: bearerToken,
        uriHelper: uriHelper,
      );
      expect(updateResult.isError, false);
      expect(updateResult.value, true);

      productTag2 = await FolksonomyAPIClient.getProductTag(
        barcode: barcode,
        key: key,
        uriHelper: uriHelper,
      );
      expect(productTag2, isNotNull);
      expect(productTag2!.barcode, barcode);
      expect(productTag2.key, key);
      expect(productTag2.value, value2);
      expect(productTag2.version, productTag.version + 1);
      expect(productTag2.editor, user.userId);

      deleteResult = await FolksonomyAPIClient.deleteProductTag(
        barcode: barcode,
        key: key,
        version: productTag.version,
        bearerToken: bearerToken,
        uriHelper: uriHelper,
      );
      // not the right version!
      expect(deleteResult.isError, true);

      deleteResult = await FolksonomyAPIClient.deleteProductTag(
        barcode: barcode,
        key: key,
        version: productTag2.version,
        bearerToken: bearerToken,
        uriHelper: uriHelper,
      );
      expect(deleteResult.isError, false);
      expect(deleteResult.value, true);
    });

    test('getKeys', () async {
      final Map<String, KeyStats> result = await FolksonomyAPIClient.getKeys();
      final KeyStats keyStats = result[knownKey]!;
      expect(keyStats.key, knownKey);
      expect(keyStats.count, greaterThanOrEqualTo(1));
      expect(keyStats.values, greaterThanOrEqualTo(1));
    });

    test('ping', () async => await FolksonomyAPIClient.ping());
  });
}
