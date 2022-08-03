import 'package:openfoodfacts/interface/Parameter.dart';
import 'package:openfoodfacts/model/IngredientsAnalysisTags.dart';

/// Ingredients Analysis search API parameter.
class IngredientsAnalysisParameter extends Parameter {
  @override
  String getName() => 'ingredients_analysis_tags';

  @override
  String getValue() {
    final List<String> result = <String>[];
    if (veganStatus != null) {
      result.add(veganStatus!.tag);
    }
    if (vegetarianStatus != null) {
      result.add(vegetarianStatus!.tag);
    }
    if (palmOilFreeStatus != null) {
      result.add(palmOilFreeStatus!.tag);
    }
    if (result.isEmpty) {
      return '';
    }
    return result.join(',');
  }

  final VeganStatus? veganStatus;
  final VegetarianStatus? vegetarianStatus;
  final PalmOilFreeStatus? palmOilFreeStatus;

  const IngredientsAnalysisParameter({
    this.veganStatus,
    this.vegetarianStatus,
    this.palmOilFreeStatus,
  });
}
