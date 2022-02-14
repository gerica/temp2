import 'package:get/get.dart';
import 'package:radio_life/app/pages/my_devices/pages/confirm_register/confirm_register_controller.dart';
import 'package:radio_life/di/di.dart';

class ConfirmRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfirmRegisterController(getIt()));
  }
}
