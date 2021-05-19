import 'package:get/get.dart';
import 'package:radio_life/app/pages/forgot_password/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordController());
  }
}
