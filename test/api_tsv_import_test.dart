import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:test/test.dart';

void main() {
  group('TsvHelper.extractTSVLine', () {
    test('parses complete valid TSV line with all fields', () {
      final barcode = '0000105000011';
      final namesRaw =
          "[{'lang': main, 'text': Chamomile Herbal Tea}, {'lang': en, 'text': Chamomile Herbal Tea}]";
      final quantity = '1 g';
      final brands = "Lagg's";
      final nutriscore = 'unknown';
      final novaGroup = '1';
      final ecoscoreGrade = '';

      final line = [
        barcode,
        namesRaw,
        quantity,
        brands,
        nutriscore,
        novaGroup,
        ecoscoreGrade,
      ].join('\t');

      final helper = TsvHelper(useRegexp: true);
      final product = helper.extractTSVLine(line);

      expect(product.barcode, barcode);
      expect(product.quantity, quantity);
      expect(product.brands, brands);
      expect(product.nutriscore, isNull);
      expect(product.novaGroup, int.parse(novaGroup));
      expect(product.ecoscoreGrade, isNull);
      expect(product.productName, 'Chamomile Herbal Tea');
      expect(product.productNameInLanguages, isNotNull);
      expect(product.productNameInLanguages!.length, 1);
      expect(
        product.productNameInLanguages![OpenFoodFactsLanguage.ENGLISH],
        'Chamomile Herbal Tea',
      );
    });

    test(
      'parses line with accented characters and special chars in product name',
      () {
        final barcode = '0000101209159';
        final namesRaw =
            "[{'lang': main, 'text': Véritable pâte à tartiner noisettes chocolat noir}, {'lang': fr, 'text': Véritable pâte à tartiner noisettes chocolat noir}]";
        final quantity = '350 g';
        final brands = 'Bovetti';
        final nutriscore = 'e';
        final novaGroup = '';
        final ecoscoreGrade = '';

        final line = [
          barcode,
          namesRaw,
          quantity,
          brands,
          nutriscore,
          novaGroup,
          ecoscoreGrade,
        ].join('\t');

        final helper = TsvHelper();
        final product = helper.extractTSVLine(line);

        expect(product.barcode, barcode);
        expect(product.quantity, quantity);
        expect(product.brands, brands);
        expect(product.nutriscore, nutriscore);
        expect(product.novaGroup, isNull);
        expect(product.ecoscoreGrade, isNull);
        expect(
          product.productName,
          'Véritable pâte à tartiner noisettes chocolat noir',
        );
        expect(product.productNameInLanguages, isNotNull);
        expect(product.productNameInLanguages!.length, 1);
        expect(
          product.productNameInLanguages![OpenFoodFactsLanguage.FRENCH],
          'Véritable pâte à tartiner noisettes chocolat noir',
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

    test('handles JSON mode parsing (if valid JSON)', () {
      final barcode = '123';
      final namesRaw =
          '[{"lang": "main", "text": "Test"}, {"lang": "en", "text": "Test EN"}]';
      final line = [
        barcode,
        namesRaw.replaceAll("'", "\""),
        '',
        '',
        '',
        '',
        '',
      ].join('\t');

      final helper = TsvHelper(useRegexp: false);
      final product = helper.extractTSVLine(line);

      expect(product.productName, 'Test');
      expect(
        product.productNameInLanguages![OpenFoodFactsLanguage.ENGLISH],
        'Test EN',
      );
    });
  });
}
