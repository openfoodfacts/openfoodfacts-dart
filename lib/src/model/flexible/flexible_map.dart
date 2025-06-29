import 'package:meta/meta.dart';

@experimental
typedef JsonMap = Map<String, dynamic>;

@experimental
abstract class FlexibleMap {
  const FlexibleMap(this.json);

  final JsonMap json;
}
