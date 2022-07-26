import 'package:get/get.dart';
import 'package:radio_life/app/pages/profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProfileController(),
    );
  }
}
