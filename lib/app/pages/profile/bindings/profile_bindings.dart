import 'package:get/get.dart';
import 'package:radio_life/app/pages/profile/profile_controller.dart';
import 'package:radio_life/di/di.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProfileController(
        getIt(),
        getIt(),
        getIt(),
        getIt(),
        getIt(),
        getIt(),
      ),
    );
  }
}
