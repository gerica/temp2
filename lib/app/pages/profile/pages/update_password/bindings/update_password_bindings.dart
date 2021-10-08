import 'package:get/get.dart';
import 'package:radio_life/di/di.dart';

import '../update_password_controller.dart';

class UpdatePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdatePasswordController(getIt()));
  }
}
