import 'package:get/get.dart';
import 'package:radio_life/di/di.dart';

import '../my_devices_controller.dart';

class MyDevicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyDevicesController(getIt()), fenix: true);
  }
}
