import 'package:get/get.dart';
import 'package:radio_life/app/pages/my_devices/pages/my_device_detail/my_device_detail_controller.dart';

class MyDeviceDetailBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => MyDeviceDetailController());
  }
}
