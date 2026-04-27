import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

void main() {
  group('TsvHelper.extractTSVLine', () {
    test('parses complete valid TSV line with all fields', () {
      const expectedBarcode = '0000105000011';
      const expectedName = 'Chamomile Herbal Tea';
      final namesRaw =
          "[{'lang': main, 'text': $expectedName}, {'lang': en, 'text': $expectedName}]";
      const expectedQuantity = '1 g';
      const expectedBrands = "Lagg's";
      const rawNutriscore = 'unknown';
      const expectedNovaGroup = 1;
      const rawEcoscoreGrade = '';

      final line = [
        expectedBarcode,
        namesRaw,
        expectedQuantity,
        expectedBrands,
        rawNutriscore,
        expectedNovaGroup.toString(),
        rawEcoscoreGrade,
      ].join('\t');

      final helper = TsvHelper();
      final product = helper.extractTSVLine(line);

      expect(product.barcode, expectedBarcode);
      expect(product.quantity, expectedQuantity);
      expect(product.brands, expectedBrands);
      expect(product.nutriscore, isNull);
      expect(product.novaGroup, expectedNovaGroup);
      expect(product.ecoscoreGrade, isNull);
      expect(product.productName, expectedName);
      expect(product.productNameInLanguages, isNotNull);
      expect(product.productNameInLanguages!.length, 1);
      expect(
        product.productNameInLanguages![OpenFoodFactsLanguage.ENGLISH],
        expectedName,
      );
    });

    test(
      'parses line with accented characters and special chars in product name',
      () {
        const expectedBarcode = '0000101209159';
        const expectedName =
            'Véritable pâte à tartiner noisettes chocolat noir';
        final namesRaw =
            "[{'lang': main, 'text': $expectedName}, {'lang': fr, 'text': $expectedName}]";
        const expectedQuantity = '350 g';
        const expectedBrands = 'Bovetti';
        const expectedNutriscore = 'e';
        const rawNovaGroup = '';
        const rawEcoscoreGrade = '';

        final line = [
          expectedBarcode,
          namesRaw,
          expectedQuantity,
          expectedBrands,
          expectedNutriscore,
          rawNovaGroup,
          rawEcoscoreGrade,
        ].join('\t');

        final helper = TsvHelper();
        final product = helper.extractTSVLine(line);

        expect(product.barcode, expectedBarcode);
        expect(product.quantity, expectedQuantity);
        expect(product.brands, expectedBrands);
        expect(product.nutriscore, expectedNutriscore);
        expect(product.novaGroup, isNull);
        expect(product.ecoscoreGrade, isNull);
        expect(product.productName, expectedName);
        expect(product.productNameInLanguages, isNotNull);
        expect(product.productNameInLanguages!.length, 1);
        expect(
          product.productNameInLanguages![OpenFoodFactsLanguage.FRENCH],
          expectedName,
        );
      },
    );

    test('throws exception for line with insufficient columns', () {
      final line = "0000101209159\tNot enough\tcolumns";
      final helper = TsvHelper();

      expect(
        () => helper.extractTSVLine(line),
        throwsA(
          isA<Exception>().having(
            (e) => e.toString(),
            'message',
            contains('Bad number of columns: 7 expected, 3 instead'),
          ),
        ),
      );
    });

    test('throws exception for line with too many columns', () {
      final line =
          "code\tname\tqty\tbrand\tnutri\tnova\tecoscore\textra\textra2";
      final helper = TsvHelper();

      expect(
        () => helper.extractTSVLine(line),
        throwsA(
          isA<Exception>().having(
            (e) => e.toString(),
            'message',
            contains('Bad number of columns: 7 expected, 9 instead'),
          ),
        ),
      );
    });

    test('maps literal unknown ecoscore to null', () {
      const expectedBarcode = '1234567890123';
      const expectedName = 'Test Product';
      const expectedQuantity = '100g';
      const expectedBrands = 'Brand';
      const expectedNutriscore = 'a';
      const expectedNovaGroup = 1;
      const rawEcoscoreGrade = 'unknown';
      final namesRaw =
          "[{'lang': main, 'text': $expectedName}, {'lang': en, 'text': $expectedName}]";
      final line = [
        expectedBarcode,
        namesRaw,
        expectedQuantity,
        expectedBrands,
        expectedNutriscore,
        expectedNovaGroup.toString(),
        rawEcoscoreGrade,
      ].join('\t');

      final product = TsvHelper().extractTSVLine(line);

      expect(product.ecoscoreGrade, isNull);
      expect(product.nutriscore, expectedNutriscore);
      expect(product.novaGroup, expectedNovaGroup);
    });

    test('returns null productName and languages when name field is empty', () {
      const rawBarcode = '1234567890123';
      const rawNamesField = '';
      const rawQuantity = '100g';
      const rawBrands = 'Brand';
      const rawNutriscore = 'a';
      const rawNovaGroup = '1';
      const rawEcoscoreGrade = 'b';
      final line = [
        rawBarcode,
        rawNamesField,
        rawQuantity,
        rawBrands,
        rawNutriscore,
        rawNovaGroup,
        rawEcoscoreGrade,
      ].join('\t');

      final product = TsvHelper().extractTSVLine(line);

      expect(product.productName, isNull);
      expect(product.productNameInLanguages, isNull);
    });

    test('parses multiple language entries in product name', () {
      const expectedBarcode = '1234567890123';
      const expectedMainName = 'Cheese';
      const expectedFrName = 'Fromage';
      const expectedQuantity = '200g';
      const expectedBrands = 'Brand';
      const rawNutriscore = '';
      const rawNovaGroup = '';
      const rawEcoscoreGrade = '';
      final namesRaw =
          "[{'lang': main, 'text': $expectedMainName}, {'lang': en, 'text': $expectedMainName}, {'lang': fr, 'text': $expectedFrName}]";
      final line = [
        expectedBarcode,
        namesRaw,
        expectedQuantity,
        expectedBrands,
        rawNutriscore,
        rawNovaGroup,
        rawEcoscoreGrade,
      ].join('\t');

      final product = TsvHelper().extractTSVLine(line);

      expect(product.productName, expectedMainName);
      expect(product.productNameInLanguages, isNotNull);
      expect(product.productNameInLanguages!.length, 2);
      expect(
        product.productNameInLanguages![OpenFoodFactsLanguage.ENGLISH],
        expectedMainName,
      );
      expect(
        product.productNameInLanguages![OpenFoodFactsLanguage.FRENCH],
        expectedFrName,
      );
    });

    test('maps non-integer nova group string to null', () {
      const rawBarcode = '1234567890123';
      const rawNamesField = '';
      const rawQuantity = '100g';
      const rawBrands = 'Brand';
      const rawNutriscore = '';
      const rawNovaGroup = 'invalid';
      const rawEcoscoreGrade = '';
      final line = [
        rawBarcode,
        rawNamesField,
        rawQuantity,
        rawBrands,
        rawNutriscore,
        rawNovaGroup,
        rawEcoscoreGrade,
      ].join('\t');

      final product = TsvHelper().extractTSVLine(line);

      expect(product.novaGroup, isNull);
    });

    test('all optional fields empty returns all nulls', () {
      const expectedBarcode = '9876543210987';
      const rawNamesField = '';
      const rawQuantity = '';
      const rawBrands = '';
      const rawNutriscore = '';
      const rawNovaGroup = '';
      const rawEcoscoreGrade = '';
      final line = [
        expectedBarcode,
        rawNamesField,
        rawQuantity,
        rawBrands,
        rawNutriscore,
        rawNovaGroup,
        rawEcoscoreGrade,
      ].join('\t');

      final product = TsvHelper().extractTSVLine(line);

      expect(product.barcode, expectedBarcode);
      expect(product.productName, isNull);
      expect(product.productNameInLanguages, isNull);
      expect(product.quantity, isNull);
      expect(product.brands, isNull);
      expect(product.nutriscore, isNull);
      expect(product.novaGroup, isNull);
      expect(product.ecoscoreGrade, isNull);
    });

    test('parses name with no main entry: productName null, languages set', () {
      const expectedBarcode = '1234567890123';
      const expectedEnName = 'Pasta';
      const expectedQuantity = '500g';
      const expectedBrands = 'Brand';
      const rawNutriscore = '';
      const rawNovaGroup = '';
      const rawEcoscoreGrade = '';
      final namesRaw = "[{'lang': en, 'text': $expectedEnName}]";
      final line = [
        expectedBarcode,
        namesRaw,
        expectedQuantity,
        expectedBrands,
        rawNutriscore,
        rawNovaGroup,
        rawEcoscoreGrade,
      ].join('\t');

      final product = TsvHelper().extractTSVLine(line);

      expect(product.productName, isNull);
      expect(product.productNameInLanguages, isNotNull);
      expect(
        product.productNameInLanguages![OpenFoodFactsLanguage.ENGLISH],
        expectedEnName,
      );
    });
  });
}
