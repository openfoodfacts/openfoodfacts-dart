import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

import 'test_constants.dart';

/// Tests around External Source
void main() {
  // TODO(monsieurtanuki) switch to PROD when relevant
  final UriProductHelper uriHelper = uriHelperFoodTest;
  OpenFoodAPIConfiguration.userAgent = TestConstants.TEST_USER_AGENT;
  const String sufferingFingerprintId = 'empreinte_souffrance';
  const OpenFoodFactsLanguage language = OpenFoodFactsLanguage.FRENCH;
  const OpenFoodFactsCountry country = OpenFoodFactsCountry.FRANCE;

  Future<ExternalSourceMetadata> getSufferingMetadata() async {
    final MaybeError<List<ExternalSourceMetadata>> result =
        await OpenFoodAPIClient.getExternalSourceMetadatas(
          uriHelper: uriHelper,
        );
    expect(result.isError, isFalse);
    for (final ExternalSourceMetadata item in result.value) {
      if (item.id == sufferingFingerprintId) {
        return item;
      }
    }
    fail('Could not find $sufferingFingerprintId');
  }

  group('$OpenFoodAPIClient External Source', () {
    test('getExternalSourceMetadata - found', () async {
      final MaybeError<List<ExternalSourceMetadata>> result =
          await OpenFoodAPIClient.getExternalSourceMetadatas(
            uriHelper: uriHelper,
          );
      bool foundExpectedId = false;
      expect(result.isError, isFalse);
      for (final ExternalSourceMetadata item in result.value) {
        expect(item.id, isNotEmpty);
        if (item.id == sufferingFingerprintId) {
          foundExpectedId = true;
        }
        expect(item.name, isNotEmpty);
        expect(item.filter, isNotNull);
        expect(item.filter.countries, isNotNull);
        expect(item.filter.languages, isNotNull);
        expect(item.filter.productTypes, isNotNull);
        expect(item.filter.categories, isNotNull);
        expect(item.description, isNotEmpty);
        expect(item.iconUrl, isNotEmpty);
        expect(item.knowledgePanelUrl, isNotEmpty);
        expect(item.privacyPolicyUrl, isNotNull);
        expect(item.providerName, isNotEmpty);
        expect(item.providerWebsite, isNotEmpty);
        expect(item.scope, isNotEmpty);
        expect(item.section, isNotEmpty);
        expect(item.sectionTitle, isNotEmpty);
        expect(item.userInScope, isNotNull);
      }
      expect(foundExpectedId, isTrue);
    });

    test('check empreinte_souffrance - found', () async {
      // eggs
      const String barcode = '3564700814628';
      final ProductResultV3 productResultV3 =
          await OpenFoodAPIClient.getProductV3(
            ProductQueryConfiguration(
              barcode,
              version: ProductQueryVersion.v3,
              language: language,
              country: country,
              fields: <ProductField>[
                ProductField.BARCODE,
                ProductField.PRODUCT_TYPE,
                ProductField.CATEGORIES_TAGS,
              ],
            ),
          );
      expect(productResultV3.product, isNotNull);
      final ExternalSourceMetadata metadata = await getSufferingMetadata();
      final MaybeError<ExternalSourceProductData?> maybeProductData =
          await OpenFoodAPIClient.getExternalSourceProductData(
            metadata: metadata,
            product: productResultV3.product!,
            language: language,
            country: country,
          );
      expect(maybeProductData.isError, isFalse);
      expect(maybeProductData.value!.productImageUrl, isNotNull);
      expect(maybeProductData.value!.name, isNotNull);
      expect(maybeProductData.value!.knowledgePanels, isNotNull);
    });

    test('check empreinte_souffrance - not found', () async {
      // mineral water
      const String barcode = '8002270014901';
      final ProductResultV3 productResultV3 =
          await OpenFoodAPIClient.getProductV3(
            ProductQueryConfiguration(
              barcode,
              version: ProductQueryVersion.v3,
              language: language,
              country: country,
              fields: <ProductField>[
                ProductField.BARCODE,
                ProductField.PRODUCT_TYPE,
                ProductField.CATEGORIES_TAGS,
              ],
            ),
          );
      expect(productResultV3.product, isNotNull);
      final ExternalSourceMetadata metadata = await getSufferingMetadata();
      final MaybeError<ExternalSourceProductData?> maybeProductData =
          await OpenFoodAPIClient.getExternalSourceProductData(
            metadata: metadata,
            product: productResultV3.product!,
            language: language,
            country: country,
          );
      expect(maybeProductData.isError, isFalse);
      expect(maybeProductData.isValueNull, isTrue);
    });
  });
}
