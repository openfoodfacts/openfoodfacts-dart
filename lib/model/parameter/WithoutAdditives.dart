import 'package:openfoodfacts/interface/Parameter.dart';

/// "Without Additives" search API parameter
class WithoutAdditives extends Parameter {
  @override
  String getName() => 'additives';

  @override
  String getValue() => 'without';

  const WithoutAdditives();
}
