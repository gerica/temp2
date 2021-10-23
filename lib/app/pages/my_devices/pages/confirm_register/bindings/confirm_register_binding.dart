import 'package:get/get.dart';
// import 'package:radio_life/di/di.dart';

import '../confirm_register_controller.dart';

class ConfirmRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfirmRegisterController());
  }
}
