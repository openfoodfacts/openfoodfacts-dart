import '../../interface/parameter.dart';

/// "Page size" search API parameter
///
/// Typically defaults to 50 (used to be 24). Max value seems to be 100.
class PageSize extends Parameter {
  @override
  String getName() => 'page_size';

  @override
  String getValue() => size.toString();

  final int size;

  const PageSize({required this.size});
}
