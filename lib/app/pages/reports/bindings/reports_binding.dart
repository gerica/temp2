import 'package:get/get.dart';
import 'package:radio_life/di/di.dart';

import '../reports_controller.dart';

class ReportsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportsController(getIt()));
  }
}
