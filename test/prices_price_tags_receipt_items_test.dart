import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

void main() {
  const UriProductHelper uriHelper = uriHelperFoodTest;
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;

  group('Live OpenPricesAPIClient PriceTags and ReceiptItems', () {
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
      expect(singleResult.value.proof, isNotNull);
      expect(firstTag.proof, isNotNull);
      final Proof proof = singleResult.value.proof!;
      expect(proof.id, equals(firstTag.proof!.id));
      expect(proof.mimetype, equals(firstTag.proof!.mimetype));
      expect(proof.owner, equals(firstTag.proof!.owner));
      expect(proof.priceCount, equals(firstTag.proof!.priceCount));

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
      expect(statusFilterResult.value.items, isNotNull);
      expect(statusFilterResult.value.items, isNotEmpty);
      for (final PriceTag item in statusFilterResult.value.items!) {
        if (firstTag.status != null) {
          expect(item.status, equals(firstTag.status));
        } else {
          expect(item.status, isNull);
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

      // Deterministic ID ascending and descending ordering
      final MaybeError<GetPriceTagsResult> idAscResult =
          await OpenPricesAPIClient.getPriceTags(
            GetPriceTagsParameters()
              ..pageSize = 3
              ..orderBy = [
                OrderBy(field: GetPriceTagsOrderField.id, ascending: true),
              ],
            uriHelper: uriHelper,
            bearerToken: bearerToken,
          );
      expect(idAscResult.isError, isFalse);
      expect(idAscResult.value.items, isNotNull);
      final List<PriceTag> ascItems = idAscResult.value.items!;
      expect(ascItems.length, greaterThanOrEqualTo(2));
      for (int i = 0; i < ascItems.length - 1; i++) {
        expect(ascItems[i].id!, lessThan(ascItems[i + 1].id!));
      }

      final MaybeError<GetPriceTagsResult> idDescResult =
          await OpenPricesAPIClient.getPriceTags(
            GetPriceTagsParameters()
              ..pageSize = 3
              ..orderBy = [
                OrderBy(field: GetPriceTagsOrderField.id, ascending: false),
              ],
            uriHelper: uriHelper,
            bearerToken: bearerToken,
          );
      expect(idDescResult.isError, isFalse);
      expect(idDescResult.value.items, isNotNull);
      final List<PriceTag> descItems = idDescResult.value.items!;
      expect(descItems.length, greaterThanOrEqualTo(2));
      for (int i = 0; i < descItems.length - 1; i++) {
        expect(descItems[i].id!, greaterThan(descItems[i + 1].id!));
      }
      expect(ascItems.first.id!, lessThan(descItems.first.id!));

      // proofId ordering
      final MaybeError<GetPriceTagsResult> proofAscResult =
          await OpenPricesAPIClient.getPriceTags(
            GetPriceTagsParameters()
              ..pageSize = 5
              ..orderBy = [
                OrderBy(field: GetPriceTagsOrderField.proofId, ascending: true),
              ],
            uriHelper: uriHelper,
            bearerToken: bearerToken,
          );
      expect(proofAscResult.isError, isFalse);
      expect(proofAscResult.value.items, isNotNull);
      expect(proofAscResult.value.items, isNotEmpty);

      final MaybeError<GetPriceTagsResult> proofDescResult =
          await OpenPricesAPIClient.getPriceTags(
            GetPriceTagsParameters()
              ..pageSize = 5
              ..orderBy = [
                OrderBy(
                  field: GetPriceTagsOrderField.proofId,
                  ascending: false,
                ),
              ],
            uriHelper: uriHelper,
            bearerToken: bearerToken,
          );
      expect(proofDescResult.isError, isFalse);
      expect(proofDescResult.value.items, isNotNull);
      expect(proofDescResult.value.items, isNotEmpty);

      final List<PriceTag> proofAscItems = proofAscResult.value.items!;
      final List<PriceTag> proofDescItems = proofDescResult.value.items!;
      for (int i = 1; i < proofAscItems.length; i++) {
        expect(
          proofAscItems[i - 1].proof!.id,
          lessThanOrEqualTo(proofAscItems[i].proof!.id),
        );
      }
      for (int i = 1; i < proofDescItems.length; i++) {
        expect(
          proofDescItems[i - 1].proof!.id,
          greaterThanOrEqualTo(proofDescItems[i].proof!.id),
        );
      }
    });

    test('getPriceTag with unknown ID returns error', () async {
      final MaybeError<PriceTag> result = await OpenPricesAPIClient.getPriceTag(
        -1,
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
      expect(singleResult.value.predictedData, equals(firstItem.predictedData));

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
      expect(statusFilterResult.value.items, isNotNull);
      expect(statusFilterResult.value.items, isNotEmpty);
      for (final ReceiptItem item in statusFilterResult.value.items!) {
        if (firstItem.status != null) {
          expect(item.status, equals(firstItem.status));
        } else {
          expect(item.status, isNull);
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

      // Deterministic ID ascending and descending ordering
      final MaybeError<GetReceiptItemsResult> idAscResult =
          await OpenPricesAPIClient.getReceiptItems(
            GetReceiptItemsParameters()
              ..pageSize = 3
              ..orderBy = [
                OrderBy(field: GetReceiptItemsOrderField.id, ascending: true),
              ],
            uriHelper: uriHelper,
            bearerToken: bearerToken,
          );
      expect(idAscResult.isError, isFalse);
      expect(idAscResult.value.items, isNotNull);
      final List<ReceiptItem> ascItems = idAscResult.value.items!;
      expect(ascItems.length, greaterThanOrEqualTo(2));
      for (int i = 0; i < ascItems.length - 1; i++) {
        expect(ascItems[i].id!, lessThan(ascItems[i + 1].id!));
      }

      final MaybeError<GetReceiptItemsResult> idDescResult =
          await OpenPricesAPIClient.getReceiptItems(
            GetReceiptItemsParameters()
              ..pageSize = 3
              ..orderBy = [
                OrderBy(field: GetReceiptItemsOrderField.id, ascending: false),
              ],
            uriHelper: uriHelper,
            bearerToken: bearerToken,
          );
      expect(idDescResult.isError, isFalse);
      expect(idDescResult.value.items, isNotNull);
      final List<ReceiptItem> descItems = idDescResult.value.items!;
      expect(descItems.length, greaterThanOrEqualTo(2));
      for (int i = 0; i < descItems.length - 1; i++) {
        expect(descItems[i].id!, greaterThan(descItems[i + 1].id!));
      }
      expect(ascItems.first.id!, lessThan(descItems.first.id!));

      // proofId ordering
      final MaybeError<GetReceiptItemsResult> proofAscResult =
          await OpenPricesAPIClient.getReceiptItems(
            GetReceiptItemsParameters()
              ..pageSize = 5
              ..orderBy = [
                OrderBy(
                  field: GetReceiptItemsOrderField.proofId,
                  ascending: true,
                ),
              ],
            uriHelper: uriHelper,
            bearerToken: bearerToken,
          );
      expect(proofAscResult.isError, isFalse);
      expect(proofAscResult.value.items, isNotNull);
      expect(proofAscResult.value.items, isNotEmpty);

      final MaybeError<GetReceiptItemsResult> proofDescResult =
          await OpenPricesAPIClient.getReceiptItems(
            GetReceiptItemsParameters()
              ..pageSize = 5
              ..orderBy = [
                OrderBy(
                  field: GetReceiptItemsOrderField.proofId,
                  ascending: false,
                ),
              ],
            uriHelper: uriHelper,
            bearerToken: bearerToken,
          );
      expect(proofDescResult.isError, isFalse);
      expect(proofDescResult.value.items, isNotNull);
      expect(proofDescResult.value.items, isNotEmpty);

      final List<ReceiptItem> proofAscItems = proofAscResult.value.items!;
      final List<ReceiptItem> proofDescItems = proofDescResult.value.items!;
      for (int i = 1; i < proofAscItems.length; i++) {
        expect(
          proofAscItems[i - 1].proofId!,
          lessThanOrEqualTo(proofAscItems[i].proofId!),
        );
      }
      for (int i = 1; i < proofDescItems.length; i++) {
        expect(
          proofDescItems[i - 1].proofId!,
          greaterThanOrEqualTo(proofDescItems[i].proofId!),
        );
      }
    });

    test('getReceiptItem with unknown ID returns error', () async {
      final MaybeError<ReceiptItem> result =
          await OpenPricesAPIClient.getReceiptItem(
            -1,
            uriHelper: uriHelper,
            bearerToken: bearerToken,
          );
      expect(result.isError, isTrue);
      expect(result.statusCode, equals(404));
    });
  });
}
