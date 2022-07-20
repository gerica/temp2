import 'package:get/get.dart';
import 'package:radio_life/app/pages/sign_in/pages/create_password/crate_password_controller.dart';

class CreatePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatePasswordController());
  }
}
