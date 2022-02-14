import 'package:get/get.dart';
import 'package:radio_life/app/pages/my_devices/pages/configure_wifi/configure_wifi_controller.dart';
import 'package:radio_life/di/di.dart';

class ConfigureWiFiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfigureWiFiController(getIt(), getIt()));
  }
}
