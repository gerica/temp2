import 'package:get/get.dart';
import 'package:radio_life/app/pages/my_devices/pages/add_new_device/add_new_device_controller.dart';

class AddNewDeviceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddNewDeviceController());
  }
}
