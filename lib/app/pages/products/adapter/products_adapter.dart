

import 'package:radio_life/app/pages/products/pages/product_details/model/product_details_model.dart';
import 'package:radio_life/app/pages/products/pages/product_details/params/product_details_params.dart';

extension ProductDetailsParamsExtension on ProductDetailsParams {
  ProductDetailsModel get toProductDetailsModel => ProductDetailsModel(title: product);
}
