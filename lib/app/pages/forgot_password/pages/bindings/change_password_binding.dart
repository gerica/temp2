import 'package:get/get.dart';
import 'package:radio_life/app/pages/forgot_password/pages/change_password_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController());
  }
}
