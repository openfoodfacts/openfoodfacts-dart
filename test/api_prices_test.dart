import 'package:http/http.dart' as http;

import 'package:http_parser/http_parser.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';
import 'test_constants.dart';

void main() {
  const User user = TestConstants.TEST_USER;
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  const int HTTP_OK = 200;
  const int pageNumber = 1;
  const int pageSize = 20;

  // TODO(monsieurtanuki): more relevant image if possible
  final Uri initialImageUri = Uri.file('test/test_assets/ingredients_en.jpg');
  final MediaType initialMediaType = HttpHelper().imagineMediaType(
    initialImageUri.path,
  )!;

  Future<String> getBearerToken({
    required final UriProductHelper uriHelper,
  }) async {
    final MaybeError<String> token =
        await OpenPricesAPIClient.getAuthenticationToken(
          username: user.userId,
          password: user.password,
          uriHelper: uriHelper,
        );
    expect(token.isError, isFalse);
    expect(token.value, isNotEmpty);
    return token.value;
  }

  Future<void> closeSession({
    required final String bearerToken,
    required final UriProductHelper uriHelper,
  }) async {
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
    expect(deleting.statusCode, Session.invalidActionWithAuthStatusCode);
    expect(
      deleting.detailError,
      contains(Session.invalidActionWithAuthMessage),
    );
  }

  Future<void> deleteProofAndCloseSession({
    required final int proofId,
    required final String bearerToken,
    required final UriProductHelper uriHelper,
  }) async {
    final MaybeError<Proof> getProof = await OpenPricesAPIClient.getProof(
      proofId,
      bearerToken: bearerToken,
      uriHelper: uriHelper,
    );
    expect(getProof.isError, isFalse);
    expect(getProof.value.id, proofId);
    expect(getProof.value.owner, user.userId);

    // delete proof first time: success
    MaybeError<bool> deletedProof = await OpenPricesAPIClient.deleteProof(
      proofId: proofId,
      bearerToken: bearerToken,
      uriHelper: uriHelper,
    );
    expect(deletedProof.isError, isFalse);
    expect(deletedProof.value, isTrue);

    // delete proof second time: failure
    deletedProof = await OpenPricesAPIClient.deleteProof(
      proofId: proofId,
      bearerToken: bearerToken,
      uriHelper: uriHelper,
    );
    expect(deletedProof.isError, isTrue);
    expect(deletedProof.statusCode, 404);
    expect(deletedProof.detailError, 'No Proof matches the given query.');

    await closeSession(bearerToken: bearerToken, uriHelper: uriHelper);
  }

  group('$OpenPricesAPIClient default', () {
    const UriProductHelper uriHelper = uriHelperFoodProd;

    test('getStatus', () async {
      final MaybeError<String> status = await OpenPricesAPIClient.getStatus(
        uriHelper: uriHelper,
      );
      expect(status.isError, isFalse);
      expect(status.value, OpenPricesAPIClient.statusRunning);
    });

    test('getStats', () async {
      final MaybeError<PriceTotalStats> stats =
          await OpenPricesAPIClient.getStats(uriHelper: uriHelper);
      expect(stats.isError, isFalse);
      expect(stats.value.priceCount, greaterThan(0));
      expect(stats.value.priceTypeProductCodeCount, greaterThan(0));
      expect(
        stats.value.priceTypeProductCodeCount,
        lessThanOrEqualTo(stats.value.priceCount!),
      );
      expect(stats.value.priceTypeCategoryTagCount, greaterThan(0));
      expect(
        stats.value.priceTypeCategoryTagCount,
        lessThanOrEqualTo(stats.value.priceCount!),
      );
      expect(stats.value.productCount, greaterThan(0));
      expect(stats.value.productWithPriceCount, greaterThan(0));
      expect(
        stats.value.productWithPriceCount,
        lessThanOrEqualTo(stats.value.productCount!),
      );
      expect(stats.value.locationCount, greaterThan(0));
      expect(stats.value.locationWithPriceCount, greaterThan(0));
      expect(
        stats.value.locationWithPriceCount,
        lessThanOrEqualTo(stats.value.locationCount!),
      );
      expect(stats.value.locationTypeOsmCount, greaterThan(0));
      expect(
        stats.value.locationTypeOsmCount,
        lessThanOrEqualTo(stats.value.locationCount!),
      );
      expect(stats.value.locationTypeOnlineCount, greaterThan(0));
      expect(
        stats.value.locationTypeOnlineCount,
        lessThanOrEqualTo(stats.value.locationCount!),
      );
      expect(stats.value.proofCount, greaterThan(0));
      expect(stats.value.proofWithPriceCount, greaterThan(0));
      expect(
        stats.value.proofWithPriceCount,
        lessThanOrEqualTo(stats.value.proofCount!),
      );
      expect(stats.value.proofTypePriceTagCount, greaterThan(0));
      expect(
        stats.value.proofTypeReceiptCount,
        lessThanOrEqualTo(stats.value.proofCount!),
      );
      expect(stats.value.proofTypeReceiptCount, greaterThan(0));
      expect(
        stats.value.proofTypeReceiptCount,
        lessThanOrEqualTo(stats.value.proofCount!),
      );
      expect(stats.value.proofTypeGdprRequestCount, greaterThan(0));
      expect(
        stats.value.proofTypeGdprRequestCount,
        lessThanOrEqualTo(stats.value.proofCount!),
      );
      expect(stats.value.proofTypeShopImportCount, greaterThan(0));
      expect(
        stats.value.proofTypeShopImportCount,
        lessThanOrEqualTo(stats.value.proofCount!),
      );
      expect(stats.value.userCount, greaterThan(0));
      expect(stats.value.userWithPriceCount, greaterThan(0));
      expect(
        stats.value.userWithPriceCount,
        lessThanOrEqualTo(stats.value.userCount!),
      );
    });
  });

  group('$OpenPricesAPIClient Auth', () {
    const UriProductHelper uriHelper = uriHelperFoodTest;

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
      final String bearerToken = await getBearerToken(uriHelper: uriHelper);

      MaybeError<Session> session = await OpenPricesAPIClient.getUserSession(
        uriHelper: uriHelper,
        bearerToken: bearerToken,
      );
      expect(session.isError, isFalse);
      expect(session.value.userId, user.userId);

      await closeSession(bearerToken: bearerToken, uriHelper: uriHelper);

      session = await OpenPricesAPIClient.getUserSession(
        uriHelper: uriHelper,
        bearerToken: bearerToken,
      );
      expect(session.isError, isTrue);
      expect(session.statusCode, Session.invalidActionWithAuthStatusCode);
      expect(
        session.detailError,
        contains(Session.invalidActionWithAuthMessage),
      );
    });
  });

  group('$OpenPricesAPIClient currency', () {
    test('fixDecimalsForNumbers', () async {
      // sad but true
      expect(4.6 * 100, 459.99999999999994);

      expect(Currency.fixDecimalsForNumbers(4.6, 0), 5);
      expect(Currency.fixDecimalsForNumbers(4.6, 1), 4.6);
      expect(Currency.fixDecimalsForNumbers(4.6, 2), 4.6);
      expect(Currency.fixDecimalsForNumbers(4.6, 3), 4.6);
      expect(Currency.fixDecimalsForNumbers(4.6, 4), 4.6);

      expect(Currency.fixDecimalsForNumbers(4.612345, 0), 5);
      expect(Currency.fixDecimalsForNumbers(4.612345, 1), 4.6);
      expect(Currency.fixDecimalsForNumbers(4.612345, 2), 4.61);
      expect(Currency.fixDecimalsForNumbers(4.612345, 3), 4.612);
      expect(Currency.fixDecimalsForNumbers(4.612345, 4), 4.6123);

      expect(Currency.fixDecimalsForNumbers(460, 0), 460);
      expect(Currency.fixDecimalsForNumbers(460, 1), 460);
      expect(Currency.fixDecimalsForNumbers(460, 2), 460);
      expect(Currency.fixDecimalsForNumbers(460, 3), 460);
      expect(Currency.fixDecimalsForNumbers(460, 4), 460);
    });

    test('fixDecimals', () async {
      // sad but true
      expect(4.6 * 100, 459.99999999999994);

      expect(Currency.BIF.fixDecimals(4.6), 5);
      expect(Currency.EUR.fixDecimals(4.6), 4.6);
      expect(Currency.BHD.fixDecimals(4.6), 4.6);
      expect(Currency.CLF.fixDecimals(4.6), 4.6);

      expect(Currency.BIF.fixDecimals(4.612345), 5);
      expect(Currency.EUR.fixDecimals(4.612345), 4.61);
      expect(Currency.BHD.fixDecimals(4.612345), 4.612);
      expect(Currency.CLF.fixDecimals(4.612345), 4.6123);

      expect(Currency.BIF.fixDecimals(460), 460);
      expect(Currency.EUR.fixDecimals(460), 460);
      expect(Currency.BHD.fixDecimals(460), 460);
      expect(Currency.CLF.fixDecimals(460), 460);
    });
  });

  group('$OpenPricesAPIClient Prices', () {
    const UriProductHelper uriHelper = uriHelperFoodTest;

    test('create', () async {
      final Price initialPrice = Price()
        ..productCode = '3560071492755'
        ..type = PriceType.product
        ..price = 3.99
        ..currency = Currency.EUR
        ..locationOSMId = 4966187139
        ..locationOSMType = LocationOSMType.node
        ..priceIsDiscounted = true
        ..discountType = DiscountType.seasonal
        ..ownerComment = 'just a test'
        ..date = DateTime(2025, 1, 18);

      final UpdatePriceParameters updatePriceParameters =
          UpdatePriceParameters()
            ..price = 12
            ..productCode = '7300400481588'
            ..ownerComment = 'another test'
            ..priceIsDiscounted = false;

      const String invalidBearerToken = 'invalid bearer token';

      // failing price creation with invalid token
      MaybeError<Price?> addedPrice = await OpenPricesAPIClient.createPrice(
        price: initialPrice,
        bearerToken: invalidBearerToken,
        uriHelper: uriHelper,
      );
      expect(addedPrice.isError, isTrue);
      expect(addedPrice.statusCode, Session.invalidActionWithAuthStatusCode);
      expect(
        addedPrice.detailError,
        contains(Session.invalidActionWithAuthMessage),
      );

      final CreateProofParameters createProofParameters =
          CreateProofParameters(ProofType.priceTag)
            ..currency = Currency.EUR
            ..ownerComment = 'just trying'
            ..date = DateTime(2025, 1, 3);

      final String bearerToken = await getBearerToken(uriHelper: uriHelper);

      // successful proof upload with valid token
      MaybeError<Proof> uploadProof = await OpenPricesAPIClient.uploadProof(
        createProofParameters: createProofParameters,
        imageUri: initialImageUri,
        mediaType: initialMediaType,
        bearerToken: bearerToken,
        uriHelper: uriHelper,
      );
      expect(uploadProof.isError, isFalse);
      expect(uploadProof.value.id, isNotNull);
      // we may expect 200(proof already existed) and 201(proof created)
      expect(uploadProof.statusCode, isIn([200, 201]));

      // trying again to upload the proof, as it already exists on the server
      uploadProof = await OpenPricesAPIClient.uploadProof(
        createProofParameters: createProofParameters,
        imageUri: initialImageUri,
        mediaType: initialMediaType,
        bearerToken: bearerToken,
        uriHelper: uriHelper,
      );
      expect(uploadProof.isError, isFalse);
      expect(uploadProof.value.id, isNotNull);
      // 200: proof already existing
      expect(uploadProof.statusCode, 200);

      final int proofId = uploadProof.value.id;
      initialPrice.proofId = proofId;

      // failing price creation with valid token but invalid dates
      addedPrice = await OpenPricesAPIClient.createPrice(
        price: initialPrice,
        bearerToken: bearerToken,
        uriHelper: uriHelper,
      );
      expect(addedPrice.isError, isTrue);

      // successful price creation
      initialPrice.date = createProofParameters.date!;
      initialPrice.currency = createProofParameters.currency!;
      addedPrice = await OpenPricesAPIClient.createPrice(
        price: initialPrice,
        bearerToken: bearerToken,
        uriHelper: uriHelper,
      );
      expect(addedPrice.isError, isFalse);
      final Price addedValue = addedPrice.value!;
      expect(addedValue.productCode, initialPrice.productCode);
      expect(addedValue.type, initialPrice.type);
      expect(addedValue.price, initialPrice.price);
      expect(
        addedValue.priceWithoutDiscount,
        initialPrice.priceWithoutDiscount,
      );
      expect(
        addedValue.priceIsDiscounted,
        initialPrice.priceIsDiscounted ?? false,
      );
      expect(addedValue.discountType, initialPrice.discountType);
      expect(addedValue.currency, initialPrice.currency);
      expect(addedValue.locationOSMId, initialPrice.locationOSMId);
      expect(addedValue.locationOSMType, initialPrice.locationOSMType);
      expect(addedValue.ownerComment, initialPrice.ownerComment);
      expect(addedValue.date, initialPrice.date);
      expect(addedValue.owner, user.userId);

      final int priceId = addedValue.id;

      // successful price update
      MaybeError<bool> updatedPrice = await OpenPricesAPIClient.updatePrice(
        priceId,
        parameters: updatePriceParameters,
        bearerToken: bearerToken,
        uriHelper: uriHelper,
      );
      expect(updatedPrice.isError, isFalse);
      expect(updatedPrice.value, isTrue);

      final MaybeError<Price> updatedPriceValue =
          await OpenPricesAPIClient.getPrice(priceId, uriHelper: uriHelper);
      expect(updatedPriceValue.isError, isFalse);
      expect(updatedPriceValue.value.price, updatePriceParameters.price);
      expect(
        updatedPriceValue.value.priceIsDiscounted,
        updatePriceParameters.priceIsDiscounted,
      );
      expect(updatedPriceValue.value.priceWithoutDiscount, isNull);
      expect(updatedPriceValue.value.discountType, isNull);
      expect(
        updatedPriceValue.value.productCode,
        updatePriceParameters.productCode,
      );
      expect(
        updatedPriceValue.value.ownerComment,
        updatePriceParameters.ownerComment,
      );

      // delete price first time: success
      MaybeError<bool> deletedPrice = await OpenPricesAPIClient.deletePrice(
        priceId: priceId,
        bearerToken: bearerToken,
        uriHelper: uriHelper,
      );
      expect(deletedPrice.isError, isFalse);
      expect(deletedPrice.value, isTrue);

      // delete price second time: failure
      deletedPrice = await OpenPricesAPIClient.deletePrice(
        priceId: priceId,
        bearerToken: bearerToken,
        uriHelper: uriHelper,
      );
      expect(deletedPrice.isError, isTrue);
      expect(deletedPrice.statusCode, 404);
      expect(deletedPrice.detailError, 'No Price matches the given query.');

      await deleteProofAndCloseSession(
        proofId: proofId,
        bearerToken: bearerToken,
        uriHelper: uriHelper,
      );
    }, timeout: Timeout(Duration(seconds: 60)));

    test('get user', () async {
      const UriProductHelper uriHelper = uriHelperFoodProd;
      late PriceUser results;

      final String username = 'chetanr25';
      MaybeError<PriceUser> maybeResults;
      try {
        maybeResults = await OpenPricesAPIClient.getUser(
          username,
          uriHelper: uriHelper,
        );
      } catch (e) {
        if (e.toString().contains(TestConstants.badGatewayError)) {
          return;
        }
        rethrow;
      }
      expect(maybeResults.isError, isFalse);
      results = maybeResults.value;
      expect(results.userId, equals(username));
      expect(results.priceCount, greaterThanOrEqualTo(0));
      expect(results.locationCount, greaterThanOrEqualTo(0));
      expect(results.productCount, greaterThanOrEqualTo(0));
      expect(results.proofCount, greaterThanOrEqualTo(0));
      expect(results.priceCurrencyCount, greaterThanOrEqualTo(0));
      expect(results.priceKindCommunityCount, greaterThanOrEqualTo(0));
      expect(results.priceKindConsumptionCount, greaterThanOrEqualTo(0));
      expect(results.proofKindCommunityCount, greaterThanOrEqualTo(0));
      expect(results.proofKindConsumptionCount, greaterThanOrEqualTo(0));
      expect(results.priceTypeProductCount, greaterThanOrEqualTo(0));
      expect(results.priceTypeCategoryCount, greaterThanOrEqualTo(0));
      expect(results.priceInProofOwnedCount, greaterThanOrEqualTo(0));
      expect(results.priceInProofNotOwnedCount, greaterThanOrEqualTo(0));
      expect(results.priceNotOwnedInProofOwnedCount, greaterThanOrEqualTo(0));
      expect(results.locationTypeOsmCountryCount, greaterThanOrEqualTo(0));
    });

    test('get prices', () async {
      const UriProductHelper uriHelper = uriHelperFoodProd;

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
    const UriProductHelper uriHelper = uriHelperFoodProd;

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
            locationOSMType: location.type!,
            locationOSMId: location.osmId!,
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
      expect(location.detailError, 'No Location matches the given query.');
    });

    test('get non-existing OSM location', () async {
      const int locationOSMId = 123123123123123123;
      const LocationOSMType locationOSMType = LocationOSMType.way;
      final MaybeError<Location> location =
          await OpenPricesAPIClient.getOSMLocation(
            locationOSMId: locationOSMId,
            locationOSMType: locationOSMType,
            uriHelper: uriHelper,
          );
      expect(location.isError, isTrue);
      expect(location.detailError, 'No Location matches the given query.');
    });

    test('get locations', () async {
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

  group('$OpenPricesAPIClient Challenges', () {
    const UriProductHelper uriHelper = uriHelperFoodProd;

    test('get existing challenge', () async {
      const int challengeId = 1;
      final MaybeError<Challenge> maybeChallenge =
          await OpenPricesAPIClient.getChallenge(
            challengeId,
            uriHelper: uriHelper,
          );
      expect(maybeChallenge.isError, isFalse);
      final Challenge challenge = maybeChallenge.value;
      expect(challenge.id, challengeId);
    });

    test('get non-existing challenge', () async {
      const int challengeId = -1;
      final MaybeError<Challenge> challenge =
          await OpenPricesAPIClient.getChallenge(
            challengeId,
            uriHelper: uriHelper,
          );
      expect(challenge.isError, isTrue);
      expect(challenge.detailError, 'No Challenge matches the given query.');
    });

    test('get challenges', () async {
      late GetChallengesResult result;

      final GetChallengesParameters parameters = GetChallengesParameters()
        ..pageSize = pageSize
        ..pageNumber = pageNumber
        ..status = GetChallengesParameters.statusCompleted
        ..id = 1
        ..startDateYear = 2025
        ..startDateMonth = 1
        ..endDateMonth = 2
        ..endDateYear = 2025
        ..isPublished = true;

      late MaybeError<GetChallengesResult> maybeResults;
      try {
        maybeResults = await OpenPricesAPIClient.getChallenges(
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
      expect(result.items, isNotNull);
      expect(result.items, hasLength(1));
      final Challenge item = result.items!.first;
      expect(item.id, parameters.id);
      expect(item.status, parameters.status);
      expect(item.isPublished, parameters.isPublished);

      // wrong parameters
      parameters.endDateYear = 2028;
      try {
        maybeResults = await OpenPricesAPIClient.getChallenges(
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
      expect(result.items, isNotNull);
      expect(result.items, isEmpty);
    });
  });

  group('$OpenPricesAPIClient Products', () {
    const UriProductHelper uriHelper = uriHelperFoodProd;

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
        'No Product matches the given query.',
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
      const String productCode = '123123123123123123123123';
      final MaybeError<PriceProduct> maybePriceProduct =
          await OpenPricesAPIClient.getPriceProductByCode(
            productCode,
            uriHelper: uriHelper,
          );
      expect(maybePriceProduct.isError, isTrue);
      expect(
        maybePriceProduct.detailError,
        'No Product matches the given query.',
      );
    });

    test('get products', () async {
      late GetPriceProductsResult result;

      // oldest first
      GetPriceProductsParameters parameters = GetPriceProductsParameters()
        ..orderBy = <OrderBy<GetPriceProductsOrderField>>[
          OrderBy(field: GetPriceProductsOrderField.created, ascending: true),
        ]
        ..pageSize = pageSize
        ..pageNumber = pageNumber;
      MaybeError<GetPriceProductsResult> maybeResults;
      try {
        maybeResults = await OpenPricesAPIClient.getPriceProducts(
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
      parameters = GetPriceProductsParameters()
        ..orderBy = <OrderBy<GetPriceProductsOrderField>>[
          OrderBy(field: GetPriceProductsOrderField.created, ascending: false),
        ]
        ..pageSize = pageSize
        ..pageNumber = pageNumber;
      try {
        maybeResults = await OpenPricesAPIClient.getPriceProducts(
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

      // most prices first
      parameters = GetPriceProductsParameters()
        ..orderBy = <OrderBy<GetPriceProductsOrderField>>[
          OrderBy(
            field: GetPriceProductsOrderField.priceCount,
            ascending: false,
          ),
        ]
        ..pageSize = pageSize
        ..pageNumber = pageNumber;
      try {
        maybeResults = await OpenPricesAPIClient.getPriceProducts(
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
      // value as of 2024-12-05
      expect(result.items!.first.priceCount, greaterThanOrEqualTo(107));

      parameters = GetPriceProductsParameters()..brandsLike = 'ferrero';
      maybeResults = await OpenPricesAPIClient.getPriceProducts(
        parameters,
        uriHelper: uriHelper,
      );
      expect(maybeResults.isError, isFalse);
      result = maybeResults.value;
      // value as of 2024-12-05
      expect(result.total, greaterThanOrEqualTo(2040));

      // values as of 2025-01-03
      const Map<Flavor?, int> expectedMinCounts = <Flavor?, int>{
        Flavor.openFoodFacts: 3679133,
        Flavor.openBeautyFacts: 34557,
        Flavor.openPetFoodFacts: 10252,
        Flavor.openProductFacts: 15736,
        null: 3745994,
      };
      for (final Flavor? flavor in expectedMinCounts.keys) {
        parameters = GetPriceProductsParameters()..source = flavor;
        maybeResults = await OpenPricesAPIClient.getPriceProducts(
          parameters,
          uriHelper: uriHelper,
        );
        expect(maybeResults.isError, isFalse);
        result = maybeResults.value;
        expect(result.total, greaterThanOrEqualTo(expectedMinCounts[flavor]!));
      }
    });
  });

  group('$OpenPricesAPIClient Proofs', () {
    const UriProductHelper uriHelper = uriHelperFoodTest;

    void checkProof(final Proof proof, final CommonProofParameters parameters) {
      expect(proof.type, parameters.type);
      expect(proof.owner, user.userId);
      expect(proof.id, isNotNull);
      expect(proof.priceCount, 0);
      expect(proof.mimetype, initialMediaType.toString());
      expect(proof.currency, parameters.currency);
      expect(proof.date, parameters.date);
      expect(proof.locationOSMId, parameters.locationOSMId);
      expect(proof.locationOSMType, parameters.locationOSMType);
      expect(proof.locationId, parameters.locationId);
      expect(proof.ownerComment, parameters.ownerComment);
      if (proof.type == ProofType.receipt) {
        expect(proof.receiptPriceCount, parameters.receiptPriceCount);
        expect(proof.receiptPriceTotal, parameters.receiptPriceTotal);
        expect(
          proof.receiptOnlineDeliveryCosts,
          parameters.receiptOnlineDeliveryCosts,
        );
        expect(proof.ownerConsumption, parameters.ownerConsumption);
      }
      if (proof.type == ProofType.priceTag) {
        expect(
          proof.readyForPriceTagValidation,
          parameters.readyForPriceTagValidation,
        );
      }
    }

    Future<void> checkProofParameters(
      final CreateProofParameters createProofParameters,
      final UpdateProofParameters updateProofParameters,
    ) async {
      final String bearerToken = await getBearerToken(uriHelper: uriHelper);

      // successful proof upload with valid token
      final MaybeError<Proof> uploadProof =
          await OpenPricesAPIClient.uploadProof(
            createProofParameters: createProofParameters,
            imageUri: initialImageUri,
            mediaType: initialMediaType,
            bearerToken: bearerToken,
            uriHelper: uriHelper,
          );
      expect(uploadProof.isError, isFalse);
      if (uploadProof.value.detail == 'duplicate') {
        // it's irrelevant to expect correct values with a pre-existing proof.
        return;
      }
      checkProof(uploadProof.value, createProofParameters);

      final int proofId = uploadProof.value.id;

      // successful proof update
      MaybeError<bool> updateProof = await OpenPricesAPIClient.updateProof(
        proofId,
        parameters: updateProofParameters,
        bearerToken: bearerToken,
        uriHelper: uriHelper,
      );
      expect(updateProof.isError, isFalse);

      final MaybeError<Proof> maybeProof = await OpenPricesAPIClient.getProof(
        proofId,
        uriHelper: uriHelper,
        bearerToken: bearerToken,
      );
      expect(maybeProof.isError, isFalse);
      expect(maybeProof.value.id, proofId);
      checkProof(maybeProof.value, updateProofParameters);

      await deleteProofAndCloseSession(
        proofId: proofId,
        bearerToken: bearerToken,
        uriHelper: uriHelper,
      );
    }

    test(
      'upload and update PRICE TAG',
      () async => checkProofParameters(
        CreateProofParameters(ProofType.priceTag)
          ..currency = Currency.EUR
          ..ownerComment = 'just trying'
          ..date = DateTime(2025, 1, 1)
          ..readyForPriceTagValidation = true,
        UpdateProofParameters()
          ..type = ProofType.priceTag
          ..currency = Currency.USD
          ..ownerComment = 'nothing in the end'
          ..date = DateTime(2025, 1, 2)
          ..readyForPriceTagValidation = false,
      ),
    );

    test(
      'upload and update RECEIPT',
      () async => checkProofParameters(
        CreateProofParameters(ProofType.receipt)
          ..currency = Currency.USD
          ..ownerComment = 'nothing in the end'
          ..date = DateTime(2025, 1, 3)
          ..receiptPriceCount = 72
          ..receiptPriceTotal = 1.75
          ..receiptOnlineDeliveryCosts = 15
          ..ownerConsumption = true,
        UpdateProofParameters()
          ..type = ProofType.receipt
          ..currency = Currency.EUR
          ..ownerComment = 'just trying'
          ..date = DateTime(2025, 1, 3)
          ..receiptPriceCount = 77
          ..receiptPriceTotal = 1.75
          ..receiptOnlineDeliveryCosts = 14
          ..ownerConsumption = false,
      ),
    );

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

    test('get proofs', () async {
      const GetProofsOrderField orderField = GetProofsOrderField.created;
      const ProofType proofType = ProofType.receipt;

      late GetProofsResult result;

      final String bearerToken = await getBearerToken(uriHelper: uriHelper);

      // oldest first
      GetProofsParameters parameters = GetProofsParameters()
        ..orderBy = <OrderBy<GetProofsOrderField>>[
          OrderBy(field: orderField, ascending: true),
        ]
        ..type = proofType
        ..pageSize = pageSize
        ..pageNumber = pageNumber;
      MaybeError<GetProofsResult> maybeResults;
      try {
        maybeResults = await OpenPricesAPIClient.getProofs(
          parameters,
          uriHelper: uriHelper,
          bearerToken: bearerToken,
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
      for (final Proof proof in result.items!) {
        expect(proof.type, proofType);
      }
      final DateTime oldestDate = result.items!.first.created;

      // newest first
      parameters = GetProofsParameters()
        ..orderBy = <OrderBy<GetProofsOrderField>>[
          OrderBy(field: orderField, ascending: false),
        ]
        ..type = proofType
        ..pageSize = pageSize
        ..pageNumber = pageNumber;
      try {
        maybeResults = await OpenPricesAPIClient.getProofs(
          parameters,
          uriHelper: uriHelper,
          bearerToken: bearerToken,
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
      for (final Proof proof in result.items!) {
        expect(proof.type, proofType);
      }
      final DateTime newestDate = result.items!.first.created;

      expect(
        newestDate.millisecondsSinceEpoch,
        greaterThan(oldestDate.millisecondsSinceEpoch),
      );

      // Trying to get the same single result, from an item.
      final Proof proof = result.items!.first;
      final MaybeError<Proof> maybeProof = await OpenPricesAPIClient.getProof(
        proof.id,
        uriHelper: uriHelper,
        bearerToken: bearerToken,
      );
      expect(maybeProof.isError, isFalse);
      expect(maybeProof.value.id, proof.id);
      expect(maybeProof.value.type, proof.type);
      expect(maybeProof.value.owner, proof.owner);
      expect(maybeProof.value.priceCount, proof.priceCount);
      expect(maybeProof.value.mimetype, proof.mimetype);
      expect(maybeProof.value.created, proof.created);
      expect(maybeProof.value.filePath, proof.filePath);
      expect(maybeProof.value.imageThumbPath, proof.imageThumbPath);
      if (proof.filePath != null) {
        final Uri uri = proof.getFileUrl(
          uriProductHelper: uriHelper,
          isThumbnail: false,
        )!;
        final http.Response response = await http.get(uri);
        expect(response.statusCode, HTTP_OK);
      }
      if (proof.imageThumbPath != null) {
        final Uri uri = proof.getFileUrl(
          uriProductHelper: uriHelper,
          isThumbnail: true,
        )!;
        final http.Response response = await http.get(uri);
        expect(response.statusCode, HTTP_OK);
      }
    });
  });

  group('$OpenPricesAPIClient Users', () {
    const UriProductHelper uriHelper = uriHelperFoodProd;

    test('get users', () async {
      const GetUsersOrderField orderField = GetUsersOrderField.priceCount;

      late GetUsersResult result;

      int? priceCountMax;
      int? priceCountMin;

      // highest first
      GetUsersParameters parameters = GetUsersParameters()
        ..orderBy = <OrderBy<GetUsersOrderField>>[
          OrderBy(field: orderField, ascending: false),
        ]
        ..pageSize = pageSize
        ..pageNumber = pageNumber;
      MaybeError<GetUsersResult> maybeResults;
      try {
        maybeResults = await OpenPricesAPIClient.getUsers(
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
      for (final PriceUser user in result.items!) {
        priceCountMax ??= user.priceCount;
      }

      // lowest first
      parameters = GetUsersParameters()
        ..orderBy = <OrderBy<GetUsersOrderField>>[
          OrderBy(field: orderField, ascending: true),
        ]
        ..pageSize = pageSize
        ..pageNumber = pageNumber;
      try {
        maybeResults = await OpenPricesAPIClient.getUsers(
          parameters,
          uriHelper: uriHelperFoodProd,
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
      for (final PriceUser user in result.items!) {
        priceCountMin ??= user.priceCount;
      }

      expect(priceCountMax!, greaterThan(priceCountMin!));
    });
  });

  group('$OpenPricesAPIClient Issues', () {
    test('issue #1045', () async {
      const UriProductHelper uriHelper = uriHelperFoodProd;

      final MaybeError<Price> maybeResults = await OpenPricesAPIClient.getPrice(
        80341,
        uriHelper: uriHelper,
      );
      expect(maybeResults.isError, isFalse);
      final Price price = maybeResults.value;
      expect(price.productCode, '4010534012093');
      expect(price.price, 2.99);
      expect(price.currency, Currency.EUR);
      expect(price.date, DateTime(2025, 2, 11));
    });
  });
}
