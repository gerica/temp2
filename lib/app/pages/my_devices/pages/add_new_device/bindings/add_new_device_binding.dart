import 'package:get/get.dart';
import 'package:radio_life/di/di.dart';

import '../add_new_device_controller.dart';

class AddNewDeviceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddNewDeviceController(getIt()));
  }
}
