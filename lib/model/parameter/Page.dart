import 'package:openfoodfacts/interface/Parameter.dart';

/// "Page number" search API parameter
class Page extends Parameter {
  @override
  String getName() => 'page';

  @override
  String getValue() => page.toString();

  final int page;

  const Page({required this.page});
}
