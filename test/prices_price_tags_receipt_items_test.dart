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
          OrderBy(field: GetPriceTagsOrderField.proofId, ascending: false),
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
      expect(queryParams['order_by'], equals('-created,id,-proof_id'));
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
          OrderBy(field: GetReceiptItemsOrderField.proofId, ascending: true),
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
      expect(queryParams['order_by'], equals('order,-created,proof_id'));
      expect(queryParams['created__gte'], equals('2025-02-01T00:00:00.000Z'));
      expect(queryParams['created__lte'], equals('2025-02-28T23:59:59.000Z'));
      expect(queryParams['proof__owner'], equals('owner1'));
      expect(queryParams['proof_id'], equals('789'));
      expect(queryParams['status'], equals('0'));
      expect(queryParams['status__isnull'], equals('true'));
    });

    test('DateTime created filters serialize as ISO 8601 string', () {
      final DateTime date = DateTime(2025, 1, 1, 12);

      final GetPriceTagsParameters priceTagParams = GetPriceTagsParameters()
        ..createdGte = date
        ..createdLte = date;
      expect(
        priceTagParams.getQueryParameters()['created__gte'],
        equals(date.toIso8601String()),
      );
      expect(
        priceTagParams.getQueryParameters()['created__lte'],
        equals(date.toIso8601String()),
      );

      final GetReceiptItemsParameters receiptParams =
          GetReceiptItemsParameters()
            ..createdGte = date
            ..createdLte = date;
      expect(
        receiptParams.getQueryParameters()['created__gte'],
        equals(date.toIso8601String()),
      );
      expect(
        receiptParams.getQueryParameters()['created__lte'],
        equals(date.toIso8601String()),
      );
    });
  });

  group('Proof and PriceTag unit tests', () {
    const UriProductHelper customUriHelper = UriProductHelper(
      domain: 'custom.openfoodfacts.net',
    );

    setUpAll(() {
      OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
    });

    test('Proof.getFileUrl returns exact URI without user-agent query or null', () {
      expect(OpenFoodAPIConfiguration.userAgent, isNotNull);

      final Proof emptyProof = Proof();
      expect(
        emptyProof.getFileUrl(
          uriProductHelper: customUriHelper,
          isThumbnail: false,
        ),
        isNull,
      );
      expect(
        emptyProof.getFileUrl(
          uriProductHelper: customUriHelper,
          isThumbnail: true,
        ),
        isNull,
      );

      final Proof proofWithOnlyFull = Proof()..filePath = 'proofs/42/full.webp';
      expect(
        proofWithOnlyFull.getFileUrl(
          uriProductHelper: customUriHelper,
          isThumbnail: true,
        ),
        isNull,
      );
      final Uri? fullUri = proofWithOnlyFull.getFileUrl(
        uriProductHelper: customUriHelper,
        isThumbnail: false,
      );
      expect(
        fullUri,
        equals(
          Uri.parse(
            'https://prices.custom.openfoodfacts.net/img/proofs/42/full.webp',
          ),
        ),
      );
      expect(fullUri!.hasQuery, isFalse);
      expect(fullUri.queryParameters, isEmpty);

      final Proof proofWithOnlyThumb = Proof()
        ..imageThumbPath = 'proofs/42/thumb.webp';
      expect(
        proofWithOnlyThumb.getFileUrl(
          uriProductHelper: customUriHelper,
          isThumbnail: false,
        ),
        isNull,
      );
      final Uri? thumbUri = proofWithOnlyThumb.getFileUrl(
        uriProductHelper: customUriHelper,
        isThumbnail: true,
      );
      expect(
        thumbUri,
        equals(
          Uri.parse(
            'https://prices.custom.openfoodfacts.net/img/proofs/42/thumb.webp',
          ),
        ),
      );
      expect(thumbUri!.hasQuery, isFalse);
      expect(thumbUri.queryParameters, isEmpty);
    });

    test(
      'PriceTag.getImageUrl returns exact URI without user-agent query or null',
      () {
        expect(OpenFoodAPIConfiguration.userAgent, isNotNull);

        final PriceTag tagWithoutImage = PriceTag();
        expect(
          tagWithoutImage.getImageUrl(uriProductHelper: customUriHelper),
          isNull,
        );

        final PriceTag tagWithImage = PriceTag()
          ..imagePath = 'price-tags/99/crop.jpg';
        final Uri? uri = tagWithImage.getImageUrl(
          uriProductHelper: customUriHelper,
        );
        expect(
          uri,
          equals(
            Uri.parse(
              'https://prices.custom.openfoodfacts.net/img/price-tags/99/crop.jpg',
            ),
          ),
        );
        expect(uri!.hasQuery, isFalse);
        expect(uri.queryParameters, isEmpty);
      },
    );

    test('Proof.getFileUrlFromPath returns exact URI without user-agent query or null', () {
      expect(
        Proof.getFileUrlFromPath(uriProductHelper: customUriHelper, path: null),
        isNull,
      );
      final Uri? uri = Proof.getFileUrlFromPath(
        uriProductHelper: customUriHelper,
        path: 'proofs/123/original.webp',
      );
      expect(
        uri,
        equals(
          Uri.parse(
            'https://prices.custom.openfoodfacts.net/img/proofs/123/original.webp',
          ),
        ),
      );
      expect(uri!.hasQuery, isFalse);
      expect(uri.queryParameters, isEmpty);
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

      final int? ascProofId = proofAscResult.value.items!.first.proof?.id;
      final int? descProofId = proofDescResult.value.items!.first.proof?.id;
      if (ascProofId != null && descProofId != null) {
        expect(ascProofId, lessThan(descProofId));
      }
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

      final int? ascProofId = proofAscResult.value.items!.first.proofId;
      final int? descProofId = proofDescResult.value.items!.first.proofId;
      if (ascProofId != null && descProofId != null) {
        expect(ascProofId, lessThan(descProofId));
      }
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
