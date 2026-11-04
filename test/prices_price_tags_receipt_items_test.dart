import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

class _MockHttpHelper extends HttpHelper {
  _MockHttpHelper() : super.internal();

  Uri? lastUri;
  String? lastBearerToken;
  http.Response responseToReturn = http.Response('{}', 200);

  @override
  Future<http.Response> doGetRequest(
    Uri uri, {
    User? user,
    required UriHelper uriHelper,
    String? bearerToken,
    bool addCookiesToHeader = false,
    bool addCredentialsToHeader = false,
  }) async {
    lastUri = uri;
    lastBearerToken = bearerToken;
    return responseToReturn;
  }
}

void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;

  group('Offline serialization tests', () {
    test('PriceTag parsing and round-trip from fixture', () {
      final String jsonString = File(
        'test/test_assets/json/prices_price_tag_1.json',
      ).readAsStringSync();
      final Map<String, dynamic> jsonMap =
          jsonDecode(jsonString) as Map<String, dynamic>;

      final PriceTag priceTag = PriceTag.fromJson(jsonMap);

      expect(priceTag.id, equals(1));
      expect(priceTag.priceId, isNull);
      expect(priceTag.imagePath, equals('price-tags/000/000/000000001.webp'));
      expect(priceTag.boundingBox, hasLength(4));
      expect(priceTag.boundingBox![0], closeTo(0.0, 0.001));
      expect(priceTag.boundingBox![1], closeTo(0.0, 0.001));
      expect(priceTag.boundingBox![2], closeTo(0.7369, 0.001));
      expect(priceTag.boundingBox![3], closeTo(0.9874, 0.001));
      expect(priceTag.status, isNull);
      expect(priceTag.predictionCount, equals(1));
      expect(priceTag.createdBy, isNull);
      expect(priceTag.updatedBy, isNull);
      expect(priceTag.tags, isEmpty);
      expect(priceTag.created, isNotNull);
      expect(priceTag.created!.year, equals(2024));
      expect(priceTag.updated, isNotNull);
      expect(priceTag.proofPrediction, equals(14638));

      // Predictions
      expect(priceTag.predictions, isNotNull);
      expect(priceTag.predictions, hasLength(1));
      final PriceTagPrediction prediction = priceTag.predictions!.first;
      expect(
        prediction.type,
        equals(PriceTagPredictionType.priceTagExtraction),
      );
      expect(prediction.modelName, equals('gemini'));
      expect(prediction.modelVersion, equals('gemini-1.5-flash'));
      expect(prediction.schemaVersion, equals('1.0'));
      expect(prediction.data, isNotNull);
      expect(prediction.data!['product'], equals('en:cherries'));
      expect(prediction.data!['price'], equals(3.558));
      expect(prediction.data!['organic'], isFalse);
      expect(prediction.created, isNotNull);

      // Proof
      expect(priceTag.proof, isNotNull);
      final ProofHalf proof = priceTag.proof!;
      expect(proof.id, equals(13117));
      expect(proof.locationId, equals(1430));
      expect(proof.location, isNotNull);
      expect(proof.location!.name, equals('Lidl'));
      expect(proof.location!.city, equals('Budapest'));
      expect(proof.filePath, equals('0017/EpvOksM9yQ.jpg'));
      expect(proof.mimetype, equals('image/jpeg'));
      expect(proof.type, equals(ProofType.priceTag));
      expect(proof.imageMd5Hash, equals('86bbae5eef18dfdd3ee8263c84d19c51'));
      expect(proof.imageThumbPath, equals('0017/EpvOksM9yQ.400.jpg'));
      expect(proof.locationOSMId, equals(675544912));
      expect(proof.locationOSMType, equals(LocationOSMType.way));
      expect(proof.date, isNotNull);
      expect(proof.currency, equals(Currency.HUF));
      expect(proof.receiptPriceCount, isNull);
      expect(proof.readyForPriceTagValidation, isFalse);
      expect(proof.draft, isFalse);
      expect(proof.priceCount, equals(1));
      expect(proof.predictionCount, equals(2));
      expect(proof.owner, equals('bathorypeter'));
      expect(proof.source, startsWith('Smoothie'));

      // Helper URLs
      final Uri? imageUrl = priceTag.getImageUrl(
        uriProductHelper: uriHelperFoodProd,
      );
      expect(imageUrl, isNotNull);
      expect(
        imageUrl!.toString(),
        contains('img/price-tags/000/000/000000001.webp'),
      );

      final Uri? proofUrl = proof.getFileUrl(
        uriProductHelper: uriHelperFoodProd,
      );
      expect(proofUrl, isNotNull);
      expect(proofUrl!.toString(), contains('img/0017/EpvOksM9yQ.jpg'));

      final Uri? thumbUrl = proof.getFileUrl(
        uriProductHelper: uriHelperFoodProd,
        isThumbnail: true,
      );
      expect(thumbUrl, isNotNull);
      expect(thumbUrl!.toString(), contains('img/0017/EpvOksM9yQ.400.jpg'));

      // Round-trip toJson / fromJson
      final Map<String, dynamic> serialized =
          jsonDecode(jsonEncode(priceTag.toJson())) as Map<String, dynamic>;
      final PriceTag deserialized = PriceTag.fromJson(serialized);
      expect(deserialized.id, equals(priceTag.id));
      expect(deserialized.imagePath, equals(priceTag.imagePath));
      expect(deserialized.proof?.id, equals(priceTag.proof?.id));
      expect(
        deserialized.predictions?.first.type,
        equals(priceTag.predictions?.first.type),
      );
    });

    test('GetPriceTagsResult parsing from fixture', () {
      final String jsonString = File(
        'test/test_assets/json/prices_price_tags.json',
      ).readAsStringSync();
      final Map<String, dynamic> jsonMap =
          jsonDecode(jsonString) as Map<String, dynamic>;

      final GetPriceTagsResult result = GetPriceTagsResult.fromJson(jsonMap);

      expect(result.pageNumber, equals(1));
      expect(result.numberOfPages, equals(1531));
      expect(result.pageSize, equals(2));
      expect(result.total, equals(3062));
      expect(result.items, hasLength(2));

      // First item status is null
      expect(result.items![0].id, equals(1));
      expect(result.items![0].status, isNull);

      // Second item status is linkedToPrice (1)
      expect(result.items![1].id, equals(2));
      expect(result.items![1].priceId, equals(31516));
      expect(result.items![1].status, equals(PriceTagStatus.linkedToPrice));
      expect(result.items![1].status!.code, equals(1));
      expect(result.items![1].status!.offTag, equals('1'));

      // Round-trip
      final Map<String, dynamic> serialized =
          jsonDecode(jsonEncode(result.toJson())) as Map<String, dynamic>;
      final GetPriceTagsResult deserialized = GetPriceTagsResult.fromJson(
        serialized,
      );
      expect(deserialized.total, equals(result.total));
      expect(deserialized.items, hasLength(2));
      expect(
        deserialized.items![1].status,
        equals(PriceTagStatus.linkedToPrice),
      );
    });

    test('ReceiptItem parsing and round-trip from fixture', () {
      final String jsonString = File(
        'test/test_assets/json/prices_receipt_item_6520.json',
      ).readAsStringSync();
      final Map<String, dynamic> jsonMap =
          jsonDecode(jsonString) as Map<String, dynamic>;

      final ReceiptItem item = ReceiptItem.fromJson(jsonMap);

      expect(item.id, equals(6520));
      expect(item.proofId, equals(28961));
      expect(item.priceId, equals(96248));
      expect(item.order, equals(0));
      expect(item.predictedData, isEmpty);
      expect(item.status, equals(ReceiptItemStatus.linkedToPrice));
      expect(item.status!.code, equals(1));
      expect(item.status!.offTag, equals('1'));
      expect(item.schemaVersion, equals('1.0'));
      expect(item.created, isNotNull);
      expect(item.updated, isNotNull);
      expect(item.proofPrediction, isNull);

      // Round-trip
      final Map<String, dynamic> serialized =
          jsonDecode(jsonEncode(item.toJson())) as Map<String, dynamic>;
      final ReceiptItem deserialized = ReceiptItem.fromJson(serialized);
      expect(deserialized.id, equals(item.id));
      expect(deserialized.proofId, equals(item.proofId));
      expect(deserialized.priceId, equals(item.priceId));
      expect(deserialized.status, equals(item.status));
    });

    test('GetReceiptItemsResult parsing from fixture', () {
      final String jsonString = File(
        'test/test_assets/json/prices_receipt_items.json',
      ).readAsStringSync();
      final Map<String, dynamic> jsonMap =
          jsonDecode(jsonString) as Map<String, dynamic>;

      final GetReceiptItemsResult result = GetReceiptItemsResult.fromJson(
        jsonMap,
      );

      expect(result.pageNumber, equals(1));
      expect(result.numberOfPages, equals(101630));
      expect(result.pageSize, equals(2));
      expect(result.total, equals(203260));
      expect(result.items, hasLength(2));

      // First item
      expect(result.items![0].id, equals(6520));
      expect(result.items![0].status, equals(ReceiptItemStatus.linkedToPrice));

      // Second item (unlinked, null price_id, null status, populated predictedData)
      expect(result.items![1].id, equals(6463));
      expect(result.items![1].priceId, isNull);
      expect(result.items![1].status, isNull);
      expect(result.items![1].predictedData, isNotNull);
      expect(result.items![1].predictedData!['price'], equals(2.21));
      expect(
        result.items![1].predictedData!['product_name'],
        equals('V.BOVINE 1 STE'),
      );
      expect(result.items![1].proofPrediction, equals(54701));

      // Round-trip
      final Map<String, dynamic> serialized =
          jsonDecode(jsonEncode(result.toJson())) as Map<String, dynamic>;
      final GetReceiptItemsResult deserialized = GetReceiptItemsResult.fromJson(
        serialized,
      );
      expect(deserialized.total, equals(result.total));
      expect(deserialized.items, hasLength(2));
      expect(deserialized.items![1].priceId, isNull);
    });

    test(
      'Enums: PriceTagStatus, PriceTagPredictionType, ReceiptItemStatus',
      () {
        expect(PriceTagStatus.fromOffTag('0'), equals(PriceTagStatus.deleted));
        expect(
          PriceTagStatus.fromOffTag('1'),
          equals(PriceTagStatus.linkedToPrice),
        );
        expect(
          PriceTagStatus.fromOffTag('2'),
          equals(PriceTagStatus.notReadable),
        );
        expect(
          PriceTagStatus.fromOffTag('3'),
          equals(PriceTagStatus.truncated),
        );
        expect(
          PriceTagStatus.fromOffTag('4'),
          equals(PriceTagStatus.notPriceTag),
        );
        expect(
          PriceTagStatus.fromOffTag('5'),
          equals(PriceTagStatus.noBarcode),
        );
        expect(PriceTagStatus.fromOffTag('10'), equals(PriceTagStatus.other));
        expect(PriceTagStatus.fromOffTag('invalid'), isNull);
        expect(PriceTagStatus.fromOffTag(null), isNull);

        expect(
          PriceTagPredictionType.fromOffTag('PRICE_TAG_EXTRACTION'),
          equals(PriceTagPredictionType.priceTagExtraction),
        );
        expect(
          PriceTagPredictionType.fromOffTag('PRICE_TAG_CLF'),
          equals(PriceTagPredictionType.priceTagClf),
        );
        expect(PriceTagPredictionType.fromOffTag('UNKNOWN'), isNull);
        expect(PriceTagPredictionType.fromOffTag(null), isNull);

        expect(
          ReceiptItemStatus.fromOffTag('0'),
          equals(ReceiptItemStatus.deleted),
        );
        expect(
          ReceiptItemStatus.fromOffTag('1'),
          equals(ReceiptItemStatus.linkedToPrice),
        );
        expect(ReceiptItemStatus.fromOffTag('invalid'), isNull);
        expect(ReceiptItemStatus.fromOffTag(null), isNull);
      },
    );
  });

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
        ..status = PriceTagStatus.linkedToPrice
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
        ..status = ReceiptItemStatus.deleted
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
  });

  group('Offline client methods tests', () {
    late _MockHttpHelper mockHttpHelper;

    setUp(() {
      mockHttpHelper = _MockHttpHelper();
      HttpHelper.instance = mockHttpHelper;
    });

    tearDown(() {
      HttpHelper.instance = HttpHelper.internal();
    });

    test('getPriceTags - 200 success', () async {
      final String fixture = File(
        'test/test_assets/json/prices_price_tags.json',
      ).readAsStringSync();
      mockHttpHelper.responseToReturn = http.Response.bytes(
        utf8.encode(fixture),
        200,
        headers: {'content-type': 'application/json; charset=utf-8'},
      );

      final MaybeError<GetPriceTagsResult> result =
          await OpenPricesAPIClient.getPriceTags(
            GetPriceTagsParameters()..pageSize = 10,
          );

      expect(result.isError, isFalse);
      expect(result.value.items, hasLength(2));
      expect(mockHttpHelper.lastUri?.path, contains('price-tags'));
      expect(mockHttpHelper.lastUri?.queryParameters['size'], equals('10'));
    });

    test('getPriceTags - non-200 error', () async {
      mockHttpHelper.responseToReturn = http.Response(
        '{"detail":"Not found"}',
        404,
      );

      final MaybeError<GetPriceTagsResult> result =
          await OpenPricesAPIClient.getPriceTags(GetPriceTagsParameters());

      expect(result.isError, isTrue);
      expect(result.statusCode, equals(404));
      expect(result.detailError, equals('Not found'));
    });

    test('getPriceTag - 200 success', () async {
      final String fixture = File(
        'test/test_assets/json/prices_price_tag_1.json',
      ).readAsStringSync();
      mockHttpHelper.responseToReturn = http.Response.bytes(
        utf8.encode(fixture),
        200,
        headers: {'content-type': 'application/json; charset=utf-8'},
      );

      final MaybeError<PriceTag> result = await OpenPricesAPIClient.getPriceTag(
        1,
      );

      expect(result.isError, isFalse);
      expect(result.value.id, equals(1));
      expect(mockHttpHelper.lastUri?.path, contains('price-tags/1'));
    });

    test('getPriceTag - non-200 error', () async {
      mockHttpHelper.responseToReturn = http.Response('Internal error', 500);

      final MaybeError<PriceTag> result = await OpenPricesAPIClient.getPriceTag(
        99999,
      );

      expect(result.isError, isTrue);
      expect(result.statusCode, equals(500));
    });

    test('getReceiptItems - 200 success', () async {
      final String fixture = File(
        'test/test_assets/json/prices_receipt_items.json',
      ).readAsStringSync();
      mockHttpHelper.responseToReturn = http.Response.bytes(
        utf8.encode(fixture),
        200,
        headers: {'content-type': 'application/json; charset=utf-8'},
      );

      final MaybeError<GetReceiptItemsResult> result =
          await OpenPricesAPIClient.getReceiptItems(
            GetReceiptItemsParameters()..proofId = 28961,
          );

      expect(result.isError, isFalse);
      expect(result.value.items, hasLength(2));
      expect(mockHttpHelper.lastUri?.path, contains('receipt-items'));
      expect(
        mockHttpHelper.lastUri?.queryParameters['proof_id'],
        equals('28961'),
      );
    });

    test('getReceiptItems - non-200 error', () async {
      mockHttpHelper.responseToReturn = http.Response('Unauthorized', 401);

      final MaybeError<GetReceiptItemsResult> result =
          await OpenPricesAPIClient.getReceiptItems(
            GetReceiptItemsParameters(),
          );

      expect(result.isError, isTrue);
      expect(result.statusCode, equals(401));
    });

    test('getReceiptItem - 200 success', () async {
      final String fixture = File(
        'test/test_assets/json/prices_receipt_item_6520.json',
      ).readAsStringSync();
      mockHttpHelper.responseToReturn = http.Response.bytes(
        utf8.encode(fixture),
        200,
        headers: {'content-type': 'application/json; charset=utf-8'},
      );

      final MaybeError<ReceiptItem> result =
          await OpenPricesAPIClient.getReceiptItem(6520);

      expect(result.isError, isFalse);
      expect(result.value.id, equals(6520));
      expect(mockHttpHelper.lastUri?.path, contains('receipt-items/6520'));
    });

    test('getReceiptItem - non-200 error', () async {
      mockHttpHelper.responseToReturn = http.Response('Not found', 404);

      final MaybeError<ReceiptItem> result =
          await OpenPricesAPIClient.getReceiptItem(99999);

      expect(result.isError, isTrue);
      expect(result.statusCode, equals(404));
    });
  });
}
