import 'package:get/get.dart';

import '../configure_wifi_controller.dart';

class ConfigureWiFiBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ConfigureWiFiController());
  }
}
