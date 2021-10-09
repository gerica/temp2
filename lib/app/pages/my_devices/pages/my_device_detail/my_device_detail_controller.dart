import 'package:get/get.dart';
import 'package:radio_life/app/pages/my_devices/model/my_device_model.dart';
import 'package:radio_life/app/utils/try_cast.dart';
import 'package:radio_life/core/data/model/resource.dart';

class MyDeviceDetailController extends GetxController {
  //region State
  Rx<Resource<MyDeviceModel>> state = Resource.loading<MyDeviceModel>().obs;

  //endregion

  //region Variables

  //endregion

  //region Functions
  @override
  Future onReady() async {
    super.onReady();
    final param = tryCast<MyDeviceModel>(Get.arguments);
    // don't need wait, because have the data
    // AppUIBlock.blockUI(context: Get.context);
    // await 1.delay();
    // AppUIBlock.unblock(context: Get.context);
    if (param != null) state.value = Resource.success(data: param);
  }
  //endregion

}
