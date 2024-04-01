import 'package:http_parser/http_parser.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';
import 'test_constants.dart';

void main() {
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  const UriProductHelper uriHelper = uriHelperFoodTest;
  const User user = TestConstants.TEST_USER;
  const String invalidBearerToken = 'invalid bearer token';

  group('$OpenPricesAPIClient default', () {
    test('getStatus', () async {
      final MaybeError<String> status = await OpenPricesAPIClient.getStatus(
        uriHelper: uriHelper,
      );
      expect(status.isError, isFalse);
      expect(status.value, OpenPricesAPIClient.statusRunning);
    });
  });

  group('$OpenPricesAPIClient Auth', () {
    test('unknown user', () async {
      final MaybeError<String> status =
          await OpenPricesAPIClient.getAuthenticationToken(
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
          await OpenPricesAPIClient.getAuthenticationToken(
        username: user.userId,
        password: user.password,
        uriHelper: uriHelper,
      );
      expect(token.isError, isFalse);
      expect(token.value, isNotEmpty);
      final String bearerToken = token.value;

      MaybeError<Session> session = await OpenPricesAPIClient.getUserSession(
        uriHelper: uriHelper,
        bearerToken: bearerToken,
      );
      expect(session.isError, isFalse);
      expect(session.value.userId, user.userId);

      MaybeError<bool> deleting = await OpenPricesAPIClient.deleteUserSession(
        uriHelper: uriHelper,
        bearerToken: bearerToken,
      );
      expect(deleting.isError, isFalse);
      expect(deleting.value, isTrue);

      deleting = await OpenPricesAPIClient.deleteUserSession(
        uriHelper: uriHelper,
        bearerToken: bearerToken,
      );
      expect(deleting.isError, isTrue);
      expect(deleting.statusCode, Session.invalidAuthStatusCode);
      expect(deleting.detailError, Session.invalidAuthMessage);

      session = await OpenPricesAPIClient.getUserSession(
        uriHelper: uriHelper,
        bearerToken: bearerToken,
      );
      expect(session.isError, isTrue);
      expect(session.statusCode, Session.invalidAuthStatusCode);
      expect(session.detailError, Session.invalidAuthMessage);
    });
  });

  group('$OpenPricesAPIClient Prices', () {
    test('create', () async {
      final Price initialPrice = Price()
        ..productCode = '3560071492755'
        ..price = 3.99
        ..currency = Currency.EUR
        ..locationOSMId = 4966187139
        ..locationOSMType = LocationOSMType.node
        ..date = DateTime(2024, 1, 18);
      //,"proof_id":1663,"product_id":null,"location_id":null

      String bearerToken = invalidBearerToken;

      // failing price creation with invalid token
      MaybeError<Price> addedPrice = await OpenPricesAPIClient.createPrice(
        price: initialPrice,
        bearerToken: bearerToken,
        uriHelper: uriHelper,
      );
      expect(addedPrice.isError, isTrue);
      expect(addedPrice.statusCode, Session.invalidAuthStatusCode);
      expect(addedPrice.detailError, Session.invalidAuthMessage);

      // authentication
      final MaybeError<String> token =
          await OpenPricesAPIClient.getAuthenticationToken(
        username: user.userId,
        password: user.password,
        uriHelper: uriHelper,
      );
      expect(token.isError, isFalse);
      expect(token.value, isNotEmpty);
      bearerToken = token.value;

      // successful price creation with valid token
      addedPrice = await OpenPricesAPIClient.createPrice(
        price: initialPrice,
        bearerToken: bearerToken,
        uriHelper: uriHelper,
      );
      expect(addedPrice.isError, isFalse);
      expect(addedPrice.value.productCode, initialPrice.productCode);
      expect(addedPrice.value.price, initialPrice.price);
      expect(addedPrice.value.currency, initialPrice.currency);
      expect(addedPrice.value.locationOSMId, initialPrice.locationOSMId);
      expect(addedPrice.value.locationOSMType, initialPrice.locationOSMType);
      expect(addedPrice.value.date, initialPrice.date);
      expect(addedPrice.value.owner, user.userId);

      final int priceId = addedPrice.value.id;

      // delete price first time: success
      MaybeError<bool> deleted = await OpenPricesAPIClient.deletePrice(
        priceId: priceId,
        bearerToken: bearerToken,
        uriHelper: uriHelper,
      );
      expect(deleted.isError, isFalse);
      expect(deleted.value, isTrue);

      // delete price second time: failure
      deleted = await OpenPricesAPIClient.deletePrice(
        priceId: priceId,
        bearerToken: bearerToken,
        uriHelper: uriHelper,
      );
      expect(deleted.isError, isTrue);
      expect(deleted.statusCode, 404);
      expect(deleted.detailError, 'Price with code $priceId not found');

      // close session
      final MaybeError<bool> closedSession =
          await OpenPricesAPIClient.deleteUserSession(
        uriHelper: uriHelper,
        bearerToken: bearerToken,
      );
      expect(closedSession.isError, isFalse);
      expect(closedSession.value, isTrue);
    });

    test('get prices', () async {
      const int pageNumber = 1;
      const int pageSize = 20;

      late GetPricesResult result;

      // oldest first
      GetPricesParameters parameters = GetPricesParameters()
        ..orderBy = <OrderBy<GetPricesOrderField>>[
          OrderBy(field: GetPricesOrderField.created, ascending: true),
        ]
        ..pageSize = pageSize
        ..pageNumber = pageNumber;
      MaybeError<GetPricesResult> maybeResults;
      try {
        maybeResults = await OpenPricesAPIClient.getPrices(
          parameters,
          uriHelper: uriHelper,
        );
      } catch (e) {
        if (e.toString().contains(TestConstants.badGatewayError)) {
          return;
        }
        rethrow;
      }
      expect(maybeResults.isError, isFalse);
      result = maybeResults.value;
      expect(result.pageSize, pageSize);
      expect(result.pageNumber, pageNumber);
      expect(result.total, isNotNull);
      expect(result.numberOfPages, (result.total! / result.pageSize!).ceil());
      expect(result.items, isNotNull);
      expect(result.items, hasLength(pageSize));
      for (final Price price in result.items!) {
        if (price.productCode == null) {
          expect(price.categoryTag, isNotNull);
        } else {
          expect(price.categoryTag, isNull);
        }
        expect(price.price, greaterThan(0));
        expect(price.locationOSMId, greaterThan(0));
        expect(price.currency, isNotNull);
        expect(price.price, isNotNull);
      }
      final DateTime oldestDate = result.items!.first.created;

      // newest first
      parameters = GetPricesParameters()
        ..orderBy = <OrderBy<GetPricesOrderField>>[
          OrderBy(field: GetPricesOrderField.created, ascending: false),
        ]
        ..pageSize = pageSize
        ..pageNumber = pageNumber;
      try {
        maybeResults = await OpenPricesAPIClient.getPrices(
          parameters,
          uriHelper: uriHelper,
        );
      } catch (e) {
        if (e.toString().contains(TestConstants.badGatewayError)) {
          return;
        }
        rethrow;
      }
      expect(maybeResults.isError, isFalse);
      result = maybeResults.value;
      expect(result.pageSize, pageSize);
      expect(result.pageNumber, pageNumber);
      expect(result.total, isNotNull);
      expect(result.numberOfPages, (result.total! / result.pageSize!).ceil());
      expect(result.items, isNotNull);
      expect(result.items, hasLength(pageSize));
      for (final Price price in result.items!) {
        if (price.productCode == null) {
          expect(price.categoryTag, isNotNull);
        } else {
          expect(price.categoryTag, isNull);
        }
        expect(price.price, greaterThan(0));
        expect(price.locationOSMId, greaterThan(0));
        expect(price.currency, isNotNull);
        expect(price.price, isNotNull);
      }
      final DateTime newestDate = result.items!.first.created;

      expect(
        newestDate.millisecondsSinceEpoch,
        greaterThan(oldestDate.millisecondsSinceEpoch),
      );

      // Trying to get the same single result, from an item.
      final Price price = result.items!.first;
      parameters = GetPricesParameters()
        ..productCode = price.productCode
        ..productId = price.productId
        ..productIdIsNull = price.productId == null
        ..categoryTag = price.categoryTag
        ..labelsTagsLike = price.labelsTags?.join(', ')
        ..originsTagsLike = price.originsTags?.join(', ')
        ..locationOSMId = price.locationOSMId
        ..locationOSMType = price.locationOSMType
        ..locationId = price.locationId
        ..currency = price.currency
        ..date = price.date
        ..dateGt = null
        ..dateGte = price.date
        ..dateLt = null
        ..dateLte = price.date
        ..owner = price.owner
        ..createdGte = price.created
        ..orderBy = null
        ..pageNumber = pageNumber
        ..pageSize = pageSize;
      maybeResults = await OpenPricesAPIClient.getPrices(
        parameters,
        uriHelper: uriHelper,
      );
      expect(maybeResults.isError, isFalse);
      result = maybeResults.value;
      expect(result.total, 1);
      expect(result.items, isNotNull);
      expect(result.items, hasLength(1));
    });
  });

  group('$OpenPricesAPIClient Locations', () {
    test('get existing location', () async {
      const int locationId = 1;
      final MaybeError<Location> maybeLocation =
          await OpenPricesAPIClient.getLocation(
        locationId,
        uriHelper: uriHelper,
      );
      expect(maybeLocation.isError, isFalse);
      final Location location = maybeLocation.value;
      expect(location.locationId, locationId);
      expect(location.osmId, greaterThan(0));
      expect(location.type, isNotNull);

      final MaybeError<Location> maybeSameOSMLocation =
          await OpenPricesAPIClient.getOSMLocation(
        locationOSMType: location.type,
        locationOSMId: location.osmId,
        uriHelper: uriHelper,
      );
      expect(maybeSameOSMLocation.isError, isFalse);
      final Location sameOSMLocation = maybeSameOSMLocation.value;
      expect(sameOSMLocation.locationId, location.locationId);
      expect(sameOSMLocation.osmId, location.osmId);
      expect(sameOSMLocation.type, location.type);
    });

    test('get non-existing location', () async {
      const int locationId = -1;
      final MaybeError<Location> location =
          await OpenPricesAPIClient.getLocation(
        locationId,
        uriHelper: uriHelper,
      );
      expect(location.isError, isTrue);
      expect(
        location.detailError,
        'Location with id $locationId not found',
      );
    });

    test('get non-existing OSM location', () async {
      const int locationOSMId = -1;
      const LocationOSMType locationOSMType = LocationOSMType.way;
      final MaybeError<Location> location =
          await OpenPricesAPIClient.getOSMLocation(
        locationOSMId: locationOSMId,
        locationOSMType: LocationOSMType.way,
        uriHelper: uriHelper,
      );
      expect(location.isError, isTrue);
      expect(
        location.detailError,
        'Location with type ${locationOSMType.offTag} & id $locationOSMId not found',
      );
    });

    test('get locations', () async {
      const int pageNumber = 1;
      const int pageSize = 20;

      late GetLocationsResult result;

      // oldest first
      GetLocationsParameters parameters = GetLocationsParameters()
        ..orderBy = <OrderBy<GetLocationsOrderField>>[
          OrderBy(field: GetLocationsOrderField.created, ascending: true),
        ]
        ..pageSize = pageSize
        ..pageNumber = pageNumber;
      MaybeError<GetLocationsResult> maybeResults;
      try {
        maybeResults = await OpenPricesAPIClient.getLocations(
          parameters,
          uriHelper: uriHelper,
        );
      } catch (e) {
        if (e.toString().contains(TestConstants.badGatewayError)) {
          return;
        }
        rethrow;
      }
      expect(maybeResults.isError, isFalse);
      result = maybeResults.value;
      expect(result.pageSize, pageSize);
      expect(result.pageNumber, pageNumber);
      expect(result.total, isNotNull);
      expect(result.numberOfPages, (result.total! / result.pageSize!).ceil());
      expect(result.items, isNotNull);
      expect(result.items, hasLength(pageSize));
      final DateTime oldestDate = result.items!.first.created;

      // newest first
      parameters = GetLocationsParameters()
        ..orderBy = <OrderBy<GetLocationsOrderField>>[
          OrderBy(field: GetLocationsOrderField.created, ascending: false),
        ]
        ..pageSize = pageSize
        ..pageNumber = pageNumber;
      try {
        maybeResults = await OpenPricesAPIClient.getLocations(
          parameters,
          uriHelper: uriHelper,
        );
      } catch (e) {
        if (e.toString().contains(TestConstants.badGatewayError)) {
          return;
        }
        rethrow;
      }
      expect(maybeResults.isError, isFalse);
      result = maybeResults.value;
      expect(result.pageSize, pageSize);
      expect(result.pageNumber, pageNumber);
      expect(result.total, isNotNull);
      expect(result.numberOfPages, (result.total! / result.pageSize!).ceil());
      expect(result.items, isNotNull);
      expect(result.items, hasLength(pageSize));
      final DateTime newestDate = result.items!.first.created;

      expect(
        newestDate.millisecondsSinceEpoch,
        greaterThan(oldestDate.millisecondsSinceEpoch),
      );

      parameters = GetLocationsParameters()
        ..osmNameLike = 'Monoprix'
        ..osmCityLike = 'Grenoble'
        ..osmPostcodeLike = '38000'
        ..osmCountryLike = 'France';
      maybeResults = await OpenPricesAPIClient.getLocations(
        parameters,
        uriHelper: uriHelper,
      );
      expect(maybeResults.isError, isFalse);
      result = maybeResults.value;
      expect(result.total, greaterThanOrEqualTo(1));
      expect(result.items, isNotNull);

      const String city = 'Grenoble';
      parameters = GetLocationsParameters()..osmCityLike = city;
      maybeResults = await OpenPricesAPIClient.getLocations(
        parameters,
        uriHelper: uriHelper,
      );
      expect(maybeResults.isError, isFalse);
      result = maybeResults.value;
      expect(result.total, greaterThanOrEqualTo(1));
      expect(result.items, isNotNull);
    });
  });

  group('$OpenPricesAPIClient Products', () {
    test('get existing product by ID', () async {
      const int productId = 1;
      final MaybeError<PriceProduct> maybePriceProduct =
          await OpenPricesAPIClient.getPriceProductById(
        productId,
        uriHelper: uriHelper,
      );
      expect(maybePriceProduct.isError, isFalse);
      final PriceProduct priceProduct = maybePriceProduct.value;
      expect(priceProduct.productId, productId);
      expect(priceProduct.code.length, greaterThanOrEqualTo(1));
      expect(priceProduct.created, isNotNull);
    });

    test('get non-existing product by ID', () async {
      const int productId = -1;
      final MaybeError<PriceProduct> maybePriceProduct =
          await OpenPricesAPIClient.getPriceProductById(
        productId,
        uriHelper: uriHelper,
      );
      expect(maybePriceProduct.isError, isTrue);
      expect(
        maybePriceProduct.detailError,
        'Product with id $productId not found',
      );
    });

    test('get existing product by CODE', () async {
      const String productCode = '3760121210609';
      final MaybeError<PriceProduct> maybePriceProduct =
          await OpenPricesAPIClient.getPriceProductByCode(
        productCode,
        uriHelper: uriHelper,
      );
      expect(maybePriceProduct.isError, isFalse);
      final PriceProduct priceProduct = maybePriceProduct.value;
      expect(priceProduct.code, productCode);
      expect(priceProduct.created, isNotNull);
    });

    test('get non-existing product by CODE', () async {
      const String productCode = 'not a code';
      final MaybeError<PriceProduct> maybePriceProduct =
          await OpenPricesAPIClient.getPriceProductByCode(
        productCode,
        uriHelper: uriHelper,
      );
      expect(maybePriceProduct.isError, isTrue);
      expect(
        maybePriceProduct.detailError,
        'Product with code $productCode not found',
      );
    });
  });

  group('$OpenPricesAPIClient Proofs', () {
    test('image file media type', () async {
      final Map<String, MediaType> expectedMediaTypes = <String, MediaType>{
        'toto.jpeg': MediaType('image', 'jpeg'),
        'toto.jpg': MediaType('image', 'jpeg'),
        'toto.png': MediaType('image', 'png'),
        'toto.webp': MediaType('image', 'webp'),
      };
      for (final String filename in expectedMediaTypes.keys) {
        expect(
          HttpHelper().imagineMediaType(filename).toString(),
          expectedMediaTypes[filename].toString(),
        );
      }
    });

    test('upload', () async {
      final ProofType initialProofType = ProofType.receipt;
      final bool initialIsPublic = true;
      // TODO(monsieurtanuki): more relevant image if possible
      final Uri initialImageUri =
          Uri.file('test/test_assets/ingredients_en.jpg');
      final MediaType initialMediaType =
          HttpHelper().imagineMediaType(initialImageUri.path)!;

      String bearerToken = invalidBearerToken;

      // failing proof upload with invalid token
      MaybeError<Proof> uploadProof = await OpenPricesAPIClient.uploadProof(
        proofType: initialProofType,
        isPublic: initialIsPublic,
        imageUri: initialImageUri,
        mediaType: initialMediaType,
        bearerToken: bearerToken,
        uriHelper: uriHelper,
      );
      expect(uploadProof.isError, isTrue);
      expect(uploadProof.statusCode, Session.invalidAuthStatusCode);
      expect(uploadProof.detailError, Session.invalidAuthMessage);

      // authentication
      final MaybeError<String> token =
          await OpenPricesAPIClient.getAuthenticationToken(
        username: user.userId,
        password: user.password,
        uriHelper: uriHelper,
      );
      expect(token.isError, isFalse);
      expect(token.value, isNotEmpty);
      bearerToken = token.value;

      // successful proof upload with valid token
      uploadProof = await OpenPricesAPIClient.uploadProof(
        proofType: initialProofType,
        isPublic: initialIsPublic,
        imageUri: initialImageUri,
        mediaType: initialMediaType,
        bearerToken: bearerToken,
        uriHelper: uriHelper,
      );
      expect(uploadProof.isError, isFalse);
      expect(uploadProof.value.type, initialProofType);
      expect(uploadProof.value.owner, user.userId);
      expect(uploadProof.value.id, isNotNull);
      expect(uploadProof.value.priceCount, 0);
      expect(uploadProof.value.isPublic, initialIsPublic);
      expect(uploadProof.value.mimetype, initialMediaType.toString());

      final int proofId = uploadProof.value.id;

      // delete proof first time: success
      MaybeError<bool> deleted = await OpenPricesAPIClient.deleteProof(
        proofId: proofId,
        bearerToken: bearerToken,
        uriHelper: uriHelper,
      );
      expect(deleted.isError, isFalse);
      expect(deleted.value, isTrue);

      // delete proof second time: failure
      deleted = await OpenPricesAPIClient.deleteProof(
        proofId: proofId,
        bearerToken: bearerToken,
        uriHelper: uriHelper,
      );
      expect(deleted.isError, isTrue);
      expect(deleted.statusCode, 404);
      expect(deleted.detailError, 'Proof with code $proofId not found');

      // close session
      final MaybeError<bool> closedSession =
          await OpenPricesAPIClient.deleteUserSession(
        uriHelper: uriHelper,
        bearerToken: bearerToken,
      );
      expect(closedSession.isError, isFalse);
      expect(closedSession.value, isTrue);
    });
  });
}
