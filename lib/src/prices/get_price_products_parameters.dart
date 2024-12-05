import 'package:openfoodfacts/src/prices/flavor.dart';

import 'get_price_count_parameters_helper.dart';
import 'get_price_products_order.dart';

/// Parameters for the "get price products" API query.
class GetPriceProductsParameters
    extends GetPriceCountParametersHelper<GetPriceProductsOrderField> {
  String? brandsLike;
  String? brandsTagsContains;
  String? categoriesTagsContains;
  String? code;
  String? ecoscoreGrade;
  String? labelsTagsContains;
  String? novaGroup;
  String? nutriscoreGrade;
  String? productNameLike;
  int? uniqueScansNGte;
  Flavor? source;

  @override
  Map<String, String> getQueryParameters() {
    super.getQueryParameters();
    addNonNullString(brandsLike, 'brands__like');
    addNonNullString(brandsTagsContains, 'brands_tags__contains');
    addNonNullString(categoriesTagsContains, 'categories_tags__contains');
    addNonNullString(code, 'code');
    addNonNullString(ecoscoreGrade, 'ecoscore_grade');
    addNonNullString(labelsTagsContains, 'labels_tags__contains');
    addNonNullString(novaGroup, 'nova_group');
    addNonNullString(nutriscoreGrade, 'nutriscore_grade');
    addNonNullString(productNameLike, 'product_name__like');
    addNonNullInt(uniqueScansNGte, 'unique_scans_n__gte');
    addNonNullString(source?.offTag, 'source');
    return result;
  }
}
