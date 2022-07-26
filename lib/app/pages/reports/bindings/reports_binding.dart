import 'package:get/get.dart';
import 'package:radio_life/app/pages/reports/reports_controller.dart';

class ReportsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ReportsController(),
    );
  }
}
