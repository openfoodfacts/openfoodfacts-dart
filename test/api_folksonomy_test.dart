import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/OpenFoodAPIConfiguration.dart';
import 'package:openfoodfacts/utils/QueryType.dart';
import 'package:test/test.dart';

/// Tests around folksonomy
void main() {
  // TODO have it working on TEST too
  OpenFoodAPIConfiguration.globalQueryType = QueryType.PROD;

  const String barcode = '9310036071174';
  const String key = 'packaging:character:wikidata';
  const String unknownBarcode = 'blablabla$barcode';
  const String unknownKey = 'blablabla$key';
  const List<Map<String, String>> unknownParameters = <Map<String, String>>[
    {'barcode': unknownBarcode, 'key': key},
    {'barcode': barcode, 'key': unknownKey},
  ];

  void _checkProductTagList(
    final Iterable<ProductTag> list,
    final String expectedBarcode, {
    final String? key,
  }) {
    bool found = false;
    for (var element in list) {
      expect(element.barcode, barcode);
      if (key != null) {
        if (element.key == key) {
          found = true;
        }
      }
    }
    expect(found, key != null);
  }

  group('$OpenFoodAPIClient Folksonomy', () {
    test('hello', () async => await FolksonomyAPIClient.hello());

    test('getProductStats', () async {
      final List<ProductStats> result =
          await FolksonomyAPIClient.getProductStats();
      expect(result, isNotEmpty);
      bool foundBarcode = false;
      for (final ProductStats productStats in result) {
        if (productStats.barcode == barcode) {
          foundBarcode = true;
          expect(productStats.numberOfKeys, greaterThanOrEqualTo(1));
        }
      }
      expect(foundBarcode, true);
    });

    test('getProducts - found', () async {
      final Map<String, String> result = await FolksonomyAPIClient.getProducts(
        key: key,
      );
      expect(result, isNotEmpty);
    });

    test('getProducts - not found', () async {
      final Map<String, String> result = await FolksonomyAPIClient.getProducts(
        key: unknownKey,
      );
      expect(result, isEmpty);
    });

    test('getProductTags - found', () async {
      final Map<String, ProductTag> result =
          await FolksonomyAPIClient.getProductTags(
        barcode: barcode,
      );
      expect(result, isNotEmpty);
      _checkProductTagList(result.values, barcode);
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
        barcode: barcode,
        key: key,
      );
      expect(result, isNotNull);
      expect(result!.barcode, barcode);
      expect(result.key, key);
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
        barcode: barcode,
        key: key,
      );
      expect(result, isNotEmpty);
      _checkProductTagList(result.values, barcode, key: key);
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
        barcode: barcode,
        key: key,
      );
      expect(result, isNotEmpty);
      _checkProductTagList(result, barcode, key: key);
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
      final KeyStats keyStats = result[key]!;
      expect(keyStats.key, key);
      expect(keyStats.count, greaterThanOrEqualTo(1));
      expect(keyStats.values, greaterThanOrEqualTo(1));
    });

    test('ping', () async => await FolksonomyAPIClient.ping());
  });
}
