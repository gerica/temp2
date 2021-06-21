import 'package:get/get.dart';

import '../my_devices_controller.dart';

class MyDevicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyDevicesController());
  }
}
