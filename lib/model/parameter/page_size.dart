import 'package:openfoodfacts/interface/parameter.dart';

/// "Page size" search API parameter
class PageSize extends Parameter {
  @override
  String getName() => 'page_size';

  @override
  String getValue() => size.toString();

  final int size;

  const PageSize({required this.size});
}
