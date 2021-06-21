import 'package:get/get.dart';

import '../add_new_device_controller.dart';

class AddNewDeviceBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AddNewDeviceController());
  }
}
