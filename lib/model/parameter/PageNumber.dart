import 'package:openfoodfacts/interface/Parameter.dart';

/// "Page number" search API parameter
class PageNumber extends Parameter {
  @override
  String getName() => 'page';

  @override
  String getValue() => page.toString();

  final int page;

  const PageNumber({required this.page});
}
