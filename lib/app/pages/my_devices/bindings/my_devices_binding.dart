import 'package:get/get.dart';
import 'package:radio_life/app/pages/my_devices/my_devices_controller.dart';
import 'package:radio_life/di/di.dart';

class MyDevicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyDevicesController(getIt()), fenix: true);
  }
}
