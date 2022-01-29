import 'package:get/get.dart';
import 'package:radio_life/app/utils/try_cast.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/device/device_entity.dart';

class MyDeviceDetailController extends GetxController {
  //region State
  Rx<Resource<MyDeviceEntity>> state = Resource.loading<MyDeviceEntity>().obs;

  //endregion

  //region Variables

  //endregion

  //region Functions
  @override
  Future onReady() async {
    super.onReady();
    final param = tryCast<MyDeviceEntity>(Get.arguments);
    // don't need wait, because have the data
    // AppUIBlock.blockUI(context: Get.context);
    // await 1.delay();
    // AppUIBlock.unblock(context: Get.context);
    if (param != null) state.value = Resource.success(data: param);
  }
  //endregion

}
