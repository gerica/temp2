import 'package:get/get.dart';
import 'package:radio_life/app/pages/home/pages/my_devices/my_devices_controller.dart';

class MyDevicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyDevicesController());
  }
}
