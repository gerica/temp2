import 'package:get/get.dart';
import 'package:radio_life/app/pages/support/support_controller.dart';

class SupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupportController());
  }
}
