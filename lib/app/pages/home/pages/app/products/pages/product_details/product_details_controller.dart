import 'package:get/get.dart';
import 'package:radio_life/app/utils/try_cast.dart';
import 'package:radio_life/core/data/model/resource.dart';

import '../../../../../../../pages/adapter/index.dart';
import 'model/product_details_model.dart';
import 'params/product_details_params.dart';

class ProductDetailsController extends GetxController {
  //region State
  Rx<Resource<ProductDetailsModel>> state = Resource.loading<ProductDetailsModel>().obs;
  //endregion

  //region Variables

  //endregion

  //region Functions
  @override
  void onInit() {
    super.onInit();
    final param = tryCast<ProductDetailsParams>(Get.arguments);
    if(param != null)
      state.value = Resource.success(data: param.toProductDetailsModel);
  }
  //endregion

}
