import 'package:get/get.dart';

import 'radio_life_app_controller.dart';
import 'widget/navigation/app_bottom_navitation_bar_controller.dart';

class RadioLifeAppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<RadioLifeAppController>(RadioLifeAppController());
    Get.put(AppBottomNavigationController());
  }
}
