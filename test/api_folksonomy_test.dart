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

    test('getProductStats - all', () async {
      final List<ProductStats> result =
          await FolksonomyAPIClient.getProductStats();
      expect(result, isNotEmpty);
      checkProductStatsList(result);
    });

    test('getProductStats - found', () async {
      final List<ProductStats> result =
          await FolksonomyAPIClient.getProductStats(key: knownKey);
      expect(result, isNotEmpty);
      checkProductStatsList(result);
    });

    test('getProductStats - not found', () async {
      final List<ProductStats> result =
          await FolksonomyAPIClient.getProductStats(key: unknownKey);
      expect(result, isEmpty);
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

    test('getProductTagWithSubKeys - found', () async {
      final Map<String, ProductTag> result =
          await FolksonomyAPIClient.getProductTagWithSubKeys(
        barcode: knownBarcode,
        key: knownKey,
      );
      expect(result, isNotEmpty);
      checkProductTagList(result.values);
    });

    test('getProductTagWithSubKeys - not found', () async {
      for (final unknownParameter in unknownParameters) {
        final Map<String, ProductTag> result =
            await FolksonomyAPIClient.getProductTagWithSubKeys(
          barcode: unknownParameter['barcode']!,
          key: unknownParameter['key']!,
        );
        expect(result, isEmpty);
      }
    });

    /* TODO
    test('deleteProductTag', () async {
      await FolksonomyAPIClient.deleteProductTag(
        barcode: '9310036071GDFFDD174',
        key: 'packaging:character:dswikidata',
        version: 21434534534,
      );
    }, skip: 'To be fixed and run on TEST env');
     */

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

    /* TODO
    test('updateProductTag', () async {
      await FolksonomyAPIClient.updateProductTag(
        productTag: ProductTag(
          barcode: 'barcode',
          key: 'key',
          value: 'value',
          owner: 'owner',
          version: 0,
          editor: 'editor',
          lastEdit: DateTime.now(),
          comment: 'comment',
        ),
      );
    }, skip: 'To be fixed and run on TEST env');
     */

    /* TODO
    test('addProductTag', () async {
      await FolksonomyAPIClient.addProductTag(
        productTag: ProductTag(
          barcode: 'barcode',
          key: 'key',
          value: 'value',
          owner: 'owner',
          version: 0,
          editor: 'editor',
          lastEdit: DateTime.now(),
          comment: 'comment',
        ),
      );
    }, skip: 'To be fixed and run on TEST env');
     */

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
