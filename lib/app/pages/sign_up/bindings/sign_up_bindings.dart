import 'package:get/get.dart';
import 'package:radio_life/app/pages/sign_up/sign_up_controller.dart';
import 'package:radio_life/core/domain/use_cases/auth/check_if_has_user_logged_in_use_case.dart';
import 'package:radio_life/core/domain/use_cases/auth/do_sign_up_use_case.dart';
import 'package:radio_life/di/di.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.create(() => DoSignUpUseCase(getIt()));
    Get.create(() => CheckIfUserIsLoggedInUseCase(getIt()));
    Get.lazyPut(() => SignUpController(Get.find(), Get.find(), getIt()));
  }
}
