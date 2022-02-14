import 'package:get/get.dart';
import 'package:radio_life/app/pages/profile/pages/update_password/update_password_controller.dart';
import 'package:radio_life/di/di.dart';

class UpdatePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdatePasswordController(getIt()));
  }
}
