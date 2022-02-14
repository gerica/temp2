import 'package:get/get.dart';
import 'package:radio_life/app/pages/reports/reports_controller.dart';
import 'package:radio_life/di/di.dart';

class ReportsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ReportsController(
        getIt(),
        getIt(),
      ),
    );
  }
}
