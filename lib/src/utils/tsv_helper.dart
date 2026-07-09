import '../model/product.dart';
import 'language_helper.dart';

/// Utility for parsing Open Food Facts TSV database export lines.
/// Designed for streaming 4M+ line datasets
class TsvHelper {
  TsvHelper();

  static const String _tabSeparator = '\t';

  // The offline TSV dump exports product names using pseudo-JSON
  // with single quotes (e.g. [{'lang': main, 'text': Name}]) instead of
  // valid JSON double quotes. Because Dart's jsonDecode strictly requires
  // double quotes, we use RegExp to parse this efficiently.
  static final RegExp _langTextPattern = RegExp(
    r"\{'lang':\s*(\w+)\s*,\s*'text':\s*(.+?)\s*\}",
  );

  /// Extracts a single [Product] from a TSV line.
  /// Throws an exception if the line format is invalid.
  /// Optimized for high-throughput streaming scenarios.
  Product extractTSVLine(String tsvLine) {
    final columns = tsvLine.split(_tabSeparator);

    if (columns.length != 7) {
      throw Exception(
        'Bad number of columns: 7 expected, ${columns.length} instead.',
      );
    }

    final barcode = _cleanValue(columns[0]);
    final parsedNames = _parseProductNames(columns[1]);
    final quantity = _cleanValue(columns[2]);
    final brands = _cleanValue(columns[3]);
    final nutriscore = _cleanValue(columns[4]);
    final novaGroup = columns[5].isEmpty ? null : int.tryParse(columns[5]);
    final ecoscoreGrade = _cleanValue(columns[6]);

    final product = Product(
      barcode: barcode,
      productName: parsedNames?.mainName,
      productNameInLanguages: parsedNames?.languages,
      quantity: quantity,
      brands: brands,
      nutriscore: nutriscore,
      ecoscoreGrade: ecoscoreGrade,
    );
    product.novaGroup = novaGroup;

    return product;
  }

  String? _cleanValue(String value) {
    if (value.isEmpty) {
      return null;
    }
    return value;
  }

  /// Parses a malformed JSON array of product names with language tags.
  /// Expected input format: "[{'lang': en, 'text': Product Name}, ...]"
  _ParsedNames? _parseProductNames(String rawData) {
    if (rawData.isEmpty) {
      return null;
    }

    String? mainName;
    final languages = <OpenFoodFactsLanguage, String>{};

    final matches = _langTextPattern.allMatches(rawData);
    if (matches.isEmpty) {
      return null;
    }

    for (final match in matches) {
      final langCode = match.group(1);
      final text = match
          .group(2)
          ?.trim(); // Text might have trailing spaces before closing brace

      if (langCode == null || text == null || text.isEmpty) {
        continue;
      }

      if (langCode == 'main') {
        mainName = text;
        continue;
      }

      final language = _mapLanguageCode(langCode);
      if (language != null) {
        languages[language] = text;
      }
    }

    if (mainName == null && languages.isEmpty) {
      return null;
    }

    return _ParsedNames(mainName, languages.isEmpty ? null : languages);
  }

  OpenFoodFactsLanguage? _mapLanguageCode(String code) {
    final language = LanguageHelper.fromJson(code);
    if (language != OpenFoodFactsLanguage.UNDEFINED) {
      return language;
    }
    return null;
  }
}

class _ParsedNames {
  final String? mainName;
  final Map<OpenFoodFactsLanguage, String>? languages;

  _ParsedNames(this.mainName, this.languages);
}
