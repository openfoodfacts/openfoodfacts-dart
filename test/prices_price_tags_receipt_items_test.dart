import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;

  group('Parameters getQueryParameters tests', () {
    test('GetPriceTagsParameters query parameters output', () {
      final GetPriceTagsParameters parameters = GetPriceTagsParameters()
        ..pageNumber = 2
        ..pageSize = 50
        ..orderBy = [
          OrderBy(field: GetPriceTagsOrderField.created, ascending: false),
          OrderBy(field: GetPriceTagsOrderField.id, ascending: true),
        ]
        ..createdGte = DateTime.utc(2025, 1, 1, 12, 0, 0)
        ..createdLte = DateTime.utc(2025, 1, 31, 23, 59, 59)
        ..predictionCount = 1
        ..predictionCountGte = 2
        ..predictionCountLte = 5
        ..priceId = 123
        ..proofId = 456
        ..proofOwner = 'testuser'
        ..proofLocationOSMAddressCountryCode = 'FR'
        ..proofReadyForPriceTagValidation = true
        ..status = 1
        ..statusIsNull = false
        ..tagsContains = 'tag1'
        ..tagsNotContains = 'tag2';

      final Map<String, String> queryParams = parameters.getQueryParameters();

      expect(queryParams['page'], equals('2'));
      expect(queryParams['size'], equals('50'));
      expect(queryParams['order_by'], equals('-created,id'));
      expect(queryParams['created__gte'], equals('2025-01-01T12:00:00.000Z'));
      expect(queryParams['created__lte'], equals('2025-01-31T23:59:59.000Z'));
      expect(queryParams['prediction_count'], equals('1'));
      expect(queryParams['prediction_count__gte'], equals('2'));
      expect(queryParams['prediction_count__lte'], equals('5'));
      expect(queryParams['price_id'], equals('123'));
      expect(queryParams['proof_id'], equals('456'));
      expect(queryParams['proof__owner'], equals('testuser'));
      expect(
        queryParams['proof__location__osm_address_country_code'],
        equals('FR'),
      );
      expect(
        queryParams['proof__ready_for_price_tag_validation'],
        equals('true'),
      );
      expect(queryParams['status'], equals('1'));
      expect(queryParams['status__isnull'], equals('false'));
      expect(queryParams['tags__contains'], equals('tag1'));
      expect(queryParams['tags__not_contains'], equals('tag2'));
    });

    test('GetReceiptItemsParameters query parameters output', () {
      final GetReceiptItemsParameters parameters = GetReceiptItemsParameters()
        ..pageNumber = 1
        ..pageSize = 20
        ..orderBy = [
          OrderBy(field: GetReceiptItemsOrderField.order, ascending: true),
          OrderBy(field: GetReceiptItemsOrderField.created, ascending: false),
        ]
        ..createdGte = DateTime.utc(2025, 2, 1, 0, 0, 0)
        ..createdLte = DateTime.utc(2025, 2, 28, 23, 59, 59)
        ..proofOwner = 'owner1'
        ..proofId = 789
        ..status = 0
        ..statusIsNull = true;

      final Map<String, String> queryParams = parameters.getQueryParameters();

      expect(queryParams['page'], equals('1'));
      expect(queryParams['size'], equals('20'));
      expect(queryParams['order_by'], equals('order,-created'));
      expect(queryParams['created__gte'], equals('2025-02-01T00:00:00.000Z'));
      expect(queryParams['created__lte'], equals('2025-02-28T23:59:59.000Z'));
      expect(queryParams['proof__owner'], equals('owner1'));
      expect(queryParams['proof_id'], equals('789'));
      expect(queryParams['status'], equals('0'));
      expect(queryParams['status__isnull'], equals('true'));
    });

    test('Local DateTime created filters serialize as UTC', () {
      final DateTime local = DateTime(2025, 1, 1, 12);

      final GetPriceTagsParameters priceTagParams = GetPriceTagsParameters()
        ..createdGte = local
        ..createdLte = local;
      expect(
        priceTagParams.getQueryParameters()['created__gte'],
        equals(local.toUtc().toIso8601String()),
      );
      expect(
        priceTagParams.getQueryParameters()['created__lte'],
        equals(local.toUtc().toIso8601String()),
      );

      final GetReceiptItemsParameters receiptParams =
          GetReceiptItemsParameters()
            ..createdGte = local
            ..createdLte = local;
      expect(
        receiptParams.getQueryParameters()['created__gte'],
        equals(local.toUtc().toIso8601String()),
      );
      expect(
        receiptParams.getQueryParameters()['created__lte'],
        equals(local.toUtc().toIso8601String()),
      );
    });
  });

  group('Live OpenPricesAPIClient PriceTags and ReceiptItems', () {
    const UriProductHelper uriHelper = uriHelperFoodTest;
    const User user = TestConstants.TEST_USER;

    late String bearerToken;

    setUpAll(() async {
      final MaybeError<String> token =
          await OpenPricesAPIClient.getAuthenticationToken(
            username: user.userId,
            password: user.password,
            uriHelper: uriHelper,
          );
      expect(token.isError, isFalse);
      bearerToken = token.value;
    });

    tearDownAll(() async {
      await OpenPricesAPIClient.deleteUserSession(
        uriHelper: uriHelper,
        bearerToken: bearerToken,
      );
    });

    test('getPriceTags and getPriceTag live', () async {
      final MaybeError<GetPriceTagsResult> listResult =
          await OpenPricesAPIClient.getPriceTags(
            GetPriceTagsParameters()..pageSize = 5,
            uriHelper: uriHelper,
            bearerToken: bearerToken,
          );
      expect(listResult.isError, isFalse);
      expect(listResult.value.items, isNotEmpty);
      expect(listResult.value.total, greaterThan(0));

      final PriceTag firstTag = listResult.value.items!.first;
      expect(firstTag.id, isNotNull);

      final MaybeError<PriceTag> singleResult =
          await OpenPricesAPIClient.getPriceTag(
            firstTag.id!,
            uriHelper: uriHelper,
            bearerToken: bearerToken,
          );
      expect(singleResult.isError, isFalse);
      expect(singleResult.value.id, equals(firstTag.id));
      if (singleResult.value.proof != null) {
        expect(singleResult.value.proof!.id, isNotNull);
      }

      // Read-only filter test by status matching the fetched tag
      final GetPriceTagsParameters statusParams = GetPriceTagsParameters()
        ..pageSize = 5;
      if (firstTag.status != null) {
        statusParams.status = firstTag.status;
      } else {
        statusParams.statusIsNull = true;
      }
      final MaybeError<GetPriceTagsResult> statusFilterResult =
          await OpenPricesAPIClient.getPriceTags(
            statusParams,
            uriHelper: uriHelper,
            bearerToken: bearerToken,
          );
      expect(statusFilterResult.isError, isFalse);
      if (statusFilterResult.value.items != null &&
          statusFilterResult.value.items!.isNotEmpty) {
        for (final PriceTag item in statusFilterResult.value.items!) {
          if (firstTag.status != null) {
            expect(item.status, equals(firstTag.status));
          } else {
            expect(item.status, isNull);
          }
        }
      }
    });

    test('getPriceTags with parameters and order', () async {
      final MaybeError<GetPriceTagsResult> listResult =
          await OpenPricesAPIClient.getPriceTags(
            GetPriceTagsParameters()
              ..pageSize = 2
              ..pageNumber = 1
              ..orderBy = [
                OrderBy(
                  field: GetPriceTagsOrderField.created,
                  ascending: false,
                ),
              ],
            uriHelper: uriHelper,
            bearerToken: bearerToken,
          );
      expect(listResult.isError, isFalse);
      expect(listResult.value.items, isNotNull);
      expect(listResult.value.items!.length, lessThanOrEqualTo(2));
      expect(listResult.value.pageNumber, equals(1));
      expect(listResult.value.pageSize, equals(2));
    });

    test('getPriceTag with unknown ID returns error', () async {
      final MaybeError<PriceTag> result = await OpenPricesAPIClient.getPriceTag(
        999999999,
        uriHelper: uriHelper,
        bearerToken: bearerToken,
      );
      expect(result.isError, isTrue);
      expect(result.statusCode, equals(404));
    });

    test('getReceiptItems and getReceiptItem live', () async {
      final MaybeError<GetReceiptItemsResult> listResult =
          await OpenPricesAPIClient.getReceiptItems(
            GetReceiptItemsParameters()..pageSize = 5,
            uriHelper: uriHelper,
            bearerToken: bearerToken,
          );
      expect(listResult.isError, isFalse);
      expect(listResult.value.items, isNotEmpty);
      expect(listResult.value.total, greaterThan(0));

      final ReceiptItem firstItem = listResult.value.items!.first;
      expect(firstItem.id, isNotNull);

      final MaybeError<ReceiptItem> singleResult =
          await OpenPricesAPIClient.getReceiptItem(
            firstItem.id!,
            uriHelper: uriHelper,
            bearerToken: bearerToken,
          );
      expect(singleResult.isError, isFalse);
      expect(singleResult.value.id, equals(firstItem.id));
      expect(singleResult.value.order, equals(firstItem.order));

      // Read-only filter test by status matching the fetched item
      final GetReceiptItemsParameters statusParams = GetReceiptItemsParameters()
        ..pageSize = 5;
      if (firstItem.status != null) {
        statusParams.status = firstItem.status;
      } else {
        statusParams.statusIsNull = true;
      }
      final MaybeError<GetReceiptItemsResult> statusFilterResult =
          await OpenPricesAPIClient.getReceiptItems(
            statusParams,
            uriHelper: uriHelper,
            bearerToken: bearerToken,
          );
      expect(statusFilterResult.isError, isFalse);
      if (statusFilterResult.value.items != null &&
          statusFilterResult.value.items!.isNotEmpty) {
        for (final ReceiptItem item in statusFilterResult.value.items!) {
          if (firstItem.status != null) {
            expect(item.status, equals(firstItem.status));
          } else {
            expect(item.status, isNull);
          }
        }
      }
    });

    test('getReceiptItems with parameters and order', () async {
      final MaybeError<GetReceiptItemsResult> listResult =
          await OpenPricesAPIClient.getReceiptItems(
            GetReceiptItemsParameters()
              ..pageSize = 2
              ..pageNumber = 1
              ..orderBy = [
                OrderBy(
                  field: GetReceiptItemsOrderField.created,
                  ascending: false,
                ),
              ],
            uriHelper: uriHelper,
            bearerToken: bearerToken,
          );
      expect(listResult.isError, isFalse);
      expect(listResult.value.items, isNotNull);
      expect(listResult.value.items!.length, lessThanOrEqualTo(2));
      expect(listResult.value.pageNumber, equals(1));
      expect(listResult.value.pageSize, equals(2));
    });

    test('getReceiptItem with unknown ID returns error', () async {
      final MaybeError<ReceiptItem> result =
          await OpenPricesAPIClient.getReceiptItem(
            999999999,
            uriHelper: uriHelper,
            bearerToken: bearerToken,
          );
      expect(result.isError, isTrue);
      expect(result.statusCode, equals(404));
    });
  });
}
