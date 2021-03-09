import 'package:openfoodfacts/interface/Parameter.dart';

class Page extends Parameter {
  @override
  String getName() {
    return 'page';
  }

  @override
  String getValue() {
    return page.toString();
  }

  final int? page;

  const Page({this.page});
}
