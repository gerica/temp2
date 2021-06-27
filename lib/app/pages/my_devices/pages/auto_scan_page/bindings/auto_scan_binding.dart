import 'package:get/get.dart';
import 'package:radio_life/app/pages/my_devices/pages/auto_scan_page/auto_scan_controller.dart';

class AutoScanBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AutoScanController());
  }
}
