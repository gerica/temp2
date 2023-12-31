import 'package:get/get.dart';
import 'package:radio_life/app/data/model/resource.dart';
import 'package:radio_life/app/domain/entities/device/device_entity.dart';
import 'package:radio_life/app/pages/my_devices/my_devices_controller.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/utils/try_cast.dart';

class MyDeviceDetailController extends GetxController {
  Rx<Resource<MyDeviceEntity>> state = Resource.loading<MyDeviceEntity>().obs;

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

  int get balance {
    if (state.value.data != null && state.value.data?.balance != null) {
      return int.tryParse(state.value.data?.balance.toString() as String) ?? 0;
    }
    return 0;
  }

  Future<void> goToMyDevicePage() async {
    await Get.delete<MyDevicesController>();
    Get.offAllNamed(Routes.myDevices);
  }

  Future<void> goToBuyCredit() async {
    await Get.toNamed(Routes.buyCreditsPage, arguments: state.value.data?.id);

    // BuyCreditsPage.navigateWith(
    //   deviceId: state.value.data?.id ?? '',
    // );
  }
}
