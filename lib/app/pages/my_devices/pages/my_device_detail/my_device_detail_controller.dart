import 'package:get/get.dart';
import 'package:radio_life/app/pages/my_devices/pages/my_device_detail/model/my_device_detail_model.dart';
import 'package:radio_life/app/pages/my_devices/pages/my_device_detail/params/my_device_detail_param.dart';
import 'package:radio_life/app/utils/try_cast.dart';
import 'package:radio_life/core/data/model/resource.dart';

import 'adapter/my_device_detail_adapter.dart';

class MyDeviceDetailController extends GetxController {
  //region State
  Rx<Resource<MyDeviceDetailModel>> state = Resource.loading<MyDeviceDetailModel>().obs;

  //endregion

  //region Variables

  //endregion

  //region Functions
  @override
  void onInit() {
    super.onInit();
    final param = tryCast<MyDeviceDetailParam>(Get.arguments);
    if (param != null) state.value = Resource.success(data: param.toModel);
  }
//endregion

}
