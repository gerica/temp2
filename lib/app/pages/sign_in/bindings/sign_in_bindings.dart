import 'package:get/get.dart';
import 'package:radio_life/app/pages/sign_in/sign_in_controller.dart';
import 'package:radio_life/core/domain/use_cases/auth/do_sign_in_use_case.dart';
import 'package:radio_life/di/di.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.create(() => DoSignInUseCase(getIt(), getIt()));
    Get.lazyPut(() => SignInController(Get.find(), getIt()));
  }
}
