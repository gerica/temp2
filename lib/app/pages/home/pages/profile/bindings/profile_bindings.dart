import 'package:get/get.dart';
import 'package:radio_life/app/pages/home/pages/profile/profile_controller.dart';

class ProfileBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
