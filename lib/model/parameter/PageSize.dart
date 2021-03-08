import 'package:openfoodfacts/interface/Parameter.dart';

class PageSize extends Parameter {
  @override
  String getName() {
    return 'page_size';
  }

  @override
  String getValue() {
    return size.toString();
  }

  final int? size;

  const PageSize({this.size});
}
