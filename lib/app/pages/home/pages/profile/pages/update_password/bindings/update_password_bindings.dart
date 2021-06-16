import 'package:get/get.dart';
import 'package:radio_life/app/pages/home/pages/profile/pages/update_password/update_password_controller.dart';

class UpdatePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdatePasswordController());
  }
}
