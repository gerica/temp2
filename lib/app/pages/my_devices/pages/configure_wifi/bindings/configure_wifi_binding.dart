import 'package:get/get.dart';
import 'package:radio_life/di/di.dart';

import '../configure_wifi_controller.dart';

class ConfigureWiFiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfigureWiFiController(getIt(), getIt()));
  }
}
